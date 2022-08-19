Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE33359A2F9
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 19:50:23 +0200 (CEST)
Received: from localhost ([::1]:56032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oP68U-0008BZ-Pb
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 13:50:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oP5zQ-0004mN-Ak; Fri, 19 Aug 2022 13:41:01 -0400
Received: from mail-vk1-xa2b.google.com ([2607:f8b0:4864:20::a2b]:40804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oP5zM-0007Wx-HL; Fri, 19 Aug 2022 13:41:00 -0400
Received: by mail-vk1-xa2b.google.com with SMTP id d6so449406vko.7;
 Fri, 19 Aug 2022 10:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=aY4GIdssTNqdSt8Opsmu6mc8NtJqn2kolOwZdliEoeo=;
 b=DqsbV1bjXD+5CvhQ7a6aSwkiIUjizNoNNoh8mI79lL2rnZckzOXMyrfpF6zCyAxOXF
 gJ/QPZsLMii681Q7yZBmz/8TjoyGDYiutIU14tzK5NzGbI3Y3GY/Mu0Z2gXHQTAfWVhu
 W4ycpX+vf0dqbgb4/4LhxzqbHcQZYUhFac3JhJbrKV5KZIOHSciJelEE7qhrPc7Os7pX
 st9MOq6zR9pBM+OU/dwjeylknSf3nycqSMptv/1cPIplDkXS0SMIIQZe31gZVx+LURHP
 4RImC5yEU457osT8T3qbRcZcyYYr7Z44B8uWP9uSEasVCgoW+gC9m66P8GZdkUkm34IW
 rX3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=aY4GIdssTNqdSt8Opsmu6mc8NtJqn2kolOwZdliEoeo=;
 b=HdWP/xKHl6cPV2QFP39s52r5cq6EyRDx+3SN18NbVBX9hNyr7UB8nIyVTCFIW4D7b+
 hx/ZUzDj+Mc39FAoBS1o4iAkvwVIBeNpZu2awWJ1CJHem6V22GFLmFF4uZ64Z/Q9qnKd
 NJMnfk+JGoRvZdXvK9ud3w44YnedW1apJPtUeoSDonW6elOQ4F6s3m96pc+JAF22unnZ
 LkSfjUnBUCC/cFS5Al0RXOe1+583u6gd/AO0gCx8TFIt+7QQ2eAoI08nRANMjMrNF90p
 mZcYzJT5561LPYTJfT2IMnqDIWFKNubK+8gWwIDtN5B6cKAgKrRjQIMHO8fSO6hVy3N2
 PSRg==
X-Gm-Message-State: ACgBeo3CLd3ZAYnF1T9YNDEA0r69OMrn5mHei8eSw6wicOF8mTBuKd9G
 hKHFE9y6ue98Xq2jW8+h1jc=
X-Google-Smtp-Source: AA6agR7SdrC0MiVGCsznraeUOER/a0xJhKXunymQGwpVEb51mtR3phCGpatBxDcfezSRBIeiz6OSqQ==
X-Received: by 2002:a1f:b6c9:0:b0:37d:bb0:9005 with SMTP id
 g192-20020a1fb6c9000000b0037d0bb09005mr3609556vkf.2.1660930854605; 
 Fri, 19 Aug 2022 10:40:54 -0700 (PDT)
Received: from [192.168.10.102] ([189.110.115.28])
 by smtp.gmail.com with ESMTPSA id
 r5-20020ab06605000000b003842250a024sm2813798uam.10.2022.08.19.10.40.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Aug 2022 10:40:54 -0700 (PDT)
Message-ID: <c3c60d0a-1e29-99cb-64d5-ad06586331e8@gmail.com>
Date: Fri, 19 Aug 2022 14:40:51 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH for-7.2 v3 10/20] hw/ppc: set machine->fdt in spapr machine
Content-Language: en-US
To: David Gibson <david@gibson.dropbear.id.au>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, clg@kaod.org,
 alistair.francis@wdc.com
References: <20220816173428.157304-1-danielhb413@gmail.com>
 <20220816173428.157304-11-danielhb413@gmail.com> <Yv2e9xTwV59QXM6I@yekko>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <Yv2e9xTwV59QXM6I@yekko>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2b;
 envelope-from=danielhb413@gmail.com; helo=mail-vk1-xa2b.google.com
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



On 8/17/22 23:07, David Gibson wrote:
> On Tue, Aug 16, 2022 at 02:34:18PM -0300, Daniel Henrique Barboza wrote:
>> The pSeries machine never bothered with the common machine->fdt
>> attribute. We do all the FDT related work using spapr->fdt_blob.
>>
>> We're going to introduce HMP commands to read and save the FDT, which
>> will rely on setting machine->fdt properly to work across all machine
>> archs/types.
>>
>> Let's set machine->fdt in the two places where we manipulate the FDT:
>> spapr_machine_reset() and CAS.
> 
> So, there's a third place where fdt_blob is updated, in h_update_dt();
> that happens because SLOF can make some updates to the DT that qemu
> needs to be aware of.  It's kinda ugly, and is a consequence of the
> fact that qemu and SLOF kind of share the role of "platform firmware"
> for spapr.
> 
> But.. it's worse than that.  Those are the only 3 places we actually
> alter fdt_blob, but not the only places we logically update the device
> tree.  Up until now there wasn't a way to introspect the DT, and so we
> didn't bother keeping spapr->fdt_blob update.  Essentially, we
> considered maintaining the DT image the job of the guest after CAS.
> 
> Specifically, every dynamic reconfiguration event (hotplug or unplug)
> alters the device tree.  We generate an fdt fragment for the new
> device then stream that as an update to the guest using the PAPR
> specified interface (rtas_ibm_configure_connector).  As noted we
> currently don't update qemu's global fdt image based on that.  On hot
> unplug logically we need to revert those changes, which is actually
> pretty tricky, but currently the guest's job.
> 
> 
> Really, the trouble is that just dumping or viewing the dt is only
> simple in an "embedded" style environment where the fdt is generate
> then spit into the guest.  In an actual open firmware environment like
> spapr, the DT is logically a dynamic thing maintained by firmware -
> but because "firmware"'s responsibility is split between SLOF and
> RTAS/qemu, keeping track of that is pretty nasty.  For an environment
> like this, the flat tree format isn't really suited either - we'd want
> a dynamic representation of the tree.  We get away with flat trees for
> now (barely) only because we mostly delegate the responsibility for
> managing the tree to SLOF and/or the OS kernel, both of which do use
> non-flat representations of the tree.

Thanks for the explanation, but I'm not sure what to do with this patch now.
Should I amend the commit msg to reflect what you explained, mentioning that
we're missing a handful of places where the FDT is updated? We can then come
back at a later time and update ms->fdt in those places as well. This would
be a good follow-up to do after we get rid of spapr->fdt_blob and use ms->fdt
only.

Another alternative is to drop this patch and do spapr in separate later on.
I can live with that, but I'd rather have something for spapr even under the
disclaimer that "this might be not the most up to date FDT the guest is
using".


Thanks,


Daniel

> 
>> spapr->fdt_blob is left untouched for now. To replace it with
>> machine->fdt, since we're migrating spapr->fdt_blob, we would need to
>> migrate machine->fdt as well. This is something that we would like to to
>> do keep our code simpler but it's a work we'll do another day.
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
>> index bc9ba6e6dc..7031cf964a 100644
>> --- a/hw/ppc/spapr.c
>> +++ b/hw/ppc/spapr.c
>> @@ -1713,6 +1713,12 @@ static void spapr_machine_reset(MachineState *machine)
>>       spapr->fdt_initial_size = spapr->fdt_size;
>>       spapr->fdt_blob = fdt;
>>   
>> +    /*
>> +     * Set the common machine->fdt pointer to enable support
>> +     * for 'dumpdtb' and 'info fdt' QMP/HMP commands.
>> +     */
>> +    machine->fdt = fdt;
>> +
>>       /* Set up the entry state */
>>       first_ppc_cpu->env.gpr[5] = 0;
>>   
>> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
>> index a8d4a6bcf0..a53bfd76f4 100644
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
>> +     * QMP/HMP commands.
>> +     */
>> +    MACHINE(spapr)->fdt = fdt;
>> +
>>       return H_SUCCESS;
>>   }
>>   
> 

