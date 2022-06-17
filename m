Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB7554F82E
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 15:09:56 +0200 (CEST)
Received: from localhost ([::1]:38882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2BjX-00021y-LA
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 09:09:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=160677330=anthony.perard@citrix.com>)
 id 1o2BhH-0000SO-FS; Fri, 17 Jun 2022 09:07:35 -0400
Received: from esa6.hc3370-68.iphmx.com ([216.71.155.175]:58580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=160677330=anthony.perard@citrix.com>)
 id 1o2BhD-0001Gw-Cd; Fri, 17 Jun 2022 09:07:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1655471251;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=43DOepLpiA6dAclzX6XEZibIuvrKwywcq/eObv9mD9M=;
 b=O55rHJSBVfJGzEDprBKfDI91CpNxkUJRcHe5i9DDYbxYNCL+A+t3Zu5n
 lTGkbT6WPbv+WATeejv7OTYUUpqbSTRFX6QUWW06U8bT9ZJb/KNSAqvUf
 /YpumGDmsURSI6Ph9Zzf3jDGPb61wa9P6CsdfeqEX80QWnEjIUTFxr1VC E=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 73699563
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:65xIEqCvzCqKSxVW/w7jw5YqxClBgxIJ4kV8jS/XYbTApDMr1DwCn
 GAdWWmAb67eZWDyeNxwO9y3/U0E6peGnIVmQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgH2eIdA970Ug5w7Bg3NY06TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPha9
 9FipaKRWTsGfbHVm95efEREMgVhaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwqKtXrO4UO/Glt1zjDAd4tQIzZQrWM7thdtNs1rp8VQ6ePO
 pRCAdZpRCrMUUx9NQ81McMVk9ijlGfFUDsG813A8MLb5ECMlVcsgdABKuH9Y9GPWIBJhEeGp
 2vC12L+BB4cKZqY0zXt2mm3mubFkCf/WYQTPL617PhnhBuU3GN7IAUfSF+TsfS/zEmkVLp3I
 VYf+jclrroa/UuvCNL6WnWQuXOBo1sQVsRdF8U87weCzLeS5ByWbkAUQzgEZNE4ucseQT0xy
 kTPj97vHSZosrCeVTSa7Lj8kN+pEXFLdylYP3ZCFFZbpYm4yG0usv7RZv1cFIGlsPzlJR6z3
 ymJlmsR2qkyqdFegs1X4mv7byKQSonhF1Bou1mMBjj9s2uVd6b+OdX2tAGzAeJoad/AEwLf5
 CVsd922trhmMH2bqMCarAzh9pmN7u3NDjDTiEUH83IJp2X0oC7LkWy9DVhDyKZV3iUsI2aBj
 Lf741852XOqFCLCgVVLS4ywEd826qPrCM7oUPvZBvIXPMUsKFfboHw2PBPKt4wIrKTLufBXB
 HtmWZz0USZy5VpPl1JauNvxIZd0n3tjlAs/tLjwzgi90Kr2WUN5vYwtaQPUBshgtfvsiFyMr
 753apvboz0CAbaWSnSGruYuwaUicCFT6Wbe8JcMKIZu42NORQkcNhMm6ep5I9I9xP8Jx7igE
 7PUchYw9WcTTEbvcW2iAk2Popu2NXqjhRrX5RARAGs=
IronPort-HdrOrdr: A9a23:a6XODK4eXS8yIRbciwPXwMjXdLJyesId70hD6qhwISY6TiW9rb
 HLoB17726QtN9/YhwdcLy7VJVoBEmskqKdgrNhX4tKPjOHhILAFugLhuHfKn/bak7DH4ZmpM
 FdmsNFaeEYY2IUsfrH
X-IronPort-AV: E=Sophos;i="5.92,306,1650945600"; d="scan'208";a="73699563"
Date: Fri, 17 Jun 2022 14:07:18 +0100
To: Chuck Zmudzinski <brchuckz@aol.com>
CC: <qemu-devel@nongnu.org>, <xen-devel@lists.xenproject.org>,
 <qemu-trivial@nongnu.org>, Stefano Stabellini <sstabellini@kernel.org>, Paul
 Durrant <paul@xen.org>
Subject: Re: [PATCH] xen/pass-through: don't create needless register group
Message-ID: <Yqx8ht2teAoRJF4b@perard.uk.xensource.com>
References: <a2e946dfb45260a5e29cec3b2195e4c1385b0d63.1654876622.git.brchuckz.ref@aol.com>
 <a2e946dfb45260a5e29cec3b2195e4c1385b0d63.1654876622.git.brchuckz@aol.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <a2e946dfb45260a5e29cec3b2195e4c1385b0d63.1654876622.git.brchuckz@aol.com>
Received-SPF: pass client-ip=216.71.155.175;
 envelope-from=prvs=160677330=anthony.perard@citrix.com;
 helo=esa6.hc3370-68.iphmx.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Anthony PERARD <anthony.perard@citrix.com>
From:  Anthony PERARD via <qemu-devel@nongnu.org>

On Fri, Jun 10, 2022 at 12:23:35PM -0400, Chuck Zmudzinski wrote:
> Currently we are creating a register group for the Intel IGD OpRegion
> for every device we pass through, but the XEN_PCI_INTEL_OPREGION
> register group is only valid for an Intel IGD. Add a check to make
> sure the device is an Intel IGD and a check that the administrator has
> enabled gfx_passthru in the xl domain configuration. Require both checks
> to be true before creating the register group. Use the existing
> is_igd_vga_passthrough() function to check for a graphics device from
> any vendor and that the administrator enabled gfx_passthru in the xl
> domain configuration, but further require that the vendor be Intel,
> because only Intel IGD devices have an Intel OpRegion. These are the
> same checks hvmloader and libxl do to determine if the Intel OpRegion
> needs to be mapped into the guest's memory.
> 
> Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
> ---
>  hw/xen/xen_pt_config_init.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/hw/xen/xen_pt_config_init.c b/hw/xen/xen_pt_config_init.c
> index c5c4e943a8..ffd915654c 100644
> --- a/hw/xen/xen_pt_config_init.c
> +++ b/hw/xen/xen_pt_config_init.c
> @@ -2037,6 +2037,10 @@ void xen_pt_config_init(XenPCIPassthroughState *s, Error **errp)
>           * therefore the size should be 0xff.
>           */

Could you move that comment? I think it would make more sense to comment
the "reg_grp_offset=XEN_PCI_INTEL_OPREGION" line now that the `if` block
also skip setting up the group on non-intel devices.

>          if (xen_pt_emu_reg_grps[i].grp_id == XEN_PCI_INTEL_OPREGION) {
> +            if (!is_igd_vga_passthrough(&s->real_device) ||
> +                s->real_device.vendor_id != PCI_VENDOR_ID_INTEL) {
> +                continue;
> +            }
>              reg_grp_offset = XEN_PCI_INTEL_OPREGION;
>          }

Thanks,

-- 
Anthony PERARD

