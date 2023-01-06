Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 923DA65FF32
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 11:54:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDkLc-0003SW-To; Fri, 06 Jan 2023 05:53:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=36316be06=anthony.perard@citrix.com>)
 id 1pDkLa-0003Pw-VH
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 05:53:14 -0500
Received: from esa5.hc3370-68.iphmx.com ([216.71.155.168])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=36316be06=anthony.perard@citrix.com>)
 id 1pDkLY-0007HY-Sr
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 05:53:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1673002392;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6Wk2TSCEO9A+5OEvRCIDTA7EztFEDFJs4i2Z9OGalEk=;
 b=IktTD19pRUopE8xBX6cbZUPKY8lOsL3ZT/arovcjbRPxoDoC/NN8XuW6
 sWI4sS5YyoGbkr2BiHBU6CIdVJQnsd2lGaLvscY5sAA5ct6BG+7pEBOkI
 Ltaim+kV11+FCNnS72VrkgqSu8W7phcTRuoFhqE0Fp/LlUMkn5AWk/af7 0=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 90405203
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ullLqqDkDLmaBBVW/33kw5YqxClBgxIJ4kV8jS/XYbTApDp2hmECy
 2sbDzqBOfaLYWr0cowgPo7j9E4Bu5/Tz9VqQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nNHuCnYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtcpvlDs15K6p4GpA4ARkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwxtxWG1NRq
 fgjMwsObSuM2Mu7+52RY7w57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2o0BPjDS0Qn1lM/AZQinOCulz/nfidRsl69rqsr+WnDigd21dABNfKEIoDSGJ8NxS50o
 Erhw0DwIjgHF+bYzBub6U61rMOVuR/CDdd6+LqQqacx3Qz7KnYoIBAaSFKhrf6Rike0WNVEN
 woS9zZGhbIz/0yiVNW7XxC+rHOepRkac95RFeQg70eK0KW8ywOQHGMJSnhIcNIrsMU/WDkC2
 VqAntevDjtq2JWMRHeAs7uZsz62ES4SK2AEeGkDVwRty8nupsQ/gwzCSv5nEbWplZvlFDfo2
 TeIoSMiwbIJgqYjz6+8+0LGhTOEvJXFTgcpoA7QWwqN5wd0dMi6Zois6FHe9vFGBJyUQlmIo
 D4PnM32xOoUBpGQny+faOwKGPei4PPtGCXVnFpHD5QnsTO39BaLZptM6TtzIENoNMcsejLzZ
 kLX/wRL6/d7OWC2RbV6b4K4F4Ihyq2IKDj+fqmKNJwUOME3LVLZunE1DaKN44zzuHQWsLsNJ
 sufSt2XDnUhBvtOwQGZbc5IhNfH2RsC7W/UQJn6yTGu3ryfeGOZRN85DbeeUgwqxPja+VuIq
 r6zI+PPkkwCC7OmPkE75KZJdTg3wW4H6YcaQiC9XsqKOUJYFW4oEJc9KptxKtU+z8y5egoll
 0xRu3O0KnKl3hUryi3QMBiPjY8Dur4hxU/XxQR2YT6VN4ELOO5DFps3eZotZqUA/+d+1/NyR
 PRtU5zeXa4eFm+aq2VBPMiVQGlemPKD31Lm082NOWFXQnKdb1aRpo+MkvXHrkHi8RZbReNh+
 ub9h2s3sLIIRhh4Dda+Vc9DO2iZ5CBH8MorBhugHzWmUBm0mGScA3Cr36BfzgBlAUmr+wZ2I
 C7NXEZE9bGS+tZlmDQL7Ijdx7qU/yJFNhIyNwHmAXyebEE2IkLLLVd8bdu1
IronPort-HdrOrdr: A9a23:12j/1qAICkWol0nlHemW55DYdb4zR+YMi2TDsHocdfU1SKOlfq
 WV98jzuiWbtN98YhAdcLK7Scq9qALnlaKdiLN5Vd3OYOCBghrMEGgI1/qB/9SPIVyYysdtkY
 tmbqhiGJnRIDFB/KDHCdCDYrId/OU=
X-IronPort-AV: E=Sophos;i="5.96,305,1665460800"; d="scan'208";a="90405203"
Date: Fri, 6 Jan 2023 10:52:54 +0000
To: Chuck Zmudzinski <brchuckz@aol.com>
CC: Alex Williamson <alex.williamson@redhat.com>, Paul Durrant <paul@xen.org>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, "Richard
 Henderson" <richard.henderson@linaro.org>, Eduardo Habkost
 <eduardo@habkost.net>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 <xen-devel@lists.xenproject.org>, <qemu-devel@nongnu.org>
Subject: Re: [PATCH v6] xen/pt: reserve PCI slot 2 for Intel igd-passthru
Message-ID: <Y7f9hi0SqYk6KQzW@perard.uk.xensource.com>
References: <830263507e8f1a24a94f81909d5102c4b204e938.1672615492.git.brchuckz.ref@aol.com>
 <830263507e8f1a24a94f81909d5102c4b204e938.1672615492.git.brchuckz@aol.com>
 <20230102124605-mutt-send-email-mst@kernel.org>
 <c21e933f-0539-9ffb-b2f8-f8e1a279b16f@netscape.net>
 <20230103081456.1d676b8e.alex.williamson@redhat.com>
 <cbfdcafc-383e-aea3-d04d-38388fab202f@aol.com>
 <ba4f8fd6-ae10-da60-7ef5-66782f29fdb9@aol.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ba4f8fd6-ae10-da60-7ef5-66782f29fdb9@aol.com>
Received-SPF: pass client-ip=216.71.155.168;
 envelope-from=prvs=36316be06=anthony.perard@citrix.com;
 helo=esa5.hc3370-68.iphmx.com
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

On Tue, Jan 03, 2023 at 05:58:01PM -0500, Chuck Zmudzinski wrote:
> Hello Anthony and Paul,

Hi Chuck,

> I am requesting your feedback to Alex Williamson's suggestion that this
> problem with assigning the correct slot address to the igd on xen should
> be fixed in libxl instead of in qemu.
> 
> It seems to me that the xen folks and the kvm folks have two different
> philosophies regarding how a tool stack should be designed. kvm/libvirt
> provides much greater flexibility in configuring the guest which puts
> the burden on the administrator to set all the options correctly for
> a given feature set, while xen/xenlight does not provide so much
> flexibility and tries to automatically configure the guest based on
> a high-level feature option such as the igd-passthrough=on option that
> is available for xen guests using qemu but not for kvm guests using
> qemu.
> 
> What do you think? Should libxl be patched instead of fixing the problem
> with this patch to qemu, which is contrary to Alex's suggestion?

I do think that libxl should be able to deal with having to put a
graphic card on slot 2. QEMU already provides every API necessary for a
toolstack to be able to start a Xen guest with all the PCI card in the
right slot. But it would just be a bit more complicated to implement in
libxl.

At the moment, libxl makes use of the QEMU machine 'xenfv', libxl should
instead start to use the 'pc' machine and add the "xen-platform" pci
device. (libxl already uses 'pc' when the "xen-platform" pci card isn't
needed.) Also probably add the other pci devices to specific slot to be
able to add the passthrough graphic card at the right slot.

Next is to deal with migration when using the 'pc' machine, as it's just
an alias to a specific version of the machine. We need to use the same
machine on the receiving end, that is start with e.g. "pc-i440fx-7.1" if
'pc' was an alias for it at guest creation.


I wonder if we can already avoid to patch the 'xenfv' machine with some
xl config:
    # avoid 'xenfv' machine and use 'pc' instead
    xen_platform_pci=0
    # add xen-platform pci device back
    device_model_args_hvm = [
        "-device", "xen-platform,addr=3",
    ]
But there's probably another device which is going to be auto-assigned
to slot 2.


If you feel like dealing with the technical dept in libxl, that is to
stop using 'xenfv' and use 'pc' instead, then go for it, I can help with
that. Otherwise, if the patch to QEMU only changes the behavior of the
'xenfv' machine then I think I would be ok with it.

I'll do a review of that QEMU patch in another email.

Cheers,

-- 
Anthony PERARD

