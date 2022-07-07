Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 288C756A0EA
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 13:11:33 +0200 (CEST)
Received: from localhost ([::1]:58586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9PPw-0004UO-3F
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 07:11:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9PJz-00015L-7O
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 07:05:23 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:34806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9PJx-0002A1-Hs
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 07:05:22 -0400
Received: by mail-pf1-x432.google.com with SMTP id 70so3541979pfx.1
 for <qemu-devel@nongnu.org>; Thu, 07 Jul 2022 04:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=HaW7PtWyleRGzJN628OdizWbjlvBM2rvhX5zIW2GulE=;
 b=WCIuqX4JK4FhDf5KJoS4WqVws3uLfPHrErIo+j0qzqmS3vhWwr5TPbmvTIiUWsm6Ol
 8vEECEvKBrENAUFI+CKzegR8fLtHWP1n5mXmn9kFbdBxa9MdsGng9EGApjufCxwPF/Y6
 oDNRxZEL+FlnlsXVWNzJKg6Uq/51vtAy6NX7ktMQqxNyJ7w9+waITUNwEwmLQInPGaIm
 rx6sXWFrQDBLtO0hw/rPfqNWLHKrITNVbLhB45bYwsXACd0uwnntdkvb4NCZYNdLJuEw
 3KJyvyDN3wHAh5AQoeB927dHQlGS9NVUGe1cMZWKmHxq7lPSCx/se/WKDqRYl9gQM3X0
 3r/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HaW7PtWyleRGzJN628OdizWbjlvBM2rvhX5zIW2GulE=;
 b=8MxrPEcaXnCvxghFP4Dduawq0wMG2XqSSQIAlLSU+NUaQyrJANnNsxg2hCpfaAr1DJ
 EmplNRAFLaLMbdARO1J2JMpkJNRec5GmVgG+Ia1+MAkYpDesM0wk8XNkhxPXycTLj8BO
 pzXmQhZeoZ/6J9Oz6Vg8nB8a5U3ZRk5xPns+ml2WnnOISR1vKchPRI1IE0kXhxZGHwSg
 cv1wxepo4FjUZ4P2DyZVyzrk309qB1vu4C8JK+JUcO40+tsbqUKgZq/yVkUZLk47ee6I
 iWzp+RH5bm5JCIasDgsPiuiSq8Ejf0os1nTwmooeNkoNMBiRftYDTJP9RxQhqas+9F9z
 fyGA==
X-Gm-Message-State: AJIora+uOpfnoDn5dWjMd1Su6Vl7znqGz3tMv2IiJAP/Pfd9Nowrfzn2
 ryyrlPxLScGV/36bUwpuOr1UQQ==
X-Google-Smtp-Source: AGRyM1sCU3WTbhP0+8pN0eQiZV+Gl8Wb5WX1z01B6iXtgGdG1yT6zkl1FR3wngUG5gxF0ynbugkebw==
X-Received: by 2002:a17:902:f543:b0:16a:54cf:3da9 with SMTP id
 h3-20020a170902f54300b0016a54cf3da9mr51292318plf.1.1657191918783; 
 Thu, 07 Jul 2022 04:05:18 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 s2-20020a170902ea0200b0016bbcdc72f1sm9880104plg.298.2022.07.07.04.05.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Jul 2022 04:05:17 -0700 (PDT)
Message-ID: <1c4bc1aa-9809-549f-8bc6-b1b2323dcdd5@linaro.org>
Date: Thu, 7 Jul 2022 16:35:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3 09/13] tests/vm: upgrade Ubuntu 18.04 VM to 20.04
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Daniel Berrange <berrange@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Michael Roth <michael.roth@amd.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <20220707040310.4163682-1-jsnow@redhat.com>
 <20220707040310.4163682-10-jsnow@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220707040310.4163682-10-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 7/7/22 09:33, John Snow wrote:
> 18.04 has fallen out of our support window, so move ubuntu.aarch64
> forward to ubuntu 20.04, which is now our oldest supported Ubuntu
> release.

Ah.  Squash with patch 5?


r~

> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   tests/vm/ubuntu.aarch64 | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/tests/vm/ubuntu.aarch64 b/tests/vm/ubuntu.aarch64
> index fc9c2ce22ff..666947393bd 100755
> --- a/tests/vm/ubuntu.aarch64
> +++ b/tests/vm/ubuntu.aarch64
> @@ -32,13 +32,13 @@ DEFAULT_CONFIG = {
>   class UbuntuAarch64VM(ubuntuvm.UbuntuVM):
>       name = "ubuntu.aarch64"
>       arch = "aarch64"
> -    # NOTE: The Ubuntu 18.04 cloud images are updated weekly. The
> -    # release below has been chosen as the latest at time of writing.
> -    # Using the rolling latest release means the SHA will be wrong
> -    # within a week.
> -    image_name = "ubuntu-18.04-server-cloudimg-arm64.img"
> -    image_link = "https://cloud-images.ubuntu.com/releases/bionic/release-20220610/" + image_name
> -    image_sha256="0eacc5142238788365576b15f1d0b6f23dda6d3e545ee22f5306af7bd6ec47bd"
> +    # NOTE: The Ubuntu 20.04 cloud images are periodically updated. The
> +    # fixed image chosen below is the latest release at time of
> +    # writing. Using a rolling latest instead would mean that the SHA
> +    # would be incorrect at an indeterminate point in the future.
> +    image_name = "focal-server-cloudimg-arm64.img"
> +    image_link = "https://cloud-images.ubuntu.com/focal/20220615/" + image_name
> +    image_sha256="95a027336e197debe88c92ff2e554598e23c409139e1e750b71b3b820b514832"
>       BUILD_SCRIPT = """
>           set -e;
>           cd $(mktemp -d);


