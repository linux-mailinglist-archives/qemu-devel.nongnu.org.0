Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 382765171B8
	for <lists+qemu-devel@lfdr.de>; Mon,  2 May 2022 16:38:22 +0200 (CEST)
Received: from localhost ([::1]:41784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlXBs-0001C6-VT
	for lists+qemu-devel@lfdr.de; Mon, 02 May 2022 10:38:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nlX9P-0005y3-MX
 for qemu-devel@nongnu.org; Mon, 02 May 2022 10:35:52 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:42964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nlX9M-0002On-Ei
 for qemu-devel@nongnu.org; Mon, 02 May 2022 10:35:46 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id D60B5746333;
 Mon,  2 May 2022 16:35:26 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 7AC0174632B; Mon,  2 May 2022 16:35:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 79669746324;
 Mon,  2 May 2022 16:35:26 +0200 (CEST)
Date: Mon, 2 May 2022 16:35:26 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v3 0/3] Misc AC97 clean ups
In-Reply-To: <cover.1650706617.git.balaton@eik.bme.hu>
Message-ID: <6ff58395-65a8-a50-90ee-571ccb131a8@eik.bme.hu>
References: <cover.1650706617.git.balaton@eik.bme.hu>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-985575339-1651502126=:15704"
X-Spam-Probability: 8%
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-985575339-1651502126=:15704
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Sat, 23 Apr 2022, BALATON Zoltan wrote:
> During trying to implement via-ac97 I did some small clean ups to ac97
> which is in this series. The via-ac97 is not working yet so that's not
> included but these unrelated clean ups could be merged now.
>
> v3: Fixed misalignments and drop spaces before commas (Víctor Colombo)
> v2: Added R-b and changes from Peter Maydell

Ping?

https://patchew.org/QEMU/cover.1650706617.git.balaton@eik.bme.hu/

> Regards.
>
> BALATON Zoltan (3):
>  hw/audio/ac97: Coding style fixes to avoid checkpatch errors
>  hw/audio/ac97: Remove unimplemented reset functions
>  hw/audio/ac97: Remove unneeded local variables
>
> hw/audio/ac97.c | 758 +++++++++++++++++++++++-------------------------
> 1 file changed, 363 insertions(+), 395 deletions(-)
>
>
--3866299591-985575339-1651502126=:15704--

