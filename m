Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD30E68BCC4
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 13:28:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP0bP-0000Ga-BP; Mon, 06 Feb 2023 07:28:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pP0b1-0000EK-SI
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 07:27:55 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pP0aw-00081P-AK
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 07:27:42 -0500
Received: by mail-wm1-x329.google.com with SMTP id q8so8534559wmo.5
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 04:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4F7xx1nNy7ikmetS0aJNjvHJZ3ymvbyT7PXs6hdpMkA=;
 b=hLzPY0aeFYE9hjjcNrSdEYYi2IMHa3z8EQJzSdYbNN5eFujyi8IDQQxoBlnlm0yw6s
 vd9+A0fIBuaLrJK59JPiyS9pm2bBmmX+5hBXCXy0xEqIX0ZhsROXCu56v7QIj2c4vKP/
 7bWpDtsg0PjMU3amdnvk6V2gq3uIOT9sMz/Z+WIuskS0HS+IdI85F2671x2jyhEHd/ZZ
 0vNpJlaWP7HC4TUY55cJiKM8l8+5z5TnwY9cNOTnnFQI9SpcLw5MX0RrxyWWP1OaUD89
 nO/sID5MG9yRLb6RTQ3fh9E5hXSd/x6Rrw9PQdcAnxgCYzzn/Qn6ciChzfsz0FcxUWua
 NL5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4F7xx1nNy7ikmetS0aJNjvHJZ3ymvbyT7PXs6hdpMkA=;
 b=s7LhOwMc62RnX6zHx/4fIRPwrCyPttp5tYf0kYHUQgeMgTrBVrvIa7PhNaNwoEHrMs
 Sz0wI0xFtNzhj9HVPuMTi0mDljNtA0HxYL8v3fc2PquQ3GmOxjvMKYGb0h+ldZVFzpcK
 l3tZCgsQvTlrtm3rMMgtm/AcqHpKxtZIDdLh5OYnE1FHM/KEQtmQIApk6UOO2YkO3rcJ
 Nd/hiAwn1wZQpk9G+GvUhk68MqhEZ+RGyNcf94ln1QzGt2mwlr5so9C6HYd4VR8sFuYb
 R6VmSbtYWwKcXgMC1hBlw5A6XQ9aiR+BIm/xd5y2drBgvs38PXGU60RJt0/Fo0LoTocF
 DPyw==
X-Gm-Message-State: AO0yUKWyxhSCd76ePbhQIbGv7YtEXfH7O/S148gfh1oeTXzjlpn4u5oC
 /hSvNryV2ryzuIGCWuDDTbpNTw==
X-Google-Smtp-Source: AK7set93B/eONIQx4CnlRmgWTxoe8jJmK75Fa+7zr5cm21TfrTC4YHiH3Mx+jMJlJ6m+0BaJzVUvQQ==
X-Received: by 2002:a7b:c4c9:0:b0:3de:1d31:1042 with SMTP id
 g9-20020a7bc4c9000000b003de1d311042mr882429wmk.23.1675686450529; 
 Mon, 06 Feb 2023 04:27:30 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 u1-20020a05600c00c100b003a3442f1229sm15846080wmm.29.2023.02.06.04.27.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 04:27:30 -0800 (PST)
Message-ID: <adf22fcb-51a6-3194-4496-6a6878e9d498@linaro.org>
Date: Mon, 6 Feb 2023 13:27:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PULL 04/35] tests/unit: drop hacky race avoidance in
 test-io-channel-command
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20230126112250.2584701-1-alex.bennee@linaro.org>
 <20230126112250.2584701-5-alex.bennee@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230126112250.2584701-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

Hi Alex, Thomas.

On 26/1/23 12:22, Alex Bennée wrote:
> We don't need to play timing games to ensure one socat wins over the
> other, just create the fifo they both can use before spawning the
> processes. However in the process we need to disable two tests for
> Windows platforms as we don't have an abstraction for mkfifo().
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1403
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Message-Id: <20230124180127.1881110-5-alex.bennee@linaro.org>
> 
> diff --git a/tests/unit/test-io-channel-command.c b/tests/unit/test-io-channel-command.c
> index 19f72eab96..425e2f5594 100644
> --- a/tests/unit/test-io-channel-command.c
> +++ b/tests/unit/test-io-channel-command.c
> @@ -20,6 +20,8 @@
>   
>   #include "qemu/osdep.h"
>   #include <glib/gstdio.h>
> +#include <sys/types.h>
> +#include <sys/stat.h>
>   #include "io/channel-command.h"
>   #include "io-channel-helpers.h"
>   #include "qapi/error.h"
> @@ -29,6 +31,7 @@
>   
>   static char *socat = NULL;
>   
> +#ifndef _WIN32
>   static void test_io_channel_command_fifo(bool async)
>   {
>       g_autofree gchar *tmpdir = g_dir_make_tmp("qemu-test-io-channel.XXXXXX", NULL);
> @@ -40,12 +43,13 @@ static void test_io_channel_command_fifo(bool async)
>       QIOChannel *src, *dst;
>       QIOChannelTest *test;
>   
> +    if (mkfifo(fifo, 0600)) {
> +        g_error("mkfifo: %s", strerror(errno));
> +    }
> +
>       src = QIO_CHANNEL(qio_channel_command_new_spawn((const char **) srcargv,
>                                                       O_WRONLY,
>                                                       &error_abort));
> -    /* try to avoid a race to create the socket */
> -    g_usleep(1000);
> -
>       dst = QIO_CHANNEL(qio_channel_command_new_spawn((const char **) dstargv,
>                                                       O_RDONLY,
>                                                       &error_abort));
> @@ -60,7 +64,6 @@ static void test_io_channel_command_fifo(bool async)

Testing on Darwin/Aarch64 I'm getting (reproducible):

78/93 qemu:unit / test-io-channel-command             ERROR 
2.38s   killed by signal 13 SIGPIPE
 >>> MALLOC_PERTURB_=10 G_TEST_BUILDDIR=./tests/unit 
G_TEST_SRCDIR=tests/unit ./tests/unit/test-io-channel-command --tap -k
―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
stderr:
2023/02/03 08:26:49 socat[32507] E 
mkfifo(/var/folders/yj/r7khncsj4d77k04ybz9lw4tm0000gn/T/qemu-test-io-channel.GMARZ1/test-io-channel-command.fifo, 
438): File exists

(test program exited with status code -13)

TAP parsing error: Too few tests run (expected 4, got 0)
―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――

We call g_rmdir(), but I see various qtests calling unlink()
before rmdir(). Do we need it here?

+       g_unlink(fifo);

>       g_rmdir(tmpdir);
>   }
>   
> -
>   static void test_io_channel_command_fifo_async(void)
>   {
>       if (!socat) {
> @@ -80,6 +83,7 @@ static void test_io_channel_command_fifo_sync(void)
>   
>       test_io_channel_command_fifo(false);
>   }
> +#endif
>   
>   
>   static void test_io_channel_command_echo(bool async)
> @@ -124,10 +128,12 @@ int main(int argc, char **argv)
>   
>       socat = g_find_program_in_path("socat");
>   
> +#ifndef _WIN32
>       g_test_add_func("/io/channel/command/fifo/sync",
>                       test_io_channel_command_fifo_sync);
>       g_test_add_func("/io/channel/command/fifo/async",
>                       test_io_channel_command_fifo_async);
> +#endif
>       g_test_add_func("/io/channel/command/echo/sync",
>                       test_io_channel_command_echo_sync);
>       g_test_add_func("/io/channel/command/echo/async",


