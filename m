Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5751665FBF5
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 08:31:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDhAm-0008GT-6d; Fri, 06 Jan 2023 02:29:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDhAg-0008GE-9p
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 02:29:46 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDhAd-0001NC-Ft
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 02:29:45 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 z8-20020a05600c220800b003d33b0bda11so3456445wml.0
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 23:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=a8h5sTvpg2TYYOwCbG+VhZl+p1rj+hPO8s66Vk6T5lM=;
 b=thv/GTd+4MrGRi6mW+jhUvnaa6gNK3vzrT8SVvGHbAQthNUwY+Hj2fqQVrBMLhKRij
 5lW+maPbvXL2RZprDSG5PPPebCm3RbZzB4hZk7Yre4VmDvzqpe8sKLAI8bw1NAzqePim
 cpSiZvuiwCsQHDKts2e7TNqcOg+HdTZWUx66XHrfrS85xKDPEXXeCQDqacLgErMBRR0s
 SJbsuo/EINbs0SvtZnsbfHB+eN6FXFEpKZ4Wn2HYAPCzvX5QeN/Sxj0j2ZImk1IVLBP9
 pZ7kwgLeI3p8RJoRrD2Ixc1z19OMdsnVqVxnp7vo4TWwiMfgW+/V0IHQaOmg/kMD2AME
 iE6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=a8h5sTvpg2TYYOwCbG+VhZl+p1rj+hPO8s66Vk6T5lM=;
 b=JlSw2pdpqpQpb7pucPb9kBeK7EP1RC1Sk+anfHgOXcoU/oObPS2/QeBGAilXahC7bk
 M3VOxFzh4aEmglfoqFwzdjHRzzERKLsPGEEiJNtHDJiyoDWl3oe+qFEtte3iMzGvvniW
 Z8xAO8NavHeflejZVn/iERAb53w41q1ZdfVyjqK8WCIqjK4BOWa8Z0ri+FQqysijcq0L
 l2yRlu9nvk7ri8BitMfORAbjSUtb2Y5iwgEUwsmUFXRxo6Bfy4VQ2OSiPUEpPuNmUmCQ
 1KHt+gTUnUiikPe2zV7i1opX5Jra4GIgnHHJ4McL3oXQPGTn7T1MEFIF8QD0HOGWZSR4
 ZayQ==
X-Gm-Message-State: AFqh2krAQcwZyJx9X57+9swfyleoHWqPXGBWCqnRTdSy1T5+wVkleHbm
 ew55rh0kDS1dNtkN6FB2ZCkPnQ==
X-Google-Smtp-Source: AMrXdXuvYf8A2M/2FLqi1lht71nUPfky8B8Ga3fkN+kfUeuT/Q7KYH1WG5SqHGpzfsPsDDS8ZqVvvg==
X-Received: by 2002:a05:600c:358a:b0:3cf:8d51:1622 with SMTP id
 p10-20020a05600c358a00b003cf8d511622mr38927044wmq.1.1672990180415; 
 Thu, 05 Jan 2023 23:29:40 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 t18-20020a5d6a52000000b0029c5e06516bsm388397wrw.14.2023.01.05.23.29.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jan 2023 23:29:40 -0800 (PST)
Message-ID: <408a6546-025b-1a94-ee98-a577b8460e13@linaro.org>
Date: Fri, 6 Jan 2023 08:29:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] semihosting: add O_BINARY flag in host_open for NT
 compatibility
Content-Language: en-US
To: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>, qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
References: <20230105211940.14988-1-eiakovlev@linux.microsoft.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230105211940.14988-1-eiakovlev@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.939,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 5/1/23 22:19, Evgeny Iakovlev wrote:
> Windows open(2) implementations opens files in text mode by default and
> needs a Windows-only O_BINARY flag to open files as binary. Qemu already

s/Qemu/QEMU/

> knows about that flag in osdep.h, so we can just add it to the
> host_flags for better compatibility when running qemu on Windows.

s/qemu/QEMU/

> Signed-off-by: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
> ---
>   semihosting/syscalls.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/semihosting/syscalls.c b/semihosting/syscalls.c
> index 508a0ad88c..00f77507e5 100644
> --- a/semihosting/syscalls.c
> +++ b/semihosting/syscalls.c
> @@ -278,6 +278,8 @@ static void host_open(CPUState *cs, gdb_syscall_complete_cb complete,
>           host_flags |= O_EXCL;
>       }
>   
> +    host_flags |= O_BINARY;
> +
>       ret = open(p, host_flags, mode);
>       if (ret < 0) {
>           complete(cs, -1, errno);

Alternatively with more churn:

-- >8 --
diff --git a/semihosting/syscalls.c b/semihosting/syscalls.c
index 508a0ad88c..b621d78c2d 100644
--- a/semihosting/syscalls.c
+++ b/semihosting/syscalls.c
@@ -253,7 +253,7 @@ static void host_open(CPUState *cs, 
gdb_syscall_complete_cb complete,
  {
      CPUArchState *env G_GNUC_UNUSED = cs->env_ptr;
      char *p;
-    int ret, host_flags;
+    int ret, host_flags = O_BINARY;

      ret = validate_lock_user_string(&p, cs, fname, fname_len);
      if (ret < 0) {
@@ -262,11 +262,11 @@ static void host_open(CPUState *cs, 
gdb_syscall_complete_cb complete,
      }

      if (gdb_flags & GDB_O_WRONLY) {
-        host_flags = O_WRONLY;
+        host_flags |= O_WRONLY;
      } else if (gdb_flags & GDB_O_RDWR) {
-        host_flags = O_RDWR;
+        host_flags |= O_RDWR;
      } else {
-        host_flags = O_RDONLY;
+        host_flags |= O_RDONLY;
      }
      if (gdb_flags & GDB_O_CREAT) {
          host_flags |= O_CREAT;
---

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


