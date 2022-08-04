Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCE758991E
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 10:16:37 +0200 (CEST)
Received: from localhost ([::1]:36268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJW20-0007Mz-70
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 04:16:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oJVho-0006aT-Jq; Thu, 04 Aug 2022 03:55:45 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:41842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oJVhm-0007k2-RK; Thu, 04 Aug 2022 03:55:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dVnT/A8dScaQhutZedMIm5hncGxIEOCO4ali+rcaqlw=; b=bnGBwcCM2xt+hTuYjvx2CjmyCY
 5FaMegB4x4St1ycxkmHw63QdS3t9dG6cuV9wIErXLn9czsK6Hkp+3Wyy1h2J4u4KQI/dy2q+WdRed
 +rJpAbx6c7Y7BaEa7WuuEdkU8zRJASdzuEvmhmTp1iHDxSezcIkZ81M9Kx5yca1mi1MkI2AnjRELV
 9+Z9z4DuL/OliM5Rsgkj/GRo/bTYQWkraUU+nC0bTRxhCFDOpiLvwfa5/k9VnPGnpOLhJkEBGXRtq
 LDkA9bJ6lfamOetFRBdDbip7h1XDPKhS2dh4Sjxx73fBBg5qAwPwpUeKlgd6c2A+c4e9eRv5kIEuz
 MhiacpxtoI2Ld9aNe1k1Rza/16/dKtLlH+Oh5fz1KbuG917XnbydhbieehDeg3tAiBJwFIAbOfXmi
 hdH+5iDGy4jR7daGcRYswfLC9vRT5O8sKotWxzsti8hfTYD0B6/N3tRZ1+zpcwHOmOwPhAb4jOmt/
 2loOyhafCNwoocuElQ5uiAYUt0SaJy9TX3XNKpcmDmrp96SJFPoPhM6qcBNZIYfanKeGo+/Ov0s03
 f287BQodejkFE5t5J3+vi9WJ6oMzKMQNt/sd72UIeKyJsAN+NeBjShSzAjOwxS7suNt83giP9btx8
 k2aFYodUUcgKNHAVwAqsODiWseZ+16HgvE+tGzvvs=;
Received: from [2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oJVgA-0006Xa-AF; Thu, 04 Aug 2022 08:54:06 +0100
Message-ID: <d1082408-9e67-58cf-e6d7-f4b15c8681f6@ilande.co.uk>
Date: Thu, 4 Aug 2022 08:55:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>
Cc: qemu-ppc@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 qemu-devel@nongnu.org
References: <20220803132844.2370514-1-clg@kaod.org>
 <20220803132844.2370514-13-clg@kaod.org>
 <91bae6f7-1e68-6bf3-e2f-b31a5a78f2d@eik.bme.hu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <91bae6f7-1e68-6bf3-e2f-b31a5a78f2d@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 12/20] ppc/ppc405: QOM'ify EBC
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 04/08/2022 00:04, BALATON Zoltan wrote:

> On Wed, 3 Aug 2022, Cédric Le Goater wrote:
>> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>> hw/ppc/ppc405.h    | 16 +++++++++++
>> hw/ppc/ppc405_uc.c | 71 +++++++++++++++++++++++++++++++---------------
>> 2 files changed, 64 insertions(+), 23 deletions(-)
>>
>> diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
>> index 1da34a7f10f3..1c7fe07b8084 100644
>> --- a/hw/ppc/ppc405.h
>> +++ b/hw/ppc/ppc405.h
>> @@ -65,7 +65,22 @@ struct ppc4xx_bd_info_t {
>>
>> typedef struct Ppc405SoCState Ppc405SoCState;
>>
>> +/* Peripheral controller */
>> +#define TYPE_PPC405_EBC "ppc405-ebc"
>> +OBJECT_DECLARE_SIMPLE_TYPE(Ppc405EbcState, PPC405_EBC);
>> +struct Ppc405EbcState {
>> +    DeviceState parent_obj;
>> +
>> +    PowerPCCPU *cpu;
>>
>> +    uint32_t addr;
>> +    uint32_t bcr[8];
>> +    uint32_t bap[8];
>> +    uint32_t bear;
>> +    uint32_t besr0;
>> +    uint32_t besr1;
>> +    uint32_t cfg;
>> +};
>>
>> /* DMA controller */
>> #define TYPE_PPC405_DMA "ppc405-dma"
>> @@ -203,6 +218,7 @@ struct Ppc405SoCState {
>>     Ppc405OcmState ocm;
>>     Ppc405GpioState gpio;
>>     Ppc405DmaState dma;
>> +    Ppc405EbcState ebc;
>> };
>>
>> /* PowerPC 405 core */
>> diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
>> index 6bd93c1cb90c..0166f3fc36da 100644
>> --- a/hw/ppc/ppc405_uc.c
>> +++ b/hw/ppc/ppc405_uc.c
>> @@ -393,17 +393,6 @@ static void ppc4xx_opba_init(hwaddr base)
>>
>> /*****************************************************************************/
>> /* Peripheral controller */
>> -typedef struct ppc4xx_ebc_t ppc4xx_ebc_t;
>> -struct ppc4xx_ebc_t {
>> -    uint32_t addr;
>> -    uint32_t bcr[8];
>> -    uint32_t bap[8];
>> -    uint32_t bear;
>> -    uint32_t besr0;
>> -    uint32_t besr1;
>> -    uint32_t cfg;
>> -};
>> -
>> enum {
>>     EBC0_CFGADDR = 0x012,
>>     EBC0_CFGDATA = 0x013,
>> @@ -411,10 +400,9 @@ enum {
>>
>> static uint32_t dcr_read_ebc (void *opaque, int dcrn)
>> {
>> -    ppc4xx_ebc_t *ebc;
>> +    Ppc405EbcState *ebc = PPC405_EBC(opaque);
>>     uint32_t ret;
>>
>> -    ebc = opaque;
> 
> I think QOM casts are kind of expensive (maybe because we have quo-debug enabled by 
> default even without --enable-debug and it does additional checks; I've tried to 
> change this default once but it was thought to be better to have it enabled). So it's 
> advised to use QOM casts sparingly, e.g. store the result in a local variable if you 
> need it more than once and so. Therefore I tend to consider these read/write 
> callbacks that the object itself registers with itself as the opaque pointer to be 
> internal to the object and guaranteed to be passed the object pointer so no QOM cast 
> is necessary and the direct assignment can be kept. This avoids potential overhead on 
> every register access. Not sure if it's measurable but I think if an overhead can be 
> avoided it probably should be.

Can you provide any evidence for this? IIRC the efficiency of the QOM cast macros 
without --enable-debug was improved several years ago to the point where their impact 
is minimal (note: this does not include object_dynamic_cast()). From memory the 
previous discussions concluded that whilst the QOM cast did add some runtime 
overhead, it was dwarfed by the cost of breaking out of emulation to handle the MMIO 
access itself. If something has changed here then that sounds like a bug.

I think it's worth keeping the QOM casts in place unless there is a good reason not 
to, simply because they have helped me many times in past catch out refactoring 
mistakes. For example I can certainly imagine that the recent PHB series would have 
been a lot more painful without having them.


ATB,

Mark.

