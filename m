Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3BB49BAF6
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 19:07:45 +0100 (CET)
Received: from localhost ([::1]:57704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCQEK-0002Xn-8R
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 13:07:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nCQD2-0001fy-T0
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 13:06:24 -0500
Received: from [2a00:1450:4864:20::331] (port=44642
 helo=mail-wm1-x331.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nCQD0-0005AR-0q
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 13:06:24 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 l35-20020a05600c1d2300b0034d477271c1so2447373wms.3
 for <qemu-devel@nongnu.org>; Tue, 25 Jan 2022 10:05:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RQqI0gDtFPm3KBZiQfac40kZv7u/ur9UwVTmcSxsDBI=;
 b=VtRjlAYPxajQuuAoi4nLeq2eGfpGnGHJnb3PBlv8+klM4RFdEty9ThpQ7NfkHjEM8c
 xaCfVQE4sHM8gkrzzxSp3ATTGbizw7RyFL+5dOj5+PZ24+Xz/XNrgl5pa4KsMh19RX2W
 +1PU44wHHts/kY4dIpMt4Ymtu3W2zs/hvCbtth/9bkVeal4YbJ1iRJY4aQDe5gpWOJTr
 lyJ0whvfY7O1/xmwPuMIrvFLX6KK35OZA1Iaz91jMcWY7hqnvYMu85ffn8K/f3/8uRhX
 C6get510r3EjS3TwWJ2dADE1Tb9KIhBy/FnWg+cvNv4XrebGDqMgENvuUct2tk2vLY9O
 QP6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RQqI0gDtFPm3KBZiQfac40kZv7u/ur9UwVTmcSxsDBI=;
 b=SCfUBd/nrNfItaktywH2oajwSAHoSfF33L09nK0AM3pPvupsaHXZk5YzBCBJOEIkYR
 rh77M2gakiNPUs+2/DF6YVLI82QUkiBbmBa5RsIC9Ey/Lgs7dCW/bOyrDrRNMGuBh43e
 6sGtqYJMiivYPsf7z0FbjEzr7r7UadXaZZcgdRMBBs9rFY+OmFglhkLBfIkPy4OZo9kg
 Ue4XLESgmWlOiztzTpjUNp6L6XOauLb9uujaUayRebxPQhI4usmcn0lekvpctbjuk3th
 uK+IrR7MKhrjj93eHNcd2vT3NJDpzCJs6C4j48yVXVWYzY5y0tU+XQ7cHmduq1k8t2vZ
 OiNQ==
X-Gm-Message-State: AOAM530Vx90PhnzJkMgZCjQoutORzCntbWBJYNKcKYB/eIx85xv/t+As
 VKmJw3RezFxcAZ8AqLLk3wY=
X-Google-Smtp-Source: ABdhPJwSIi+JSyWrDKmoA5yKeUzoowy2ctB7REYKV6CnjCGrTzN/XClMX3a6vziUN7M0HpvRv/281g==
X-Received: by 2002:a05:600c:4f07:: with SMTP id
 l7mr4059957wmq.129.1643133939122; 
 Tue, 25 Jan 2022 10:05:39 -0800 (PST)
Received: from [192.168.1.40] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id h1sm17159449wrq.82.2022.01.25.10.05.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jan 2022 10:05:38 -0800 (PST)
Message-ID: <930ecf22-cc73-3bfe-3af9-a52b7489492a@amsat.org>
Date: Tue, 25 Jan 2022 19:05:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] gitlab: fall back to commit hash in qemu-setup filename
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Greg Kurz <groug@kaod.org>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20220125173454.10381-1-stefanha@redhat.com>
In-Reply-To: <20220125173454.10381-1-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::331
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 1/25/22 18:34, Stefan Hajnoczi wrote:
> Personal repos may not have release tags (v6.0.0, v6.1.0, etc) and this
> causes cross_system_build_job to fail when pretty-printing a unique
> qemu-setup-*.exe name:
> 
>   version="$(git describe --match v[0-9]*)";
>              ^^^^^^^^^^ fails ^^^^^^^^^^^
>   mv -v qemu-setup*.exe qemu-setup-${version}.exe;
> 
> Fall back to the short commit hash if necessary. This fixes CI failures
> that Greg Kurz and I experienced in our personal repos.

This answers this thread:
https://lore.kernel.org/qemu-devel/YVwQRyD6FxrB9qgd@redhat.com/

> Cc: Greg Kurz <groug@kaod.org>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  .gitlab-ci.d/crossbuild-template.yml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/.gitlab-ci.d/crossbuild-template.yml b/.gitlab-ci.d/crossbuild-template.yml
> index 10d22dcf6c..29c3c2b826 100644
> --- a/.gitlab-ci.d/crossbuild-template.yml
> +++ b/.gitlab-ci.d/crossbuild-template.yml
> @@ -14,7 +14,7 @@
>      - make -j$(expr $(nproc) + 1) all check-build $MAKE_CHECK_ARGS
>      - if grep -q "EXESUF=.exe" config-host.mak;
>        then make installer;
> -      version="$(git describe --match v[0-9]*)";
> +      version="$(git describe --match v[0-9]* 2>/dev/null || git rev-parse --short HEAD)";
>        mv -v qemu-setup*.exe qemu-setup-${version}.exe;
>        fi
>  

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

