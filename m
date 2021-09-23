Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D42DC41648F
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 19:43:13 +0200 (CEST)
Received: from localhost ([::1]:47564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTSka-0007fR-V4
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 13:43:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mTSLx-0002Vg-HJ
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 13:17:45 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:43658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mTSLr-0002kw-MG
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 13:17:45 -0400
Received: by mail-wr1-x436.google.com with SMTP id w17so19159205wrv.10
 for <qemu-devel@nongnu.org>; Thu, 23 Sep 2021 10:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=02A58D0W1tuN8JhDcSx6wBT6EQAltRTNQxNcDcM0+8Y=;
 b=RS0XuGtQtUBXXx8r66B5DzqkBVEoTKesPgiAx6OKyOvF0SoP9VgVcxNv359QOfMVEB
 OyaOd9qQnyC/mmjtAQU6hhZdgZq8679RrokgBPWoauzft6bjnk8bEwcuN/6XM+bVtVrW
 ykjPpw3pWcvuKEYFlporpj1YFVpL8fEHgdvwGpzTLUO/BWcL4rgreflV7uWC3o1gxM0A
 3b+vDT6rP9FBo2QuRjjJ6BT6wDSgMQQHnhbyoBsVXlpcsWoK1IbeEpG4Gr/BN7L6Zm5X
 5+seey9ReyPsVIWyyxYETmW8+9BY8HUCSWdwT3P0zjZFeMts8pjzqLFC/Pos51eHKOLP
 W9jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=02A58D0W1tuN8JhDcSx6wBT6EQAltRTNQxNcDcM0+8Y=;
 b=k73s2eOg09LRQFcQEbc2eAUUPCSsCC6xoO3kim/Qebfq4fiMgpGMMDiJG5TdIiriAf
 qgDe0Rv4/RzSffcP6Y+KcadMu28m5I0FPUXhQ+VlGBkDeIMsb2s5kufQ+0/UejqWkHoG
 EFI273LtEFjwmOQomGZlSxynv2Avn6i9tP/rXfpW/odUFCoEfIc23ZiffWGY/gqhB5Vv
 lkMuKI8+QggI/BJ+juigp87odFG6VdiCNw456OXjVXBykwgzop4LgUgKEu2bV7TKiXol
 JVjpgP2ecJ2B0jSMchRkfUIixpH8QyqHuYmp6j0EfuzUx6OQUlwSP+j9flmVyr/6nvSN
 Yccg==
X-Gm-Message-State: AOAM5312IFfjkPC7cLKJiKj56RTVkRTc88Nx0QBooySShtQXmGr5mzeB
 LAD76IuXEzRmZcE0WOf6+SQgqNR6518=
X-Google-Smtp-Source: ABdhPJyvoiZVJUE8PbaARdnoVxiGcG/yZh9pCwVQ5XIKe2/PENYKtggG2D6QpNuww1BDvyQuTsaFuw==
X-Received: by 2002:a05:600c:b56:: with SMTP id
 k22mr5787418wmr.92.1632417458266; 
 Thu, 23 Sep 2021 10:17:38 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id i2sm5767430wrq.78.2021.09.23.10.17.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Sep 2021 10:17:37 -0700 (PDT)
Message-ID: <fe5e4a48-722a-b7dc-8c64-655257dc1720@amsat.org>
Date: Thu, 23 Sep 2021 19:17:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v5 05/31] sysemu: Introduce AccelOpsClass::has_work()
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210920214447.2998623-1-f4bug@amsat.org>
 <20210920214447.2998623-6-f4bug@amsat.org>
 <919a17ed-9438-8fd8-f595-b5448db6198e@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <919a17ed-9438-8fd8-f595-b5448db6198e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/20/21 23:58, Richard Henderson wrote:
> On 9/20/21 2:44 PM, Philippe Mathieu-Daudé wrote:
>> -    g_assert(cc->has_work);
>> -    return cc->has_work(cpu);
>> +    if (cc->has_work) {
>> +        return cc->has_work(cpu);
>> +    }
>> +    if (cpus_accel->has_work) {
>> +        return cpus_accel->has_work(cpu);
>> +    }
>> +    g_assert_not_reached();
> 
> This might be close to the end result, but it isn't what we begin with 
> in cpu_thread_is_idle.
> 
> You'd want
> 
>      if (cc->has_work && cc->has_work(cpu)) {
>          return true;
>      }
>      if (cpus_accel->has_work && cpus_accel->has_work(cpu)) {
>          return true;
>      }
>      return false;
> 
> to start.  After the cpus_accel hook is filled in you can assert and 
> return from cpus_accel->has_work.  And of course after cc->has_work is 
> removed, that clause is gone.

Much cleaner, thank you for the hints :)

