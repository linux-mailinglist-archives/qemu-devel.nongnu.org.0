Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 100CA59173F
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Aug 2022 00:24:51 +0200 (CEST)
Received: from localhost ([::1]:41766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMd5F-0007pT-MR
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 18:24:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oMd3j-0006F6-P0; Fri, 12 Aug 2022 18:23:15 -0400
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29]:38519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oMd3i-0004Ug-1x; Fri, 12 Aug 2022 18:23:15 -0400
Received: by mail-vs1-xe29.google.com with SMTP id 125so2125685vsd.5;
 Fri, 12 Aug 2022 15:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=RNlc8BH8+QrIuqmQjuL1/j3o9IK/A4MPALog30eIG4w=;
 b=Lmz9AbAkpr8Roo5DAxalrIWwqiU876FMIal1Qfty9POKlP9EQAdfvDKHe6bAO65fIp
 86T0eqKcdijkX4dWtRHXfQSVdJSM1valUdr0oO0a6SOKyvliP0VKudzv/Q9pSIaYxYVp
 p/bjZPJ5ceV9fcyelDf1R1xPX76+lQsQtBB+fRrTxSsZS12mg1pRutgmhSGaTe1XK7Mj
 6Ns5xxX/HxUx8jjILvPeWVCPretNvoP4KEekXJivIpNEBsOqn162g8a4UtHspbUoGUhK
 pNU89B0aiYwyUx3ySJrRq4g6g/XkJPLcA8twy6zP63l6vxmXjte/kxdvX+nzymlNJK7K
 lO5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=RNlc8BH8+QrIuqmQjuL1/j3o9IK/A4MPALog30eIG4w=;
 b=NiPvOfLE6cICQKOpHtgYmldq+GoH2CPeD3asAtgJkpZ/qpHQQXSOiAPJWAi9eJ9kl5
 JTIEcG8MzWQPp+APPmpx5N7gTrCR7AC6mCTrezEJeZx5sYrif3p3Z8e1PJFL5XGHK4Iv
 2Zr1nQAYKELg7GTZEMALLuMG4gS/V8rfjOdeuewH+6dvQYXFchFn2aqWXHBdjVXJEe6o
 8BdZhpnbc0GG8CTVgX65lpCjeaFoOsfNa2c4YBkC5ySfEAIcZaB+fCK0U/J+0dOJgQ5i
 f+3MyxI8brnlGoZVOjmFYvZZDZFU+ORhj9Wsmj+w0pvwIi9SUvz4gFdsyLQ8hiuLowL2
 b+Lg==
X-Gm-Message-State: ACgBeo04AmS/qVqczEAdefcnnH/DLtPjAuQmzhj695vQD7eLkGo6C87M
 enxesneaazNh6zlE6hrOXv4=
X-Google-Smtp-Source: AA6agR4LY1bCpi47Z8BAP8VkmXVhcNWl93OwEkuAo66lzxAW/ogWGu0fB0+PrnVXAmL+XxV8z+se1A==
X-Received: by 2002:a05:6102:d89:b0:379:2914:9cfa with SMTP id
 d9-20020a0561020d8900b0037929149cfamr3079840vst.18.1660342992570; 
 Fri, 12 Aug 2022 15:23:12 -0700 (PDT)
Received: from [192.168.10.102] (201-43-216-47.dsl.telesp.net.br.
 [201.43.216.47]) by smtp.gmail.com with ESMTPSA id
 a6-20020a056102094600b003884d8319fesm2084680vsi.26.2022.08.12.15.23.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Aug 2022 15:23:12 -0700 (PDT)
Message-ID: <1991166b-a463-4812-a6fe-eae5299fc3f1@gmail.com>
Date: Fri, 12 Aug 2022 19:23:09 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH for-7.2 v2 10/20] hw/ppc: set machine->fdt in spapr machine
Content-Language: en-US
To: David Gibson <david@gibson.dropbear.id.au>
Cc: qemu-devel@nongnu.org, alistair.francis@wdc.com,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org
References: <20220805093948.82561-1-danielhb413@gmail.com>
 <20220805093948.82561-11-danielhb413@gmail.com> <YvCCbNOkX4ZtaoWl@yekko>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <YvCCbNOkX4ZtaoWl@yekko>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e29;
 envelope-from=danielhb413@gmail.com; helo=mail-vs1-xe29.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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



On 8/8/22 00:26, David Gibson wrote:
> On Fri, Aug 05, 2022 at 06:39:38AM -0300, Daniel Henrique Barboza wrote:
>> The pSeries machine never bothered with the common machine->fdt
>> attribute. We do all the FDT related work using spapr->fdt_blob.
>>
>> We're going to introduce HMP commands to read and save the FDT, which
>> will rely on setting machine->fdt properly to work across all machine
>> archs/types.
>>
>> Let's set machine->fdt in the two places where we manipulate the FDT:
>> spapr_machine_reset() and CAS. spapr->fdt_blob is left untouched: what
>> we want is a way to access the FDT from HMP, not replace
>> spapr->fdt_blob.
> 
> Given there is now an fdt field in the generic MACHINE structure, we
> should be able to remove the one in spapr->fdt_blob, yes?

I thought about it but I backed down when I realized that spapr->fdt_blob is
being migrated.

At first glance it would be a matter of migrating ms->fdt and then removing
spapr->fdt_blob, but then I got confused about how a migration to an older
version would occur (e.g. QEMU 7.2 with ms->fdt to a QEMU 7.0 with
spapr->fdt_blob).

Migration to a newer QEMU would require us to move the spapr->version_id to 4
and then handle the old version accordingly in spapr_post_load().

Probably something to think about after this work is accepted.


Thanks,


Daniel



> 
>>
>> Cc: Cédric Le Goater <clg@kaod.org>
>> Cc: qemu-ppc@nongnu.org
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> ---
>>   hw/ppc/spapr.c       | 6 ++++++
>>   hw/ppc/spapr_hcall.c | 8 ++++++++
>>   2 files changed, 14 insertions(+)
>>
>> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
>> index bc9ba6e6dc..94c90f0351 100644
>> --- a/hw/ppc/spapr.c
>> +++ b/hw/ppc/spapr.c
>> @@ -1713,6 +1713,12 @@ static void spapr_machine_reset(MachineState *machine)
>>       spapr->fdt_initial_size = spapr->fdt_size;
>>       spapr->fdt_blob = fdt;
>>   
>> +    /*
>> +     * Set the common machine->fdt pointer to enable support
>> +     * for 'dumpdtb' and 'info fdt' commands.
>> +     */
>> +    machine->fdt = fdt;
>> +
>>       /* Set up the entry state */
>>       first_ppc_cpu->env.gpr[5] = 0;
>>   
>> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
>> index a8d4a6bcf0..0079bc6fdc 100644
>> --- a/hw/ppc/spapr_hcall.c
>> +++ b/hw/ppc/spapr_hcall.c
>> @@ -1256,6 +1256,14 @@ target_ulong do_client_architecture_support(PowerPCCPU *cpu,
>>       spapr->fdt_initial_size = spapr->fdt_size;
>>       spapr->fdt_blob = fdt;
>>   
>> +    /*
>> +     * Set the machine->fdt pointer again since we just freed
>> +     * it above (by freeing spapr->fdt_blob). We set this
>> +     * pointer to enable support for 'dumpdtb' and 'info fdt'
>> +     * HMP commands.
>> +     */
>> +    MACHINE(spapr)->fdt = fdt;
>> +
>>       return H_SUCCESS;
>>   }
>>   
> 

