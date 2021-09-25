Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3F341833F
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 17:34:32 +0200 (CEST)
Received: from localhost ([::1]:60636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mU9h9-0007rR-70
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 11:34:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU9aH-0006IX-Vb
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 11:27:25 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:41893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU9aG-00008a-80
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 11:27:25 -0400
Received: by mail-wr1-x42e.google.com with SMTP id w29so36586131wra.8
 for <qemu-devel@nongnu.org>; Sat, 25 Sep 2021 08:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AfOZtobBliWdcFfUqHd1LDnT+YPgVz/EEo4iu35LyqY=;
 b=Kc15JZxNwcj8B/y0gwDZar5RSqFiGPY7J8awRIvg5qVtPchGcpOwv/+Sa5C/cAahI5
 VKCx2/kJ9qefC2o+CHAYhtrAaFeISip+CQN4iha9iMlRGg9VDGaWeH3liE8/viCE2UOD
 fe0O3Yh4OUN/gHmWyWIZLK9TI8gnhKvN4nNGMH/YOEVvABw9kAesJXBavksGoBCUN3VR
 fwXIPokCHkhMinl1FWc3ZUwU0byVDG54r05HV2GB+R7VgnxPhoyv2FFBKDCW5Gg0D85T
 NU2P3GVKVu+mLAcA1hYcltUk8kLRgiVzReCx2M67MBllO2D+swG39aNi9LOn4/3H4I2c
 MLVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AfOZtobBliWdcFfUqHd1LDnT+YPgVz/EEo4iu35LyqY=;
 b=5oOYOcf6sDmO8BUpVmSyx5As3j+j0xdtv65RdfWYuDY6dWgV0AuwE8UvQJfKj74kHC
 UIOKuwLBjAIFFC5kdweAsWNXjVu9jxWq+rQYza/2z58JlQqhdeEzgFLpwrKE/3LrhuxI
 lGkoAv+eQ3d3I/iZi0ApomdLCjv1IcONkqqy0IBGMACq73KpkV4ctunUhxOemrud2zTl
 kGf/l+oyqrezBhzBgGwLHat/QO8Vn48rFn6aQHkkQOAtNStABYxpfDj+Zb3gSCaX+jfA
 kZVrjEgE/sWja0c6KJrIJ8Z/TyW+l0qsfyy1ip3TTnU1XRYATWOgE0JM+YqudEqZqzD2
 L7lw==
X-Gm-Message-State: AOAM530SW7qiCKyTGyCZh2R7qNuJTyX6xM6W7vKeeGMxFNzjqr/fmFU9
 w/LYmY3+3A0kyqHubA+zcvj6fnv3qEQ=
X-Google-Smtp-Source: ABdhPJwwyaHXIqvwe+khN8jNyl9cI6u4cbE23yLjAm+PAQajed18Pw30rygHGZD5ligiz2XkHozczg==
X-Received: by 2002:a1c:3b09:: with SMTP id i9mr7252503wma.175.1632583642281; 
 Sat, 25 Sep 2021 08:27:22 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id o7sm14314063wro.45.2021.09.25.08.27.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Sep 2021 08:27:21 -0700 (PDT)
Message-ID: <8b882c1d-933a-448b-ec76-010b36d12096@amsat.org>
Date: Sat, 25 Sep 2021 17:27:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v7 12/40] accel/qtest: Implement AccelOpsClass::has_work()
Content-Language: en-US
To: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>
References: <20210925145118.1361230-1-f4bug@amsat.org>
 <20210925145118.1361230-13-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210925145118.1361230-13-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Igor

On 9/25/21 16:50, Philippe Mathieu-Daudé wrote:
> Implement QTest has_work() handler in AccelOpsClass.
> Since no CPU are available under QTest accelerator,
> this function is not reachable.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   accel/qtest/qtest.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/accel/qtest/qtest.c b/accel/qtest/qtest.c
> index 7e6b8110d52..903c39ec1bf 100644
> --- a/accel/qtest/qtest.c
> +++ b/accel/qtest/qtest.c
> @@ -47,12 +47,18 @@ static const TypeInfo qtest_accel_type = {
>   };
>   module_obj(TYPE_QTEST_ACCEL);
>   
> +static bool qtest_cpu_has_work(CPUState *cpu)
> +{
> +    g_assert_not_reached();
> +}

Sigh, this triggers:

Running test qtest-i386/cpu-plug-test
**
ERROR:../accel/qtest/qtest.c:52:qtest_cpu_has_work: code should not be 
reached
ERROR qtest-i386/cpu-plug-test - Bail out! 
ERROR:../accel/qtest/qtest.c:52:qtest_cpu_has_work: code should not be 
reached
Broken pipe

I understand we want to test CPU hotplug, however I'm not sure what
part of the accelerator can be tested, QTest is almost empty stubs.

I suppose it is in my interest to 'return false' here and call it
a day...

>   static void qtest_accel_ops_class_init(ObjectClass *oc, void *data)
>   {
>       AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
>   
>       ops->create_vcpu_thread = dummy_start_vcpu_thread;
>       ops->get_virtual_clock = qtest_get_virtual_clock;
> +    ops->has_work = qtest_cpu_has_work;
>   };
>   
>   static const TypeInfo qtest_accel_ops_type = {
> 

