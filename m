Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C05D138FC02
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 09:52:57 +0200 (CEST)
Received: from localhost ([::1]:56444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llRs0-0003If-P3
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 03:52:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1llRpZ-0007yn-P6; Tue, 25 May 2021 03:50:25 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:42622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1llRpX-0001NQ-Ge; Tue, 25 May 2021 03:50:25 -0400
Received: by mail-wr1-x431.google.com with SMTP id x8so31072238wrq.9;
 Tue, 25 May 2021 00:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nmYc2Dsu/mtV3yTQgka/32ZwE/VTW1KZABPuzSnyZMQ=;
 b=blkvdk3iwgArzoviEtxC2kfISeONTi6jiYJV/lSv6VfIP0puBz4DnARtKYqQ8uEEvb
 /2cIWoHxGd8FNllnr73H/ijdTGVIqU5PE5ApV+54su44YhpcD6D34csWN4JBJ2/11DyR
 uKIiy2iIvcvkb0UZo8Ce3GIL5h0OLttj0GLbZaZdCy/2Oo3puPXPJqX7Oo7ekILZ8PSY
 4aOIIeq2TTyTRBhrGdj9yTEvlZuDUr6e4D/FhMt1Gpdq3ZI25PNwnKLR5b5v4tp7ZHUj
 iCELaDIFjv87ClqHZozIj3d8rRrkyludKOQkNbPhxjzvQhFHLKg9AS7tKc236vsD5yZ6
 AR+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nmYc2Dsu/mtV3yTQgka/32ZwE/VTW1KZABPuzSnyZMQ=;
 b=n0Vh66ePWZ5STadz2C1nlF33iXm1Qrnpplb+JFqHkEeQ02CEcxkELI3vShjiIl1P76
 YQ23JN+Z6xgheunh0/Sa3nFTRfxAhCl6iNIs1/Ud6ZohuKIMMOmrIP37/fum9Fgs5K8x
 ZixvoQZ97sGdflxxwQysUzwAcfFf2arUII5ibZnrzTmf+MeEG59BHem8MqA5Wcm0pQoX
 WyzExfKjzwaNcq/rdhe3U1UF5bzzVJ6AXI71p/ajn9To0QCJW6tBoMJs/4p+6yp82r9d
 nCrbkGQ/Cui1vW6OHSEEd8+bXdjT3MXeYD3tewqZD6EhwOJ8ZtOyU33cTQAEIL+x5zha
 g74g==
X-Gm-Message-State: AOAM530miwpxW323iwA11xL9Q9ghPdHzFtAQzPMq2DTaKcsaYrhM6aBX
 Lk20hSzKi0RhaQ48rDPDGrw=
X-Google-Smtp-Source: ABdhPJy/FOMCiHqFnHbRfPVIBo0jV6hrqdb5cjBdkj1JxK20Hrtoe69rBp0VqSWGLmf8uO1mSDUfBA==
X-Received: by 2002:a5d:4b89:: with SMTP id b9mr25731994wrt.238.1621929021867; 
 Tue, 25 May 2021 00:50:21 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id z6sm10356276wml.29.2021.05.25.00.50.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 May 2021 00:50:21 -0700 (PDT)
Subject: Re: [PATCH v2] linux-user/syscall: Constify bitmask_transtbl
 fcntl/mmap flags_tlb[]
To: qemu-devel@nongnu.org
References: <20210517055243.830491-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <813aac72-1f3f-72ad-8be9-6c532a089022@amsat.org>
Date: Tue, 25 May 2021 09:50:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210517055243.830491-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: qemu-trivial@nongnu.org, Bin Meng <bmeng.cn@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping? (patch reviewed)

On 5/17/21 7:52 AM, Philippe Mathieu-Daudé wrote:
> Keep bitmask_transtbl in .rodata by marking the arrays const.
> 
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  linux-user/syscall.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 95d79ddc437..64f486743a9 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -365,7 +365,7 @@ _syscall5(int, sys_statx, int, dirfd, const char *, pathname, int, flags,
>  _syscall2(int, membarrier, int, cmd, int, flags)
>  #endif
>  
> -static bitmask_transtbl fcntl_flags_tbl[] = {
> +static const bitmask_transtbl fcntl_flags_tbl[] = {
>    { TARGET_O_ACCMODE,   TARGET_O_WRONLY,    O_ACCMODE,   O_WRONLY,    },
>    { TARGET_O_ACCMODE,   TARGET_O_RDWR,      O_ACCMODE,   O_RDWR,      },
>    { TARGET_O_CREAT,     TARGET_O_CREAT,     O_CREAT,     O_CREAT,     },
> @@ -6062,7 +6062,7 @@ static const StructEntry struct_termios_def = {
>      .print = print_termios,
>  };
>  
> -static bitmask_transtbl mmap_flags_tbl[] = {
> +static const bitmask_transtbl mmap_flags_tbl[] = {
>      { TARGET_MAP_SHARED, TARGET_MAP_SHARED, MAP_SHARED, MAP_SHARED },
>      { TARGET_MAP_PRIVATE, TARGET_MAP_PRIVATE, MAP_PRIVATE, MAP_PRIVATE },
>      { TARGET_MAP_FIXED, TARGET_MAP_FIXED, MAP_FIXED, MAP_FIXED },
> 

