Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A065728DB
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 23:56:24 +0200 (CEST)
Received: from localhost ([::1]:34286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBNrj-0005zl-HQ
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 17:56:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oBNom-0008FW-E5
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 17:53:20 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:45824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oBNoj-0007mM-Rm
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 17:53:20 -0400
Received: by mail-wr1-x433.google.com with SMTP id a5so12972027wrx.12
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 14:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6VaRBm5RPO1WeJTUZjfjRbh8vUnKAQljz+6Egd8kLBY=;
 b=cdaYvbhokypwdIQgxsJpeTh9JuF4DWAWCq/WoJeEFSPC53bKCVvAdKAOePe6mxsxI8
 v7kkDKqjFQ3JR0tAbwqJFom5+V8A/G+PdAHZh85wjrYtGxdmsOeohHuul3mJ6Cce655S
 l2BzHjmAkzyzIkeidl5SLDz10g0wvKHqWRuaoD9HaMFYJgyY+9eyIb6jnefmWA5nvii8
 PGMS97OEzzhySd+CWAnl1dgC18ZUpTG1GmJKOKFHi6ZYJSPZuvshiQvMyIrv7ZMfuFZv
 cRXhn3hBpWRNcBGS8ESNAoOinweULIAeX3Oo5Qqc38ofVPQEKm8y/EuqJJjQJVj5pDN9
 4iFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6VaRBm5RPO1WeJTUZjfjRbh8vUnKAQljz+6Egd8kLBY=;
 b=4JVQ4alUFE0F+KTLxRJIYGdax3BYo++zcsqx57bkSPTDxVH08GnsZ4g/4vJadSS2rX
 AE/xiITH0N2gY+LcvTWsjmRGV2xh+4PhyNoX+JTAAAOJ4y4wAkOU1DHPj2ZbVcaaaYcm
 +JLaO3zdLwEOzg7DLvo3ZmEd4QYQ5xNrfwyB9BFKSFm0JHRBqN2kBBsOUO0QYhWfHY3y
 uoNM5fTe97L8Z9Oe/m7afdv3rks3aqeIvQPT1Hwnhi+fYeDQ2d0qNb/CzsZ2QMUiAEs/
 hOULVQiRSmUcPSYlpIrn335ASmrJG9Ms+ztvbeEei7by5xnbSxtpYiCX1wLB3rl0yTLG
 w5xA==
X-Gm-Message-State: AJIora+B4I5mKAoKDvMoMZxc8WbGfXznTTY7B+TXFLWuyC1u4QUufmX+
 mTDKV6mA4YtMR6fuzxfRkk8=
X-Google-Smtp-Source: AGRyM1sVZAObDemdsubpjAilm9tPHPcXgQMLUQiNYpjSORSwKCMzvWgwaljzWnTZJXGuelWBrsLDjQ==
X-Received: by 2002:a05:6000:178d:b0:21d:a3cc:54c8 with SMTP id
 e13-20020a056000178d00b0021da3cc54c8mr83216wrg.602.1657662796434; 
 Tue, 12 Jul 2022 14:53:16 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 j27-20020a05600c1c1b00b0039c4ba160absm5132027wms.2.2022.07.12.14.53.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jul 2022 14:53:15 -0700 (PDT)
Message-ID: <f2fceb5e-ab0e-20fd-3549-a6086cec5215@amsat.org>
Date: Tue, 12 Jul 2022 23:53:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH] avocado: Fix BUILD_DIR if it's equal to SOURCE_DIR
Content-Language: en-US
To: Peter Delevoryas <peter@pjd.dev>
Cc: Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20220702185604.46643-1-peter@pjd.dev>
In-Reply-To: <20220702185604.46643-1-peter@pjd.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 2/7/22 20:56, Peter Delevoryas wrote:
> I like to build QEMU from the root source directory, rather than cd'ing
> into the build directory. This code may as well include a search path
> for that, so that you can run avocado tests individually without
> specifying "-p qemu_bin=build/qemu-system-arm" manually.
> 
> Signed-off-by: Peter Delevoryas <peter@pjd.dev>
> ---
>   tests/avocado/avocado_qemu/__init__.py | 17 +++++++++--------
>   1 file changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/tests/avocado/avocado_qemu/__init__.py b/tests/avocado/avocado_qemu/__init__.py
> index b656a70c55..ed4853c805 100644
> --- a/tests/avocado/avocado_qemu/__init__.py
> +++ b/tests/avocado/avocado_qemu/__init__.py
> @@ -120,14 +120,15 @@ def pick_default_qemu_bin(bin_prefix='qemu-system-', arch=None):
>       # qemu binary path does not match arch for powerpc, handle it
>       if 'ppc64le' in arch:
>           arch = 'ppc64'
> -    qemu_bin_relative_path = os.path.join(".", bin_prefix + arch)
> -    if is_readable_executable_file(qemu_bin_relative_path):
> -        return qemu_bin_relative_path
> -
> -    qemu_bin_from_bld_dir_path = os.path.join(BUILD_DIR,
> -                                              qemu_bin_relative_path)
> -    if is_readable_executable_file(qemu_bin_from_bld_dir_path):
> -        return qemu_bin_from_bld_dir_path
> +    qemu_bin_name = bin_prefix + arch
> +    qemu_bin_paths = [
> +        os.path.join(".", qemu_bin_name),
> +        os.path.join(BUILD_DIR, qemu_bin_name),
> +        os.path.join(BUILD_DIR, "build", qemu_bin_name),

I suppose you are building as pseudo-in-tree (see commit dedad02720: 
"configure: add support for pseudo-"in source tree" builds"). OK.

> +    ]
> +    for path in qemu_bin_paths:
> +        if is_readable_executable_file(path):
> +            return path
>       return None
>   
>   

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

And queued.

