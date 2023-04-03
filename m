Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D518D6D4D05
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 18:02:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjMdI-0005c7-E0; Mon, 03 Apr 2023 12:02:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minhquangbui99@gmail.com>)
 id 1pjMdF-0005Ut-0A
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 12:02:09 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minhquangbui99@gmail.com>)
 id 1pjMdC-0002Hn-Ry
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 12:02:08 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 p3-20020a17090a74c300b0023f69bc7a68so31037639pjl.4
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 09:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680537724;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=At16ZM2v/CKGa5kust2up3B9GAiQeOyqfdZzJInX35w=;
 b=T0zv/9y9rtTQ1e8DpNLfJQ3xP1ed6KgWpm7CxG9WIrQn0dtyTI9Em0IpccKVVaRqcv
 A687uwauvBVV1xMr+WN7l0APo3bpR11hQW8iMGkRTSGY4lr0dU4kgdMui12C8DOMTU1j
 f/chIplKvhdluJJTwQi1Ex/C3vUEi2WZN9GdCUh+PPEJzaUhnzvcfUqhpyKnJd/WZTCk
 q8qajx8Ex4Z0DxX3eQZpNJchiXM3pYk6v5k6JVEgM1wYxhxeR7fwpkZHmssuwU3FOc+i
 1kxOF5ubnwo+aHd2k7Qud1HdvlF7B0BEMq7+M27m0pTy+B9foz8l8EguOH/WhxkUd9Mq
 YdAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680537724;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=At16ZM2v/CKGa5kust2up3B9GAiQeOyqfdZzJInX35w=;
 b=J1oVEZp5+0TlT7TUgM9RF949WB0UJp/zkvApnw8eo8utIC86fgDbVieAj4L0H0fqTN
 S2tmm07GmsXvPxd9dwPHBBcaIdQG/rWNMUxgMHW9pA0RbeQsDrTVZHu8Sj8aQG8wdMRX
 maAwHBLaGXkagtGH9+D8EGAHkcr2R1cgTRXl0zjIPCzHFHcDve0QNZgCEhW49wl+RI7+
 gQmBvI84qq6oB7Z+7Jw62Fz3q1ERAVaWd+yDzFCIUYvO561xYBHYgM4/XBvp7OKoWZiU
 AePmFPrRDCOmImgvvaA8tmE/Zw9G8SD566bN2uscIEgtMEnLZ1zNS53tCPz0BwBSfbUm
 Ajhw==
X-Gm-Message-State: AO0yUKVMqYvU6m/+76wCsNM7gRP+l+C/3camqkwkPlph74xPtlKRbNBz
 vuB5kA2GPyt3ERSKumXsB7k=
X-Google-Smtp-Source: AK7set+Ek2MO3bdcAJ4oKHcS94cvgz2xaSbZCCyjM0/K3+XQ284Vugw5Y5Ofrp20zTKEUKIQXY5DlA==
X-Received: by 2002:a05:6a20:2903:b0:d3:a347:7db4 with SMTP id
 t3-20020a056a20290300b000d3a3477db4mr32108821pzf.15.1680537723615; 
 Mon, 03 Apr 2023 09:02:03 -0700 (PDT)
Received: from [192.168.0.115] ([113.173.97.170])
 by smtp.gmail.com with ESMTPSA id
 r13-20020a63440d000000b0050336b0b08csm6098174pga.19.2023.04.03.09.02.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Apr 2023 09:02:03 -0700 (PDT)
Message-ID: <1c3f75d1-2f00-4059-dbc6-7264481e10e3@gmail.com>
Date: Mon, 3 Apr 2023 23:01:58 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 2/5] apic: add support for x2APIC mode
To: Igor Mammedov <imammedo@redhat.com>
Cc: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, "Michael S . Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20230326052039.33717-1-minhquangbui99@gmail.com>
 <20230326052039.33717-3-minhquangbui99@gmail.com>
 <a8ea36d901a1b713ab8bc0f5bcd1b7d26ad6f9cb.camel@infradead.org>
 <05d55576-f703-18a1-7f9f-4c15b8c54490@gmail.com>
 <0944a6f4c7c1569c182a27d40bdeb0a164a41bbb.camel@infradead.org>
 <61446cfb-f937-3a0d-2a98-34febcc7e4f3@gmail.com>
 <3834475953c0f865e88251886f1e861d51c25a2b.camel@infradead.org>
 <445928d9-4cd3-978d-ce76-9cd01457b6f0@gmail.com>
 <e47b58ef574bcf61259d7d3f0707a1f5ca808ff6.camel@infradead.org>
 <49167ae7-4cb4-3863-64b1-1396e1911bbf@gmail.com>
 <37cbb3b9-8a9a-2b88-2e09-a81f46b8bf74@gmail.com>
 <60228a86-633e-3cf6-b0d9-890b032d44f3@gmail.com>
 <20230330102850.33882a75@imammedo.users.ipa.redhat.com>
Content-Language: en-US
From: Bui Quang Minh <minhquangbui99@gmail.com>
In-Reply-To: <20230330102850.33882a75@imammedo.users.ipa.redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=minhquangbui99@gmail.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-1.349,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 3/30/23 15:28, Igor Mammedov wrote:
> On Wed, 29 Mar 2023 22:30:44 +0700
> Bui Quang Minh <minhquangbui99@gmail.com> wrote:
> 
>> On 3/29/23 21:53, Bui Quang Minh wrote:
>>> On 3/28/23 22:58, Bui Quang Minh wrote:
>>>> On 3/27/23 23:49, David Woodhouse wrote:
>>>>> On Mon, 2023-03-27 at 23:35 +0700, Bui Quang Minh wrote:
>>>>>> On 3/27/23 23:22, David Woodhouse wrote:
>>>>>>> On Mon, 2023-03-27 at 22:45 +0700, Bui Quang Minh wrote:
>>>>>>>>   
>>>>>>>>> Maybe I'm misreading the patch, but to me it looks that
>>>>>>>>> if (dest == 0xff) apic_get_broadcast_bitmask() bit applies even in
>>>>>>>>> x2apic mode? So delivering to the APIC with physical ID 255 will be
>>>>>>>>> misinterpreted as a broadcast?
>>>>>>>>
>>>>>>>> In case dest == 0xff the second argument to
>>>>>>>> apic_get_broadcast_bitmask
>>>>>>>> is set to false which means this is xAPIC broadcast
>>>>>>>
>>>>>>> Yeah, but it *isn't* xAPIC broadcast. It's X2APIC unicast to APIC#255.
>>>>>>>
>>>>>>> I think you want (although you don't have 'dev') something like this:
>>>>>>>
>>>>>>>
>>>>>>> static void apic_get_delivery_bitmask(uint32_t *deliver_bitmask,
>>>>>>>                                          uint32_t dest, uint8_t
>>>>>>> dest_mode)
>>>>>>> {
>>>>>>>        APICCommonState *apic_iter;
>>>>>>>        int i;
>>>>>>>
>>>>>>>        memset(deliver_bitmask, 0x00, max_apic_words *
>>>>>>> sizeof(uint32_t));
>>>>>>>
>>>>>>>        /* x2APIC broadcast id for both physical and logical
>>>>>>> (cluster) mode */
>>>>>>>        if (dest == 0xffffffff) {
>>>>>>>            apic_get_broadcast_bitmask(deliver_bitmask, true);
>>>>>>>            return;
>>>>>>>        }
>>>>>>>
>>>>>>>        if (dest_mode == 0) {
>>>>>>>            apic_find_dest(deliver_bitmask, dest);
>>>>>>>            /* Broadcast to xAPIC mode apics */
>>>>>>> -        if (dest == 0xff) {
>>>>>>> +        if (dest == 0xff && is_x2apic_mode(dev)) {
>>>>>>>                apic_get_broadcast_bitmask(deliver_bitmask, false);
>>>>>>>            }
>>>>>>>        } else {
>>>>>>>   
>>>>>>
>>>>>> Hmm, the unicast case is handled in apic_find_dest function, the logic
>>>>>> inside the if (dest == 0xff) is for handling the broadcast case only.
>>>>>> This is because when dest == 0xff, it can be both a x2APIC unicast and
>>>>>> xAPIC broadcast in case we have some CPUs that are in xAPIC and others
>>>>>> are in x2APIC.
>>>>>
>>>>> Ah! Yes, I see it now.
>>>>>
>>>>> Shouldn't apic_get_broadcast_bitmask(… true) add *all* APICs to the
>>>>> mask, regardless of their mode? An APIC which is still in xAPIC mode
>>>>> will only look at the low 8 bits and see 0xFF which it also interprets
>>>>> as broadcast? Or is that not how real hardware behaves?
>>>>
>>>> This is interesting. Your point looks reasonable to me but I don't
>>>> know how to verify it, I'm trying to write kernel module to test it
>>>> but there are just too many things running on Linux that uses
>>>> interrupt so the system hangs.
>>>>
>>>> This raises another question: when dest == 0x102 in IPI, does the
>>>> xAPIC mode CPU with APIC ID 0x2 accept the IPI? I can't see this
>>>> stated clearly in the Intel SDM.
>>>
>>> I do some more testing on my hardware, your point is correct when dest
>>> == 0xffffffff, the interrupt is delivered to all APICs regardless of
>>> their mode.
>>
>> To be precisely, it only broadcasts to CPUs in xAPIC mode if the IPI
>> destination mode is physical. In case the destination mode is logical,
>> flat model/cluster model rule applies to determine if the xAPIC CPUs
>> accept the IPI. Wow, this is so complicated :)
> 
> It would be nice if you could update apic kvm unit test with your
> findings if it doesn't test those variants yet.
> 
>>
>>
>>> And when dest == 0x102 in IPI, xAPIC mode CPU with APIC ID
>>> 0x2 also accepts that IPI.

KVM does not do the same way as the real hardware in these cases, if the 
destination of IPI is 0xffffffff, IPI is broadcasted to x2APIC CPUs but 
not xAPIC CPUs. The same with IPI has destination 0x102 does not deliver 
to xAPIC CPU with APIC ID 0x2. This is the intended behavior as I see 
some comments mentioning it.

diff --git a/x86/apic.c b/x86/apic.c
index 20c3a1a..8c91d27 100644
--- a/x86/apic.c
+++ b/x86/apic.c
@@ -679,7 +679,7 @@ static void set_ldr(void *__ldr)
  	apic_write(APIC_LDR, ldr << 24);
  }

-static int test_fixed_ipi(u32 dest_mode, u8 dest, u8 vector,
+static int test_fixed_ipi(u32 dest_mode, u32 dest, u8 vector,
  			  int nr_ipis_expected, const char *mode_name)
  {
  	u64 start = rdtsc();
@@ -913,6 +913,38 @@ static void test_aliased_xapic_physical_ipi(void)
  	report(!f, "IPI to aliased xAPIC physical IDs");
  }

+static void reset_apic_cpu(void *arg)
+{
+	u8 *id = (u8 *)arg;
+	reset_apic();
+	*id = apic_id();
+}
+
+static void test_physical_ipi_with_x2apic_id(void)
+{
+	u8 vector = 0xf1;
+	int f = 0;
+	u8 apic_id_cpu1;
+
+	if (cpu_count() < 2)
+		return;
+
+	if (!is_x2apic_enabled())
+		return;
+
+	on_cpu(1, reset_apic_cpu, &apic_id_cpu1);
+	handle_irq(vector, handle_ipi);
+
+	/*
+	 * CPU1 is in xAPIC so it accepts the IPI because the (destination & 0xff)
+	 * matches its APIC ID.
+	 */
+	f += test_fixed_ipi(APIC_DEST_PHYSICAL, apic_id_cpu1 | 0x100, vector, 
1, "physical");
+	f += test_fixed_ipi(APIC_DEST_PHYSICAL, 0xffffffff, vector, 
cpu_count(), "physical");
+
+	report(!f, "IPI with x2apic id to xapic CPU");
+}
+
  typedef void (*apic_test_fn)(void);

  int main(void)
@@ -950,6 +982,7 @@ int main(void)
  		test_apic_id,
  		test_apicbase,
  		test_aliased_xapic_physical_ipi,
+		test_physical_ipi_with_x2apic_id,
  	};

  	assert_msg(is_apic_hw_enabled() && is_apic_sw_enabled(),

With this patch in kvm-unit-test, the version 3 of this series, which I 
will post soon, passes the test but not KVM. So I am not sure if I 
should post this test to kvm-unit-test.

