Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC676D0568
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 14:55:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phrnM-0002H1-VA; Thu, 30 Mar 2023 08:54:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=446aa7e4f=anthony.perard@citrix.com>)
 id 1phrnH-0002Gq-OQ
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 08:54:19 -0400
Received: from esa3.hc3370-68.iphmx.com ([216.71.145.155])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=446aa7e4f=anthony.perard@citrix.com>)
 id 1phrnE-00058V-Rq
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 08:54:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1680180855;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=zFVWl6FHEqhOUvgAIvCkLHmwVEt/WkNWTO6CEDMa4UU=;
 b=cSQy4fyUjHro21aPV+3SwykMa1UjH82sb2Yk+4Cw8mmBBYoJOMU3VcOj
 dIbyfE+C06sDnwnX9EkGyjdT5rohJOHY7Mg4Nn57urnAG3u2G/qV9IlGe
 5y8l2yPui9fo2cFiW6F9TeYb6/DiiIrux2o26SSugbGcbU8PR3P53eBRI M=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 103702062
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:blYcU6xJU+HUzXxAaJx6t+cpwSrEfRIJ4+MujC+fZmUNrF6WrkUPm
 2BODWCFPf/fMWKnLookOYqw8UgPsJCBzNNlSVdtqyAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UMHUMja4mtC5QRlPqgT5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KXEe9
 qBbAhc3Uheoo+2WxZ7hddA8me12eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyMlKZOUYn1lQ/UfrSmM+hgGX/dDtJ7kqYv6Mt70DYzRBr0airO93QEjCPbZwNxRnA/
 DqYpQwVBDkaM922zReP7kv3i+HfsQfAZK1KBpCBo6sCbFq7mTVIVUx+uUGAieK5h0iiVsN3J
 Ekd+y5opq83nGSyQ9zgGhG1vnOAlhgbXdVWDqs98g7l4q/d+Q2UAi4NVjBMbNYvqcoeSjkj1
 1vPlNTsbRR3urqTW3Ob95+OoD+yMDRTJmgHDQcIUg4ay9DmqZM0iFTESZB+E8adjsXyBCrrw
 jaitiU3jKkUlogMzarT1VnamT+op5XPZgco/AjTBTjj6A5lDKaoa5Gh81TcxfZJJoWeVUXHu
 nUY8+CG5f0KJYGAkmqKWuplNKGk4bOJPSPRhXZrHoI97HK99ni7Z4dS7TpiYkBzPa4sfCT1S
 FXetQNY+NlYO37CRbRsf4u7BsAuzK7hPdfoTPbZapxJeJcZXBWG9yFnf0LW323rnEU2iqY5E
 ZOad8+2CjAdE6sP5CK2RuMY3ZcvxyY332SVQor0pzyty7GeeXWWW58MN1/IZec8hIuNuAjP+
 sxTH9eLwR5YFub5Z0HqHZU7dA5QayJhXNav9pIRL7TYSuZ7JI0/I++Bwu9iUatfo6N+sujo+
 13nZXYI13Oq0BUrNj62hmBfhKLHBMgg/CNrbXBwbT5EyFB4P9/xsf53m48fOOB+qbc9laMco
 +wtIZ3oPxhZdtjQF93xh7HZpZcqShmkjBnm08GNMGlmJM4Iq+AkF7bZkurTGMomVHDfWTMW+
 eHI6+8iacNrq/5eJMjXcumz6Fi6oGIQnul/N2ORfIkLIRywrtc0e3Kv5hPSHy3qAU+brtd9/
 1j+PPvljbOV/99dHCfh3shoULtF48MhRxEHTgE3HJ69NDXA/3rL/LKspN2gJGiHPEutofXKW
 Amg562kWBHxtAoQ4tUU/ncC5f5W2uYDUJcAlFo8RCiQNwv1Yl6iS1HftfRyWmR27ucxkWOLt
 oino7G25Z3h1BvZLWMs
IronPort-HdrOrdr: A9a23:ZRgbaaBIfugAqaflHemO55DYdb4zR+YMi2TDtnoBLCC9F/bz+v
 xG88526faZslkssQgb6Le90cq7MBHhHPxOgbX5VI3KNDUO3lHHEGgI1/qA/9SPIUzDH9lmpM
 NdmvhFY+EY1WIK9/oSOjPIa+rIHeP3lpxAWd2utEuFkzsaFp2JgG9Ce3+mLnE=
X-IronPort-AV: E=Sophos;i="5.98,303,1673931600"; d="scan'208";a="103702062"
Date: Thu, 30 Mar 2023 13:54:05 +0100
To: Bernhard Beschow <shentey@gmail.com>
CC: <qemu-devel@nongnu.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, David Woodhouse <dwmw@amazon.co.uk>,
 =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>, Aurelien Jarno
 <aurelien@aurel32.net>, Eduardo Habkost <eduardo@habkost.net>, Paul Durrant
 <paul@xen.org>, <xen-devel@lists.xenproject.org>, "Michael S. Tsirkin"
 <mst@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, Richard
 Henderson <richard.henderson@linaro.org>, Philippe
 =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>, Chuck Zmudzinski
 <brchuckz@aol.com>
Subject: Re: [PATCH v3 1/6] include/hw/xen/xen: Rename xen_piix3_set_irq() to
 xen_intx_set_irq()
Message-ID: <b380f2c5-4f56-4713-b372-91d54114aa4e@perard>
References: <20230312120221.99183-1-shentey@gmail.com>
 <20230312120221.99183-2-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230312120221.99183-2-shentey@gmail.com>
Received-SPF: pass client-ip=216.71.145.155;
 envelope-from=prvs=446aa7e4f=anthony.perard@citrix.com;
 helo=esa3.hc3370-68.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-to:  Anthony PERARD <anthony.perard@citrix.com>
From:  Anthony PERARD via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sun, Mar 12, 2023 at 01:02:16PM +0100, Bernhard Beschow wrote:
> xen_piix3_set_irq() isn't PIIX specific: PIIX is a single PCI device
> while xen_piix3_set_irq() maps multiple PCI devices to their respective
> IRQs, which is board-specific. Rename xen_piix3_set_irq() to communicate
> this.
> 
> Also rename XEN_PIIX_NUM_PIRQS to XEN_IOAPIC_NUM_PIRQS since the Xen's
> IOAPIC rather than PIIX has this many interrupt routes.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

