Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C363967FC6E
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Jan 2023 03:47:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLxhw-0007yl-5R; Sat, 28 Jan 2023 21:46:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pLxht-0007xw-QO; Sat, 28 Jan 2023 21:46:13 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pLxhq-0006PQ-9I; Sat, 28 Jan 2023 21:46:13 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 3EE2474633D;
 Sun, 29 Jan 2023 03:43:37 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 0AA8D745706; Sun, 29 Jan 2023 03:43:37 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 09CB97456E3;
 Sun, 29 Jan 2023 03:43:37 +0100 (CET)
Date: Sun, 29 Jan 2023 03:43:37 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Gerd Hoffmann <kraxel@redhat.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH 0/3] Misc sm501 clean ups
In-Reply-To: <78368e67-0ed7-1828-100c-d4d9d15fd27d@linaro.org>
Message-ID: <46b0b8d7-dce4-18e2-970d-2fd81100bd98@eik.bme.hu>
References: <cover.1674333199.git.balaton@eik.bme.hu>
 <78368e67-0ed7-1828-100c-d4d9d15fd27d@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1826593396-1674960217=:91915"
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

--3866299591-1826593396-1674960217=:91915
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Mon, 23 Jan 2023, Philippe Mathieu-Daudé wrote:
> On 21/1/23 21:35, BALATON Zoltan wrote:
>> Some small trivial clean ups I've found while looking at this file.
>> 
>> BALATON Zoltan (3):
>>    hw/display/sm501: Remove parenthesis around consant macro definitions
>>    hw/display/sm501: Remove unneeded casts from void pointer
>>    hw/display/sm501: Code style fix
>>
>>   hw/display/sm501.c | 419 +++++++++++++++++++++++----------------------
>>   1 file changed, 210 insertions(+), 209 deletions(-)
>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Ping? Who will merge this series? Should Daniel take it via PPC or Gerd 
for display? I only care that it gets in one way or another and not lost 
between maintainers.

Regards,
BALATON Zoltan
--3866299591-1826593396-1674960217=:91915--

