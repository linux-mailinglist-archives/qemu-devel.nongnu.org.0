Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1454B52D644
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 16:39:29 +0200 (CEST)
Received: from localhost ([::1]:34586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrhJI-0007Cf-6k
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 10:39:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=13100c9ce=anthony.perard@citrix.com>)
 id 1nrhHR-00063y-U8; Thu, 19 May 2022 10:37:33 -0400
Received: from esa2.hc3370-68.iphmx.com ([216.71.145.153]:57688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=13100c9ce=anthony.perard@citrix.com>)
 id 1nrhHQ-0007Tx-6A; Thu, 19 May 2022 10:37:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1652971052;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ebfjX54Q/dRlgfHegJC/4k9RI/dgb8rA4FaZPyu1KJc=;
 b=K84E+qbbtPb23OWLAYOtDKCcozWkkpwpGjp14KN5Xf4ivdKSFR2QnYr2
 5PsKubJ6tawqYpUP1sS1tGoDy2yQmHfCtQyQISHAnYtrVuZNy5Sg+ab0B
 7sQotjVc7YhjTaCMVe1Cxu2lXmXski+6vzBQE2cqE9/WGfuz27837kR1e 8=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 71710597
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:NIQFwKC8e5CfWRVW/3bkw5YqxClBgxIJ4kV8jS/XYbTApGwr1GdSn
 DEfXG3VMveIMWWjfNogb43n9hwF68fdytEyQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHGeIdA970Ug5w7Ng09Yx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhq8
 sdRmL+sRj0jAbz2vuZMcAt+TiNXaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwqKtXrO4UO/Glt1zjDAd4tQIzZQrWM7thdtNs1rp8XQq+GO
 ptGAdZpRBSfOiwMKHosMps/oOa4nXfwUHoBtWvA8MLb5ECMlVcsgdABKuH9YN2BRcxPkgCYq
 2TK8n7iBRcyMN2ZwCCCtHW2iYfnhSn8XpATEryQ7PNmgFSPgGcUDXU+UFKhqvS9zEemVd9bI
 UUJ/wIhqKEz8AqgSdyVdwS1pWPBtBobUNl4Feo85weQjK3O7G6xBHMCSSFpctEqtMYqAzct0
 zehkt/0DCZjt5WVQHie8ayI6zW/JUA9KHQeTTUJQQsM/5/op4RbpgvCS8smDLS0kNz8HRn2x
 DaFqjV4gK8c5eYS2qCmuFzKnT+ojp7OSAEz+0PQRG3Nxhh5aYi5ap2A5l3S7PIGJ4GcJnGRs
 X5Bl8WA4eQmCZCWiDfLUOgLBKuu5fuOLHvbm1EHN4Eo6jCF63OlO4dK71lWP1x1O8wJfTvoZ
 k77ug5L4pJXenywYsdKj5mZUppwi/K6TJK8C66SPoEmjoVNmBGv5xt8eWOzw2/Xmnc9q4c9a
 LSJV5uuJCNPYUh49waeS+AY2L4t4ykxw2LPWJz2pyiaPaqiiG29EulcbgbXBgwtxObd+ViOr
 Y4DXyef408HONASdBU75mL6wboiCXEgTa77pMVMHgJoClo3QTpxYxM9LF5IRmCEo0i3vrqRl
 p1echUBoLYauZEgAVzTAk2PkJu1Af5CQYsTZETAx2qA1Xk5epqI56wCbZYxdrRP3LU9kKQkF
 qNZJpzeWawnptH7F9M1NMmVkWCfXE7z2VLm09SNPlDTgKKMtySWo4S5L2MDBQEFDzattNtWn
 lFT/lizfHb3fCw7VJy+QKv2lzuZ5CFB8MovDxqgCoQCIy3Erdk1QxEde9dqeqng3z2YnWDEv
 +tXaD9FzdTwT3gdqYmW2vvc9d/yewa8d2IDd1TmAX+NHXGy1gKeLUVoCY5koRi1uLvIxZif
IronPort-HdrOrdr: A9a23:v08bXqwXPdbnKZsMDznDKrPwLL1zdoMgy1knxilNoRw8SKKlfu
 SV7ZAmPH7P+VMssR4b9OxoVJPtfZqYz+8T3WBzB8bBYOCFgguVxehZhOOIqQEIWReOldK1vZ
 0QFZSWY+eQMbEVt6nH3DU=
X-IronPort-AV: E=Sophos;i="5.91,237,1647316800"; d="scan'208";a="71710597"
Date: Thu, 19 May 2022 15:37:24 +0100
To: Bernhard Beschow <shentey@gmail.com>
CC: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>,
 <sstabellini@kernel.org>, <paul@xen.org>, <xen-devel@lists.xenproject.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, Richard
 Henderson <richard.henderson@linaro.org>, Eduardo Habkost
 <eduardo@habkost.net>, John Snow <jsnow@redhat.com>, "open list:IDE"
 <qemu-block@nongnu.org>
Subject: Re: [PATCH v2 3/3] include/hw/ide: Unexport pci_piix3_xen_ide_unplug()
Message-ID: <YoZWJFatGiKF1pUI@perard.uk.xensource.com>
References: <20220513180957.90514-1-shentey@gmail.com>
 <20220513180957.90514-4-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220513180957.90514-4-shentey@gmail.com>
Received-SPF: pass client-ip=216.71.145.153;
 envelope-from=prvs=13100c9ce=anthony.perard@citrix.com;
 helo=esa2.hc3370-68.iphmx.com
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

On Fri, May 13, 2022 at 08:09:57PM +0200, Bernhard Beschow wrote:
> This function was declared in a generic and public header, implemented
> in a device-specific source file but only used in xen_platform. Given its
> 'aux' parameter, this function is more xen-specific than piix-specific.
> Also, the hardcoded magic constants seem to be generic and related to
> PCIIDEState and IDEBus rather than piix.
> 
> Therefore, move this function to xen_platform, unexport it, and drop the
> "piix3" in the function name as well.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> Reviewed-by: Paul Durrant <paul@xen.org>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

