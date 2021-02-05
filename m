Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8E9310D35
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 16:36:39 +0100 (CET)
Received: from localhost ([::1]:36890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l839y-0006dD-4v
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 10:36:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1l837a-0004yQ-Fe
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 10:34:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1l837X-00072i-NN
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 10:34:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612539246;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o1GX7JoM5Djv8HsAufPe8DVWNddfRP9gsP5SmQ8FBJ8=;
 b=PU2bSyw8+HM0DA7C68SgsoluI47x5yd6ctuX5JzV3txfR1ni3VrmcADr92IJ00nX2cA4Y2
 HsQS67LRyBes9PB9AHjvANlaM2NtjF1WYRYwwjWKbwmuYhI24Nkfa3AGCM5NyZX83SDws3
 I8tEwWu43cyqFgczXOitFcjvbcn+D+s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-167--9Q05ikNOEOjoRF5IiOKSA-1; Fri, 05 Feb 2021 10:34:04 -0500
X-MC-Unique: -9Q05ikNOEOjoRF5IiOKSA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 589B181470A;
 Fri,  5 Feb 2021 15:34:03 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.195.147])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0326F100AE2B;
 Fri,  5 Feb 2021 15:34:00 +0000 (UTC)
Date: Fri, 5 Feb 2021 16:33:57 +0100
From: Andrew Jones <drjones@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 1/9] tests/qtest/arm-cpu-features: Remove Cortex-A15 check
Message-ID: <20210205153357.q73y2xo6oazheyma@kamzik.brq.redhat.com>
References: <20210205144345.2068758-1-f4bug@amsat.org>
 <20210205144345.2068758-2-f4bug@amsat.org>
 <20210205145938.dvjk7jsfatgm56cy@kamzik.brq.redhat.com>
 <83662416-8eb6-eab9-fe90-c70daad29e44@amsat.org>
MIME-Version: 1.0
In-Reply-To: <83662416-8eb6-eab9-fe90-c70daad29e44@amsat.org>
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

On Fri, Feb 05, 2021 at 04:15:45PM +0100, Philippe Mathieu-Daudé wrote:
> Hi Drew,
> 
> On 2/5/21 3:59 PM, Andrew Jones wrote:
> > On Fri, Feb 05, 2021 at 03:43:37PM +0100, Philippe Mathieu-Daudé wrote:
> >> Support for ARMv7 has been dropped in commit 82bf7ae84ce
> >> ("target/arm: Remove KVM support for 32-bit Arm hosts"),
> >> no need to check for Cortex A15 host cpu anymore.
> >>
> >> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> >> ---
> >>  tests/qtest/arm-cpu-features.c | 4 ----
> >>  1 file changed, 4 deletions(-)
> >>
> >> diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
> >> index 8252b85bb85..c59c3cb002b 100644
> >> --- a/tests/qtest/arm-cpu-features.c
> >> +++ b/tests/qtest/arm-cpu-features.c
> >> @@ -515,10 +515,6 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
> >>          QDict *resp;
> >>          char *error;
> >>  
> >> -        assert_error(qts, "cortex-a15",
> >> -            "We cannot guarantee the CPU type 'cortex-a15' works "
> >> -            "with KVM on this host", NULL);
> >> -
> > 
> > This isn't testing anything regarding 32-bit KVM host support. It's
> > testing that an error is returned when a given cpu type that can't
> > be known to work with KVM is used. We know that the cortex-a15 can't
> > be known to work. If we were to use a 64-bit cpu type here then there's
> > a chance that it would work, failing the test that an error be returned.
> 
> This was my first understanding, but then why does it fail?
> 
> PASS 1 qtest-aarch64/arm-cpu-features /aarch64/arm/query-cpu-model-expansion
> **
> ERROR:../../tests/qtest/arm-cpu-features.c:543:test_query_cpu_model_expansion_kvm:
> assertion failed: (g_str_equal(_error, "We cannot guarantee the CPU type
> 'cortex-a15' works " "with KVM on this host"))
> ERROR qtest-aarch64/arm-cpu-features - Bail out!
> ERROR:../../tests/qtest/arm-cpu-features.c:543:test_query_cpu_model_expansion_kvm:
> assertion failed: (g_str_equal(_error, "We cannot guarantee the CPU type
> 'cortex-a15' works " "with KVM on this host"))
> make: *** [Makefile.mtest:905: run-test-111] Error 1
> 
> FWIW when tracing (cavium thunderX1 host, dmesg reports 0x431f0a11):
> kvm_vcpu_ioctl cpu_index 0, type 0x4020aeae, arg 0xffff9b7f9b18

Hmm... I don't know. It works for me

$ QTEST_QEMU_BINARY=./qemu-system-aarch64 ./tests/qtest/arm-cpu-features
/aarch64/arm/query-cpu-model-expansion: OK
/aarch64/arm/kvm/query-cpu-model-expansion: OK
/aarch64/arm/kvm/query-cpu-model-expansion/sve-off: OK
/aarch64/arm/max/query-cpu-model-expansion/sve-max-vq-8: OK
/aarch64/arm/max/query-cpu-model-expansion/sve-off: OK

$ lscpu
Architecture:        aarch64
Byte Order:          Little Endian
CPU(s):              48
On-line CPU(s) list: 0-47
Thread(s) per core:  1
Core(s) per cluster: 16
Socket(s):           -
Cluster(s):          3
NUMA node(s):        1
Vendor ID:           Cavium
Model:               1
Model name:          ThunderX 88XX
Stepping:            0x1
BogoMIPS:            200.00
NUMA node0 CPU(s):   0-47
Flags:               fp asimd evtstrm aes pmull sha1 sha2 crc32 cpuid

> 
> > 
> >>          assert_has_feature_enabled(qts, "host", "aarch64");
> >>  
> >>          /* Enabling and disabling pmu should always work. */
> >> -- 
> >> 2.26.2
> >>
> >>
> > 
> > This file could use a cleanup patch regarding the dropping of 32-bit KVM
> > support though. At least the comment in main(), "For now we only run KVM
> > specific tests..." could be reworded. It was written that way when we
> > planned to try testing on 32-bit KVM too eventually, but we never did,
> > and now we'll never need to.
> > 
> > Thanks,
> > drew
> > 
> > 
> 


