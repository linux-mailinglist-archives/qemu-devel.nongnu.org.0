Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9076751F7
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 11:03:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIoDL-0003BR-QA; Fri, 20 Jan 2023 05:01:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pIoDF-0003Au-2H
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 05:01:34 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pIoDC-0005St-FF
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 05:01:32 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 0425A745712;
 Fri, 20 Jan 2023 10:59:05 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 62AFC745706; Fri, 20 Jan 2023 10:59:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 60A5D7456E3;
 Fri, 20 Jan 2023 10:59:04 +0100 (CET)
Date: Fri, 20 Jan 2023 10:59:04 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Thomas Huth <thuth@redhat.com>
cc: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>, 
 qemu-devel@nongnu.org
Subject: Re: [PATCH v2 0/4] bulk: Replace TARGET_FMT_plx by HWADDR_PRIx
In-Reply-To: <9494369d-a498-81f7-0cd8-1cfe31029c2a@redhat.com>
Message-ID: <f33059d9-3c11-8fde-1da7-19264c495c4a@eik.bme.hu>
References: <20230111083909.42624-1-philmd@linaro.org>
 <9494369d-a498-81f7-0cd8-1cfe31029c2a@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="3866299591-1308043357-1674208744=:388"
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1308043357-1674208744=:388
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Fri, 20 Jan 2023, Thomas Huth wrote:
> On 11/01/2023 09.39, Philippe Mathieu-Daudé wrote:
>> Since v1:
>> - Fix checkpatch style violations
>> - Use HWADDR_PRIx instead of HWADDR_FMT_plx (Zoltan)
>> 
>> Supersedes: <20230110212947.34557-1-philmd@linaro.org>
>>              "bulk: Rename TARGET_FMT_plx -> HWADDR_FMT_plx"
>> 
>> Philippe Mathieu-Daudé (4):
>>    hw: Remove hardcoded tabs (code style)
>>    bulk: Coding style fixes
>>    bulk: Replace TARGET_FMT_plx -> HWADDR_PRIx
>>    bulk: Prefix '0x' to hex values displayed with HWADDR_PRIx format
>
> Big sorry, I picked up v1 for my last pull request before I saw that there is 
> a v2. But IMHO it's ok to have a separate macro with a %016 included, so I'd 
> rather tend to keep HWADDR_FMT_plx. Anyway, if you consider the other changes 
> in your series important enough, please rebase them. Sorry again for the 
> additional work that this might cause.

I don't mind too much so maybe isn't worth the churn to have another patch 
for this. I'll let Philippe decide what he wants to do with it.

Regards,
BALATON Zoltan
--3866299591-1308043357-1674208744=:388--

