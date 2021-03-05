Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2303B32F375
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 20:07:42 +0100 (CET)
Received: from localhost ([::1]:53646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIFnZ-0002j9-6v
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 14:07:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lIFke-0000vs-MI
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 14:04:45 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:39009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lIFkb-00063c-EY
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 14:04:40 -0500
Received: by mail-pj1-x1029.google.com with SMTP id ch11so2657800pjb.4
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 11:04:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PF7Z0/qIMuTyRq0GXDoKtAwSHlPQWX0fI68R4KEEhBU=;
 b=g33yepKE81bogIc19MggTIUN/1iZryiN71WVWm0/Ns81n0bhBKgtqLhMzAXCcc1KIk
 O+h550Ve9uzJAALhdJLIea+pVOH61CebEYuNbASvlc0C1iIx2Z5U/HLWvlKnFrqK0X5K
 v6m8sJZQd8gasjZBhMWTSedtC4+sTSuVpLg5D6+TIcvQKKSHKb7GB6DQRO2+FkZvre7Z
 n5PmTAbyuBOhy/ujyroBb5Gyrd3eAzIukcTCw+5rkeGB3FM/4HGtMQNU4gF/8YBWY2Rd
 wgh/5t3XsqZSW4JP6eEzVgXIQd5XF8RP2cgodGq5kDgGCjDf3qt11XcI50HOaJyf9i/S
 XJ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PF7Z0/qIMuTyRq0GXDoKtAwSHlPQWX0fI68R4KEEhBU=;
 b=g4vyVvCSRQCSvDJevCo1jm6WaVTBsn88uO6JuMYkyqKMb89tkf6CaNQ736dtaUDQpH
 Q/PxIZ0GOetFf3OCwtxgGttTZAmTOXhILCyUsOAmNvBZkj2OdsygeLjNlhEyAlpMo/Kz
 Yki4fmISBFxuk/I/Oy5HBsfYfKpE65cMD7q0FEl3aHgKXZDb+kFGYSKpfVGrbuw0StRI
 HXstBuYWKClxNgsW00Vgve3W6x+/xtAItUimJbLn9k8tKiMSC1c8kFDjM00Ev6d6I9ZB
 R48XxT1L08zciABg1YqE+vDsQObagC1AndSAOYc90hhIMmMNgd2b8EptJzeWIS3eAlJT
 qJQQ==
X-Gm-Message-State: AOAM530ZHYYSmP+ul0KYWLDJkFtnp2R0Y85AVaNoxu+oyf8gSl70Kq3P
 MDFQsk7zWa4SXeMzBKtgZNQUFZmC+m1U9w==
X-Google-Smtp-Source: ABdhPJxzubaUX10jXyIqGd6CKV+hLP8ZTL0Y0NxBoVu5yARaV0BCMOtOJp96qCaexpDQnaeposMDlA==
X-Received: by 2002:a17:90a:e516:: with SMTP id
 t22mr10288079pjy.39.1614971076140; 
 Fri, 05 Mar 2021 11:04:36 -0800 (PST)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id y14sm3215930pfq.218.2021.03.05.11.04.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Mar 2021 11:04:35 -0800 (PST)
Subject: Re: [PATCH] target/hexagon/opcodes: Add missing varargs cleanup
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210223111253.2831285-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <655c262f-6033-a8ab-3565-ecafaa7ddd18@linaro.org>
Date: Fri, 5 Mar 2021 11:04:33 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210223111253.2831285-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Taylor Simpson <tsimpson@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/23/21 3:12 AM, Philippe Mathieu-Daudé wrote:
> Fix a trivial incorrect usage of variable argument macros detected
> by Coverity (missing_va_end: va_end was not called for ap).
> 
> Fixes: Coverity CID 1446720 (VARARGS)
> Fixes: e3c00c2ed75 ("Hexagon (target/hexagon) opcode data structures")
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/hexagon/opcodes.c | 1 +
>   1 file changed, 1 insertion(+)

Queued to hexagon-next.

r~

