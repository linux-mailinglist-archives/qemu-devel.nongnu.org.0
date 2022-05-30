Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1A85388C3
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 00:01:52 +0200 (CEST)
Received: from localhost ([::1]:40550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvnSR-0001zR-KZ
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 18:01:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvnQe-0001CM-Jv
 for qemu-devel@nongnu.org; Mon, 30 May 2022 18:00:00 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:35669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvnQd-000328-4S
 for qemu-devel@nongnu.org; Mon, 30 May 2022 18:00:00 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 o6-20020a17090a0a0600b001e2c6566046so523298pjo.0
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 14:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3+QdlzmQZxY+XEC+xwkFSoqg2a70WZ9XcQUmx9oSlv4=;
 b=d+LnmuytVeloMmN5pxfCSI4mD7yT8d2ZIiDv5q6td/FqORbgr9Dr9p0aSuuFHtWJSF
 Xn3yGEeYnlsOc1ynkrE4WNxBnXZZplpG5nWfpYmicralST1K4qqXsUALx5z4yVpmzUAm
 IRl6BhpHJA7psELuxaNw6TzVzHrX8PIFmNEbbnqF9Sk/wQEftRcP0Jpb+HlOLel3EFWW
 rFdCIGbS06MkZo2ysO2uYsJI5DuXr8R6phGxX6i33Ieraz1d5tRTuei0KdEMCLLD5GcD
 8uA9bpSTkLC1E1SZcOp0tb84EqBdQbfh96xfN014gqtPc5EbSf6TPt+oJIs6VsVonOy9
 Z57g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3+QdlzmQZxY+XEC+xwkFSoqg2a70WZ9XcQUmx9oSlv4=;
 b=KLtuRV4hpE02aOfUbWlJAGDwi4/6+BgpsRbAjJto37FuQ7wwbjTTFPfHc4qlbRgF6u
 7wS3KSyPk14GkFly8cuYAVNw7C6x0cC6wfqFDKeGvcIylu0BhwlcfiDgI7/Z0P955toP
 citLTTYeqlW+8jcGsden1nMQIRfGYDmgh7u7oz2QNhzUBcD1UF8crPXdv4qPfrO1Ne9e
 M5gAjxriiRuk1kvFivm06aO0e3Nh4IMqR7jLaj1GqnRP2bjeJnKg7n2LDVCOLSd8jDAs
 Hn63PLChqUX6JJpeAl/0lb/hfO7APOSknyi6+uAjUuxe++Zf2BrMtP9LYmzArVjSXa+y
 8EAQ==
X-Gm-Message-State: AOAM533xyEqEQITMH+H2lxW7bRHAeShW+5SfgaWBRo0eF4S5xCZyhyDT
 P4gm9hMobzKibr9LElLyHF4=
X-Google-Smtp-Source: ABdhPJwRWIhcGj8JiGzKL/YngKrv8Moozu3nQ6jv47nENTm34G0lMYsclHCFVy1ijmOHIPpz+Ft+pQ==
X-Received: by 2002:a17:90a:fa5:b0:1e2:ee1b:8f85 with SMTP id
 34-20020a17090a0fa500b001e2ee1b8f85mr8991092pjz.216.1653947997715; 
 Mon, 30 May 2022 14:59:57 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 g18-20020a170902d5d200b0015edc07dcf3sm8992830plh.21.2022.05.30.14.59.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 May 2022 14:59:57 -0700 (PDT)
Message-ID: <5207e134-b00e-11c3-2046-8717aca6ccbc@amsat.org>
Date: Mon, 30 May 2022 23:59:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [PATCH v5 05/10] cutils: add functions for IEC and SI prefixes
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: armbru@redhat.com, dgilbert@redhat.com
References: <20220530150714.756954-1-pbonzini@redhat.com>
 <20220530150714.756954-6-pbonzini@redhat.com>
In-Reply-To: <20220530150714.756954-6-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 30/5/22 17:07, Paolo Bonzini wrote:
> Extract the knowledge of IEC and SI prefixes out of size_to_str and
> freq_to_str, so that it can be reused when printing statistics.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   include/qemu/cutils.h    | 18 ++++++++++++++++++
>   tests/unit/test-cutils.c | 32 ++++++++++++++++++++++++++++++++
>   util/cutils.c            | 34 +++++++++++++++++++++++++---------
>   3 files changed, 75 insertions(+), 9 deletions(-)

> diff --git a/util/cutils.c b/util/cutils.c
> index 19fb4d04f8..485e9b0cea 100644
> --- a/util/cutils.c
> +++ b/util/cutils.c
> @@ -872,6 +872,25 @@ int parse_debug_env(const char *name, int max, int initial)
>       return debug;
>   }
>   
> +const char *si_prefix(unsigned int exp10)
> +{
> +    static const char *prefixes[] = {
> +        "a", "f", "p", "n", "u", "m", "", "k", "M", "G", "T", "P", "E"
> +    };
> +
> +    exp10 += 18;
> +    assert(exp10 % 3 == 0 && exp10 / 3 < ARRAY_SIZE(prefixes));

Can we add parenthesis to ease code review?

> +    return prefixes[exp10 / 3];
> +}
> +
> +const char *iec_binary_prefix(unsigned int exp2)
> +{
> +    static const char *prefixes[] = { "", "ki", "Mi", "Gi", "Ti", "Pi", "Ei" };
> +
> +    assert(exp2 % 10 == 0 && exp2 / 10 < ARRAY_SIZE(prefixes));

Ditto.

> +    return prefixes[exp2 / 10];
> +}

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

