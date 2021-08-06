Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C7D3E3090
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 22:52:51 +0200 (CEST)
Received: from localhost ([::1]:60212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC6pm-0007do-AB
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 16:52:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mC6on-0006uu-A0
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 16:51:49 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:38486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mC6ol-00077v-To
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 16:51:49 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 i10-20020a05600c354ab029025a0f317abfso9816472wmq.3
 for <qemu-devel@nongnu.org>; Fri, 06 Aug 2021 13:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wlnvU07bgDZpDxLjnaob/1Zn1b1JdDpMQIf9v0uLEKM=;
 b=WIUOSkhLr4WaPlvs6H1GCs3g2ko/CG5BsQW8NA3F78XLnRnAD826vjOdROY4s+nyVQ
 FRbyNetIFfefPAwFZoXOVlKcV5cTROC+j4dLI/+uCzwbM/lvOo/qwFKHLLE3z+Vf7UMD
 KLOgVAzgmw/Mhha+/j/CH0vvlMe4VX9l42izRVSlmInjLbGfpOi1CTXaxfs2K+fbQsrO
 Z8rlDKI8mWjGCENhi26Ja7T56cKRBP0BCpBabSxzhurMKHFrJmOPTv2l6Ss676OKex3G
 aC1yHd3qyc+DYYIF6hCjaMEXYipSDEY6bodjBpAdm+0hKwIDLBdVqN1B7Nyf+iBQ/fwQ
 5m+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wlnvU07bgDZpDxLjnaob/1Zn1b1JdDpMQIf9v0uLEKM=;
 b=IBO9BF/HF+SFxhPGiF7z0ofEU0tKby5HeoOLaXf6qQOv6oUEVyJRtxpeVJ/yCVU5fi
 VUR0SfLxqHX2Rqe/grotqJCDh0tK1C4gMC4f7auNly4SR+rgcfSd0aFv3eEka08XNEA2
 REhydTa9ZqVuxkYeb0WknfkxXdAoXcG0AVQnOkiZaV41xMsuxpQyRiayy7dJn1OPXyXN
 mK47KwwP9/UcG4ldj5t3DMwMhlzt0cFNjR0GpsI0Ti/JNNKMURe3xd+rQ8qntesWqI5M
 cMoRKXmmBzi5ejfvO5QQwHUWfC43KfqLwIuwZsvFnA+349wbP+ko0KY6oFI/uX8189Yq
 GpLA==
X-Gm-Message-State: AOAM532LDqp7U7LC8PmA9hvvfZGEH9OCrfbPzsV7/EVU6UZlVcXJOHMj
 bcShQlhmLbPU3qOxYva9OuU=
X-Google-Smtp-Source: ABdhPJwRemxzGddQXnTs+1HUgTPkr3bw04UKLHdZDMs+ryV3i0ufiBDM2sH8glGuMo787SNcW5OjXg==
X-Received: by 2002:a05:600c:3653:: with SMTP id
 y19mr5138050wmq.147.1628283106422; 
 Fri, 06 Aug 2021 13:51:46 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id c15sm10631544wrx.70.2021.08.06.13.51.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Aug 2021 13:51:45 -0700 (PDT)
Subject: Re: [PATCH-for-6.2 0/4] target/mips: Decodetree housekeeping
To: qemu-devel@nongnu.org
References: <20210801234202.3167676-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <564e25f3-6dd4-6a46-b4c2-ddf871be8b55@amsat.org>
Date: Fri, 6 Aug 2021 22:51:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210801234202.3167676-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.619,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/2/21 1:41 AM, Philippe Mathieu-Daudé wrote:
> Minor cleanups while looking at converting more opcodes to decodetree.
> 
> Philippe Mathieu-Daudé (4):
>   target/mips: Simpify PREF opcode
>   target/mips: Decode vendor extensions before MIPS ISAs
>   target/mips: Merge 32-bit/64-bit release6 decodetree definitions
>   target/mips: Rename 'rtype' as 'r'

Thanks, series applied to mips-next tree.

