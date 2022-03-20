Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3A64E1E08
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Mar 2022 22:52:56 +0100 (CET)
Received: from localhost ([::1]:55650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nW3Tr-0007WI-FA
	for lists+qemu-devel@lfdr.de; Sun, 20 Mar 2022 17:52:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nW3S1-0006i8-Cj
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 17:51:01 -0400
Received: from [2a00:1450:4864:20::42e] (port=36825
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nW3Rz-0006Tl-Sd
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 17:51:01 -0400
Received: by mail-wr1-x42e.google.com with SMTP id r10so18473051wrp.3
 for <qemu-devel@nongnu.org>; Sun, 20 Mar 2022 14:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=PM+NyHkhdHQ2R7xYVUJcAaVQCZBBFZu/djxWuwfuXUQ=;
 b=G7qA39Ats2bAOZdf+JV7LV0HXvY1p4ojVcre1UygjkRUvXGdua/BGSLRvG7ulXQJeZ
 qspIV2WrJC4BWFWSJxP0Q5dP/KqebmvQE8tBUkcpy2bYH6RjuVJcfcWs0mNGHreG0i5Y
 ecDkbWw8elw0CJND4UFe33hV+09AXjMb3eZADwS+FRCuF43voRwVcYx2r7CTFvX3FsRL
 JvyuDwBIOVZOCvBDY6TokDfpi4sraXu6/usPzPLhpCZO2QzY9BF1QyiW9NPuN1x4xbhj
 xNCVpsvJVnYRh5ErN2kFIZh0HI0CS+F3KIVLbliEN6F3/CTXoYCraAj67/vJIzwrPGlf
 kdKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PM+NyHkhdHQ2R7xYVUJcAaVQCZBBFZu/djxWuwfuXUQ=;
 b=O7tAaGG6f78KLRMbtKzRsHmz/K45zmpGH6HYxcbC8mluAa+narSXYQP81/cQU3e+hT
 QJNRtOVukwEp7GqDrY8NnnnKRh2sy+qMhWEccbMOIpytFsT3Ap6wP4LorE+vNv1xjKlH
 qssFPUVnAWe2aYraIlhbi/qRQzZ8OAWi7T/+L6zl5E08jxr3uRO2T9qVeVGasAonzh41
 APb9WOCIVt5AGDsqnN5d+Mhu74+JEyD5jUTwTzZTX9NcJG+/JVjcYto0q+nQrGy8ecRA
 Y6c/k9x/ZVxiS9Jc5Of77yxfnqBzwfhG4tGYQrGIgHNWWrrk/BegSanh/ijYx0PPt+0L
 /mNA==
X-Gm-Message-State: AOAM5304U9NY/j5r3vGm8tsY5VDFsRSZQICcg1NnYzLsbnsK0P3h2Pz+
 14Oy8syUqi4Ic6NcmLy8mvznbeWmUHjtCQ==
X-Google-Smtp-Source: ABdhPJwoeURue6tccqDY3/vy/MXqGH8Uvr/AQVhfspJRCbXxmDkw5O4yOBpyBWHSZcpdWU2UU5/IHQ==
X-Received: by 2002:a5d:518e:0:b0:204:5a3:763d with SMTP id
 k14-20020a5d518e000000b0020405a3763dmr4959228wrv.360.1647813058278; 
 Sun, 20 Mar 2022 14:50:58 -0700 (PDT)
Received: from [192.168.1.34] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71]) by smtp.gmail.com with ESMTPSA id
 p12-20020a5d48cc000000b001e6114938a8sm11743524wrs.56.2022.03.20.14.50.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 20 Mar 2022 14:50:57 -0700 (PDT)
Message-ID: <a4939a58-e51c-430f-9f3d-15a9f57b25d0@gmail.com>
Date: Sun, 20 Mar 2022 22:50:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PULL for-7.1 03/36] util/log: Pass Error pointer to qemu_set_log
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220320171135.2704502-1-richard.henderson@linaro.org>
 <20220320171135.2704502-4-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220320171135.2704502-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/3/22 18:11, Richard Henderson wrote:
> Do not force exit within qemu_set_log.  Pass an Error
> value back up the stack as per usual.

"Pass an Error value back up the stack [and return a boolean
value] as per usual.", see:

https://lore.kernel.org/qemu-devel/87bky6ugmx.fsf@pond.sub.org/

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/qemu/log.h                   |  2 +-
>   bsd-user/main.c                      |  2 +-
>   linux-user/main.c                    |  2 +-
>   monitor/misc.c                       |  7 ++++++-
>   qemu-img.c                           |  2 +-
>   qemu-io.c                            |  2 +-
>   qemu-nbd.c                           |  2 +-
>   scsi/qemu-pr-helper.c                |  2 +-
>   softmmu/vl.c                         |  4 ++--
>   storage-daemon/qemu-storage-daemon.c |  2 +-
>   tests/unit/test-logging.c            |  2 +-
>   util/log.c                           | 10 +++++-----
>   12 files changed, 22 insertions(+), 17 deletions(-)
> 
> diff --git a/include/qemu/log.h b/include/qemu/log.h
> index 08b0cd0bb3..64f28785ae 100644
> --- a/include/qemu/log.h
> +++ b/include/qemu/log.h
> @@ -147,7 +147,7 @@ typedef struct QEMULogItem {
>   
>   extern const QEMULogItem qemu_log_items[];
>   
> -void qemu_set_log(int log_flags);
> +void qemu_set_log(int log_flags, Error **errp);

