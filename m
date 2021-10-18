Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBE04315D2
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 12:20:05 +0200 (CEST)
Received: from localhost ([::1]:55926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcPkR-0002mY-VZ
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 06:20:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mcPiQ-00023u-7y
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 06:17:58 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:43606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mcPiL-0004y8-Hd
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 06:17:58 -0400
Received: by mail-wr1-x42f.google.com with SMTP id r7so40405600wrc.10
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 03:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6+yOyivTYo66C75DiW7QtanmBswbAr/adD+2AqIX4BU=;
 b=NG01Q6r2EiXtpeed09V99Mzbt05kkqoiqt0PGlD35w6zORIdxQKkZc6/jHr/xRgKjg
 q1ZsxuZ7IFMCt6T+NlgMAgHLA2nd6R9Y9yk7khBtc5buCwRqdFFmzK81ZFBMucU9+qC0
 B7w+Fs4G7GR7GnZL5gS1BLQOsN3ZeSRjeaVYwj3iKX6B15HFr3RJUkU5J60RU6AiynuV
 hKn9IvGGiYV8YmIBlszDSSHmvbZdJwS33Qqj/gnwTEIvXaULdiXIBNeRc8oTiX9gRKnW
 nPtj1RdY3zzMjhua9+aCnqkeUNZUH553FkQvE4vKl5WzkSb13UvVLwBZh8LsXVq3ihV8
 TzTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6+yOyivTYo66C75DiW7QtanmBswbAr/adD+2AqIX4BU=;
 b=YH7nYOsUxqha1WgP2vAx5muZ2z+lbzONA3sFSw87LV8GHC/N074YfebAmDgqgnTLuL
 GCfQuRYxWwph+vInCyYoSywREoSTkuItyBJMIIrbs8M83ZAZSVyAlljfJF+jOJ4BPn5P
 9c7+W52+gHwYa6sTUzb/ATGvOrFlLyCtdWcOI+7OjOF1EpkVM9N7Owu3j055oROMn4Nd
 0Q7dgAxwzt8a+kT1KF/snUjFTj/Iwv/l6WvLCFdJt9yFV9b3PngP5UBiIam+4zwngWTq
 wMTr/BgOkAskZ/gLnwxpfg/dXQDGVEwAnPI7QEd5kMOM5cuBAUQPzH8W1UNgxqpGJ4iV
 4kGQ==
X-Gm-Message-State: AOAM532Ac4NdCWx0kZDL44SIoQHytvkJgLlznZqiYKYCoFWLp92REFSD
 RTjoci75vsg+JZU0HUUv6W0=
X-Google-Smtp-Source: ABdhPJxZxc0wypxGGKK4pgTI/xzZCCD9cs000u/PKIqYhX3UVG4sJFJaj9jctsm6woxELtbYUxhgLg==
X-Received: by 2002:a5d:4f8d:: with SMTP id d13mr33760222wru.239.1634552271883; 
 Mon, 18 Oct 2021 03:17:51 -0700 (PDT)
Received: from [192.168.1.36] (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id x24sm19042540wmk.31.2021.10.18.03.17.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Oct 2021 03:17:51 -0700 (PDT)
Message-ID: <81d96ba8-6a06-8bad-7777-a9fdb1354c02@amsat.org>
Date: Mon, 18 Oct 2021 12:17:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 01/15] meson: *-user: only descend into *-user when
 configured
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20211008231506.17471-1-imp@bsdimp.com>
 <20211008231506.17471-2-imp@bsdimp.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211008231506.17471-2-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Kyle Evans <kevans@freebsd.org>, richard.henderson@linaro.org,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzinni@redhat.com>,
 Warner Losh <wlosh@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/9/21 01:14, Warner Losh wrote:
> To increase flexibility, only descend into *-user when that is
> configured. This allows *-user to selectively include directories based
> on the host OS which may not exist on all hosts. Adopt Paolo's
> suggestion of checking the configuration in the directories that know
> about the configuration.
> 
> Message-Id: <20210926220103.1721355-2-f4bug@amsat.org>
> Message-Id: <20210926220103.1721355-3-f4bug@amsat.org>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: Warner Losh <wlosh@bsdimp.com>
> Acked-by: Paolo Bonzini <pbonzinni@redhat.com>
> 
> Sponsored by:		Netflix
> ---
>  bsd-user/meson.build   | 4 ++++
>  linux-user/meson.build | 4 ++++
>  meson.build            | 3 +--
>  3 files changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/bsd-user/meson.build b/bsd-user/meson.build
> index 0369549340..243fb78930 100644
> --- a/bsd-user/meson.build
> +++ b/bsd-user/meson.build
> @@ -1,3 +1,7 @@
> +if not config_target.has_key('CONFIG_BSD_USER')
> +   subdir_done()
> +endif
> +
>  bsd_user_ss.add(files(
>    'bsdload.c',
>    'elfload.c',
> diff --git a/linux-user/meson.build b/linux-user/meson.build
> index 9549f81682..602255a3d6 100644
> --- a/linux-user/meson.build
> +++ b/linux-user/meson.build
> @@ -1,3 +1,7 @@
> +if not config_target.has_key('CONFIG_LINUX_USER')
> +   subdir_done()
> +endif
> +
>  linux_user_ss.add(files(
>    'elfload.c',
>    'exit.c',
> diff --git a/meson.build b/meson.build
> index 99a0a3e689..1f2da5f7d9 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2303,10 +2303,9 @@ subdir('ebpf')
>  
>  common_ss.add(libbpf)
>  
> -bsd_user_ss.add(files('gdbstub.c'))
>  specific_ss.add_all(when: 'CONFIG_BSD_USER', if_true: bsd_user_ss)
>  
> -linux_user_ss.add(files('gdbstub.c', 'thunk.c'))
> +linux_user_ss.add(files('thunk.c'))
>  specific_ss.add_all(when: 'CONFIG_LINUX_USER', if_true: linux_user_ss)
>  
>  # needed for fuzzing binaries
> 

Thanks Warner for respining this! LGTM :)

