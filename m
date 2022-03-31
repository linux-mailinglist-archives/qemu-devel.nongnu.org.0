Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7A04EDF94
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 19:22:19 +0200 (CEST)
Received: from localhost ([::1]:58742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZyV0-0004Us-OT
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 13:22:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nZyQf-0000qE-28; Thu, 31 Mar 2022 13:17:52 -0400
Received: from [2607:f8b0:4864:20::333] (port=39560
 helo=mail-ot1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nZyQd-0004oi-4J; Thu, 31 Mar 2022 13:17:48 -0400
Received: by mail-ot1-x333.google.com with SMTP id
 a17-20020a9d3e11000000b005cb483c500dso340578otd.6; 
 Thu, 31 Mar 2022 10:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=eGoKsMCgrRfX39y6y1Q/5vZauX9lPvXVdkMdLCAYVOk=;
 b=ms9M4cl50BRo0gPA6LhB0iCQxF0/TfcPetwgkLvPPQGi04XCIglmDnjaJtcae8H/NU
 DbZoqxxkOtIlpaPBXH4eRXSCP4+7TcIb+IXSrjAO2GtFiFJ98N91V6phDzUnPcNNHBpU
 jf5MAGC5IqGGttzjYxPNNy0/C8jxTNCnQIwGVlaaptONbVvOrej4W8M03+YnFuIVx3lQ
 q8UQEvao9nFB3v+Gt9Jh+PV2IpW/70tYDbvcMDs+HKMmWoj4Fm+iO0PW94pFNkqMFp+z
 J/FcPux2J+CdXh5+8W4x4W+x6j0r+JQu8dgrHOEemMWxPL0UdRlQI/C9/9uSgO+7Zmp7
 hk0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=eGoKsMCgrRfX39y6y1Q/5vZauX9lPvXVdkMdLCAYVOk=;
 b=FNlNA7t1R3NiY8JWxqIJaZnCP1/4YtDhVBeom/gL3wZa0qhXEoMyulxwFmBiCtACy3
 0vOmHEMu8m1SNPn182p25Q3yjKtwwRSEJZexDqmmp/x+UYx1By3TpJe7Norf9+7oDdJ/
 tBldrVvIp5y7D9e+ZDldUlDFZj19wTEeHQVLtGWgDCE6S0nXflcN4ED7gbcJK5wjRLVi
 AmjCTOJMgJ0aw0XX9cjRwUaqgUktzwVW25fmgAMyC8qADFPk5nTwWMtnLGoOqOzC95M0
 6008Yf8gulzCq2AfR/FZ5f1N6XPGaNZkWvmwWibuIATHB2tI1flGdMuKY3hj8hEBG78b
 eLEA==
X-Gm-Message-State: AOAM5311t9cnIB+e95to43BEVi8HIr+02g0m9HqPxx8Hm4aTNApINIy6
 7pwV4+uVg4QMH7BrUR6X0Sk=
X-Google-Smtp-Source: ABdhPJzCBOcU23fY5G4tUPj53Y3YnONy/DimtAi7tc+P/hAwdI+9DK5oQlmG+s0bSEhmqpeTyaGq0g==
X-Received: by 2002:a9d:868:0:b0:5ce:1958:2ce1 with SMTP id
 95-20020a9d0868000000b005ce19582ce1mr264508oty.147.1648747065515; 
 Thu, 31 Mar 2022 10:17:45 -0700 (PDT)
Received: from ?IPV6:2804:431:c7c6:abe8:ed:2c78:ab0c:7946?
 ([2804:431:c7c6:abe8:ed:2c78:ab0c:7946])
 by smtp.gmail.com with ESMTPSA id
 t17-20020a9d7f91000000b005c925454e6fsm21896otp.69.2022.03.31.10.17.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Mar 2022 10:17:45 -0700 (PDT)
Message-ID: <d5b622c6-81b4-9d3f-9777-5233fe5a2be4@gmail.com>
Date: Thu, 31 Mar 2022 14:17:42 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 2/4] target/ppc: init 'lpcr' in
 kvmppc_enable_cap_large_decr()
Content-Language: en-US
To: David Gibson <david@gibson.dropbear.id.au>
References: <20220331001717.616938-1-danielhb413@gmail.com>
 <20220331001717.616938-3-danielhb413@gmail.com> <YkUDCdUsjjmzFgJr@yekko>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <YkUDCdUsjjmzFgJr@yekko>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::333
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x333.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 3/30/22 22:25, David Gibson wrote:
> On Wed, Mar 30, 2022 at 09:17:15PM -0300, Daniel Henrique Barboza wrote:
>> 'lpcr' is used as an input of kvm_get_one_reg(). Valgrind doesn't
>> understand that and it returns warnings as such for this function:
>>
>> ==55240== Thread 1:
>> ==55240== Conditional jump or move depends on uninitialised value(s)
>> ==55240==    at 0xB011E4: kvmppc_enable_cap_large_decr (kvm.c:2546)
>> ==55240==    by 0x92F28F: cap_large_decr_cpu_apply (spapr_caps.c:523)
>> ==55240==    by 0x930C37: spapr_caps_cpu_apply (spapr_caps.c:921)
>> ==55240==    by 0x955D3B: spapr_reset_vcpu (spapr_cpu_core.c:73)
>> ==55240==    by 0x95612B: spapr_cpu_core_reset (spapr_cpu_core.c:209)
>> ==55240==    by 0x95619B: spapr_cpu_core_reset_handler (spapr_cpu_core.c:218)
>> ==55240==    by 0xD3605F: qemu_devices_reset (reset.c:69)
>> ==55240==    by 0x92112B: spapr_machine_reset (spapr.c:1641)
>> ==55240==    by 0x4FBD63: qemu_system_reset (runstate.c:444)
>> ==55240==    by 0x62812B: qdev_machine_creation_done (machine.c:1247)
>> ==55240==    by 0x5064C3: qemu_machine_creation_done (vl.c:2725)
>> ==55240==    by 0x5065DF: qmp_x_exit_preconfig (vl.c:2748)
>> ==55240==  Uninitialised value was created by a stack allocation
>> ==55240==    at 0xB01158: kvmppc_enable_cap_large_decr (kvm.c:2540)
>>
>> Init 'lpcr' to avoid this warning.
> 
> Hmm... this is seeming a bit like whack-a-mole.  Could we instead use
> one of the valgrind hinting mechanisms to inform it that
> kvm_get_one_reg() writes the variable at *target?

I didn't find a way of doing that looking in the memcheck helpers
(https://valgrind.org/docs/manual/mc-manual.html section 4.7). That would be a
good way of solving this warning because we would put stuff inside a specific
function X and all callers of X would be covered by it.

What I did find instead is a memcheck macro called VALGRIND_MAKE_MEM_DEFINED that
tells Valgrind that the var was initialized.

This patch would then be something as follows:


diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index dc93b99189..b0e22fa283 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -56,6 +56,10 @@
  #define DEBUG_RETURN_GUEST 0
  #define DEBUG_RETURN_GDB   1
  
+#ifdef CONFIG_VALGRIND_H
+#include <valgrind/memcheck.h>
+#endif
+
  const KVMCapabilityInfo kvm_arch_required_capabilities[] = {
      KVM_CAP_LAST_INFO
  };
@@ -2539,6 +2543,10 @@ int kvmppc_enable_cap_large_decr(PowerPCCPU *cpu, int enable)
      CPUState *cs = CPU(cpu);
      uint64_t lpcr;
  
+#ifdef CONFIG_VALGRIND_H
+    VALGRIND_MAKE_MEM_DEFINED(lpcr, sizeof(uint64_t));
+#endif
+
      kvm_get_one_reg(cs, KVM_REG_PPC_LPCR_64, &lpcr);
      /* Do we need to modify the LPCR? */


CONFIG_VALGRIND_H needs 'valgrind-devel´ installed.

I agree that this "Valgrind is complaining about variable initialization" is a whack-a-mole
situation that will keep happening in the future if we keep adding this same code pattern
(passing as reference an uninitialized var). For now, given that we have only 4 instances
to fix it in ppc code (as far as I'm aware of), and we don't have a better way of telling
Valgrind that we know what we're doing, I think we're better of initializing these vars.


Thanks,


Daniel



> 
>> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> ---
>>   target/ppc/kvm.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
>> index 858866ecd4..42814e1b97 100644
>> --- a/target/ppc/kvm.c
>> +++ b/target/ppc/kvm.c
>> @@ -2538,7 +2538,7 @@ int kvmppc_get_cap_large_decr(void)
>>   int kvmppc_enable_cap_large_decr(PowerPCCPU *cpu, int enable)
>>   {
>>       CPUState *cs = CPU(cpu);
>> -    uint64_t lpcr;
>> +    uint64_t lpcr = 0;
>>   
>>       kvm_get_one_reg(cs, KVM_REG_PPC_LPCR_64, &lpcr);
>>       /* Do we need to modify the LPCR? */
> 

