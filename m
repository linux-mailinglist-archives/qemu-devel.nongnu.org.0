Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A1F2E331C
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Dec 2020 23:29:20 +0100 (CET)
Received: from localhost ([::1]:56462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kteXP-0004by-3n
	for lists+qemu-devel@lfdr.de; Sun, 27 Dec 2020 17:29:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kteWC-0003XE-U2
 for qemu-devel@nongnu.org; Sun, 27 Dec 2020 17:28:05 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:36612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kteW8-0000oN-PZ
 for qemu-devel@nongnu.org; Sun, 27 Dec 2020 17:28:04 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 9990F74646C;
 Sun, 27 Dec 2020 23:27:59 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 680A074645F; Sun, 27 Dec 2020 23:27:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 667E074645B;
 Sun, 27 Dec 2020 23:27:59 +0100 (CET)
Date: Sun, 27 Dec 2020 23:27:59 +0100 (CET)
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH 2/2] via-ide: Fix fuloong2e support
In-Reply-To: <cdf2cf0e-bde8-a854-5206-4e55bdcc733f@amsat.org>
Message-ID: <ecf2dfd6-b38-a2f7-68d-6164f15b6710@eik.bme.hu>
References: <cover.1608852217.git.balaton@eik.bme.hu>
 <796292ea92f3f00e696b1eea33ef0c6815002bf0.1608852217.git.balaton@eik.bme.hu>
 <00c994c9-99d8-5b34-3976-4e6617b794a2@amsat.org>
 <8c7e7487-3cb8-5df3-2ce7-5b4bb1b698c2@eik.bme.hu>
 <cdf2cf0e-bde8-a854-5206-4e55bdcc733f@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1733261998-1609108079=:33939"
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
Cc: John Snow <jsnow@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1733261998-1609108079=:33939
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Sun, 27 Dec 2020, Philippe Mathieu-Daudé wrote:
> On 12/27/20 5:40 PM, BALATON Zoltan via wrote:
>> On Sun, 27 Dec 2020, Philippe Mathieu-Daudé wrote:
>>> On 12/25/20 12:23 AM, BALATON Zoltan wrote:
>>>> From: Guenter Roeck <linux@roeck-us.net>
>>>>
>>>> Fuloong2e needs to use legacy mode for IDE support to work with Linux.
>>>> Add property to via-ide driver to make the mode configurable, and set
>>>> legacy mode for Fuloong2e.
>>>>
>>>
>>> Fixes: 4ea98d317eb ("ide/via: Implement and use native PCI IDE mode")?
>>
>> Not really. That patch did what it said (only emulating (half) native
>> mode instead of only emulating legacy mode) so it wasn't broken per se
>> but it turned out that approach wasn't good enough for all use cases so
>> this now takes a different turn (emulating either legacy or half-native
>> mode based on option property). Therefore. I don't think Fixes: applies
>> in this case. It fixes an issue with a guest but replaces previous patch
>> with different approach. (Even though it reuses most of it.)
>
> Well, if Linux guest got broken by this commit, why not name it a "fix"?

We do call it a fix in the patch title. I just thought Fixes: tag was more 
for either security fixes or cases when original commit had a bug that's 
fixed up by this patch which is not exactly the case here.

> Anyway I don't mind how it is called. I find important to refer to the
> commit hash to help navigating between commits while reviewing history.
>
> What about:
>
> '''
> The legacy mode for IDE support has been removed in commit 4ea98d317eb
> ("ide/via: Implement and use native PCI IDE mode"). When using a Linux
> guest, the Fuloong2e machine requires the legacy mode.
> Add property to via-ide driver to make the mode configurable, and set
> legacy mode for Fuloong2e.
> '''
>
> Guenter, is that OK with you? (I can update when applying this series
> via the MIPS tree).

I've submitted v2 with this commit message (slightly edited) mentioning 
the original commit for tracking.

Regards,
BALATON Zoltan
--3866299591-1733261998-1609108079=:33939--

