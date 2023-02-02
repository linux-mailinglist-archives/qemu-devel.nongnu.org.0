Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 260B4687C3D
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 12:30:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNXnG-0005ya-NF; Thu, 02 Feb 2023 06:30:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNXnD-0005yM-2T
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 06:30:15 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNXnB-000222-0s
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 06:30:14 -0500
Received: by mail-wr1-x433.google.com with SMTP id y1so1416128wru.2
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 03:30:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jSnaNAQSaQT82gLXfXMCm71pRM/VWWdSKqhIs7qQvYY=;
 b=U2ydGeNThhHFRK5FaixgOSRu6u814zOnVgzHKx7U/Ex56LDASftHIDvRi7lJ1y6IPK
 klaq63oYw6Wcn1qzGl60aPLtXLOyzRIoFm3Gshp616njdJqB9W5ARAhsqeJKKbUs8mi2
 jEtR0X7M7HD8dEKEWWCOgOmZi6XJKyu22uK93fqV2SUG1cxAO4km2dRZnUTdoZjzdF4h
 53kTHT/0fVISGKvHYBJ/VPacd5veb/unXD2QcBZJMRd7/qwCeKQjut702fFRH0kQfD4X
 l7q+iMJUniEA7Qp2Wn3BwFvhuPqJ8VgmkZJs0JJJ23bn14wQmPv9TSQx1ikvAku+0kCQ
 DQQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jSnaNAQSaQT82gLXfXMCm71pRM/VWWdSKqhIs7qQvYY=;
 b=ZN75ZcichxytK6wdtGr7LV5XYfZki+gA7Q5gYkcEugjq0XjOWaPxWCnRYoT9nrC9ji
 elP9k4Icb/tj0wT49ghXIlWBrlyMIh9YAUXy07OjwzGjfIU91y1VaN842EqFxUHJkjxt
 r8uV5mmz0wooB/WeH5CjitSqOXvbNCFnQWnWnWPCN2muymbuCU6s7hFegEC8kr0LDx3O
 uzRUxrs1kbKpXRNK+uOeQoPEwqi/dmuFv82Eo9DEHMRLKglqZz2mtfxVBa2O7Kj6NRIN
 ynbVGgsKsLzA00Rq3U7EDYLHFRzOV1ydgaLSxb3TmMd1g0M+AahoscL0AArYahq+6Ify
 A5+A==
X-Gm-Message-State: AO0yUKXydBoT9Sq1sno6rh8GqtuBdqr21YJvFIuvEQ7K+EGYVz1r1+oc
 PDiK5BowxlgKBoLBTLh8L0gxig==
X-Google-Smtp-Source: AK7set9H6fErNwRCQ9xUPU0pDugAkT/rj+aVY4mRx0wxh/eJCgXrLWtD9SE69FZYuq/T7/cUgjlhwg==
X-Received: by 2002:a05:6000:2c6:b0:2c2:6541:7afc with SMTP id
 o6-20020a05600002c600b002c265417afcmr6861245wry.64.1675337411303; 
 Thu, 02 Feb 2023 03:30:11 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 r25-20020adfa159000000b00297dcfdc90fsm20148854wrr.24.2023.02.02.03.30.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Feb 2023 03:30:10 -0800 (PST)
Message-ID: <b5830cd2-9856-00a8-2ab5-8e9920ac1521@linaro.org>
Date: Thu, 2 Feb 2023 12:30:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 0/6] Shorten the runtime of some gitlab-CI shared runner
 jobs
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20230130104446.1286773-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230130104446.1286773-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 30/1/23 11:44, Thomas Huth wrote:
> We're currently facing the problem that the gitlab-CI jobs for the
> shared runners take too much of the limited CI minutes on gitlab.com.
> Here are now some patches that optimize some of the jobs a little bit
> to take less runtime. We slightly lose some test coverage by some of
> these changes (e.g. by dropping ppc-softmmu from a Clang-based test
> and only continue testing ppc64-softmmu with Clang in another job),
> but that should still be much better than running out of CI minutes
> after 3/4 of a month.

FWIW the last time I wanted to add some tests Alex suggested me to
run a before/after gcov report and justify the new path tested.

Maybe we should enforce something similar, either cover new paths
or fix a bug.


