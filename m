Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A92A52D62D
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 16:34:54 +0200 (CEST)
Received: from localhost ([::1]:54968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrhEr-0001wN-1S
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 10:34:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=13100c9ce=anthony.perard@citrix.com>)
 id 1nrhA5-0007d1-6x; Thu, 19 May 2022 10:29:57 -0400
Received: from esa1.hc3370-68.iphmx.com ([216.71.145.142]:24959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=13100c9ce=anthony.perard@citrix.com>)
 id 1nrhA2-00066d-Hi; Thu, 19 May 2022 10:29:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1652970594;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=r9lkrrxfjkjFuwcAENsqT/4XhkccjDDyecQwXCzjSPY=;
 b=AFheTfYcClJMnnxb5RY2Ow1RcmoiAYiraTKWf6rwFlmx0AYLdglURw2g
 x6LitFi+1UWp79RlReC7zvAjXjAcNHo+TMQb3d3q0Q2qsIKTTStYOBPaH
 TCxbvGLHZ6+vIoRg2+KHLvNKp+aYvLXRfwJQrFozQevr+WB12SNMHQgq+ s=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 72097988
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:v3GPyqzBMmFL99XFBYd6t+dowSrEfRIJ4+MujC+fZmUNrF6WrkVWy
 zEZXziPM/vYZzanf9skOYuy9EkB6JSGytNkG1dsqSAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX5JZS5LwbZj2NY12InhWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Nplm4WdSy1wAZL1le1MahQFOjk9Eb140eqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DNYUDunZm3HfBAOwvW5zrSKTW/95Imjw3g6iiGN6BP
 ZJINms/PHwsZTUfEFE6NbwXld6npXDOXmRakUy/lfEetj27IAtZj+G2bYu9lsaxbcBOgm6Cq
 27G9ni/CRYfXPSSxSeM6H6rru/GlyD8Q55UErCkntZwgVaTz3YfTh0bU1e2u+K+jGa6WtRWM
 UtS/TAhxYAr+Um2C9P5WBa7iHiDuBEaRpxXCeJSwAOWzK3LyxyUCmgNUnhKb9lOnMo/Xzcn0
 hmAh93kATZmrbi9RneU97PSpjS3UQANJ2gEdy4CTCMf7tXjqZ11hRXKJv56Hauoy8HvGC/xy
 jSiqi84iLMOy8kR2M2T5F3Cnnegq4bESiYz4QPYWH/j6Rl2DKa+Z4Gu9VXKxflFJYedCFKGu
 RAsi8WYqewDE5yJvCiMW/kWWqGk4e6fNz/RikIpGIMunxy18mOnVZBd5nd5PkgBGt0fZTbjb
 UvXuAVQzJxeJn2naelweY3ZNigx5fG+T5K/DKmSN4cQJMgqHOOawM1wTWCJ8mLHyXcTqKw2a
 K6WLO+0TloKN40ymVJaWNwh+bMswyk/w0baSpb60wmr3NKiWZKFdVsWGADQN75ktctotC2Qq
 o8CbJXSl32zRcWkOkHqHZgvwUfmxJTRLbT/sIRpe+GKOWKK80lxWqaKkdvNl2GI9pm5d9skH
 FngAye0K3Kl3BUrzDlmjVg6MdvSsW5X9y5TAMDVFQ/AN4IfSYiu9rwDUJA8YKMq8udupdYtE
 aRfK5zaXqkWFG+fk9j4UXUahNUyHClHeCrUZ3b1CNTBV8AIq/P1Fi/MIVK0qXhm4tufvsoiu
 bywvj43srJYLzmO+P3+Mar1p3vo5CB1sLsrAyPgf4kCEG2xodMCA3Gg0ZcKzzQkdEyrKs2yj
 F3NX3/1ZIDl/ucIzTU+rfnU8NjyS7EmRSK33QDztN6LCMUTxUL7qacobQpCVWq1uL/ckEl6W
 dho8g==
IronPort-HdrOrdr: A9a23:OeyjjKD0QigQIbzlHemu55DYdb4zR+YMi2TC1yhKKCC9Vvbo8P
 xG/c5rsSMc5wx8ZJhNo7+90ey7MBXhHP1OkOws1NWZLWrbUQKTRekIh+bfKn/bak/DH4ZmpN
 5dmsNFaOEYY2IVsfrH
X-IronPort-AV: E=Sophos;i="5.91,237,1647316800"; d="scan'208";a="72097988"
Date: Thu, 19 May 2022 15:29:42 +0100
To: Bernhard Beschow <shentey@gmail.com>
CC: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>,
 <sstabellini@kernel.org>, <paul@xen.org>, <xen-devel@lists.xenproject.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, John Snow <jsnow@redhat.com>, "open list:IDE"
 <qemu-block@nongnu.org>
Subject: Re: [PATCH v2 1/3] hw/ide/piix: Remove redundant "piix3-ide-xen"
 device class
Message-ID: <YoZUVvjL0EFjvqgj@perard.uk.xensource.com>
References: <20220513180957.90514-1-shentey@gmail.com>
 <20220513180957.90514-2-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220513180957.90514-2-shentey@gmail.com>
Received-SPF: pass client-ip=216.71.145.142;
 envelope-from=prvs=13100c9ce=anthony.perard@citrix.com;
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

On Fri, May 13, 2022 at 08:09:55PM +0200, Bernhard Beschow wrote:
> Commit 0f8445820f11a69154309863960328dda3dc1ad4 'xen: piix reuse pci
> generic class init function' already resolved redundant code which in
> turn rendered piix3-ide-xen redundant.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>

Creating a guest and migrating a guest seems to work fine without
"piix3-ide-xen", and I can't find this name used outside of QEMU. So I
guess it's fine to remove it.

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

