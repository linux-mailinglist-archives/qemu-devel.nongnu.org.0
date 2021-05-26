Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B563391E40
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 19:39:08 +0200 (CEST)
Received: from localhost ([::1]:52828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llxUo-0003Ku-Lu
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 13:39:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1llx96-0004JD-3F
 for qemu-devel@nongnu.org; Wed, 26 May 2021 13:16:40 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:37886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1llx93-0001Fl-LB
 for qemu-devel@nongnu.org; Wed, 26 May 2021 13:16:39 -0400
Received: by mail-wr1-x42c.google.com with SMTP id q5so1931896wrs.4
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 10:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ho3LJnmnOHM5/daeNt5QxujvlDMrZ3nfbyIVITlBS5o=;
 b=DUMwj5yc1fMKMkR4HsjJcBfr4M5hJKBIIZ3jvhZF0vqFoMqFNpi/A+kJDZnuuVM7t/
 FmYZNwigS7kAT1caXDv47CuekCJhp2ZCA6CSNXB/3ncctaaneU0u1vDxX6ezjXB8Rk05
 v5zVuD9qx4b4wwDLCFtTXRv9JRybYYOSkXZGqN2W+IMkEQuHW7wceIRPXwr+48x3IRWq
 fMjsUCVskda3VWsgBjJuvh8mfGQVMSrUSO5hvYyhbI8bqraYm6FxvBYJjvoL/cDSYUJT
 IoYnBxMBXZy61h2xEnwc00aYb5+UtxPVApuqdj9rbKlaxo811fks6zlr6xz9lpr1xYsL
 GcYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ho3LJnmnOHM5/daeNt5QxujvlDMrZ3nfbyIVITlBS5o=;
 b=OS7qeXX4+te02O3urdgRkyTB1IqVtOI4Se1lhUApW50afDk/f01w70iVbuGsNXvso2
 NY7di2iiyBpb0BPDTfVKdZ6zOc/tGpEMmxBbOlnyL9TdhrFFEomU5D3q/GaF+AMiVd6T
 GxYr9q+EjI10ds805YxK98pT9bg7VvASj9l06vyWQfKXKTcTY1pIQrezTD739KCRizph
 2xkU1WPq3d/w0iI4WtZXrTo2BJ/etxVkvO/DVd+oPHKAIt66FpyFdJc/EJhje4vOD0Df
 sXDdnG0O6vbhM5lfj2Zv4Vo8FWvX6on49YPIYpI314k9kMc2V5x2YVaXVOi9pBIu14mr
 t88g==
X-Gm-Message-State: AOAM530C4M7Fwc2DHTaCYzjjuamkgLb98frkHxjo87gP4uCu3w03ukjC
 AO/QpE+zlvsVGGJ1kRYuGpjKTi0Tvafgwg==
X-Google-Smtp-Source: ABdhPJwzjHNm6H8LppQei5H5VcNuaL92ciPRNU2qWtIVsZ6MU45nd2hGYQR+fuP9ZrmcUSGVqQ6khw==
X-Received: by 2002:adf:e58c:: with SMTP id l12mr33757780wrm.133.1622049395357; 
 Wed, 26 May 2021 10:16:35 -0700 (PDT)
Received: from [192.168.1.36] (64.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.64])
 by smtp.gmail.com with ESMTPSA id d9sm20532899wrx.11.2021.05.26.10.16.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 May 2021 10:16:34 -0700 (PDT)
Subject: Re: [PATCH] linux-user: Remove unnecessary static assert involving
 __SIGRTMAX
To: Michael Forney <mforney@mforney.org>, Laurent Vivier <laurent@vivier.eu>
References: <20210526043928.9586-1-mforney@mforney.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <502221eb-cc9f-ca58-2864-91aaa07006ba@amsat.org>
Date: Wed, 26 May 2021 19:16:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210526043928.9586-1-mforney@mforney.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/26/21 6:39 AM, Michael Forney wrote:
> Since "linux-user: fix use of SIGRTMIN" (6bc024e7), qemu removed
> use of __SIGRTMAX except for in this QEMU_BUILD_BUG_ON assert.
> Presumably, this check is to ensure that the loop in signal_table_init
> from SIGRTMIN to SIGRTMAX falls within the bounds of
> host_to_target_signal_table (_NSIG).
> 
> However, _NSIG is already defined to be the one larger than the
> largest signal supported by the system (as specified in the upcoming
> POSIX revision[0]), so the check is unnecessary.
> 
> musl libc does not define __SIGRTMAX, so removing this check fixes
> one of the last remaining errors when building qemu.
> 
> [0] https://www.austingroupbugs.net/view.php?id=741
> 
> Signed-off-by: Michael Forney <mforney@mforney.org>
> ---
> If you prefer, I can send an alternate patch to leave the
> QEMU_BUILD_BUG_ON, but guard it by #ifdef __SIGRTMAX.

This looks safer, personally I prefer, but let's see what the
maintainers prefer.

>  linux-user/signal.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/linux-user/signal.c b/linux-user/signal.c
> index 9016896dcd..6f62f2b528 100644
> --- a/linux-user/signal.c
> +++ b/linux-user/signal.c
> @@ -38,7 +38,6 @@ static void host_signal_handler(int host_signum, siginfo_t *info,
>   * Signal number 0 is reserved for use as kill(pid, 0), to test whether
>   * a process exists without sending it a signal.
>   */
> -QEMU_BUILD_BUG_ON(__SIGRTMAX + 1 != _NSIG);
>  static uint8_t host_to_target_signal_table[_NSIG] = {
>      [SIGHUP] = TARGET_SIGHUP,
>      [SIGINT] = TARGET_SIGINT,
> 


