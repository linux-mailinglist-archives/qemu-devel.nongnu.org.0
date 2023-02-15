Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A1E6984F9
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 20:53:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSNpO-00036Z-Pr; Wed, 15 Feb 2023 14:52:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSNpM-00031w-CS
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 14:52:28 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSNpK-0006AT-H4
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 14:52:28 -0500
Received: by mail-wr1-x429.google.com with SMTP id s13so2590612wrw.3
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 11:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pv48IS0bIEUWeFjNSuZrUxV14PF1zqOzJD0ZOch69Ys=;
 b=o8yNcngrU0Ugx6aILIA30qpSK0Bufv8E0dEpOHm/EBzd+PM0YBbVcilcv5DHUExCkM
 rs0LXVgaP14zRbNx2+RXGRYE6yQ5ls8xRSs6K+iQXwvpcxo1BsTa6vRX1FWekqdQUEfQ
 kjUcQi8y0kJ5z7OYJ7MlWqUmF/GergRIDva3p93OpHuJjlbsDEgozsxFkq0Iv4SbBWm4
 CeXC/LaZV36cPXHIArMJGfHYP8ypUNEU1JpCwsmFbJIjJggqYMFNhbOCMQ882GyA1AFJ
 O3QBw6k6DunuR5qp/myqWVkpRPErOiu9CBX0+lD6CUI8sLy0fsoquhNtfw78ta9fkQRr
 tObw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pv48IS0bIEUWeFjNSuZrUxV14PF1zqOzJD0ZOch69Ys=;
 b=rR3a1lcGkiE8S01fvYBwH/BlOha0enfjw/B9xy29rgvE6kRJlVJh7cHTi4cYhN5xx3
 Rl4tGZp6VD24+31/KlB1NfuJ5r1HnVfW+PT4KAJJK3sEb5MHmR5vDSisLy3b39Jpsy13
 1yWu15hg4jBw9rK4JtzdBgBLjicefjik72d6k69QNRFAyRGgmmjur+sg6V4E7I9+10YM
 6L0ma0DK7gz6KrYjYnmRX1E9jC0oc7BpeTYV1kSwHfAX97rkv35L00avT8Eal7fP/W1/
 dv76fBmoPKL2dYZM/c5v8I4xgXPL/8ow/GYg3exm9xYUKuMNFWGk5x8KrT1SN9mXm8EL
 8f/g==
X-Gm-Message-State: AO0yUKUI+HrYjs9SEp4oTZr+NrJmTMe57fYpjZwZgaRjiusDvjvM7Tr2
 Rql98v0LILXMlplKz/6o8MycCw==
X-Google-Smtp-Source: AK7set9o5mu6bSAo1kbfDAmFjefIL0TeCZzX2GXEs+5LGsFY//FG9IXjn7pdU9oY4AgJPH0crruaHw==
X-Received: by 2002:a05:6000:787:b0:2c5:5916:e902 with SMTP id
 bu7-20020a056000078700b002c55916e902mr330528wrb.17.1676490744714; 
 Wed, 15 Feb 2023 11:52:24 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 x1-20020adfffc1000000b002425be3c9e2sm16509304wrs.60.2023.02.15.11.52.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 11:52:24 -0800 (PST)
Message-ID: <049ce408-e1e7-6bac-0fef-654157a5f984@linaro.org>
Date: Wed, 15 Feb 2023 20:52:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH 03/12] tests: add socat dependency for tests
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Michael Roth <michael.roth@amd.com>, Alexander Bulekov <alxndr@bu.edu>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, John Snow <jsnow@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Darren Kenny <darren.kenny@oracle.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Bandan Das <bsd@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Yonggang Luo <luoyonggang@gmail.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Ed Maste <emaste@freebsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20230215192530.299263-1-alex.bennee@linaro.org>
 <20230215192530.299263-4-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230215192530.299263-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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

On 15/2/23 20:25, Alex Bennée wrote:
> We only use it for test-io-channel-command at the moment.
> Unfortunately bringing socat into CI exposes an existing bug in the
> test-io-channel-command unit test. For now disable the test with the
> preprocessor until someone can diagnose it on Mac hardware.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Philippe Mathieu-Daudé <philmd@linaro.org>
> Cc: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   tests/unit/test-io-channel-command.c                  | 4 ++--
>   .gitlab-ci.d/cirrus/freebsd-12.vars                   | 2 +-
>   .gitlab-ci.d/cirrus/freebsd-13.vars                   | 2 +-
>   .gitlab-ci.d/cirrus/macos-12.vars                     | 2 +-
>   tests/docker/dockerfiles/alpine.docker                | 1 +
>   tests/docker/dockerfiles/centos8.docker               | 1 +
>   tests/docker/dockerfiles/debian-amd64-cross.docker    | 1 +
>   tests/docker/dockerfiles/debian-amd64.docker          | 1 +
>   tests/docker/dockerfiles/debian-arm64-cross.docker    | 1 +
>   tests/docker/dockerfiles/debian-armel-cross.docker    | 1 +
>   tests/docker/dockerfiles/debian-armhf-cross.docker    | 1 +
>   tests/docker/dockerfiles/debian-mips64el-cross.docker | 1 +
>   tests/docker/dockerfiles/debian-mipsel-cross.docker   | 1 +
>   tests/docker/dockerfiles/debian-ppc64el-cross.docker  | 1 +
>   tests/docker/dockerfiles/debian-s390x-cross.docker    | 1 +
>   tests/docker/dockerfiles/fedora-win32-cross.docker    | 1 +
>   tests/docker/dockerfiles/fedora-win64-cross.docker    | 1 +
>   tests/docker/dockerfiles/fedora.docker                | 1 +
>   tests/docker/dockerfiles/opensuse-leap.docker         | 1 +
>   tests/docker/dockerfiles/ubuntu2004.docker            | 1 +
>   tests/lcitool/projects/qemu.yml                       | 1 +
>   21 files changed, 22 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/unit/test-io-channel-command.c b/tests/unit/test-io-channel-command.c
> index 425e2f5594..f3c34152ac 100644
> --- a/tests/unit/test-io-channel-command.c
> +++ b/tests/unit/test-io-channel-command.c
> @@ -31,7 +31,7 @@
>   
>   static char *socat = NULL;
>   
> -#ifndef _WIN32
> +#if !defined(_WIN32) && !defined(DARWIN)

s/DARWIN/CONFIG_DARWIN/

>   static void test_io_channel_command_fifo(bool async)
>   {
>       g_autofree gchar *tmpdir = g_dir_make_tmp("qemu-test-io-channel.XXXXXX", NULL);
> @@ -128,7 +128,7 @@ int main(int argc, char **argv)
>   
>       socat = g_find_program_in_path("socat");
>   
> -#ifndef _WIN32
> +#if !defined(_WIN32) && !defined(DARWIN)

CONFIG_DARWIN

>       g_test_add_func("/io/channel/command/fifo/sync",
>                       test_io_channel_command_fifo_sync);
>       g_test_add_func("/io/channel/command/fifo/async",

^ Clearly another preliminary patch.

With the split, for both patches, using CONFIG_DARWIN:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>

