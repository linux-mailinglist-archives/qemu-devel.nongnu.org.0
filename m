Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0321552F8A
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 12:17:15 +0200 (CEST)
Received: from localhost ([::1]:47964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3awc-0003ss-DN
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 06:17:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=16408edfd=anthony.perard@citrix.com>)
 id 1o3avB-0002VC-M0; Tue, 21 Jun 2022 06:15:45 -0400
Received: from esa1.hc3370-68.iphmx.com ([216.71.145.142]:13246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=16408edfd=anthony.perard@citrix.com>)
 id 1o3av9-0003eW-5I; Tue, 21 Jun 2022 06:15:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1655806543;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=QcSpgKS225JamIFv9EzQROZ047pLLv+YqmxHeJjalYQ=;
 b=CHdOSs0HPhcuFBIlcoC+UtiNTZl9b9GRn9yygo864QiZjgRT6fI/huyC
 Q12zLHCNBeneeaYCpWjHTxy6jp1W1j1xmQUH3LcrLM90nWiZLHZ0EAh10
 3R+CphAtC9O7IHgyTz4NtHVPFTVbQEyVqkDNclfQ4llNOye6zQ3VcNbyY w=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 74479126
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Cy6BZa5aSvgBW2sqn/pT8QxRtCLHchMFZxGqfqrLsTDasY5as4F+v
 jQdWD/Xb/yDYGXweN9+bN+yo0hUv8WEndBqSQNuryhkHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw03qPp8Zj2tQy2YbjWlvU0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurThd1gmF7LVmdgaXkRUTx9iZJdL27b+dC3XXcy7lyUqclPpyvRqSko3IZcZ6qB8BmQmG
 f4wcW5XKErZ3qTvnez9GrIEascLdaEHOKsWvG1gyjfIS+4rW5nZT43B5MNC3Sd2jcdLdRrbT
 5VFNWU+NU6eC/FJEnwRWMoVsuuKvEvUcwII73iwmq0bvGeGmWSd15CyaYGIK7RmX/59h0udu
 yfa5WXnAxgeHNqYzzWD7zSrnOCntTjgRIsYGbm89/hrqF6e3GoeDFsRT1TTieGwl0qWS99Zb
 UsO9UIGp7I59FGgTcvVVhq85nWDu3Y0QtdVDqg25R+AzoLS5ACWAHVCSSROAPQ2uclzSTE02
 1uhm9LyGScpoLCTUWia9LqfsXW1Iyd9EIMZTXZaF01fuYCl+dxtyEKUJjp+LEKrpozLRj7Z3
 CmLkC8z2rlPs9JS7aiY9GmS1lpAuaP1oh4JChT/Bzz4s1wmOd77OORE+nCAs68ecd/xok2p+
 SFdxpPAtL1m4YSlznTlfQkbIF2+Cx9p2hX4iEUnIZQu/i/FF5WLLdEJu2EWyKuE3685ld7Vj
 Kz741o5CGd7ZifCUEOOS9vZ5z4W5abhD8/5cfvfc8BDZJN8HCfeonwzOhPIhz+3yRlz+U3aB
 Xt8WZ/0ZUv29Iw9lGbmLwvj+eRDKt8CKZP7GsmgkkXPPUu2b3+JU7YVWGazghQCxPrc+m39q
 o8HX+PTkkU3eLCvOUH/rN9MRW3m2FBmXPgaXeQMLr7dSuencUl8Y8LsLUQJIdc6xP4KzLmWo
 xlQmCZwkTLCuJEOEi3SAlgLVV8ldcwnxZ7nFUTA5WqV5kU=
IronPort-HdrOrdr: A9a23:7qOdMqH/+cPYMaaRpLqE6MeALOsnbusQ8zAXP0AYc3Jom+ij5q
 STdZUgpHrJYVkqNU3I9ertBEDEewK6yXcX2/hyAV7BZmnbUQKTRekIh7cKgQeQeBEWntQts5
 uIGJIeNDSfNzdHsfo=
X-IronPort-AV: E=Sophos;i="5.92,209,1650945600"; d="scan'208";a="74479126"
Date: Tue, 21 Jun 2022 11:15:05 +0100
To: Chuck Zmudzinski <brchuckz@aol.com>
CC: <qemu-devel@nongnu.org>, <xen-devel@lists.xenproject.org>,
 <qemu-trivial@nongnu.org>, Stefano Stabellini <sstabellini@kernel.org>, Paul
 Durrant <paul@xen.org>
Subject: Re: [PATCH v2] xen/pass-through: don't create needless register group
Message-ID: <YrGaKdx+af+7g2HY@perard.uk.xensource.com>
References: <4d4b58473beb0565876687e9d8a53b76a7cf3fbb.1655490576.git.brchuckz.ref@aol.com>
 <4d4b58473beb0565876687e9d8a53b76a7cf3fbb.1655490576.git.brchuckz@aol.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <4d4b58473beb0565876687e9d8a53b76a7cf3fbb.1655490576.git.brchuckz@aol.com>
Received-SPF: pass client-ip=216.71.145.142;
 envelope-from=prvs=16408edfd=anthony.perard@citrix.com;
 helo=esa1.hc3370-68.iphmx.com
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

On Fri, Jun 17, 2022 at 03:13:33PM -0400, Chuck Zmudzinski wrote:
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
> needs to be mapped into the guest's memory. Also, move the comment
> about trapping 0xfc for the Intel OpRegion where it belongs after
> applying this patch.
> 
> Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

