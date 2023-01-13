Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E5A668816
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 01:05:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pG7Yo-0003hd-I6; Thu, 12 Jan 2023 19:04:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pG7Yl-0003hR-3G; Thu, 12 Jan 2023 19:04:39 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pG7Yi-0004tj-1V; Thu, 12 Jan 2023 19:04:38 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 2305D746324;
 Fri, 13 Jan 2023 01:02:11 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id E3BFA745712; Fri, 13 Jan 2023 01:02:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id E24E87456E3;
 Fri, 13 Jan 2023 01:02:10 +0100 (CET)
Date: Fri, 13 Jan 2023 01:02:10 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
cc: Akihiko Odaki <akihiko.odaki@daynix.com>, qemu-devel@nongnu.org, 
 qemu-ppc@nongnu.org
Subject: Re: [PATCH 07/31] e1000: Use more constant definitions
In-Reply-To: <0f22e884-93f2-237e-e44a-6dd1b7443349@linaro.org>
Message-ID: <2071638d-8966-b22e-8098-7a718bb5bdc4@eik.bme.hu>
References: <20230112095743.20123-1-akihiko.odaki@daynix.com>
 <20230112095743.20123-8-akihiko.odaki@daynix.com>
 <0f22e884-93f2-237e-e44a-6dd1b7443349@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-301133139-1673568130=:66220"
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

--3866299591-301133139-1673568130=:66220
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Thu, 12 Jan 2023, Philippe Mathieu-Daudé wrote:
> On 12/1/23 10:57, Akihiko Odaki wrote:
>> The definitions for E1000_VFTA_ENTRY_SHIFT, E1000_VFTA_ENTRY_MASK, and
>> E1000_VFTA_ENTRY_BIT_SHIFT_MASK were copied from:
>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/drivers/net/ethernet/intel/e1000/e1000_hw.h?h=v6.0.9#n306
>> 
>> The definitions for E1000_NUM_UNICAST, E1000_MC_TBL_SIZE, and
>> E1000_VLAN_FILTER_TBL_SIZE were copied from:
>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/drivers/net/ethernet/intel/e1000/e1000_hw.h?h=v6.0.9#n707
>> 
>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>> ---
>>   hw/net/e1000.c         | 50 +++++++++++++++++++++++-------------------
>>   hw/net/e1000_regs.h    |  9 ++++++++
>>   hw/net/e1000x_common.c |  5 +++--
>>   hw/net/e1000x_common.h |  2 +-
>>   4 files changed, 41 insertions(+), 25 deletions(-)
>
>
>> diff --git a/hw/net/e1000x_common.h b/hw/net/e1000x_common.h
>> index 3501e4855a..b991d814b1 100644
>> --- a/hw/net/e1000x_common.h
>> +++ b/hw/net/e1000x_common.h
>> @@ -102,7 +102,7 @@ enum {
>>   static inline void
>>   e1000x_inc_reg_if_not_full(uint32_t *mac, int index)
>>   {
>> -    if (mac[index] != 0xffffffff) {
>> +    if (mac[index] != UINT32_MAX) {
>
> I wonder if using -1 wouldn't be simpler, otherwise great

Comparing unsigned type with negative value does not seem very clean to 
me. Either of the above (0xffffffff or UINT32_MAX) is more explicit and 
easier to understand.

Regards,
BALATON Zoltan

> cleanup!
>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>
>>           mac[index]++;
>>       }
>>   }
>
>
>
--3866299591-301133139-1673568130=:66220--

