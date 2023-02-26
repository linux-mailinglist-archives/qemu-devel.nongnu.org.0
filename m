Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5014F6A348F
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Feb 2023 23:17:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWPKk-0001ou-EV; Sun, 26 Feb 2023 17:17:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pWPKe-0001nU-Ds; Sun, 26 Feb 2023 17:17:24 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pWPKc-0005Y5-N3; Sun, 26 Feb 2023 17:17:23 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 45DD0746E90;
 Sun, 26 Feb 2023 23:17:21 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 14145746E5A; Sun, 26 Feb 2023 23:17:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 12AC9746E06;
 Sun, 26 Feb 2023 23:17:21 +0100 (CET)
Date: Sun, 26 Feb 2023 23:17:21 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 Gerd Hoffmann <kraxel@redhat.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 Bernhard Beschow <shentey@gmail.com>, philmd@redhat.com
Subject: Re: [PATCH 4/5] hw/audio/ac97: Split off some definitions to a header
In-Reply-To: <b8a1b43d-3216-2194-5a10-5b515378bc18@linaro.org>
Message-ID: <513bf143-7fdf-fa12-5830-f005149d3177@eik.bme.hu>
References: <cover.1677004414.git.balaton@eik.bme.hu>
 <ca70d84e45ad465e2d8adeebe21b9fba99103858.1677004415.git.balaton@eik.bme.hu>
 <b8a1b43d-3216-2194-5a10-5b515378bc18@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-110018823-1677449841=:59185"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-110018823-1677449841=:59185
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Sat, 25 Feb 2023, Philippe Mathieu-Daudé wrote:
> On 21/2/23 19:44, BALATON Zoltan wrote:
>> These can be shared with other AC97 implementations.
>> 
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> ---
>>   hw/audio/ac97.c | 43 +-------------------------------
>>   hw/audio/ac97.h | 65 +++++++++++++++++++++++++++++++++++++++++++++++++
>>   2 files changed, 66 insertions(+), 42 deletions(-)
>>   create mode 100644 hw/audio/ac97.h
>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Sorry missed this one, I'll add to next version if needed.
--3866299591-110018823-1677449841=:59185--

