Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 946B95BEF47
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 23:40:57 +0200 (CEST)
Received: from localhost ([::1]:50780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oakzA-0004aV-Hz
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 17:40:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oagNH-0007Mo-A5
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 12:45:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oagNE-00041t-21
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 12:45:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663692327;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kX45IZHd5T80sxgdzvsZUjfdHOp/mMTOq6VJQy4iOBo=;
 b=KuSrZuczhBbpvRiQFMMTWy32aHUKBQBWBJUv/klX+lAmFWOYDesHLXMK+S5LsAU/82COeq
 qtBwhVmSDimRF7IQXZKSMleNIXdKcmWwhDR/8DGhvA+HVETO3v/8T6GU/+jJe0JjmgN2R+
 bBcyzqkH1o+fYqAsjSvDYhS/znhMXzU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-583-6LlzBup0Mj2Ym-3vuP8-bA-1; Tue, 20 Sep 2022 12:45:23 -0400
X-MC-Unique: 6LlzBup0Mj2Ym-3vuP8-bA-1
Received: by mail-wr1-f70.google.com with SMTP id
 c21-20020adfa315000000b0022adc2a2edaso1397246wrb.0
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 09:45:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=kX45IZHd5T80sxgdzvsZUjfdHOp/mMTOq6VJQy4iOBo=;
 b=Rhl0KneiX8kfjmypBb4T5u9diYhb4ZslDqP7MNFCx3zVKnAGpFcAik1rZzvHIeSHV/
 tk6dSt8Mzb6jgo5VzEZ/bo93Q5GJc3DinYwz5WhFDgZZK6YzkXpZFyvdvB44T7mSlAQQ
 ky3qwAlRXl/7bWIq/+R5/YV3qBor6rQwH2lDmiA6OcXv/mHT7vKYk9nKEm/stSZHN1F3
 5BasduSj6d378hO4w5cUQWncbFrEUkvDHG4stu+QBvloo6+w+6HdgJRUbtbMV8T/jObt
 cbh4yRtiY+feivKLjz+GkUUZTxCDubV4eXmmCLNoZvf5iUzxglHvaX81TFl2wIoLAUGx
 rrmA==
X-Gm-Message-State: ACrzQf3KDn0Wi5hAKjuf8Cyu2XL6ZjzIJS5z/SDmK5ezRTx4EkdCAQVs
 UxvFHOd4CiKxinxDENHn/7CwmjSygiHmCcMlztkTs+pS0TRV8o2Y5LMVYs5r1tjBpWdtT4dFkPE
 B4OCLKUsdDhviKQ0=
X-Received: by 2002:a05:600c:3781:b0:3a6:804a:afc with SMTP id
 o1-20020a05600c378100b003a6804a0afcmr3108443wmr.27.1663692322810; 
 Tue, 20 Sep 2022 09:45:22 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5KQKFID6i2QO3Aq7f5lCIRTExIsCOSfsWivfz+8idKP4LUqf60/4B82k5VFXO/9KrE0p7vUA==
X-Received: by 2002:a05:600c:3781:b0:3a6:804a:afc with SMTP id
 o1-20020a05600c378100b003a6804a0afcmr3108435wmr.27.1663692322606; 
 Tue, 20 Sep 2022 09:45:22 -0700 (PDT)
Received: from [192.168.8.103] (tmo-083-219.customers.d1-online.com.
 [80.187.83.219]) by smtp.gmail.com with ESMTPSA id
 i27-20020a1c541b000000b003a502c23f2asm312946wmb.16.2022.09.20.09.45.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Sep 2022 09:45:22 -0700 (PDT)
Message-ID: <a1289aed-8d2a-266a-c766-7c698a3aebfe@redhat.com>
Date: Tue, 20 Sep 2022 18:45:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PULL 11/20] target/arm: Don't mishandle count when enabling or
 disabling PMU counters
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
References: <20220914115217.117532-1-richard.henderson@linaro.org>
 <20220914115217.117532-13-richard.henderson@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220914115217.117532-13-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.182, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 14/09/2022 13.52, Richard Henderson wrote:
> From: Peter Maydell <peter.maydell@linaro.org>
> 
> The PMU cycle and event counter infrastructure design requires that
> operations on the PMU register fields are wrapped in pmu_op_start()
> and pmu_op_finish() calls (or their more specific pmmcntr and
> pmevcntr equivalents).  This includes any changes to registers which
> affect whether the counter should be enabled or disabled, but we
> forgot to do this.
> 
> The effect of this bug is that in sequences like:
>   * disable the cycle counter (PMCCNTR) using the PMCNTEN register
>   * write a value such as 0xfffff000 to the PMCCNTR
>   * restart the counter by writing to PMCNTEN
> the value written to the cycle counter is corrupted, and it starts
> counting from the wrong place. (Essentially, we fail to record that
> the QEMU_CLOCK_VIRTUAL timestamp when the counter should be considered
> to have started counting is the point when PMCNTEN is written to enable
> the counter.)
> 
> Add the necessary bracketing calls, so that updates to the various
> registers which affect whether the PMU is counting are handled
> correctly.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Message-Id: <20220822132358.3524971-4-peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/helper.c | 45 +++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 45 insertions(+)

  Hi Peter, hi Richard,

this seems to break some Avocado based test(s) in our CI:

  make check-venv
  ./tests/venv/bin/avocado run tests/avocado/replay_kernel.py:ReplayKernelNormal.test_aarch64_virt

... fails with commit 01765386a88868ae993bcb but still passes
with the preceeding commit. Could you please have a look?

  Thanks,
   Thomas


