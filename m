Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D488C4796D2
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 23:04:34 +0100 (CET)
Received: from localhost ([::1]:32856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myLL7-00019q-I0
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 17:04:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myLJ7-0007MS-2j
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 17:02:30 -0500
Received: from [2607:f8b0:4864:20::529] (port=33759
 helo=mail-pg1-x529.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myLJ5-0007Jx-Hf
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 17:02:28 -0500
Received: by mail-pg1-x529.google.com with SMTP id f125so3431677pgc.0
 for <qemu-devel@nongnu.org>; Fri, 17 Dec 2021 14:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=DJvD2aB8Ec2Kw3pe2g7OYiL6utUXO4pbl5D0N9tgYf0=;
 b=lyMJpeHh1iQuOaE6lZ3hzImoro2Cu7UWJ+xXO56K4BTBq2yra3/3wTq65vKQEESd16
 6AUJ7jSpAW1qDSrIApld2di6lS6m9KErxhPU8xXOpk/ZiNkhzy2ey/5pIh7DHyan4o5Q
 yCfs4smyjlpQa17RV9mN9uj17XZiXCUTSgRI0tdlCl8dOCAXH3JHOPrIrvrg9EpE+t5K
 GCKy2hLE06MCILcAya2GBnPJY0CRWuDsVzuNneFzsfc+cKyl0sx60QFPPMYEaI40RySk
 ssCkX1o7yQyH9pbDycI+AXpwVBLnSFkH3WHz7UJUKl1hbOHJQzCrbYbk4YAImRHoTF9P
 6MzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DJvD2aB8Ec2Kw3pe2g7OYiL6utUXO4pbl5D0N9tgYf0=;
 b=TZFk2xa7egF4Z6y1ZFW27MPORKzeiXrlnn3m/mI+qk9Z9STqTMe0IOEBoHV4HOTQt9
 k7vGir0RM9886nA4hhtWK4MUchysx/MfS1j1mNxDDy4nSlo66Z92mZ2stXdBISc2mwee
 DhDTG3XepoQeVXrw82cbpdQSwSAYN7cnGmqR/GXt03jTaV6XP2O9Y1VzAmyLjX8DtRQq
 BDlReH8HIO9IdeF3ZKkPqOdGduDC9jzV36bXzEqg8iew6x9b57dpfH8nabY2gj/GcnXl
 Sj6ASl6Ru85yoSMl9OXQlzxKLeBTjEt9c4LvcdqbR4oVTjx31fa2zSeT+GKKor5uCzB5
 Cvwg==
X-Gm-Message-State: AOAM532UAZM9pmJRJ1UgDqHxW/cZ7raNLmkXclxPcxKujop5g+B5kfVK
 izxC3T/OX0q4BQp/nuMoqtcsb1Ur341OOA==
X-Google-Smtp-Source: ABdhPJy7t4L5wrg5Ca8nATsXDQLtQXW4nPjslPaJYMDhaVZZ4mKHzmiq9G3mq08pw+uswsHbygqWMw==
X-Received: by 2002:aa7:8e48:0:b0:4a7:fe01:5971 with SMTP id
 d8-20020aa78e48000000b004a7fe015971mr4963719pfr.20.1639778546129; 
 Fri, 17 Dec 2021 14:02:26 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id p8sm11621317pfo.141.2021.12.17.14.02.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 14:02:25 -0800 (PST)
Subject: Re: [PATCH 09/10] configure, meson: move ARCH to meson.build
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211216085139.99682-1-pbonzini@redhat.com>
 <20211216085139.99682-10-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f38d2662-9961-f15a-69df-c12e108df63b@linaro.org>
Date: Fri, 17 Dec 2021 14:02:23 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211216085139.99682-10-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::529
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.716,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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

On 12/16/21 12:51 AM, Paolo Bonzini wrote:
> -    if config_host['ARCH'].startswith(k) or config_target['TARGET_BASE_ARCH'].startswith(k)
> +    if host_arch.startswith(k) or config_target['TARGET_BASE_ARCH'].startswith(k)

Not a problem with this patch, but a missed use of target_base_arch variable?

Anyway,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

