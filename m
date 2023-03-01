Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F19116A6AFF
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 11:43:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXJvb-0005Mi-3R; Wed, 01 Mar 2023 05:43:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXJvZ-0005Lt-Bl
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 05:43:17 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXJvW-0003d6-Kc
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 05:43:17 -0500
Received: by mail-wr1-x433.google.com with SMTP id e13so1204551wro.10
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 02:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677667393;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wsXQUeyFAJEfxTkVDZ8mG6U2/zmfD/nyfojNaH3hanc=;
 b=GP8tM9iPve8HnXuaAIybtDFWT8js59UZB4B3pGdung1vtXlRhMuioYiedLXBSGljY5
 ddWehVh9DvKPvWgcb8X67bjOmU40diKRZXwrqJxmuf5m8OgjJ5+keVRuO43NYIs7UGHi
 0sSbgE53+EkfOzaeTeo2KMLjoWthaEob2fSBS9L080CNDLZZK2CckWGrgMGA5c7l17Mt
 bJQ+4MLPXiwi2KVMpoN12jE9urBpBCaqWc2rMHSlBaU/Z58Y4B8UzjK/+r2ZdeiYnWEG
 aRIHODZ1SfKEfhYMr8sRIQPpHRfo6QxHS1rY4QRwcYSS+zOIhjoTKwYWOu81BY951zrM
 J2Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677667393;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wsXQUeyFAJEfxTkVDZ8mG6U2/zmfD/nyfojNaH3hanc=;
 b=lrgFVEksx5XZ1Zrqld7h+Z9MjtBn2PZYCZ7pjoNPi/swtbeBRt0/ODxbAkxe0uhjaB
 rG9L41EEFxgW6rJBipvy0zpIaRend5odYLJCS1x1/1mFiP7RCrGuFYp4XiTcovXuRauU
 FErFuHdYPOF5W+L5EEN9nB7HUfEn9pyVxatzVMhkLUG/R2yvkUIY/tjnUy9HXI2GErZh
 K65NCigG83KavGAl2bnZT8b3L7KtG8IoCI8n9LxXWxO7aiD9JXFweiuGTgII3OekhhmN
 21jEpipja6oc4vMM5w8kSI+k3TtV8gmYb9gePLIPR/Thz5Nxhox3V8iHH8UZ1OQL8gps
 nMig==
X-Gm-Message-State: AO0yUKVDco+0yNwngBpASPkxQr6tjtfq6leut9+wdfqs9SLmSz7jpB/I
 12eX/eDDXZ1lDth/17g6Hp9r0A==
X-Google-Smtp-Source: AK7set82yOLVwxB/Uu1gOKUcv6EEtoOKnkCy9Yj9L8IqihaYCIOUAhAQnEUh4EAcXmkSFyk8SARBeg==
X-Received: by 2002:a5d:40ca:0:b0:2c7:4ec:8d79 with SMTP id
 b10-20020a5d40ca000000b002c704ec8d79mr4007883wrq.21.1677667393202; 
 Wed, 01 Mar 2023 02:43:13 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 a2-20020adfdd02000000b002c3f03d8851sm12512961wrm.16.2023.03.01.02.43.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Mar 2023 02:43:12 -0800 (PST)
Message-ID: <8e982d42-4b3a-7334-8f13-44c3c58da1a3@linaro.org>
Date: Wed, 1 Mar 2023 11:43:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v3 22/24] gitlab: move the majority of artefact handling
 to a template
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Peter Maydell
 <peter.maydell@linaro.org>, Kevin Wolf <kwolf@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Aurelien Jarno <aurelien@aurel32.net>, Markus Armbruster
 <armbru@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Ed Maste <emaste@freebsd.org>,
 qemu-arm@nongnu.org, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Bandan Das <bsd@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Laurent Vivier <lvivier@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20230228190653.1602033-1-alex.bennee@linaro.org>
 <20230228190653.1602033-23-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230228190653.1602033-23-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 28/2/23 20:06, Alex Bennée wrote:
> To avoid lots of copy and paste lets deal with artefacts in a
> template. This way we can filter out most of the pre-binary object and
> library files we no longer need as we have the final binaries.
> 
> build-system-alpine also saved .git-submodule-status so for simplicity
> we bring that into the template as well.
> 
> As an example the build-system-ubuntu artefacts before this patch
> where around 1.3 GB, after dropping the object files it comes to 970
> MB.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   .gitlab-ci.d/buildtest-template.yml | 16 ++++++
>   .gitlab-ci.d/buildtest.yml          | 81 +++++++++++------------------
>   2 files changed, 46 insertions(+), 51 deletions(-)
> 
> diff --git a/.gitlab-ci.d/buildtest-template.yml b/.gitlab-ci.d/buildtest-template.yml
> index cb96b55c3f..a6cfe9be97 100644
> --- a/.gitlab-ci.d/buildtest-template.yml
> +++ b/.gitlab-ci.d/buildtest-template.yml
> @@ -25,6 +25,22 @@
>           make -j"$JOBS" $MAKE_CHECK_ARGS ;
>         fi
>   
> +# We jump some hoops in common_test_job_template to avoid
> +# rebuilding all the object files we skip in the artifacts
> +.native_build_artifact_template:
> +  artifacts:
> +    expire_in: 2 days
> +    paths:
> +      - build
> +      - .git-submodule-status
> +    exclude:
> +      - build/**/*.p
> +      - build/**/*.a.p
> +      - build/**/*.fa.p
> +      - build/**/*.c.o
> +      - build/**/*.c.o.d
> +      - build/**/*.fa

Why not exclude "build/**/*.a", was there some issue?

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


