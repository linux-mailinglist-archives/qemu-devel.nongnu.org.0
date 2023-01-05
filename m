Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADCC465F0DE
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 17:09:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDSnu-0006wA-5M; Thu, 05 Jan 2023 11:09:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pDSnq-0006vq-Hd; Thu, 05 Jan 2023 11:09:17 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pDSno-0004r6-R0; Thu, 05 Jan 2023 11:09:14 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id A35D274900C;
 Thu,  5 Jan 2023 17:06:54 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 6F91174633D; Thu,  5 Jan 2023 17:06:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 6E917746307;
 Thu,  5 Jan 2023 17:06:54 +0100 (CET)
Date: Thu, 5 Jan 2023 17:06:54 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH v7 6/7] mac_newworld: Deprecate mac99 "via" option
In-Reply-To: <7aa2d81c-6d9f-b681-b93f-6d997c86dd00@linaro.org>
Message-ID: <2d5e36e4-2633-e2a4-4907-3e5048cbc6ea@eik.bme.hu>
References: <cover.1672868854.git.balaton@eik.bme.hu>
 <4162db13bd1da9c6ddd77f185cef738e44790467.1672868854.git.balaton@eik.bme.hu>
 <7aa2d81c-6d9f-b681-b93f-6d997c86dd00@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-802763478-1672934814=:30257"
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

--3866299591-802763478-1672934814=:30257
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Thu, 5 Jan 2023, Philippe Mathieu-Daudé wrote:
> On 4/1/23 22:59, BALATON Zoltan wrote:
>> Setting emulated machine type with a property called "via" is
>> confusing users so deprecate the "via" option in favour of newly added
>> explicit machine types. The default via=cuda option is not a valid
>> config (no real Mac has this combination of hardware) so no machine
>> type could be defined for that therefore it is kept for backwards
>> compatibility with older QEMU versions for now but other options
>> resembling real machines are deprecated.
>> 
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> ---
>>   hw/ppc/mac_newworld.c | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>
> Don't we need to document in the 'System emulator machines'
> section of docs/about/deprecated.rst? (maybe within a
> "machine options" subsection)

That's in patch 7 for now which contains all the docs updates in one 
patch, I can reorganise these once we decide what should each patch 
contain. Options could be to make all deprecations a single patch or 
divide it by machines or options like one patch for ppc64 mac99 another 
for via option os whatever Matk is ready to accept at the end.

Regards,
BALATON Zoltan
--3866299591-802763478-1672934814=:30257--

