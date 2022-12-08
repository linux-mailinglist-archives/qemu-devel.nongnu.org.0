Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB972646C91
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 11:18:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3DyG-0006rp-P9; Thu, 08 Dec 2022 05:17:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3DyC-0006oT-5z
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 05:17:36 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3DyA-0004hb-Jt
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 05:17:35 -0500
Received: by mail-wr1-x430.google.com with SMTP id bx10so1073004wrb.0
 for <qemu-devel@nongnu.org>; Thu, 08 Dec 2022 02:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tH5EUUVNOzml8wRcXKQriEpLMEW8gn5N9vovwPTlznA=;
 b=t17CFZJR2IpsByTahZ+fL3TJnvcpAR5CCVKiZMhHZ3YVFb0nJbfIjoxU6K+1nYM7Vg
 cR3Y8u3buwQcgPHNozPk2tKTduBdBuUDPoAyexGcuuTQLSmwegIyVhstIhmBtmkoa37y
 tKPKmAK8jR4dxbB5P0n6+Ud4lsVmj1WIQNZAKOS8CVKddFZ64Eksy3lhIPzcTmewWQgT
 yaySBuYPWWKLkDQ/QMLuZBX8GWSSmsm/S8uFZFR4x4Ow92+eAP0++kiED5wS6egq1Nvn
 QsLYt9qgojGihG1V8ytxq/ySqIZBpS90Hk7EqI8KFFZAxB8hrXyfPFWTPPW80ekEe/XO
 1HSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tH5EUUVNOzml8wRcXKQriEpLMEW8gn5N9vovwPTlznA=;
 b=vHNYfiVhP5rP4doeHCH7+WV31H8fiDq4yBJX0+sHfWaqZvkfJ+sw0ouh2IRpzEeE/r
 sXmQg2VAjKF1nacr4CW0e5yELZ5otRmksbAL25d6GyZKWv0iLiszk++rJ8jBXt0KKV/m
 CNdUZR5hnC0FH3PWlr96oBAdwzy96vDAwraCMovYk5FkpWi9ZEQSiGw0PHSH3G4GrpYB
 TWkJ3FFY/F+eLL3VZylI4SZxY76AbFpAMYhCMLjaMSwDYD8oJtyYvAdcAKhltc9ErMIV
 NYU5gSUHjpl4sgDhganWM31qGgG7vrFzW1FP/3EqSuGkrnHJztuG2NXcmI9wtPqzV1i6
 NILA==
X-Gm-Message-State: ANoB5pkJxVPYPL5+Un/yU+/ihply9ees/0aWLQJMnB3IJMNDlnVGGyKl
 vzP7otCXXO052A6JKBjjkDPnyg==
X-Google-Smtp-Source: AA0mqf4j0sqsce5MCRIYW1sJByU6BiqgRldZ+pIz71mgLJzWezkoTHTqH6DPukepfyWEjBTiYUAuWQ==
X-Received: by 2002:adf:f142:0:b0:241:71fc:3b3d with SMTP id
 y2-20020adff142000000b0024171fc3b3dmr57722235wro.268.1670494653006; 
 Thu, 08 Dec 2022 02:17:33 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 a16-20020a5d4570000000b00242109cf587sm21938286wrc.28.2022.12.08.02.17.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Dec 2022 02:17:32 -0800 (PST)
Message-ID: <1f01f666-58b7-f4b8-ec69-9a9d0de2bad9@linaro.org>
Date: Thu, 8 Dec 2022 11:17:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH] gitlab-ci: Check building ppc64 without TCG
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-ppc@nongnu.org
References: <20221208101527.36873-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221208101527.36873-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.262,
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

On 8/12/22 11:15, Thomas Huth wrote:
> Building QEMU for ppc64 hosts with --disable-tcg used to break a couple
> of times in the past, see e.g. commit a01b64cee7 ("target/ppc: Put do_rfi
> under a TCG-only block") or commit 049b4ad669 ("target/ppc: Fix build
> warnings when building with 'disable-tcg'"), so we should test this in
> our CI to avoid such regressions.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   Not sure whether we really should add new shared runner jobs ... but
>   I currently also don't see a better option for this: We don't have
>   any custom ppc64 runners in our CI, so the only other way to test this
>   is travis - but the Travis extension for gitlab recently broke, so
>   the results there are currently rather neglected, I think...
> 
>   .gitlab-ci.d/crossbuilds.yml | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
> index c4cd96433d..8dbbb8f881 100644
> --- a/.gitlab-ci.d/crossbuilds.yml
> +++ b/.gitlab-ci.d/crossbuilds.yml
> @@ -112,6 +112,14 @@ cross-ppc64el-user:
>     variables:
>       IMAGE: debian-ppc64el-cross
>   
> +cross-ppc64el-kvm-only:
> +  extends: .cross_accel_build_job
> +  needs:
> +    job: ppc64el-debian-cross-container
> +  variables:
> +    IMAGE: debian-ppc64el-cross
> +    EXTRA_CONFIGURE_OPTS: --disable-tcg --without-default-devices

Maybe also --disable-tools --disable-docs?

Regardless:

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


