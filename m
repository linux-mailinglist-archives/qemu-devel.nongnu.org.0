Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50811597635
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 21:06:36 +0200 (CEST)
Received: from localhost ([::1]:42596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOON9-0000ru-Al
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 15:06:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oOOJ5-0006uz-W9; Wed, 17 Aug 2022 15:02:24 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:22231)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oOOIx-00075a-1D; Wed, 17 Aug 2022 15:02:17 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 1E903746397;
 Wed, 17 Aug 2022 21:02:12 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id E0B3574638A; Wed, 17 Aug 2022 21:02:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id DEE7C746381;
 Wed, 17 Aug 2022 21:02:11 +0200 (CEST)
Date: Wed, 17 Aug 2022 21:02:11 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: qemu-devel@nongnu.org, qemu-ppc@nongnu.org
cc: clg@kaod.org, Daniel Henrique Barboza <danielhb413@gmail.com>, 
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2 00/31] QOMify PPC4xx devices and minor clean ups
In-Reply-To: <cover.1660746880.git.balaton@eik.bme.hu>
Message-ID: <b61057e-9d29-1720-9926-74b59b3c0c7@eik.bme.hu>
References: <cover.1660746880.git.balaton@eik.bme.hu>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1194653798-1660762931=:79357"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1194653798-1660762931=:79357
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Wed, 17 Aug 2022, BALATON Zoltan wrote:
> Hello,
>
> This is based on gitlab.com/danielhb/qemu/tree/ppc-7.2
>
> This series contains the rest of Cédric's OOM'ify patches modified
> according my review comments and some other clean ups I've noticed
> along the way.
>
> v2 now also includes the sdram changes after some clean up to simplify
> it. This should now be the same state as Cédric's series. I shall
> continue with the ppc440_sdram DDR2 controller model used by the
> sam460ex but that needs a bit more chnages. But it is independent of
> this series so this can be merged now and I can follow up later in a
> separate series.

I've resent fixed v3 patches for patch 21 and 31, hopefully there are no 
more missing pieces. Let me know if you want the whole series resent 
instead.

Regards,
BALATON Zoltan
--3866299591-1194653798-1660762931=:79357--

