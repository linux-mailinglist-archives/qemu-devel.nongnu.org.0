Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 147774AAD55
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 02:06:56 +0100 (CET)
Received: from localhost ([::1]:34986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGW10-0004Ci-OC
	for lists+qemu-devel@lfdr.de; Sat, 05 Feb 2022 20:06:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nGVrn-0001w6-Cz
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 19:57:23 -0500
Received: from [2607:f8b0:4864:20::432] (port=33730
 helo=mail-pf1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nGVrl-00067u-O1
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 19:57:23 -0500
Received: by mail-pf1-x432.google.com with SMTP id i186so8525379pfe.0
 for <qemu-devel@nongnu.org>; Sat, 05 Feb 2022 16:57:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=FLabCwfQQGzmtItCu+80mjjbn+m0nz2mw3vO+3Nx/K8=;
 b=p8cJCznKRRHg+PE5/PySetVaLyjztQUo0zTDTTZ/PAz0OAYBtXDgOw/ExYxbuOv4Q/
 Uf8IhhhsfZ4UxdzN+EybNWaJSlP5Vo4YejAiqiV1SMrt6X+rHm5iyiG35foBnnMiRK6N
 p4fWwT+kF5m7NOkb9lxMm5btj0E/QePGaFKYB2LzOsdO2XOWhN23etPKXWX4DfHnI+9j
 WsmwBSTOL/ACT1m75JYmQh9mlxq/o1EtdYqwFLgEQ1Ngi3uYpiu7lCbkuhqSbcAKKlhB
 Nj0kbs3CpvT7Zb3PU8Lraj2zh/5oVHXldQW7CRoYAJwDtWE4HrCcvhBDQutySgZ/zhDW
 grww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FLabCwfQQGzmtItCu+80mjjbn+m0nz2mw3vO+3Nx/K8=;
 b=jKuy9h9obClphnvYw0NZ9/gJ6nAHZASqqeQm2UbKcmjiJ0rqygO2DlHLoXsQwyaZKb
 PcnXx6NGn2rclbW+ALdu7oy66VA/pgm/5NA0F1niY65lhM0Udwx1UzEgVzBTpPO6qwlO
 9gO+l2NKkqV8gw+FG2bQ9dSCy2GeiEqTpDMIPaAjc+d56cbpEzZNH3AnKCP6PlUWLaMd
 uCD5Lp3BO6YpESd6NHIgCcG0a9QtfAYoUqfwCH4vq6zh2KSdyZCzvzxmKpNXp5UUd8Zv
 PjYpTizxbmZO5xYXnxSXqSSPsZCAY9iAist6AZU3qDVIu2zuujEQKk1bJs2zS+MS3+yZ
 8VQw==
X-Gm-Message-State: AOAM533rBRqJxF8cZKMnToDXoNwKEnbSG/7sZzsdn6mP6qtTAGpBjEro
 xdYUf8lkVP3LbRdgdeuGnbGSMg==
X-Google-Smtp-Source: ABdhPJwY3Ypu1U/pi/Ul+fXns4/M7w8gUR2PUUluD1YVVFlwILQS8yVYxXhW0Ql7a8Z3v+uTYr9ItQ==
X-Received: by 2002:a63:215a:: with SMTP id s26mr4514164pgm.141.1644109037667; 
 Sat, 05 Feb 2022 16:57:17 -0800 (PST)
Received: from [192.168.1.118] ([220.235.247.127])
 by smtp.gmail.com with ESMTPSA id z1sm7129510pfh.137.2022.02.05.16.57.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Feb 2022 16:57:17 -0800 (PST)
Message-ID: <a3750c55-4240-d5a4-2e6a-ffea3ed0f6b6@linaro.org>
Date: Sun, 6 Feb 2022 11:57:08 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 03/26] Makefile: also remove .gcno files when cleaning
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220204204335.1689602-1-alex.bennee@linaro.org>
 <20220204204335.1689602-4-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220204204335.1689602-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::432
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: fam@euphon.net, berrange@redhat.com, Luke.Craig@ll.mit.edu,
 kuhn.chenqun@huawei.com, f4bug@amsat.org, robhenry@microsoft.com,
 aaron@os.amperecomputing.com, mahmoudabdalghany@outlook.com, minyihh@uci.edu,
 cota@braap.org, stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 ma.mandourr@gmail.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/5/22 07:43, Alex Bennée wrote:
> Left over .gcno files from old builds can really confuse gcov and the
> user expects a clean slate after "make clean". Make clean mean clean.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Message-Id:<20220124201608.604599-4-alex.bennee@linaro.org>
> 
> ---
> v2
>    - fix whitespace damage
> ---
>   Makefile | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

