Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 106BF49DC8E
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 09:28:30 +0100 (CET)
Received: from localhost ([::1]:37510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD08q-0000AS-FD
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 03:28:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCziL-0000qr-0S
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 03:01:06 -0500
Received: from [2607:f8b0:4864:20::1030] (port=42858
 helo=mail-pj1-x1030.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCziG-0001g0-T6
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 03:01:04 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 my12-20020a17090b4c8c00b001b528ba1cd7so2147283pjb.1
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 00:00:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=2nfbPa9hjPP/Ds5QyJ9gbOVQ32AbKkvDZWJ9otsrT5o=;
 b=sbkcTgs7aaqytv3opXT8W8gnzTIXJEnGjHk2egWRHBWtkmgdIjzAgdLHikfRGZkwrH
 b5bJ3IGYazqK/9dvkdQjr2L+bVZ7GQ8Uxi5mLIEsa8PvObFmbCxDLzRlXJxgvepJT9GY
 c9pVfSMkkTduybw7yuoZJTY+AXiUDNAn5jOtzSevXLXQ4QePcoiQwJDGnZwgvemzqOUW
 x0BTskI3YNlf2vjiJgYZ3k4bXZtrkekmdioKNBXYX3vryQV3rYeWXiFJezDA9QnUjSoR
 mKFILuP0q1tyw4vP9JsYct98LcDj5nM0htEo9DujR7ctB/j/qBN8zVDjTbtepW5YlRwb
 l54w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2nfbPa9hjPP/Ds5QyJ9gbOVQ32AbKkvDZWJ9otsrT5o=;
 b=ubJJwkhRKWBOmlN74HSUBBATJ3Y9gkiYEoZZHQWQm2MdcQkHi8I+yzRh9Bp4hU6GYo
 oxWtUzi6yqV2Fi6IhZQ1rO475pLAzMYMxc8DQmGSeHKvUsKuzhZypD9yP+SQJ/Je0Ray
 gyvdIfeOtoNHEhPKnyEwhEJxAOq7XO5RoLW0Yt3uHbs3ynattZCozQg2+o4fV2pUjKSK
 0EprsaMpZCKF66C0e2ByEhB+8+YBDlMzT+OdGKGkh1+C2POpJDXt3ZMYUl0/s+FxKA+9
 rYeDD1ktFwoXu2tbFEw79bmEb1kSJQTEKavpe5caugAR+FJbEX52+W9F5nstLcXQ81Vn
 sP1g==
X-Gm-Message-State: AOAM530ZzguxoFQnEtnkItyoh5qL5Fnw9yJUHcmfN0KIn8yRA+Lp3q1k
 QemhsaM4hMrLOoBzQbzTEV5SXsJa0hadix9B
X-Google-Smtp-Source: ABdhPJwacKW1nCKcA4xR8zJGbLsug4gc3eYZcnlUXuJzUX3FDexopUWINc893HtbrgvHP4ByggUSFg==
X-Received: by 2002:a17:902:7e4a:: with SMTP id
 a10mr2157291pln.143.1643270451697; 
 Thu, 27 Jan 2022 00:00:51 -0800 (PST)
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id d20sm4621293pfv.74.2022.01.27.00.00.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jan 2022 00:00:51 -0800 (PST)
Message-ID: <737a9a20-6921-1567-16d0-84c80e300f67@linaro.org>
Date: Thu, 27 Jan 2022 19:00:45 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 39/40] bsd-user: Rename arg name for target_cpu_reset
 to env
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20220125012947.14974-1-imp@bsdimp.com>
 <20220125012947.14974-40-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220125012947.14974-40-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1030
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Kyle Evans <kevans@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/25/22 12:29, Warner Losh wrote:
> Rename the parameter name for target_cpu_reset's CPUArchState * arg from
> cpu to env.
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/arm/target_arch_cpu.h    | 2 +-
>   bsd-user/i386/target_arch_cpu.h   | 4 ++--
>   bsd-user/x86_64/target_arch_cpu.h | 4 ++--
>   3 files changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

