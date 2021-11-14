Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4973744FBC3
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Nov 2021 22:19:41 +0100 (CET)
Received: from localhost ([::1]:37880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmMua-00024I-BV
	for lists+qemu-devel@lfdr.de; Sun, 14 Nov 2021 16:19:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mmMte-0001Pm-PJ
 for qemu-devel@nongnu.org; Sun, 14 Nov 2021 16:18:42 -0500
Received: from [2a00:1450:4864:20::32d] (port=41623
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mmMtd-00068E-6U
 for qemu-devel@nongnu.org; Sun, 14 Nov 2021 16:18:42 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 f7-20020a1c1f07000000b0032ee11917ceso10913299wmf.0
 for <qemu-devel@nongnu.org>; Sun, 14 Nov 2021 13:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vNbzEe6cAJnzzbVXF7ll3/ofD/0BYBYDN22JkApOs8U=;
 b=a5zluHSsA3ivBVCS8q7sPIs82YfLF0He75mvJNnBuZZ5XNAetwvRnADFIbF8FRD9+9
 EeBaLXtvOoXVECLyt1QxRthN9eKfC8eKdkheGoKesqI8LTarCNyuGckRsewjhaoRQ/vV
 2+2Z6n/6Mz9pnuHqQXSMviy9Xk+CujG/+Zpb3VLPkz2Hku4aWdw2NJzrb2J/1vhl6DR+
 XjcoVPs7V8cPOmHyXlgM8PuNybOmSXaecjyb63P6K8oVyh8YyHFbC5HKmEOy6ZYeNrUO
 61iGGRQuiaphi/KS+ovjp8O6OSdzpE+x+SZTk/8Wnh/ebJ+agHVRozLVxOd6I010hx4b
 lktw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vNbzEe6cAJnzzbVXF7ll3/ofD/0BYBYDN22JkApOs8U=;
 b=cJIO5eEv+HeQAU8hBhQPiU/2xoqardEMtOddxi//6zSlgkNbGpCoJsgCoeS0/f9Qp0
 RnUqHhRHVjeuT1zc9n4M5v9mWr6xHGAWmFAfcta1x/r4FjtcfKiTlsTF8KpejXFkP7K1
 rXoA+j9wuhq1i8yPOwrfSp8h1TH0MshpLXZ0MeACgUKGmZnM6GyhXMN+a5w3xSxhvcQo
 vThPzvXLAxQfqY7bs13zWPUzgqPEV8TAuHP32V9MQ6zCwoq21oSKlkFuVChrw0/N0fwX
 r42AuF+HhJH1TfsUV7AN3L0lNHutMo71jBdeJ+iQUlaoaNpl32hzOAWnyvQT/ee7EgLG
 563A==
X-Gm-Message-State: AOAM5304Le86hHqKkZ7e+VXz942L/iYukMGz3DQEQ1mqVuVfne4x/X1T
 oYuzEw1nKkSxTzcsl9fNadQ=
X-Google-Smtp-Source: ABdhPJzIzOdREj+fa/Jw4JsSFbJri3mGbTj5stkORkwDh3oj2ru4M9KVu/P6ErarQY1vwInz/a65fA==
X-Received: by 2002:a7b:c005:: with SMTP id c5mr55500365wmb.155.1636924719644; 
 Sun, 14 Nov 2021 13:18:39 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id h1sm12109661wmb.7.2021.11.14.13.18.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Nov 2021 13:18:38 -0800 (PST)
Message-ID: <041b98ac-2c75-2969-fdaa-9e4552220bdb@amsat.org>
Date: Sun, 14 Nov 2021 22:18:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 4/4] linux-user: Rewrite do_getdents, do_getdents64
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211114103539.298686-1-richard.henderson@linaro.org>
 <20211114103539.298686-5-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211114103539.298686-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-3.402,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 11/14/21 11:35, Richard Henderson wrote:
> Always allocate host storage; this ensures that the struct
> is sufficiently aligned for the host.  Merge the three host
> implementations of getdents via a few ifdefs.  Utilize the
> same method for do_getdents64.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/704
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/syscall.c | 259 ++++++++++++++++++++-----------------------
>  1 file changed, 121 insertions(+), 138 deletions(-)

> +        namelen = strlen(hde->d_name);
> +        hreclen = hde->d_reclen;
> +        treclen = offsetof(struct target_dirent, d_name) + namelen + 2;
> +        treclen = QEMU_ALIGN_UP(treclen, __alignof(struct target_dirent));
> +
> +        if (toff + treclen > count) {
> +            /*
> +             * If the host struct is smaller than the target struct, or
> +             * requires less alignment and thus packs into less space,
> +             * then the host can return more entries than we can pass
> +             * on to the guest.
> +             */
> +            if (toff == 0) {
> +                toff = -TARGET_EINVAL; /* result buffer is too small */
>                  break;
>              }
[...]
>              /*
> -             * The target_dirent type is in what was formerly a padding
> -             * byte at the end of the structure:
> +             * Return what we have, resetting the file pointer to the
> +             * location of the first record not returned.
>               */
> +            lseek64(dirfd, prev_diroff, SEEK_SET);
> +            break;
>          }

LGTM,
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

