Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF2A4CE49F
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Mar 2022 12:27:19 +0100 (CET)
Received: from localhost ([::1]:41790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQSZC-0007It-Tf
	for lists+qemu-devel@lfdr.de; Sat, 05 Mar 2022 06:27:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQSXT-0006VL-BO
 for qemu-devel@nongnu.org; Sat, 05 Mar 2022 06:25:31 -0500
Received: from [2607:f8b0:4864:20::1036] (port=42635
 helo=mail-pj1-x1036.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQSXM-00088J-Ij
 for qemu-devel@nongnu.org; Sat, 05 Mar 2022 06:25:26 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 c16-20020a17090aa61000b001befad2bfaaso9693672pjq.1
 for <qemu-devel@nongnu.org>; Sat, 05 Mar 2022 03:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=AJ75C0Tn6euvXAljkSJPwcS/hlE2vhaVqNrdp4DgqTU=;
 b=ADQTSSLQBFn5O4XMkaNgtigswftqP/LXC492XN2SWDB79YniwO5zys2pyXQVFtkbHZ
 6f48H8YNlpxkOEErfJkvh2CV2NYOZ2J5JRzoirVOV3M7nsI3WDJd3fmIVymZLk9s51gE
 IeD+epSzZb2hO0RGXUP0dxcKWQHWm5GFs+OZZdaaFb0ly3QXRml0F2m1W4kcU2/AKSe3
 p1qvu3AS3/nmHSgzU/wjfuX6uLJ7rhfrVVyqxhZB5jrO3R+j+wO0uLHhHETNbnNi4WNn
 HA/Lnwz0QCEMpK4yfDaN20N3ZngB274pmSqot+HuxdiGasSGaQJxD5tl955PumtrgDaz
 KUrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AJ75C0Tn6euvXAljkSJPwcS/hlE2vhaVqNrdp4DgqTU=;
 b=kkRfqkIRUhPoinzK3ApgSD3IGqnTjtVIQC42gFeYVX4//g1aLu0wa0vsX4MlsRLJcL
 o1RU0jhXVyc7ADFvHTgl0Q+yJyDZPoM5UMAHdDj9U7yCR9HRSPv4VgVdSr694hKWRhI+
 BUaSbozQds2tTXJcIfid1unW6CxZdFmIKud3VuI2pu97xXnSNHucrbjS33LfRsOplnQU
 ehlXFdgmrG16veZlV3+1NvboYBECiLmAgN6XJBP0kqMbK4bZoBsrEvgWEifYJ9i+yUCE
 P3vMQr2mDMGcEQ+P50fIRb/pjUmZoTyErsOqVvkik/yoC0P/xhe934JNC1Kz5GgGJbrp
 /dSA==
X-Gm-Message-State: AOAM530dMYHxXHWu5wAPkc0HhRkSupLw3qA135/6it/DrrdjEbfXaIzh
 9IK9Rykh/i/fhIRuLK+6DnA=
X-Google-Smtp-Source: ABdhPJxb8Bo3m6T6ACt28w7XYbfA1q6E5yA6CjggbR6jJyhmMRnDvYz/s7gZ6hkLeN0ZB/0BuA7OCA==
X-Received: by 2002:a17:90b:4c8f:b0:1bc:a64b:805 with SMTP id
 my15-20020a17090b4c8f00b001bca64b0805mr3334972pjb.156.1646479520391; 
 Sat, 05 Mar 2022 03:25:20 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 nl12-20020a17090b384c00b001bc1bb5449bsm7868030pjb.2.2022.03.05.03.25.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Mar 2022 03:25:20 -0800 (PST)
Message-ID: <8624c864-b459-f178-a8be-20ee6bac780b@gmail.com>
Date: Sat, 5 Mar 2022 12:25:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v3] i386/sev: Ensure attestation report length is valid
 before retrieving
Content-Language: en-US
To: Tyler Fanelli <tfanelli@redhat.com>, qemu-devel@nongnu.org
References: <20220304201141.509492-1-tfanelli@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220304201141.509492-1-tfanelli@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1036
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: pbonzini@redhat.com, mtosatti@redhat.com, berrange@redhat.com,
 kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/3/22 21:11, Tyler Fanelli wrote:
> The length of the attestation report buffer is never checked to be
> valid before allocation is made. If the length of the report is returned
> to be 0, the buffer to retrieve the attestation buffer is allocated with
> length 0 and passed to the kernel to fill with contents of the attestation
> report. Leaving this unchecked is dangerous and could lead to undefined
> behavior.
> 
> Signed-off-by: Tyler Fanelli <tfanelli@redhat.com>
> ---
>   target/i386/sev.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/target/i386/sev.c b/target/i386/sev.c
> index 025ff7a6f8..e82be3e350 100644
> --- a/target/i386/sev.c
> +++ b/target/i386/sev.c
> @@ -616,6 +616,8 @@ static SevAttestationReport *sev_get_attestation_report(const char *mnonce,
>           return NULL;
>       }
>   
> +    input.len = 0;

I agree with Daniel's review of your v1:

   "The declaration of 'input' already zero initializes."

https://lore.kernel.org/qemu-devel/YiJi9IYqtZvNQIRc@redhat.com/

>       /* Query the report length */
>       ret = sev_ioctl(sev->sev_fd, KVM_SEV_GET_ATTESTATION_REPORT,
>               &input, &err);
> @@ -626,6 +628,11 @@ static SevAttestationReport *sev_get_attestation_report(const char *mnonce,
>                          ret, err, fw_error_to_str(err));
>               return NULL;
>           }
> +    } else if (input.len == 0) {
> +        error_setg(errp, "SEV: Failed to query attestation report:"
> +                         " length returned=%u",
> +                   input.len);
> +        return NULL;
>       }
>   
>       data = g_malloc(input.len);


