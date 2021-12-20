Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED4B47B5F1
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 23:44:23 +0100 (CET)
Received: from localhost ([::1]:49506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzROH-0007Bc-Nh
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 17:44:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mzRLS-0005ds-HZ
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 17:41:27 -0500
Received: from [2a00:1450:4864:20::52f] (port=35395
 helo=mail-ed1-x52f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mzRLQ-00047T-SR
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 17:41:26 -0500
Received: by mail-ed1-x52f.google.com with SMTP id y22so44467479edq.2
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 14:41:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=F4qKCOQGK4oVTxEkRtVro6vjR8T9DiT/Wm6q2KWPShU=;
 b=FhpW3yaJbJRHLvKbjFLXq8Ij2B6pCXd4UvvV9m3b7M1YcHyqtKTzv0alDySp3uiTDX
 29OfHU6nA9DkuZPBpLizhtnpFndP9POeB5+3SxYE85eTLho6peE+kyn1uPD3ESI+KoO4
 gP0SG18zQ2GstWF7JhjNCR2GEiPpnxBi08qp4WzJnpI9rw1NCjwJRMTQfBlnIiWHU6S3
 tyDqxLojm4p2WqP6fBG+OBv82qxvFUX0m4zOQEK7zPYlw06dPB4XnpoBtdG7rmIleQ7i
 lZQGQzuR3bPxDacxq+JYAEgkBxUvwm5vcV+xDVXJ2UbP9mwm+Y9kOdX83SKllHyNvWvn
 qx4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=F4qKCOQGK4oVTxEkRtVro6vjR8T9DiT/Wm6q2KWPShU=;
 b=SsIPfbrf5nkvrGTHAJlF33uE6GkQBDxrcaQMbCEVXdgb7n+kuveRws6uOaT9cldwqn
 vJhlMJtijJMH5tUs4yvGUnU6uAJ/+vDxi6y5/vCRmmYbsf6xIntaU8Pt35pKE1PCPMQI
 YsVdihcL8Co1dvpNkdx8UIXokHCE28NciaIRcYWVyx6Xj4+sjMf09+IN+HmOnDgoSzVb
 LQuTthmNqu7lVNAhuwE98r4WVqi1XvIdslazHv4K6mqIpEH1nN9vV3jRE/VZ4KMs8PjH
 R/zpBsv0jUo59OgAUy0KKbLL5KB1AIVDiFsmjb36BC5C4hRCKMDDSZl+bAv659jXctyO
 UNPA==
X-Gm-Message-State: AOAM533T7yKyI66c6nXSKIWamJ1UHOQ2IZvlfhdg+WW+vQEVl1K3cMA1
 fpOOZkoSZ/zQOP+2Tx6va7o=
X-Google-Smtp-Source: ABdhPJxzzyhA1QqnRvPOSxiZh4iw0fZgbdiqfHHcAoqisnCh2vjs6UnwdjesjC0uMeH4KA51eEjfNA==
X-Received: by 2002:a17:907:6da1:: with SMTP id
 sb33mr263565ejc.692.1640040083144; 
 Mon, 20 Dec 2021 14:41:23 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id qf14sm2765615ejc.18.2021.12.20.14.41.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Dec 2021 14:41:22 -0800 (PST)
Message-ID: <f490a5a8-e6c2-664c-e497-da6cca4174da@amsat.org>
Date: Mon, 20 Dec 2021 23:41:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 2/6] linux-user: Disable more prctl subcodes
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211220214135.189157-1-richard.henderson@linaro.org>
 <20211220214135.189157-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211220214135.189157-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-3.608,
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/20/21 22:41, Richard Henderson wrote:
> Create a list of subcodes that we want to pass on, a list of
> subcodes that should not be passed on because they would affect
> the running qemu itself, and a list that probably could be
> implemented but require extra work. Do not pass on unknown subcodes.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/syscall.c | 56 ++++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 52 insertions(+), 4 deletions(-)

> +    case PR_SET_SYSCALL_USER_DISPATCH:
> +    case PR_GET_THP_DISABLE:
> +    case PR_SET_THP_DISABLE:
> +    case PR_GET_TSC:
> +    case PR_SET_TSC:
> +    case PR_GET_UNALIGN:
> +    case PR_SET_UNALIGN:
>      default:

Unfortunately prctl values are not enumerated, so we can't remove
the default case to catch new values at build time.

Maybe a qemu_log_mask(LOG_UNIMP) call would help here? (only
for default?)

Regardless:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> -        /* Most prctl options have no pointer arguments */
> -        return get_errno(prctl(option, arg2, arg3, arg4, arg5));
> +        /* Disable to prevent the target disabling stuff we need. */
> +        return -TARGET_EINVAL;
>      }
>  }
>  


