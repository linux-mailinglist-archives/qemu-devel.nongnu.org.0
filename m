Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3775BDEEE
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 09:59:02 +0200 (CEST)
Received: from localhost ([::1]:41842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaY9l-0004u7-AA
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 03:59:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oaY6z-0002K8-Bs
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 03:56:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oaY6t-0003N6-16
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 03:56:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663660560;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mvXSVhpTqXSPxYXKGaVhatsMnSFj3YZgE7IFYZR+Mt8=;
 b=f+EifIpVX6UC36E4Ly9olNs0sEYqrLQP1vG3Yxw/BT1vgp1zaaP/8tRA4f0ypVpJMTk0MS
 cfBKQkkSV6bux7oSWo+bT6vIiuP2j3nkVkrJI8JdQYl79Pdhl9uob4JbC7OntekB6PYbNo
 w4AACr8vkqPTxIonFgX4Hf5K4KhZoT8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-595-1DwzLLD3OTCxu0cyVUWJ7Q-1; Tue, 20 Sep 2022 03:55:58 -0400
X-MC-Unique: 1DwzLLD3OTCxu0cyVUWJ7Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 b5-20020a05600c4e0500b003b499f99aceso5906795wmq.1
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 00:55:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=mvXSVhpTqXSPxYXKGaVhatsMnSFj3YZgE7IFYZR+Mt8=;
 b=XBQMs9cT3wHfEBM94qWmC5D5eFoPVtGhc2CX5EoLKVuVCgipCA+tLYO/8/+fIDfoc/
 1A7UOZXPd5uDqBcpZlNx7rmET7kU2Hd8IA4F+W+GhH4mxoJaq7k4gL9z6CrBblj+yfwR
 qouNOUgv1sRx15vI38a8se43aDT0KHvUH1DuDayiIjVzvFBMjU8cg/U81vc8+8f5dSx2
 WIpDbqPuGgOM2yytcpEqV9bg9V77zfOEvoXn7YIPXQWd46Gk73PbNR9eevONJL7wUlP7
 sQ/CYsuE2lhQMEjjmjdnH5fyl61NCZjAp/kFza8wmxlXBa/QVO0hBfUAPHyWTDv+uwAg
 KCwA==
X-Gm-Message-State: ACrzQf2PTempUOE0kct7alcG77cV1k5KZhD/AcpopIk429Us/UhotVYK
 qkBeizv+W+bu1Ze8lwLuqpHr8POoqvRX7FNQLu02SQ0XlA23abZswiLQtP4J2VpAxPKPNM0LeWV
 6GcUn/vvDHPzLx6U=
X-Received: by 2002:a05:600c:3541:b0:3b4:c0fd:9182 with SMTP id
 i1-20020a05600c354100b003b4c0fd9182mr1302124wmq.142.1663660557739; 
 Tue, 20 Sep 2022 00:55:57 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4LQruBtptOpRvas+vwoPiSSCMWYHIpePdCzZZ6+HDQuUXPKihjwRTOCOX98E8G2OwfqTrp2Q==
X-Received: by 2002:a05:600c:3541:b0:3b4:c0fd:9182 with SMTP id
 i1-20020a05600c354100b003b4c0fd9182mr1302100wmq.142.1663660557515; 
 Tue, 20 Sep 2022 00:55:57 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-177-8.web.vodafone.de. [109.43.177.8])
 by smtp.gmail.com with ESMTPSA id
 o13-20020a05600c4fcd00b003b332a7bf15sm17365823wmq.7.2022.09.20.00.55.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Sep 2022 00:55:57 -0700 (PDT)
Message-ID: <84e511fb-a052-736e-2809-c5a2749ed0a0@redhat.com>
Date: Tue, 20 Sep 2022 09:55:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: Bandan Das <bsd@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 Alexander Bulekov <alxndr@bu.edu>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Gerd Hoffmann <kraxel@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
References: <20220902173452.1904-1-quintela@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 0/8] RFC: Pass tests for x86_64 machine types compiled
 individually
In-Reply-To: <20220902173452.1904-1-quintela@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.952,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/09/2022 19.34, Juan Quintela wrote:
[...]
> There are interesting cases, and are the tests are run with the
> default machine type (pc) but that work with either of them
[...]
> This tests can be run with both machine types, but as we can't easily
> put -machine on them (several of them are supposed to run on other
> architectures), it is not "trivial to fix".  I have a "hack" on my
> tree that gets the 1st machine available for this kind of tests and
> changed qtest_init() to qtest_init_first() that does exactly that.
> But I am not sure that is the way to go.

I don't think that this would be a reliable solution, e.g. with 
qemu-system-ppc64 or -aarch64, there are plenty of different machine types 
and you cannot simply grab the first one to hope that it is good enough to 
run the tests.

> Another way for me to fix it
> is just to change the Q35 machine to be the default for x86_64 when
> I400FX is not compiled in, but it has other kind of troubles.

I think there was a consensus in the past to rather get away from default 
machine types, so I think that's also the wrong way to go.

> I
> started this wanting than all tests showed an explicit machine type,
> but there is nothing easier to be done for this multiarch tests.

What about this idea: Introduce a "qtest_default_machine()" function that 
looks like this:

const char *qtest_default_machine(void)
{
     if (g_strequal(arch, "i386") || g_strequal(arch, "x86_64")) {
         if (qtest_has_machine("pc")) {
             return "-machine pc";
         } else if (qtest_has_machine("q35")) {
             return "-machine q35";
	} else {
             abort(); // Or skip the test somehow?
         }
     }

     if (g_strequal(arch, "arm") || g_strequal(arch, "aarch64")) {
         /* ARM does not have a default machine, so use "virt" */
         if (qtest_has_machine("virt")) {
             return "-machine virt";
	} else {
             abort(); // Or skip the test somehow?
         }

     // ... similar logic for m68k, riscv, rx, avr and tricore ...

     /* For all others use the default machine */
     return "";
}

Then you could use this à la:

     qts = qtest_init("%s ...", gtest_default_machine(), ...);

Or even add a wrapper function qtest_init_default_machine() for this?

  HTH,
   Thomas


