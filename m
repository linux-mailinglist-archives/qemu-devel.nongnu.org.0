Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5675AEA71
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 15:54:20 +0200 (CEST)
Received: from localhost ([::1]:45046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVZ1v-00046z-C3
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 09:54:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oVXxL-0006HB-Pd; Tue, 06 Sep 2022 08:45:32 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:43686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oVXxJ-0000A9-Tl; Tue, 06 Sep 2022 08:45:31 -0400
Received: by mail-pg1-x532.google.com with SMTP id v4so10506389pgi.10;
 Tue, 06 Sep 2022 05:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=K3reb8+Rx6xSxGolbC3ARiRVIbkuFfdbpHxUHk+pv4s=;
 b=N4dRZeo+8ZpNe8P6qy/fsi7PguIJI8FqaYceMsVwOfLAuYmDPnGB8YMTm1PUUeszti
 Io0SUwujrto4emLLe5f/+qAtUVesdIpAVVsC8iIjdVnFH0rMVxafW518zGknAJDWxYZE
 FYuilaIc0pc1einKiIU5I/DK2nTh+vUbGKNRX/HIptMCvysO648n/zuS/lPFkURNHeZK
 tgKEVdUW5kCEW/rwfvqIs1L6i0tryR9fIF4x7yIKl2FcrY22wImONjjPRvn6gKod0xOB
 a0t38k7GNlDd+upHBci7oW3fYFw7wl5uHj3dsrIUgZkg8qEgzV9JQbdx5ihPhsZH+Y8u
 S//Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=K3reb8+Rx6xSxGolbC3ARiRVIbkuFfdbpHxUHk+pv4s=;
 b=xW1O+k2khZVM6XT1vkoZEwxQCczppol3PRAkdltmDOO4Zv0pkC3lpO8YcR3+cP87UQ
 x04mi4FCRFjg5v98k7eEZi/X/WKKuapt0hNtr9AFEb1yp0woui//36HuesyT3deFYYzp
 LPYk/ozrEt8+XWqIPRWE4IzwzTYJeeLfSFZUJcHOQcF/POTNLyEUe5pI6HK+s5kKxzPx
 v732LAiyBm5kLWo84N8TPwzhvjxa3LVVmdtydxrO+THLD+V5C+EpeOyBU+hn534aFd37
 C/m4/rCTE8zrnFtjgp2HlYgnUlLgNdnqZJ8aIZpLXtbm/GV5i3oxW9nLh28MU3AAE8QH
 h92A==
X-Gm-Message-State: ACgBeo2wS6trt8GuPPtDPhWL4Owak4yQms7X+Ulh7XK8P6sVJKV0sZsQ
 LbIepbeYXMW983lZK1wRP1k=
X-Google-Smtp-Source: AA6agR4YGX4ltUN5pp3Gfc9vDdWjcM6YrjqsgxW5MvcORHPN1RbMCgHdORqZNj6x2FlzJVfGxC5SCg==
X-Received: by 2002:a05:6a00:1691:b0:53b:3f2c:3257 with SMTP id
 k17-20020a056a00169100b0053b3f2c3257mr22248524pfc.21.1662468327533; 
 Tue, 06 Sep 2022 05:45:27 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 m16-20020a170902f65000b0017682b90532sm7553591plg.194.2022.09.06.05.45.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Sep 2022 05:45:27 -0700 (PDT)
Message-ID: <182f5f68-5e08-2d82-5491-167b2ed4f493@amsat.org>
Date: Tue, 6 Sep 2022 14:45:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v4 1/9] target/arm: Introduce curr_insn_len
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20220906100528.343244-1-richard.henderson@linaro.org>
 <20220906100528.343244-2-richard.henderson@linaro.org>
In-Reply-To: <20220906100528.343244-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x532.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.752,
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 6/9/22 12:05, Richard Henderson wrote:
> A simple helper to retrieve the length of the current insn.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/translate.h     | 5 +++++
>   target/arm/translate-vfp.c | 2 +-
>   target/arm/translate.c     | 5 ++---
>   3 files changed, 8 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

