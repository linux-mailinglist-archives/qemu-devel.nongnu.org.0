Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE601F9D70
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jun 2020 18:29:38 +0200 (CEST)
Received: from localhost ([::1]:38374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jkrzN-0008Eh-RI
	for lists+qemu-devel@lfdr.de; Mon, 15 Jun 2020 12:29:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1jkryA-0007MQ-EN; Mon, 15 Jun 2020 12:28:22 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:21601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1jkry7-0006TM-Vg; Mon, 15 Jun 2020 12:28:21 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 84D4D74633E;
 Mon, 15 Jun 2020 18:28:15 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 67A75746331; Mon, 15 Jun 2020 18:28:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 663FF74632B;
 Mon, 15 Jun 2020 18:28:15 +0200 (CEST)
Date: Mon, 15 Jun 2020 18:28:15 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PULL 0/4] Vga 20200615 patches
In-Reply-To: <20200615151449.19818-1-kraxel@redhat.com>
Message-ID: <alpine.BSF.2.22.395.2006151822170.51837@zero.eik.bme.hu>
References: <20200615151449.19818-1-kraxel@redhat.com>
User-Agent: Alpine 2.22 (BSF 395 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/15 11:14:38
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 15 Jun 2020, Gerd Hoffmann wrote:
> The following changes since commit 7d3660e79830a069f1848bb4fa1cdf8f666424fb:
>
>  Merge remote-tracking branch 'remotes/bonzini/tags/for-upstream' into staging (2020-06-12 23:06:22 +0100)
>
> are available in the Git repository at:
>
>  git://git.kraxel.org/qemu tags/vga-20200615-pull-request
>
> for you to fetch changes up to fca0b885417497a973c56e6d4e0d88f9f7a0e71b:
>
>  sm501: Optimise 1 pixel 2d ops (2020-06-15 10:52:53 +0200)
>
> ----------------------------------------------------------------
> vga: sm501 fixes and optimizations.
>
> ----------------------------------------------------------------
>
> BALATON Zoltan (4):
>  sm501: Fix bounds checks
>  sm501: Drop unneded variable
>  sm501: Ignore no-op blits
>  sm501: Optimise 1 pixel 2d ops
>
> hw/display/sm501.c | 58 ++++++++++++++++++++++++++++++++++++++--------
> 1 file changed, 48 insertions(+), 10 deletions(-)

Seems you've crossed mails with Peter. He sent some review comments for 
these patches. Should I respin with those changes or you'll take this as 
it is and I should send followup patches?

Regards,
BALATON Zoltan

