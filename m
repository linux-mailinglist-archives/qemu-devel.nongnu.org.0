Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A29D327914
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 09:22:37 +0100 (CET)
Received: from localhost ([::1]:52020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGdp6-0001M3-0O
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 03:22:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lGdne-0000vD-Bx
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 03:21:06 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:54278)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lGdnb-0004TQ-4D
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 03:21:06 -0500
Received: by mail-wm1-x334.google.com with SMTP id u187so10751812wmg.4
 for <qemu-devel@nongnu.org>; Mon, 01 Mar 2021 00:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sm4sMuPVCY61AgDjfvaLwDiT8dLLtxGhUWLsLHtSyU0=;
 b=TDusfE/I1w1pJuLSuIeOPajSmROo6a7Jf8tk4lS8zGtL3FNfriRRaFh+UkvRPKYfsO
 a8dvk8jwmgNzNdvjzz1/4NmRZ1nudPNnliOAwALAoE3Cjm0uhDYsvOpJ/HEEdU+M8vid
 gb4eKis5bv9fnPRb2AVwaczbJYQSm1YKKvkPttf28YbYCa9orwUB+lTZE+6Z63Fpf1kX
 WfEfJSUP746FaDLICuwuWwPh7+TPkOk35CC9h2QEQgDjgzOd/U38WRERqhDeeK+AAwUl
 jlqNnNTbuO5wcvjICBNEtHTGYW3AmHxo0M5rLW+vqLM7c/XHBoJedSaeW8BtJTDl79kV
 o1xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sm4sMuPVCY61AgDjfvaLwDiT8dLLtxGhUWLsLHtSyU0=;
 b=JmC0TpB3dEAjmbNw6KHsLmFOhEzixF975qe85WAfwKRKn34Uf7t8bdUanfPb8FnZTp
 lJ+HcyDdKyLvAiK9JaKMefKJT7e8p6xJSThNocbYJJnvOh7ETTVoRhGB3UR2pjGd2ND1
 LPaq9QoQxk6KB30SQT8C6fMmINTSkNkdhb4EC+jDRLY6VAKfrcgmqPJokJQn9MaHsVNJ
 EvGgEv1yEO035jNqHPDNxn1WIC2LWHtgiBwDjIR7TqFYp+darx4ALW/VSBUaHDGkqlvv
 BELr2bzCXB2AYSiSVzlEEQmq2IdvaQQBtV5X1NV0Rb7/iCEkqrMuMokiwqU8pHNYgFin
 r1zg==
X-Gm-Message-State: AOAM532XVkhH/IYm+YJ2wV83zu299EVRPxEnwp0f8AwTSONI0yaXK6sf
 Q7ef2vg6D/KQj0Aq2VzDWng=
X-Google-Smtp-Source: ABdhPJxcUgiPKaWZ0JSNQv3VC6zWvsjmqMCqwA5f1KqHy5aew/DmiIgMfDy/FO0bBYK+l1jYJ9gx+A==
X-Received: by 2002:a05:600c:3590:: with SMTP id
 p16mr14414996wmq.108.1614586861641; 
 Mon, 01 Mar 2021 00:21:01 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id n1sm26731339wrx.45.2021.03.01.00.20.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Mar 2021 00:21:00 -0800 (PST)
Subject: Re: [PATCH] gitlab-ci: Disable vhost-kernel in build-disable job
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210131104621.221602-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <60e7663d-e270-6499-adaf-217fa0a911ab@amsat.org>
Date: Mon, 1 Mar 2021 09:20:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210131104621.221602-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping?

On 1/31/21 11:46 AM, Philippe Mathieu-Daudé wrote:
> Commit 299e6f19b3e ("vhost-net: revamp configure logic") added
> the --enable-vhost-kernel option.
> Disable it in the build-disable job.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  .gitlab-ci.yml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 7c0db64710b..e8390314d89 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -346,6 +346,7 @@ build-disabled:
>        --disable-vhost-crypto
>        --disable-vhost-net
>        --disable-vhost-scsi
> +      --disable-vhost-kernel
>        --disable-vhost-user
>        --disable-vhost-vdpa
>        --disable-vhost-vsock
> 


