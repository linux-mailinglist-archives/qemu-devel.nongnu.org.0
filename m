Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE8A3166EC
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 13:41:09 +0100 (CET)
Received: from localhost ([::1]:43738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9ons-0007pk-R2
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 07:41:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l9okY-00074h-9Q
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 07:37:42 -0500
Received: from mx2.suse.de ([195.135.220.15]:59254)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l9okV-0005rQ-UV
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 07:37:42 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 31A28AC97;
 Wed, 10 Feb 2021 12:37:38 +0000 (UTC)
Subject: Re: [PATCH v16 02/23] target/riscv: remove CONFIG_TCG, as it is
 always TCG
To: Roman Bolshakov <r.bolshakov@yadro.com>
References: <20210204163931.7358-1-cfontana@suse.de>
 <20210204163931.7358-3-cfontana@suse.de>
 <20210210122236.xllr7snnl2xiofln@SPB-NB-133.local>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <bf24e3ea-37ef-3b32-2da1-18c0bf0d341c@suse.de>
Date: Wed, 10 Feb 2021 13:37:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210210122236.xllr7snnl2xiofln@SPB-NB-133.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.211,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/10/21 1:22 PM, Roman Bolshakov wrote:
> On Thu, Feb 04, 2021 at 05:39:10PM +0100, Claudio Fontana wrote:
>> for now only TCG is allowed as an accelerator for riscv,
>> so remove the CONFIG_TCG use.
>>
>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
>> ---
>>  target/riscv/cpu.c | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index 567f6790a9..60d0b43153 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -617,10 +617,9 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
>>  #endif
>>      cc->gdb_arch_name = riscv_gdb_arch_name;
>>      cc->gdb_get_dynamic_xml = riscv_gdb_get_dynamic_xml;
>> -#ifdef CONFIG_TCG
>>      cc->tcg_ops.initialize = riscv_translate_init;
>>      cc->tlb_fill = riscv_cpu_tlb_fill;
>> -#endif
>> +
>>      device_class_set_props(dc, riscv_cpu_properties);
>>  }
>>  
> 
> I'm not sure if it should be dropped because it might be readded soon
> because of: https://lwn.net/Articles/830078/
> 
> Regards,
> Roman
> 


This #ifdef comes in my view from a "template" use of target/xxx/cpu.c (all targets seem to start with this #ifdef), but its use is not consistent throughout, it's only here.

When KVM is enabled, correct splitting of TCG and KVM will be required, this specific #ifdef is not the solution.

Note that this change is already in master.

Ciao,

Claudio



