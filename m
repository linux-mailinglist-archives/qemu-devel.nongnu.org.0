Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0819648EDBA
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 17:12:00 +0100 (CET)
Received: from localhost ([::1]:56728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8PBH-0000Iv-50
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 11:11:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n8OxA-0007Ut-Ov
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 10:57:24 -0500
Received: from [2607:f8b0:4864:20::52b] (port=45971
 helo=mail-pg1-x52b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n8Ox8-0003PI-2X
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 10:57:24 -0500
Received: by mail-pg1-x52b.google.com with SMTP id c5so3094404pgk.12
 for <qemu-devel@nongnu.org>; Fri, 14 Jan 2022 07:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KopI6fz65Ngv2Ma/cjiyXYOU6yoroONXAtQgEmwRV/0=;
 b=Lp7+hInosaJ1a8jsfdVoaDUl/QUuEKLHI61NG09Scsp8hbRqolOJ/Ys9KEhDffno4F
 AqVTKhZTWsVmoiixpFqQhNjIBeVZARFRptkGT1BfVPF8HOyUgQVpEwaDexX99XMukV/n
 068Hf3doBbwpCq39ZG2sdcUJ69wcjlplyHhFv4V3Rlywx6q3X2c/M19hl/iCbpU7TuPe
 1utOUzeDXeurhn22Bsp3QXnMZZ7C+6MMUJzrw9Stf8DiyvH9L+gq5iIOF7AvHuNcVHcq
 GS+GqUNc9GTwEhkWSGA64raf5sujSUHVGR9dH2c0wj2wtymmMYX4EJ6tHwaG+1RdLc6w
 mj8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KopI6fz65Ngv2Ma/cjiyXYOU6yoroONXAtQgEmwRV/0=;
 b=aNHi/aQ5DF8aEHcCCd54lkiJVcsuq6DIobbcBg7U/4mq8p3sIQEmNN1yBL9BH7iwd0
 x5WbOADmWks06TegXVJq7+4aFMbzG1XMM8qRthoioSP3p16FICWeQpCSjYrYQaVyTboH
 BGzeaGmZdhBOZdrGsrDrHGYDmgPaGvUxDN6UtMg5z4o0UKz+fPbzY5CYFmnJdhpm1Alp
 QafqAZSj9kn8wjJFyyc0eb8amrW1IeLPlq6nT1YmcwKzY2L/GZUq0fUSnJ69Va2FbBt0
 mkOOM/jrOUj119wT48a11xs0VVGCcES220fWMArFhIC5NfENuc6S4pLALzDEWRx+Hm38
 iaig==
X-Gm-Message-State: AOAM533M/Nb7DgRl164EmHW4cc2fW2VpndH4Ke3zZE8DjT73FWLmhmvC
 ZqkXoPIzYxxyNVUl1zca0WM=
X-Google-Smtp-Source: ABdhPJyDUDBYloCawd6Xqp2sNo90nZkZ1xAye38MihDbIaATfMzVt19OJ+x6TFdWGk2FiSjw2aYS8A==
X-Received: by 2002:aa7:93ba:0:b0:4bd:bbca:1936 with SMTP id
 x26-20020aa793ba000000b004bdbbca1936mr9455611pff.43.1642175840624; 
 Fri, 14 Jan 2022 07:57:20 -0800 (PST)
Received: from ?IPV6:2a01:e34:ec40:49e0:48b5:8fce:b44b:d951?
 ([2a01:e34:ec40:49e0:48b5:8fce:b44b:d951])
 by smtp.gmail.com with ESMTPSA id g6sm4956566pgk.37.2022.01.14.07.57.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jan 2022 07:57:20 -0800 (PST)
Message-ID: <9443a027-b1bf-4b39-fd89-6da7a0781d99@amsat.org>
Date: Fri, 14 Jan 2022 16:57:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH 3/3] linux-user: Return void from queue_signal()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>
References: <20220114153732.3767229-1-peter.maydell@linaro.org>
 <20220114153732.3767229-4-peter.maydell@linaro.org>
In-Reply-To: <20220114153732.3767229-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 14/1/22 16:37, Peter Maydell wrote:
> The linux-user queue_signal() function always returns 1, and none of
> its callers check the return value.  Give it a void return type
> instead.
> 
> The return value is a leftover from the old pre-2016 linux-user
> signal handling code, which really did have a queue of signals and so
> might return a failure indication if too many signals were queued at
> once.  The current design avoids having to ever have more than one
> signal queued via queue_signal() at once, so it can never fail.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   linux-user/signal-common.h | 4 ++--
>   linux-user/signal.c        | 5 ++---
>   2 files changed, 4 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

