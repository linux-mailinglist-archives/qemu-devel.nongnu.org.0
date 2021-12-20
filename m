Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E30D547B1CE
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 18:04:26 +0100 (CET)
Received: from localhost ([::1]:40206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzM5I-0008KM-V2
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 12:04:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mzKXO-0004PB-BY
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:25:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mzKX9-00017M-BM
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:25:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640013901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b0ShQ54j1Xo+YrN3wOXGecHS/pAwTzDidPQ5RWg9kho=;
 b=X8uaMYwfvivGr2iNJWyUxxLGDykOov99pIwy7zAwtPxNVEvjRG1L9W7EImXwlzRKGYErqw
 7q8pL40hR8AJ2ogFBJZd2fqz1gAJUOeJahOqT0MuLf4kte94OLZdAWt/iF1Y+74mv4SUd6
 YKxDXQNJlnoCMik+YxtpDLO8iAI4oUU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-97-H6-oKB8MPVyICjqEQTUzUA-1; Mon, 20 Dec 2021 08:11:38 -0500
X-MC-Unique: H6-oKB8MPVyICjqEQTUzUA-1
Received: by mail-wr1-f72.google.com with SMTP id
 c16-20020adfa310000000b001a2349890e1so3721223wrb.0
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 05:11:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=b0ShQ54j1Xo+YrN3wOXGecHS/pAwTzDidPQ5RWg9kho=;
 b=edIFbIbsZ2WqyZnJsdXeej5okiaRKeVEtcqbjBvodg2qB8FHJG2GfCdDUmmtmj2n/M
 r7AWlfQGxvoaIcc3gFPMlGTV6x+tl1QTzR+und2svQ5i+BKxv5U3WqWJyELsO+McNdZ4
 OkV1y2OXpqECEtIvmXbRvHk+2LIyu0aqa3cYAC7D+M/A9hRs53JfWZCRO0gEiEdd3Jgm
 SW/8x20by26jCGJYR/JYV2Jcgthpbs3bw2oGx2Ak2ojUKJRmg3A44ACf9KraDqJ/wArg
 wPpv65IZ5cpEtYBRMnCz5VlX7WyG8wuL0j+fq+1+CT3IMdCaQP1/Vi7VZBOrT2gMPGrF
 /Alw==
X-Gm-Message-State: AOAM532MjwdQQImAdqV1YL1fCsIKEpBxpUXr4fpvzpW55deSemMFMMOW
 mal/hgH6QkzpOx9hDd0wIlaj0NnvLGiQI8fe9JhDBLhVnK44WF4bcrOQdA1Wl7Tr0cJ4OSU9dU9
 d+sZ6fQfNQlw5bRE=
X-Received: by 2002:a05:600c:5009:: with SMTP id
 n9mr9907619wmr.162.1640005897120; 
 Mon, 20 Dec 2021 05:11:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyC7wNRtCeuHqbs8nmMvhmaVpZqB+Udo0ZBk/1rpn6ea7eUEuVSv00gAgy+8HqDVzOuN4EDhQ==
X-Received: by 2002:a05:600c:5009:: with SMTP id
 n9mr9907478wmr.162.1640005894858; 
 Mon, 20 Dec 2021 05:11:34 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id a198sm15149227wmd.42.2021.12.20.05.11.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Dec 2021 05:11:34 -0800 (PST)
Message-ID: <8561411d-6386-edf0-94eb-18a03012eb7d@redhat.com>
Date: Mon, 20 Dec 2021 14:11:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PULL 00/16] qtest and gitlab-CI improvements
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>
References: <20211215073402.144286-1-thuth@redhat.com>
 <ed66cc5f-cc71-fcf8-3026-6fe775a1c5f8@redhat.com>
 <bc315dd4-d43d-092a-30b2-f609266715a2@redhat.com>
 <c7b79c7b-e8b6-855a-8e7e-dee8f4bb2d34@redhat.com>
 <4a46debd-8211-28b1-e293-aa795d24ed01@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <4a46debd-8211-28b1-e293-aa795d24ed01@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.209,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.608, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Alexander Bulekov <alxndr@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/20/21 10:53, Thomas Huth wrote:
> On 20/12/2021 10.24, Philippe Mathieu-Daudé wrote:
>> +Alex & Paolo
>>
>> On 12/20/21 07:52, Thomas Huth wrote:
>>> On 18/12/2021 17.33, Philippe Mathieu-Daudé wrote:
>>>> Hi,
>>>>
>>>> On 12/15/21 08:33, Thomas Huth wrote:
>>>>
>>>>> ----------------------------------------------------------------
>>>>> * Add virtio-net failover test
>>>>> * Make qtests a little bit more flexible with regards to reduced
>>>>> configs
>>>>> * Move libssh setup from configure to meson.build
>>>>> * Run device-crash-test in CI
>>>>> * Add jobs for NetBSD and OpenBSD to the CI
>>>>> * Test compilation with MSYS2 in the gitlab-ci, too
>>>>> * Add new virtio-iommu test
>>>>>
>>>>> ----------------------------------------------------------------
>>>>
>>>>> Laurent Vivier (4):
>>>>>         qtest/libqos: add a function to initialize secondary PCI buses
>>>>>         tests/qtest: add some tests for virtio-net failover
>>>>>         tests/libqtest: add some virtio-net failover migration
>>>>> cancelling tests
>>>>>         tests/libqtest: add a migration test with two couples of
>>>>> failover devices
>>>>
>>>> On my ASan build directory I'm sometime getting:
>>>>
>>>> Running test qtest-i386/virtio-net-failover
>>>> (process:1558675): GLib-CRITICAL **: 16:19:12.556: g_rand_int:
>>>> assertion
>>>> 'rand != NULL' failed
>>>
>>> Weird, since the test is not using that function?
>>
>> Well it calls g_test_rand_int(), which calls it:
>> https://github.com/GNOME/glib/blob/main/glib/gtestutils.c#L1800
> 
> Ah, right. I think the problem is that g_test_rand_int() must not be
> called before g_test_init().
> 
> But actually, I think in this case we even don't want to use
> g_test_rand_int() since it's about generating a true random temporary
> file name, not a random number for a test case that could be influenced
> with the "--seed" CLI option.
> So I think using g_random_int() might be the better choice instead?

I think you are right.


