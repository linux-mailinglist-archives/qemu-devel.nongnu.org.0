Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A95DC370E1F
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 19:07:50 +0200 (CEST)
Received: from localhost ([::1]:54696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldFZN-00062g-O6
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 13:07:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldEsJ-0003wO-Ve
 for qemu-devel@nongnu.org; Sun, 02 May 2021 12:23:20 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:54139)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldEsI-0001Bf-EO
 for qemu-devel@nongnu.org; Sun, 02 May 2021 12:23:19 -0400
Received: by mail-wm1-x334.google.com with SMTP id s82so1926487wmf.3
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 09:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=L/2JP8VYtBbmkX1PK4zlOhgyY4Vh582KsUJXcRV6XxA=;
 b=gy8mhPxrFFLnG19B6wgAMG6ewpgAVSp9VxZP5Lw5NZ11MFJzTDkCxil2x/hHwkyZOM
 5lI6EpJxDxLViFAk5iICDv8dDVQN6+COJfA5dBui0uLsMoyQg45N3WGrqU3j9gs0knBI
 n7QuADDwUxat8GE6pFgI+sk7dGv4Lo78QFTYfwFnF1EMp/cdjGsBEUH09xttIt5kltlB
 4SdwqEPEyaGLZBKFNh2zKz2HrlW7ufRvVdIHPcpZlzzX8sFPQX7486FBpeJMfKQK9XO3
 F9dX7kNni9ASC+xCWlS38TtnNUUAu6iyx0eJ0k5sXOjvegCvqxzHtXeldxO9q+7DgWtM
 hioQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=L/2JP8VYtBbmkX1PK4zlOhgyY4Vh582KsUJXcRV6XxA=;
 b=SCNAum12nKfafxhuvoOBiMIuEugJCFUAG7myphgVLyPJ4RB2SZ+CuN1+X/GvEheeUi
 GCdqkiCss+yPB226RHwDacihsu3hpWFfxdIf4SXoDmIoR8LOt+iAEnTYWZHH3KQNaidD
 4e6QK0TzdTd/kqiYKZi/l25LsAx2YOzHpAE6YfB87bgIH9I96AkU8eOj6JyozZB4pVo9
 KtUYkuwWEv3DwKbKQEsyJejE5U3i7/lEm8oHT97rO0/wXDa7QdRhMjxG4R9x+VDGzZsS
 WjnKF0C6WyQsLsRmE0YUr/438gw6D6gtYVJnhLwG0kQhzZq6y+zwSxDnLzXYg7Eun8zA
 K2Pg==
X-Gm-Message-State: AOAM530qHaIaPPivs9/BgiPlGKEQ0yUPRZQ2zwrW7zfP/TuDbFoKxF7X
 tsNAffOatD2IJwi36gGsgm8=
X-Google-Smtp-Source: ABdhPJzcyvPBf5qAgm8QaLknrccJfrcaNgF5dSIyHBLvaXnYs8uhklQroh5aJiYbpFPDxryiSi5slQ==
X-Received: by 2002:a1c:f20f:: with SMTP id s15mr28404098wmc.61.1619972596507; 
 Sun, 02 May 2021 09:23:16 -0700 (PDT)
Received: from [192.168.1.19] (anancy-651-1-208-144.w109-217.abo.wanadoo.fr.
 [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id m11sm9479573wri.44.2021.05.02.09.23.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 May 2021 09:23:16 -0700 (PDT)
Subject: Re: [PATCH 0/2] exec: Cover gen-icount.h in MAINTAINERS, add missing
 exec-all.h header
To: qemu-devel@nongnu.org
References: <20210422064128.2318616-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <8cd38f7d-c51a-574b-e881-f94d6b4128f7@amsat.org>
Date: Sun, 2 May 2021 18:23:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210422064128.2318616-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@gmail.com>, "Emilio G . Cota" <cota@braap.org>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping?

On 4/22/21 8:41 AM, Philippe Mathieu-Daudé wrote:
> include/exec/gen-icount.h is listed as unmaintained.
> Add it to Main Loop (or should it be TCG? softmmu/icount.c
> is already there).
> 
> Add the missing "exec/exec-all.h" header.
> 
> Philippe Mathieu-Daudé (2):
>   MAINTAINERS: Add include/exec/gen-icount.h to 'Main Loop' section
>   exec/gen-icount.h: Add missing "exec/exec-all.h" include
> 
>  include/exec/gen-icount.h | 1 +
>  MAINTAINERS               | 1 +
>  2 files changed, 2 insertions(+)
> 

