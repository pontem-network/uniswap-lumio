var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
import { html, LitElement } from 'lit';
import { property } from 'lit/decorators.js';
import { browserSvg } from '../../assets/visual/browser.js';
import { daoSvg } from '../../assets/visual/dao.js';
import { defiSvg } from '../../assets/visual/defi.js';
import { defiAltSvg } from '../../assets/visual/defiAlt.js';
import { ethSvg } from '../../assets/visual/eth.js';
import { layersSvg } from '../../assets/visual/layers.js';
import { lockSvg } from '../../assets/visual/lock.js';
import { loginSvg } from '../../assets/visual/login.js';
import { networkSvg } from '../../assets/visual/network.js';
import { nftSvg } from '../../assets/visual/nft.js';
import { nounSvg } from '../../assets/visual/noun.js';
import { profileSvg } from '../../assets/visual/profile.js';
import { systemSvg } from '../../assets/visual/system.js';
import { resetStyles } from '../../utils/ThemeUtil.js';
import { customElement } from '../../utils/WebComponentsUtil.js';
import styles from './styles.js';
const svgOptions = {
    browser: browserSvg,
    dao: daoSvg,
    defi: defiSvg,
    defiAlt: defiAltSvg,
    eth: ethSvg,
    layers: layersSvg,
    lock: lockSvg,
    login: loginSvg,
    network: networkSvg,
    nft: nftSvg,
    noun: nounSvg,
    profile: profileSvg,
    system: systemSvg
};
let WuiVisual = class WuiVisual extends LitElement {
    constructor() {
        super(...arguments);
        this.name = 'browser';
    }
    render() {
        return html `${svgOptions[this.name]}`;
    }
};
WuiVisual.styles = [resetStyles, styles];
__decorate([
    property()
], WuiVisual.prototype, "name", void 0);
WuiVisual = __decorate([
    customElement('wui-visual')
], WuiVisual);
export { WuiVisual };
//# sourceMappingURL=index.js.map