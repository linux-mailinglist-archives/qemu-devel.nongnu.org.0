Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D276E6D05D7
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 15:04:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phrws-0007Z5-Vt; Thu, 30 Mar 2023 09:04:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=446aa7e4f=anthony.perard@citrix.com>)
 id 1phrwq-0007Yu-SX
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 09:04:12 -0400
Received: from esa6.hc3370-68.iphmx.com ([216.71.155.175])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=446aa7e4f=anthony.perard@citrix.com>)
 id 1phrwp-0007us-6e
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 09:04:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1680181451;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5FcC/uA7lSp2Phb7/lv7hFKSC5V4AzTs6UovUysFa+A=;
 b=CEB+m1JyGUms96p+YQX+uxxWnJV8LBsY/OpuSAPSENKA6uCE5soroCO5
 6L4O7juh/rlF/Ju1+FVekd5IqeKRiuasy9I1BC7xwwSyiG4CXPogPmdj3
 h9mHNhoiMy7HhRyhQwCA4cLWe6j0C41lQitEeiywvPfUUBb++1wQZAjiT Q=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 103041192
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:tTZiAay6tiw4EgF+hHx6t+cpwSrEfRIJ4+MujC+fZmUNrF6WrkVVy
 2NKDT2HbPneZWHzed9/YN+38UsPvcWByNYxGQA4ryAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UMHUMja4mtC5QRlPqgT5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KT9Tr
 fESLx0sUh+onfix6a6gG/hGt9t2eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyMlKZOUYn1lQ/UfrSmM+hgGX/dDtJ7kqYv6Mt70DYzRBr0airO93QEjCPbZwNxR7E/
 zuXpQwVBDkRGOe2mRekqku+i8nzwnijAtoWBq2no6sCbFq7mTVIVUx+uUGAieK5h0iiVsN3J
 Ekd+y5opq83nGSyQ9zgGhG1vnOAlhgbXdVWDqs98g7l4q/d+Q2UAi4NVjBMbNYvqcoeSjkj1
 1vPlNTsbRR3urqTW3Ob95+OoD+yMDRTJmgHDQcIUg4ay9DmqZM0iFTESZB+E8adjsXyBCrrw
 jaitiU3jKkUlogMzarT1VnamT+op5XPZgco/AjTBTjj6A5lDKaoa5Gh81TcxfZJJoWeVUXHu
 nUY8+CG5f0KJYGAkmqKWuplNKGk4bOJPSPRhXZrHoI97HK99ni7Z4dS7TpiYkBzPa4sfCT1S
 FXetQNY+NlYO37CRbRsf4u7BsAuzK7hPdfoTPbZapxJeJcZXBWG9yFnf0LW323rnEU2iqY5E
 ZOad8+2CjAdE6sP5CK2RuMY3ZcvxyY332SVQor0pzyty7GeeXWWW58MN1/IZec8hIuNuAjP+
 sxTH9eLwR5YFub5Z0HqHZU7dA5QayJhXNav9pIRL7TYSuZ7JI0/I6HMmb4rfKFEo6t+jP3P1
 22mC15y+UWq0BUrNj62hmBfhKLHBMgg/CNrbXBwbT5EyFB4P9/xsf53m48fOOB+qbc9laMco
 +wtIZ3oPxhZdtjQF93xh7HZpZcqShmkjBnm08GNMGlmJM4Iq+AkF7bZkurTGMomVHDfWTMW+
 eHI6+8iacNrq/5eJMjXcumz6Fi6oGIQnul/N2ORfIkLIRywrtc0e3Kv5hPSHy3qAU+brtd9/
 1j+PPvljbOV/99dHCfh3shoULtF48MhRxEHTgE3HJ69NDXA/3rL/LKspN2gJGiHPEutofXKW
 Amg562kWBHxtAoQ4tUU/ncC5f5W2uYDUJcAlFo8RCiQNwv1Yl6iS1HftfRyWmR27ucxkWOLt
 oinp7G25Z3h1BvZLWMs
IronPort-HdrOrdr: A9a23:jHdlpKzTkAfAAUgVU61xKrPwIr1zdoMgy1knxilNoH1uHvBw8v
 rEoB1173DJYVoqNk3I++rhBEDwexLhHPdOiOF6UItKNzOW21dAQrsSiLfK8nnNHDD/6/4Y9Y
 oISdkbNDQoNykZsfrH
X-IronPort-AV: E=Sophos;i="5.98,303,1673931600"; d="scan'208";a="103041192"
Date: Thu, 30 Mar 2023 14:03:53 +0100
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
Subject: Re: [PATCH v3 3/6] hw/isa/piix3: Wire up Xen PCI IRQ handling
 outside of PIIX3
Message-ID: <8871c33b-690a-4a0a-9b8b-eda163910571@perard>
References: <20230312120221.99183-1-shentey@gmail.com>
 <20230312120221.99183-4-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230312120221.99183-4-shentey@gmail.com>
Received-SPF: pass client-ip=216.71.155.175;
 envelope-from=prvs=446aa7e4f=anthony.perard@citrix.com;
 helo=esa6.hc3370-68.iphmx.com
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

On Sun, Mar 12, 2023 at 01:02:18PM +0100, Bernhard Beschow wrote:
> xen_intx_set_irq() doesn't depend on PIIX3State. In order to resolve
> TYPE_PIIX3_XEN_DEVICE and in order to make Xen agnostic about the
> precise south bridge being used, set up Xen's PCI IRQ handling of PIIX3
> in the board.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

