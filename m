Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 797BF679E52
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 17:12:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKLu1-0000eV-1a; Tue, 24 Jan 2023 11:12:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3811cd0e8=anthony.perard@citrix.com>)
 id 1pKLty-0000eB-Eh
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 11:12:02 -0500
Received: from esa3.hc3370-68.iphmx.com ([216.71.145.155])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3811cd0e8=anthony.perard@citrix.com>)
 id 1pKLtw-0003nN-Ff
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 11:12:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1674576720;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=aJZjbVq4jKQ0w0wngtXqyqo/hwzFxt75DZOtebZQHFs=;
 b=KSSPAuLOFsw6SPwVjPjKAhp/FO1PTzBs0MNhORZNvMZxaFqhQMj2jxDd
 mMjoOOrUaQzeMPH1jDGnUk3tC8xWXS0TA+/KL6vP9J2swhet2jR6yCApg
 DCvNS5+nF7yTlWAQOhNuXXM0bsmqyAl28+0UTQMdFfrQ614AM2ooOnbzo w=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 94058108
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:GxeXy6+4c9v4OCAQ99JqDrUDnnmTJUtcMsCJ2f8bNWPcYEJGY0x3y
 moWWm6CMvjfNGTyed9zPNnj9UtUvJ/SyoNgTlBkqyw8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKucYHsZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kIw1BjOkGlA5AdmPKoX5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDkley
 fomdh5RaSmdrP/u8OKge6pIiNQ8eZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUqGOkcUUrsUIMtWcOOAj3/jczpeuRSNqLA++WT7xw1tyrn9dtHSf7RmQO0Ewh7F9
 juerwwVBDkbBvGm4gSk6E6lg8TBjQGhBo85F4OBo6sCbFq7mTVIVUx+uUGAifS1l0ekV9V3K
 0Ue+S01se40+VDDZsH3WBuqoXiFlgQRV9pZD6sx7wTl4q/d+Q2UAi4NVjBMbNYvqcoeSjkj1
 1vPlNTsbRR3sLyRTH618raSpCm1fy8PIgcqbDcJVwIf7/H/oYs4iVTESdMLOKuukvXvFD3wy
 izMpy87750Zl8ULyq6473jOhDbqrZ/MJiYt7xjTdnKo6EV+foHNT5ap4ljS9/oGLIufQlSbp
 38Cs8yf6ukUCteKjiPlaPwAGazs6/ubPTn0h1lpEJ88sTO39BaLZoBd5i1zNW9mN88FfXniZ
 0q7kRhK+JZZMX+ubKl2S4G8EcInye7nD9uNfvnJdNdKY5V3XAaa5ixqPhTW2W3x+GAsiaYiI
 oyad+62AH8RFaN8ij2sSI81wbItgywz227XbZT61Ai8l6qTYmaPTrUIO0fIafo2hJ5ouy2Mr
 YwZbZHTjUwCDqunOHK/HZMvwU4iPUQ9O87Y98tuaMWeejo2A1BiL/HB3uZ0E2B6pJh9muDN9
 3C7f0ZXzlvjmHHKQTm3hmBfhKDHBsgm8y9iVcA4FRPxgiV4P97zhEsKX8FvFYTL4tCP2hKdo
 xMtX8ybSspCRT3ck9j2Rcms9dcyHPhHaO/nAsZEXNTdV8Q4L+Aq0oW+FucKyMXpJnTfiCfGi
 +f8vj43uLJaL+iYMO7Yaei003S6tmUHleR5UiPge4cMJBm9oNgzdnKh35fbxv3gzj2allOnO
 /u+W09E9YEhXadrmDU2uUx0h9jwSLYvdqarN2La8ay3JUHnEpmLmOd9vBKzVWmFDgvcofzyD
 di5OtmgaJXran4W6dsje1uqpIpij+bSS0hylFQ5RCqbNwn7VtuN4BCuhKFyi0GE/ZcB0SPeZ
 65F0oUy1WmhUC89LGMsGQ==
IronPort-HdrOrdr: A9a23:3iT3NKpzngz3fMBqiuncRfQaV5v5L9V00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssRAb6La90cy7LU80mqQFhbX5UY3SPjUO21HYT72Kj7GSugEIcheWnoEytZ
 uIG5IOcOEYZmIK6voSjjPIdurI9OP3i5xAyN2uvEtFfEVPUeVN/g15AgGUHglfQxRHP4MwEN
 656tBcrzStVHwLZoDjb0N1KtTrlpnurtbLcBQGDxko5E2nii6p0qfzF1y90g0FWz1C7L8++S
 zukhD/5I+kr/anoyWspVP73tBzop/M29FDDMuDhow8LSjtsB+hYMBbV7iLrFkO0Z+SAAJBqr
 jxiiZlG/42x2Laf2mzrxeo8RLnyiwS53jrzkLdqWf/oOTiLQhKQfZptMZ8SF/0+kAgtNZz3O
 ZgxGSCradaChvGgWDU+8XIbRd3jUC5yEBS2tL7t0YvHLf2VYUh5LD3vXklZqvoJRiKn7zPxd
 MeRP01555tACynhj7izyVSKeeXLwgO9ye9MzU/U/OuokJrdVBCvjolLZ8k7wc9HdQGOu1529
 g=
X-IronPort-AV: E=Sophos;i="5.97,242,1669093200"; d="scan'208";a="94058108"
Date: Tue, 24 Jan 2023 16:11:47 +0000
To: Bernhard Beschow <shentey@gmail.com>
CC: <qemu-devel@nongnu.org>, Richard Henderson <richard.henderson@linaro.org>, 
 Stefano Stabellini <sstabellini@kernel.org>,
 <xen-devel@lists.xenproject.org>, =?iso-8859-1?Q?Herv=E9?= Poussineau
 <hpoussin@reactos.org>, Aurelien Jarno <aurelien@aurel32.net>, Paul Durrant
 <paul@xen.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, Philippe
 =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>, Chuck Zmudzinski
 <brchuckz@aol.com>, "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2 0/6] Resolve TYPE_PIIX3_XEN_DEVICE
Message-ID: <Y9ADQ/Yu8QQD0oyD@perard.uk.xensource.com>
References: <20230104144437.27479-1-shentey@gmail.com>
 <20230118051230-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230118051230-mutt-send-email-mst@kernel.org>
Received-SPF: pass client-ip=216.71.145.155;
 envelope-from=prvs=3811cd0e8=anthony.perard@citrix.com;
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

On Wed, Jan 18, 2023 at 05:13:03AM -0500, Michael S. Tsirkin wrote:
> On Wed, Jan 04, 2023 at 03:44:31PM +0100, Bernhard Beschow wrote:
> > This series first renders TYPE_PIIX3_XEN_DEVICE redundant and finally removes
> > it. The motivation is to 1/ decouple PIIX from Xen and 2/ to make Xen in the PC
> > machine agnostic to the precise southbridge being used. 2/ will become
> > particularily interesting once PIIX4 becomes usable in the PC machine, avoiding
> > the "Frankenstein" use of PIIX4_ACPI in PIIX3.
> 
> Looks ok to me.
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> 
> Feel free to merge through Xen tree.

Hi Bernhard,

The series currently doesn't apply on master. And a quick try at
applying the series it is based on also failed. Could you rebase it , or
maybe you would prefer to wait until the other series "Consolidate
PIIX..." is fully applied?

Thanks.

> > Testing done:
> > None, because I don't know how to conduct this properly :(
> > 
> > Based-on: <20221221170003.2929-1-shentey@gmail.com>
> >           "[PATCH v4 00/30] Consolidate PIIX south bridges"

-- 
Anthony PERARD

