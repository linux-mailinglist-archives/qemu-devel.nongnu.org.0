Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9DA635B18
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 12:08:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxnb2-0004At-2q; Wed, 23 Nov 2022 06:07:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oxnaj-00048M-3m
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 06:06:58 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oxnag-00015d-O3
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 06:06:56 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 396D974812E;
 Wed, 23 Nov 2022 12:06:14 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 057F174812D; Wed, 23 Nov 2022 12:06:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 0473F74811B;
 Wed, 23 Nov 2022 12:06:14 +0100 (CET)
Date: Wed, 23 Nov 2022 12:06:13 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
cc: peter.maydell@linaro.org, alex.bennee@linaro.org, 
 richard.henderson@linaro.org, qemu-devel@nongnu.org
Subject: Re: [PATCH 0/1] tcg: convert tcg/README to rst
In-Reply-To: <20221123095445.31970-1-mark.cave-ayland@ilande.co.uk>
Message-ID: <361dd079-a7d3-a1b2-0753-177156ef833e@eik.bme.hu>
References: <20221123095445.31970-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hello,

On Wed, 23 Nov 2022, Mark Cave-Ayland wrote:
> This is something I've had lying around in the background for a while, and I
> finally managed to get it in a state suitable for submission. The main
> motivation was that I wanted to have a TCG operation reference that was
> easily viewable online in a web browser.

Nice. Maybe including a link to the result could help review. Is this the 
right link?

https://github.com/mcayland/qemu/blob/tcg-readme-rst/docs/devel/tcg.rst

The second paragraph refers to tcg/README which is this file and this 
patch moves it so that sentence does not make much sense. Maybe it should 
be dropped and the only remaining sentence from that paragraph added to 
the previous. In fact the last sentence could also be added to avoid one 
sentence paragraphs and make the intro section just one paragraph.

Regards,
BALATON Zoltan

> The patch converts tcg/README to rst and then moves it from tcg/README to a
> new "TCG Intermediate Representation" section in docs/devel.
>
> The conversion is fairly straightforward, with a few minor touch-ups to
> produce a more aesthetic result which are documented in the commit message.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>
>
> Mark Cave-Ayland (1):
>  tcg: convert tcg/README to rst
>
> docs/devel/atomics.rst   |    2 +
> docs/devel/index-tcg.rst |    1 +
> docs/devel/tcg-ops.rst   | 1018 ++++++++++++++++++++++++++++++++++++++
> tcg/README               |  784 -----------------------------
> 4 files changed, 1021 insertions(+), 784 deletions(-)
> create mode 100644 docs/devel/tcg-ops.rst
> delete mode 100644 tcg/README
>
>

