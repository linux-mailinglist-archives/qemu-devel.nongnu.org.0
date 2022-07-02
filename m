Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F04564065
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jul 2022 15:36:19 +0200 (CEST)
Received: from localhost ([::1]:43332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7dII-0007SD-RX
	for lists+qemu-devel@lfdr.de; Sat, 02 Jul 2022 09:36:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o7dH2-0006gt-AZ; Sat, 02 Jul 2022 09:35:00 -0400
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f]:44739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o7dH0-0004rt-Nx; Sat, 02 Jul 2022 09:35:00 -0400
Received: by mail-oi1-x22f.google.com with SMTP id h65so7131073oia.11;
 Sat, 02 Jul 2022 06:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=waBuwBbE6Pd32TOD4FBzZ/z+pBK2Ab76+UJtXun9vgE=;
 b=QQsKG5K81voAWNijXr3msGPwRD6AU1T7USPCegYW+rCmS6AYVFTWbUyCMxzbpbNBmh
 VxXDIrkdVQon54xWQDDAeHxH3jg2LceqtueOdZ244yLXfxZ3PlQsbwMO0T/GjEUszeWV
 kH7k21hfcr+k3AqsJrE+SWlXM1a1HVzCUIMkozNzK1DC1xdgUZuwqBQA5FhLcfuHLfm7
 EnQC3D8LGka8MwLpimW9qSPIDxLKcWNnNRJf8/f9yzrANj4JFymnZ9H39Uq8cDfC+Kcb
 ZqUCM7WLLND0ZDXIxG4I7UD7q/9AjvsUR92onB/uZtEle5BtHTgFRIGppX/2UEPN/ZkU
 tyWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=waBuwBbE6Pd32TOD4FBzZ/z+pBK2Ab76+UJtXun9vgE=;
 b=bDetpO7ANBbtIbWjrW1MOzO0GJD3JNngAhNGmf2b+pQCYUB0j/yZxMPn84eFDPnW4u
 z0gWA5mMkhPSjr/0HJpELbNz/2YMNlebMBurffyfOgefFEMn77HWI2S7O43Hv+jxFAtg
 DgapeHenA+qkSQ0HNLNG+UJv3eY8zJOro2dWJDdRkuBEca9IKHkOrAzcpbn/hS6QgV00
 tNhUYC/LadrRdDs68mP9e9bvvXTsjUDK050EUzEdyb8D2h+3iHLcocXppaRNbeY3G2wW
 McBPLjGoml25VPxQF6ld6aNlbPm/RTqUaFP8+CQ3i/vIZgJ+prJtjOtRdG9f+BPN2ZJ9
 Qlog==
X-Gm-Message-State: AJIora+63bAQ5MV5DkhsVAi++SfHnJQ/7fzAVHOupz+4Qg4dtWQHoGNz
 wQGX0AVqza5xZvuje1WzhFc=
X-Google-Smtp-Source: AGRyM1vIfoarZlITvOGBGLsHixnJO+Ik89ObakDXUOFUb3JTJRC9nFIvEJr7kym/LNVhCpE/l+mNeQ==
X-Received: by 2002:a05:6808:144b:b0:337:aee7:b006 with SMTP id
 x11-20020a056808144b00b00337aee7b006mr827161oiv.204.1656768896778; 
 Sat, 02 Jul 2022 06:34:56 -0700 (PDT)
Received: from [192.168.10.102] ([191.193.1.105])
 by smtp.gmail.com with ESMTPSA id
 u13-20020a056870f28d00b001048b819e13sm16014993oap.8.2022.07.02.06.34.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Jul 2022 06:34:56 -0700 (PDT)
Message-ID: <47277f4f-a6a5-85dc-4806-67df8e2fc153@gmail.com>
Date: Sat, 2 Jul 2022 10:34:49 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/9] target/ppc: add errp to kvmppc_read_int_cpu_dt()
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org
References: <20220630194249.886747-1-danielhb413@gmail.com>
 <20220630194249.886747-3-danielhb413@gmail.com>
 <55014e2a-a668-4843-8338-850abeb5ff04@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <55014e2a-a668-4843-8338-850abeb5ff04@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22f.google.com
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



On 7/2/22 03:24, Cédric Le Goater wrote:
> On 6/30/22 21:42, Daniel Henrique Barboza wrote:
>> The function can't just return 0 whether an error happened and call it a
>> day. We must provide a way of letting callers know if the zero return is
>> legitimate or due to an error.
>>
>> Add an Error pointer to kvmppc_read_int_cpu_dt() that will be filled
>> with an appropriate error, if one occurs. Callers are then free to pass
>> an Error pointer and handle it.
>>
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> ---
>>   target/ppc/kvm.c | 16 +++++++++-------
>>   1 file changed, 9 insertions(+), 7 deletions(-)
>>
>> diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
>> index 109823136d..bc17437097 100644
>> --- a/target/ppc/kvm.c
>> +++ b/target/ppc/kvm.c
>> @@ -1925,15 +1925,17 @@ static uint64_t kvmppc_read_int_dt(const char *filename)
>>   /*
>>    * Read a CPU node property from the host device tree that's a single
>> - * integer (32-bit or 64-bit).  Returns 0 if anything goes wrong
>> - * (can't find or open the property, or doesn't understand the format)
>> + * integer (32-bit or 64-bit).  Returns 0 and set errp if anything goes
>> + * wrong (can't find or open the property, or doesn't understand the
>> + * format)
>>    */
>> -static uint64_t kvmppc_read_int_cpu_dt(const char *propname)
>> +static uint64_t kvmppc_read_int_cpu_dt(const char *propname, Error **errp)
>>   {
>>       char buf[PATH_MAX], *tmp;
>>       uint64_t val;
>>       if (kvmppc_find_cpu_dt(buf, sizeof(buf))) {
>> +        error_setg(errp, "Failed to read CPU property %s", propname);
>>           return 0;
>>       }
>> @@ -1946,12 +1948,12 @@ static uint64_t kvmppc_read_int_cpu_dt(const char *propname)
>>   uint64_t kvmppc_get_clockfreq(void)
>>   {
>> -    return kvmppc_read_int_cpu_dt("clock-frequency");
>> +    return kvmppc_read_int_cpu_dt("clock-frequency", NULL);
> 
> 
> This should be fatal. no ?


I'm not sure. I went under the assumption that there might be some weird
condition where 'clock-frequency' might be missing from the DT, and this
is why we're not exiting out immediately.

That said, the advantage of turning this into fatal is that we won't need
all the other patches that handles error on this function. We're going to
assume that if 'clock-frequency' is missing then we can't boot. I'm okay
with that.


Thanks,


Daniel



> 
> C.
> 
> 
>>   }
>>   static int kvmppc_get_dec_bits(void)
>>   {
>> -    int nr_bits = kvmppc_read_int_cpu_dt("ibm,dec-bits");
>> +    int nr_bits = kvmppc_read_int_cpu_dt("ibm,dec-bits", NULL);
>>       if (nr_bits > 0) {
>>           return nr_bits;
>> @@ -2336,8 +2338,8 @@ static void alter_insns(uint64_t *word, uint64_t flags, bool on)
>>   static void kvmppc_host_cpu_class_init(ObjectClass *oc, void *data)
>>   {
>>       PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
>> -    uint32_t dcache_size = kvmppc_read_int_cpu_dt("d-cache-size");
>> -    uint32_t icache_size = kvmppc_read_int_cpu_dt("i-cache-size");
>> +    uint32_t dcache_size = kvmppc_read_int_cpu_dt("d-cache-size", NULL);
>> +    uint32_t icache_size = kvmppc_read_int_cpu_dt("i-cache-size", NULL);
>>       /* Now fix up the class with information we can query from the host */
>>       pcc->pvr = mfpvr();
> 

