Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1094E5B45
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 23:34:47 +0100 (CET)
Received: from localhost ([::1]:60596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX9Z0-0000q5-Ih
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 18:34:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nX9Vn-0006uE-Hv
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 18:31:32 -0400
Received: from [2607:f8b0:4864:20::1035] (port=55065
 helo=mail-pj1-x1035.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nX9Vl-0006V6-8O
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 18:31:26 -0400
Received: by mail-pj1-x1035.google.com with SMTP id b8so3085706pjb.4
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 15:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=aNYEnkC9YyVO7rg4EH6SG6ODjxjozU+7Jj/i0vJhb2g=;
 b=X2Eq5qqriaIwoN/ySyny+VKQsJ7K7N/t14bR2hKwi8X4K1rvSACnkL7TGjvdA2L6iK
 iQlZDFvWva0Nk2S7RRvgFJ3pYCn9ThIs0CeItQ1eRUGqBQnW8dWI9xXLA2bw7VWr9e5T
 DNw9kq7D0daSgQua1yIuvu9rvsnEqll5CWDOmlJF98librj1QI1bSoLvDCxPWHksPY1c
 uEw2sbH6iJPmn7JMD7P6jysuQSspDSsGJLdrfaWStA7/eA3a1V1jNrAxnHI+XGLdoPyA
 auKy8gKUTYbrc9dTC+m+WTJrqG1VaIYgfb2UHheJ2Vnp/hlkspFvyHfm2bxis4euJJLf
 00Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=aNYEnkC9YyVO7rg4EH6SG6ODjxjozU+7Jj/i0vJhb2g=;
 b=k6dQSWuMhex3/52jBuTvjmWSX7/PWk+resSnwKR4Pbh0aLY/ZVfDwf0v7ePnQ9bZ0L
 aNMU5f5zm/YA8nwDd7q5BRqdUPQNMrhW/TbwesOGD7s5E9cxlXrfVwnsicBUl5vs2gDk
 HShXVQk0lq/dDez7xsz8gSFmJNQvteE/p/ZwrpefwWNYTheyO8C8GCNlZSiwhL4BXxRx
 mhMhT+iMf2uxyHVxxUSj49oZVSnNAqHxmHn58qey3/Q77UOMa86fniCcOGJzf6tbEcys
 SvAkK3FlqKJRcAZrIYpsuRp9T1C7CvNsMmS3ZaVLZW9Huo2/VsDtP7tRGB+SYdCp/CQX
 xRaA==
X-Gm-Message-State: AOAM530wMidLNxlelFcLjaaPACV/P1fNS4Xo9chaXuzeCwQh8bvfwqaq
 j9aG+THxM6ZxF/MevDjQBmxxWQ==
X-Google-Smtp-Source: ABdhPJzf2YoGY0jP95+ApLB0c3diCc0DnCO9oDCsYXGkN9ZPbRBk2xdjfAIyVDaVEiG8WHdVldRYEA==
X-Received: by 2002:a17:902:8203:b0:153:2e8:aaae with SMTP id
 x3-20020a170902820300b0015302e8aaaemr2304400pln.14.1648074683518; 
 Wed, 23 Mar 2022 15:31:23 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 h12-20020a056a00170c00b004fab8f3244esm856984pfc.28.2022.03.23.15.31.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Mar 2022 15:31:23 -0700 (PDT)
Message-ID: <77ae091a-094a-1ddc-4e1e-9bd61b7fc86e@linaro.org>
Date: Wed, 23 Mar 2022 15:31:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 10/13] accel-ops: Introduce
 common_vcpu_thread_destroy() and .precheck handler
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>, qemu-devel@nongnu.org
References: <20220323171751.78612-1-philippe.mathieu.daude@gmail.com>
 <20220323171751.78612-11-philippe.mathieu.daude@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220323171751.78612-11-philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1035
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 3/23/22 10:17, Philippe Mathieu-Daudé wrote:
> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> Introduce an empty common_vcpu_thread_destroy() function, and
> provide a AccelOpsClass::destroy_vcpu_thread_precheck() callback
> so accelerators can choose whether to call common_vcpu_thread_destroy.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   include/sysemu/accel-ops.h | 2 ++
>   softmmu/cpus.c             | 9 +++++++++
>   2 files changed, 11 insertions(+)

My comments here are similar to the create precheck hook.
Do not add a "precheck" hook, but simply a hook to perform the whole job.



r~

