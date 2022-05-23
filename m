Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9F0530EB4
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 14:46:45 +0200 (CEST)
Received: from localhost ([::1]:43914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nt7SO-0001Ug-DP
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 08:46:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nt7OA-0007PX-3x
 for qemu-devel@nongnu.org; Mon, 23 May 2022 08:42:25 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b]:46840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nt7O7-0007IG-WF
 for qemu-devel@nongnu.org; Mon, 23 May 2022 08:42:21 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-2ff39b44b06so146067367b3.13
 for <qemu-devel@nongnu.org>; Mon, 23 May 2022 05:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9vNVEQc0nCj7nPii/Dx4xG1ceszdnfexhgL/+4+T0Cg=;
 b=grcA9NI7TkytW+vcYCjDO5jmDSIvqJRz0OwhkIQoZmxye8LD0hDp0l/gMwPnN1+22y
 6r6m24W8fUU1xKUCgYxpWMnqdZsJkxm9W5zpZh0Btrzb5/LFQLsGVaWy/K2i2tmJOsUO
 u6cUrCEoATDPCwLOe5ksHh+NAxdK7bOHt73xCzroIHQNfbacAcpdm1SVQGdSlQkmZGqR
 2StsUVEVglYA74g9MBxE3s7IXpvzCL+u0A+ig3RJxtikh9oDFVlrSkRmu/NkVldR3QZT
 mwbBQCsdzp7zlS2QhUwQCq53/giw6CwGqyhGqPwAVvQtiQxxfHt3yVjYp2JdCOAxEVTK
 nmsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9vNVEQc0nCj7nPii/Dx4xG1ceszdnfexhgL/+4+T0Cg=;
 b=rVygEIZEACejqrrjTVSFSfpBvZbJ/JMXWTq7dodazMp40MBRzvOf5fI33sap5XC6JY
 R83/j0E8+oCzw9zdWZ3qkocTSHQ33iKcjlssczSLQPx66XAH6m4UO7Op6wizIgcLmg7v
 r4bNv6q+4u/9lbaXhwq/SZJmAs7SEkECzmt8QBoDILyTiNEx3yTHpJSN7B/mJ1WcXoOL
 JY4DoOqczTbfQEr5yOOD9D3LMW++N3Q0AMOyEObA773s3yZJ2tQf29mOtjQ9Fh+8VaY8
 WIh88xqeTiJpZ1dle3ZfJDIb9M9PCzSt2syuKbfnHOg7GSnI6E8qgdGNp3PMu4LIj8Xk
 givw==
X-Gm-Message-State: AOAM533c5HV3YJnE3zUNCCznf0JeOPMwqxJa8m8hYoqRf2vaHN6KnUqo
 duJ9AmPLmX9FgBqzJCt/fNNr2bnqEZLmwpBF1m5d1A==
X-Google-Smtp-Source: ABdhPJwJNlGWU7Towx0tcfsYQKtePdNXhJbaYAZnxSH3hx6aUVZMXGAXLX3FFQ/xCFXkrY/9JL+wvfZnZNgJyFJAOu4=
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr23712923ywb.257.1653309738950; Mon, 23
 May 2022 05:42:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220521000400.454525-1-richard.henderson@linaro.org>
 <20220521000400.454525-16-richard.henderson@linaro.org>
In-Reply-To: <20220521000400.454525-16-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 May 2022 13:42:07 +0100
Message-ID: <CAFEAcA_-buWN+81qph23t=8jzitJBRH+d+w8KpWQ2R2doM1aKw@mail.gmail.com>
Subject: Re: [PATCH v3 15/49] include/exec: Move gdb_stat and gdb_timeval to
 gdbstub.h
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Sat, 21 May 2022 at 01:04, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We have two copies of these structures, and require them
> in semihosting/ going forward.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/exec/gdbstub.h    | 25 +++++++++++++++++++++++++
>  target/m68k/m68k-semi.c   | 30 +++---------------------------
>  target/nios2/nios2-semi.c | 30 +++---------------------------
>  3 files changed, 31 insertions(+), 54 deletions(-)
>
> diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
> index 2aaba9c723..33a262a5a3 100644
> --- a/include/exec/gdbstub.h
> +++ b/include/exec/gdbstub.h
> @@ -20,6 +20,31 @@
>  #define GDB_O_TRUNC   0x400
>  #define GDB_O_EXCL    0x800
>
> +/* For gdb file i/o stat/fstat. */
> +typedef uint32_t gdb_mode_t;
> +typedef uint32_t gdb_time_t;
> +
> +struct gdb_stat {
> +  uint32_t    gdb_st_dev;     /* device */
> +  uint32_t    gdb_st_ino;     /* inode */
> +  gdb_mode_t  gdb_st_mode;    /* protection */
> +  uint32_t    gdb_st_nlink;   /* number of hard links */
> +  uint32_t    gdb_st_uid;     /* user ID of owner */
> +  uint32_t    gdb_st_gid;     /* group ID of owner */
> +  uint32_t    gdb_st_rdev;    /* device type (if inode device) */
> +  uint64_t    gdb_st_size;    /* total size, in bytes */
> +  uint64_t    gdb_st_blksize; /* blocksize for filesystem I/O */
> +  uint64_t    gdb_st_blocks;  /* number of blocks allocated */
> +  gdb_time_t  gdb_st_atime;   /* time of last access */
> +  gdb_time_t  gdb_st_mtime;   /* time of last modification */
> +  gdb_time_t  gdb_st_ctime;   /* time of last change */
> +} QEMU_PACKED;
> +
> +struct gdb_timeval {
> +  gdb_time_t tv_sec;  /* second */
> +  uint64_t tv_usec;   /* microsecond */
> +} QEMU_PACKED;

As an aside,
https://sourceware.org/gdb/onlinedocs/gdb/struct-timeval.html#struct-timeval
says "this structure is of size 8 bytes", but looking at the gdb sources
our definition here is correct and it's 12 bytes (not 8 as the text says
and not 16 as you might expect from the C struct in the docs...)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

