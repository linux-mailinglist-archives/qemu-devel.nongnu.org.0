Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D884F310D21
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 16:26:21 +0100 (CET)
Received: from localhost ([::1]:44476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8300-00062n-V5
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 10:26:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l82tK-00069x-Fr; Fri, 05 Feb 2021 10:19:26 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:35791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l82tI-0000uQ-Lr; Fri, 05 Feb 2021 10:19:26 -0500
Received: by mail-ed1-x52f.google.com with SMTP id g10so9238801eds.2;
 Fri, 05 Feb 2021 07:19:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xs/h5pwcWBfMfXCSsJxrtS4LW+NHIjyZFcqK0jtcVIk=;
 b=CyjGoyZ/RW6ORzJF/8kfOqu2W54R+Q6T7YAozjVUhXeA3Tshxhx355EacdIARXbIkj
 tlcryGB9mBH7WpNl+yw6a9utlx7T5fdyMqdJaP7htOQt6ittyAw4/UFN2YFgEp+9JBOP
 9aDelGdWeludaldjKk5RoUcw627SnSGB18gEgwsdtFRu7wYqDvDaesVE6FyN/uzHN1iv
 HXmejbN+NusbR6uQ6KqoXN6Zu6xZqitcy60lAHm0shhJcGZYJ+THw0Max3TKURKC4K9F
 gVy9AjwT0puwLI+K/+iExRVKW+dVt8z9yDQC9EJ0U+9XSY/4Y3Qy7KjprcFJG1OWj5Lr
 UM6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xs/h5pwcWBfMfXCSsJxrtS4LW+NHIjyZFcqK0jtcVIk=;
 b=aEWBX2HkWvpaVMvqvvBiEterJPUmVcudRxAut0cyD+KuJ56aCJlOS6FPhL9FHepwOF
 /F5zCVqmvAGsDitlejfY4u54QFchc52IMzYGJ5VTgxgU9Mx7d5Z4kfvmKXXOlCGfOzc8
 cbtZjzBCwgJB17Yc4cT5f8YEO/W/13nYjhyfDtf7xo50CcEuH4JYiC4kCtVc8wy127dc
 V1R6DM8ocrR0Bnv+kDb5v2OLro3pYJPQPJFkKh0fcey9voIoXVoqvcBVlymSll0RWUGv
 gQKFDjht6sdSLXvaE1rTCyjaINHQBFUUJt5mHvN604tT5kqrF0RkBFHSeLFbHb9Z4vq6
 gxMA==
X-Gm-Message-State: AOAM530EJ/aAAaMUzLcP7s0yE6ar32oHFIQ+9p5WSAwSn5coTfiDt19S
 9w6HHPwBAzFCC65mm04a9v9IGVjx1Rw=
X-Google-Smtp-Source: ABdhPJyNWpQc2n8paMZp+AnVgG5aS1rpDkouXtG9u02HxRSXzDUYr0tooqkOQq36OfMoJRP60wmuVA==
X-Received: by 2002:aa7:d696:: with SMTP id d22mr3907185edr.361.1612538362528; 
 Fri, 05 Feb 2021 07:19:22 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id z13sm4181575edc.73.2021.02.05.07.19.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Feb 2021 07:19:21 -0800 (PST)
Subject: Re: [PATCH 4/9] tests/qtest/cdrom-test: Only allow the Virt machine
 under KVM
To: Andrew Jones <drjones@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <20210205144345.2068758-1-f4bug@amsat.org>
 <20210205144345.2068758-5-f4bug@amsat.org>
 <20210205150810.feuywlyy7xav56di@kamzik.brq.redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ed098234-3de6-9e25-e912-cfd64a1c9c5c@amsat.org>
Date: Fri, 5 Feb 2021 16:19:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210205150810.feuywlyy7xav56di@kamzik.brq.redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.33,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/5/21 4:08 PM, Andrew Jones wrote:
> On Fri, Feb 05, 2021 at 03:43:40PM +0100, Philippe Mathieu-Daudé wrote:
>> Only the Virt and Versal machines are supported under KVM.
>> Restrict the other ones to TCG.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  tests/qtest/cdrom-test.c | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/tests/qtest/cdrom-test.c b/tests/qtest/cdrom-test.c
>> index 5af944a5fb7..ac02f2bb4f1 100644
>> --- a/tests/qtest/cdrom-test.c
>> +++ b/tests/qtest/cdrom-test.c
>> @@ -222,9 +222,12 @@ int main(int argc, char **argv)
>>          add_cdrom_param_tests(mips64machines);
>>      } else if (g_str_equal(arch, "arm") || g_str_equal(arch, "aarch64")) {
>>          const char *armmachines[] = {
>> +#ifdef CONFIG_TCG
>>              "realview-eb", "realview-eb-mpcore", "realview-pb-a8",
>>              "realview-pbx-a9", "versatileab", "versatilepb", "vexpress-a15",
>> -            "vexpress-a9", "virt", NULL
>> +            "vexpress-a9",
>> +#endif /* CONFIG_TCG */
>> +            "virt", NULL
>>          };
>>          add_cdrom_param_tests(armmachines);
>>      } else {
>> -- 
>> 2.26.2
>>
> 
> Don't we need to use a runtime check for this? I'd guess we can
> build a QEMU that supports both KVM and TCG and then attempt to
> run this test with KVM, which would still try all these other
> machine types.

Yes, I followed commit c51a5a23d87 fix ("qtest: unbreak non-TCG
builds in bios-tables-test").
We need that QMP 'query-accelerators' command then.

