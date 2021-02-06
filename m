Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 399C0311CA4
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Feb 2021 11:42:42 +0100 (CET)
Received: from localhost ([::1]:43128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8L32-00015R-OY
	for lists+qemu-devel@lfdr.de; Sat, 06 Feb 2021 05:42:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1l8L1T-0000Hs-93
 for qemu-devel@nongnu.org; Sat, 06 Feb 2021 05:41:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1l8L1Q-0008DL-9J
 for qemu-devel@nongnu.org; Sat, 06 Feb 2021 05:41:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612608059;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+OS2pMEcstykJOUii5ZoH1P/HMTHwJFOn+j9ZzbBEF4=;
 b=CEOJ0mv7GLteaSQnjp9/hQaWfYdWSpyoZdtRzKPd4QqrYlZQH+deNfBUpvfOlSzn8AWQIo
 rbYZJVprnlXPLThU0J6I4Dy1klcJQeRc8qYv/EidPGaLb5vxVuQWPSOWb0K7OgOdTTkf2N
 WOlD7W8yVfHrsKUCDjp5m5vM0t0qZq4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-x9ONB1IEMfKM2RVVUzT0YA-1; Sat, 06 Feb 2021 05:40:55 -0500
X-MC-Unique: x9ONB1IEMfKM2RVVUzT0YA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 747DE15721;
 Sat,  6 Feb 2021 10:40:54 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.195.147])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BDBE710016F7;
 Sat,  6 Feb 2021 10:40:51 +0000 (UTC)
Date: Sat, 6 Feb 2021 11:40:48 +0100
From: Andrew Jones <drjones@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 1/9] tests/qtest/arm-cpu-features: Remove Cortex-A15 check
Message-ID: <20210206104048.wavdqfi3zps377yf@kamzik.brq.redhat.com>
References: <20210205144345.2068758-1-f4bug@amsat.org>
 <20210205144345.2068758-2-f4bug@amsat.org>
 <20210205145938.dvjk7jsfatgm56cy@kamzik.brq.redhat.com>
 <83662416-8eb6-eab9-fe90-c70daad29e44@amsat.org>
 <20210205153357.q73y2xo6oazheyma@kamzik.brq.redhat.com>
 <7173ad26-fc28-171e-b159-4b777fbaeb3a@amsat.org>
MIME-Version: 1.0
In-Reply-To: <7173ad26-fc28-171e-b159-4b777fbaeb3a@amsat.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.352,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 qemu-block@nongnu.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 05, 2021 at 05:03:08PM +0100, Philippe Mathieu-Daudé wrote:
> On 2/5/21 4:33 PM, Andrew Jones wrote:
> > On Fri, Feb 05, 2021 at 04:15:45PM +0100, Philippe Mathieu-Daudé wrote:
> >> Hi Drew,
> >>
> >> On 2/5/21 3:59 PM, Andrew Jones wrote:
> >>> On Fri, Feb 05, 2021 at 03:43:37PM +0100, Philippe Mathieu-Daudé wrote:
> >>>> Support for ARMv7 has been dropped in commit 82bf7ae84ce
> >>>> ("target/arm: Remove KVM support for 32-bit Arm hosts"),
> >>>> no need to check for Cortex A15 host cpu anymore.
> >>>>
> >>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> >>>> ---
> >>>>  tests/qtest/arm-cpu-features.c | 4 ----
> >>>>  1 file changed, 4 deletions(-)
> >>>>
> >>>> diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
> >>>> index 8252b85bb85..c59c3cb002b 100644
> >>>> --- a/tests/qtest/arm-cpu-features.c
> >>>> +++ b/tests/qtest/arm-cpu-features.c
> >>>> @@ -515,10 +515,6 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
> >>>>          QDict *resp;
> >>>>          char *error;
> >>>>  
> >>>> -        assert_error(qts, "cortex-a15",
> >>>> -            "We cannot guarantee the CPU type 'cortex-a15' works "
> >>>> -            "with KVM on this host", NULL);
> >>>> -
> >>>
> >>> This isn't testing anything regarding 32-bit KVM host support. It's
> >>> testing that an error is returned when a given cpu type that can't
> >>> be known to work with KVM is used. We know that the cortex-a15 can't
> >>> be known to work. If we were to use a 64-bit cpu type here then there's
> >>> a chance that it would work, failing the test that an error be returned.
> >>
> >> This was my first understanding, but then why does it fail?
> >>
> >> PASS 1 qtest-aarch64/arm-cpu-features /aarch64/arm/query-cpu-model-expansion
> >> **
> >> ERROR:../../tests/qtest/arm-cpu-features.c:543:test_query_cpu_model_expansion_kvm:
> >> assertion failed: (g_str_equal(_error, "We cannot guarantee the CPU type
> >> 'cortex-a15' works " "with KVM on this host"))
> >> ERROR qtest-aarch64/arm-cpu-features - Bail out!
> >> ERROR:../../tests/qtest/arm-cpu-features.c:543:test_query_cpu_model_expansion_kvm:
> >> assertion failed: (g_str_equal(_error, "We cannot guarantee the CPU type
> >> 'cortex-a15' works " "with KVM on this host"))
> >> make: *** [Makefile.mtest:905: run-test-111] Error 1
> >>
> >> FWIW when tracing (cavium thunderX1 host, dmesg reports 0x431f0a11):
> >> kvm_vcpu_ioctl cpu_index 0, type 0x4020aeae, arg 0xffff9b7f9b18
> > 
> > Hmm... I don't know. It works for me
> > 
> > $ QTEST_QEMU_BINARY=./qemu-system-aarch64 ./tests/qtest/arm-cpu-features
> > /aarch64/arm/query-cpu-model-expansion: OK
> > /aarch64/arm/kvm/query-cpu-model-expansion: OK
> > /aarch64/arm/kvm/query-cpu-model-expansion/sve-off: OK
> > /aarch64/arm/max/query-cpu-model-expansion/sve-max-vq-8: OK
> > /aarch64/arm/max/query-cpu-model-expansion/sve-off: OK
> 
> Thanks, that helped.
> 
> I ran my tests including the "Restrict v7A TCG cpus to TCG accel"
> patch which removes the A15 in KVM-only build:
> https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg08051.html

Oh, I see. So this patch is OK if we merge "Restrict v7A TCG cpus to
TCG accel", but we should change the commit message of this patch
to point to the real reason for it, which is "Restrict v7A TCG cpus to
TCG accel". Also, I'd prefer we don't remove this test, but rather find
another way to perform it without the cortex-a15 cpu type.

>  So when TCG is disabled,
> 
> So I get:
> 
> { "execute": "query-cpu-model-expansion", 'arguments': { 'type': 'full',
> 'model': { 'name': 'cortex-a15' }}}
> {
>     "error": {
>         "class": "GenericError",
>         "desc": "The CPU type 'cortex-a15' is not a recognized ARM CPU type"
>     }
> }
> 
> which fails the g_str_equal().
> 
> BTW is there some easy way to dump QMP traffic on stdio?

You can use scripts/qmp/qmp-shell to manually test stuff.

Thanks,
drew

> 
> > 
> > $ lscpu
> > Architecture:        aarch64
> > Byte Order:          Little Endian
> > CPU(s):              48
> > On-line CPU(s) list: 0-47
> > Thread(s) per core:  1
> > Core(s) per cluster: 16
> > Socket(s):           -
> > Cluster(s):          3
> > NUMA node(s):        1
> > Vendor ID:           Cavium
> > Model:               1
> > Model name:          ThunderX 88XX
> > Stepping:            0x1
> > BogoMIPS:            200.00
> > NUMA node0 CPU(s):   0-47
> > Flags:               fp asimd evtstrm aes pmull sha1 sha2 crc32 cpuid
> > 
> >>
> >>>
> >>>>          assert_has_feature_enabled(qts, "host", "aarch64");
> >>>>  
> >>>>          /* Enabling and disabling pmu should always work. */
> >>>> -- 
> >>>> 2.26.2
> >>>>
> >>>>
> >>>
> >>> This file could use a cleanup patch regarding the dropping of 32-bit KVM
> >>> support though. At least the comment in main(), "For now we only run KVM
> >>> specific tests..." could be reworded. It was written that way when we
> >>> planned to try testing on 32-bit KVM too eventually, but we never did,
> >>> and now we'll never need to.
> >>>
> >>> Thanks,
> >>> drew
> >>>
> >>>
> >>
> > 
> > 
> 


