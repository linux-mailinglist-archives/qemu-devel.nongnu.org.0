Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 176D95BBAAE
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Sep 2022 23:33:54 +0200 (CEST)
Received: from localhost ([::1]:37080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZfRg-0006R6-M3
	for lists+qemu-devel@lfdr.de; Sat, 17 Sep 2022 17:33:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oZfPB-0004EV-L9
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 17:31:27 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:39810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oZfP9-00079e-O9
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 17:31:17 -0400
Received: by mail-wr1-x42d.google.com with SMTP id cc5so31527120wrb.6
 for <qemu-devel@nongnu.org>; Sat, 17 Sep 2022 14:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=sJ61KkIWlKXRfDDMDiElHv0CKEumzLxIW0TH9C0JbIc=;
 b=HXPw9xXqbwp8Qg5KDuQ1slKMC6pLumpDagVdZcwO6kOZC8EireZa0zBpUF2iBuVY/h
 UgOgN2+XV0T6fdTXsY1KbVB7fuY7XDidifyvgJ8p3dd1oK2a/Ex92PbHBwDdHniu1F41
 yo3LnlnEYtNVVOrpPMRQaTU7UK6mI4Mm8Jvjxlc255AZBHVSQT70NQf755bE/W6zxlbv
 VX3vX6W+OoIyXO7TGeiikXP27G6PHHmTwMjyrad67rAke4RB8idlPgQexBmdoHm/xwxH
 ZtLFUolHG7D3sBNR0hPOa9o1UIWZJwqWxC9ADNh9Q0cyb0MRm+HjXXuFjcG63fFevSvU
 F1IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=sJ61KkIWlKXRfDDMDiElHv0CKEumzLxIW0TH9C0JbIc=;
 b=cm9dXAtMRJSlWm/zgPJt35SuOg7JfeF92Omz8Q3iXTdb1SaWGgySvovjAkV0wP8OvI
 RyOcq0j3wLBjEbB5TYgsNftIP/O3nAV+hUeEnyoPoJ/t948FlWOdejT58QhM9REuUqLu
 /qhlnHxeSW7YbTXExMhxGXl2VYFofDFpIk6AXLC5k6sjTvlTerUMUUcrrRzeInRh2zRl
 ZvPUGa5zz76ymY8tM92bv62vpNWasEgTlL2mlCT34CoyzH44apOwOMxz1dvrHC4EGzdW
 FfYdJIhJhXBZ0G/aBeLEUANiHE57UMyByah1I+PlzB0IV4lRVqfaO2h2QK5/vI3L9RXc
 A0yw==
X-Gm-Message-State: ACrzQf1L/z4PGUTwpTBQjsvVGJGpw97U/DOsmal7FPXu44FH8yN9h6Sr
 YB+xjs4N3jF+H1KwxofInac=
X-Google-Smtp-Source: AMsMyM4xT8jF0q01l+pyKqOeXKlwtqn0Obn/pKeXhTD9eS/t6o185gkmqN00LmNfiIXBS8YITU7tnQ==
X-Received: by 2002:a05:6000:18a1:b0:22a:f4c2:c9d3 with SMTP id
 b1-20020a05600018a100b0022af4c2c9d3mr1701627wri.92.1663450274170; 
 Sat, 17 Sep 2022 14:31:14 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a05600c510200b003a5b6086381sm7539198wms.48.2022.09.17.14.31.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Sep 2022 14:31:13 -0700 (PDT)
Message-ID: <0fdefda1-92b0-cbf9-049b-1a4bd4ff2de4@amsat.org>
Date: Sat, 17 Sep 2022 23:31:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH 7/7] .gitlab-ci.d/windows.yml: Test 'make installer' in
 the CI
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Beraldo Leal <bleal@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20220908132817.1831008-1-bmeng.cn@gmail.com>
 <20220908132817.1831008-8-bmeng.cn@gmail.com>
In-Reply-To: <20220908132817.1831008-8-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-3.529,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 8/9/22 15:28, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> Now that we have supported packaging DLLs automatically, let's add
> the 'make installer' in the CI and publish the generated installer
> file as an artifact.
> 
> Increase the job timeout to 90 minutes to accommodate to it.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
>   .gitlab-ci.d/windows.yml | 27 +++++++++++++++++++--------
>   1 file changed, 19 insertions(+), 8 deletions(-)
> 
> diff --git a/.gitlab-ci.d/windows.yml b/.gitlab-ci.d/windows.yml
> index fffb202658..3a94d40e73 100644
> --- a/.gitlab-ci.d/windows.yml
> +++ b/.gitlab-ci.d/windows.yml
> @@ -10,7 +10,7 @@
>         - ${CI_PROJECT_DIR}/msys64/var/cache
>     needs: []
>     stage: build
> -  timeout: 70m
> +  timeout: 90m
>     before_script:
>     - If ( !(Test-Path -Path msys64\var\cache ) ) {
>         mkdir msys64\var\cache
> @@ -28,6 +28,11 @@
>     - .\msys64\usr\bin\bash -lc 'pacman --noconfirm -Syuu'  # Core update
>     - .\msys64\usr\bin\bash -lc 'pacman --noconfirm -Syuu'  # Normal update
>     - taskkill /F /FI "MODULES eq msys-2.0.dll"
> +  artifacts:
> +    name: "$CI_JOB_NAME-$CI_COMMIT_REF_SLUG"
> +    expire_in: 7 days
> +    paths:
> +      - build/qemu-setup*.exe

Do you really want to test this binary? I think the CI is only to test
the installer. This is a stripped down version anyway (./configure
options). If someone want to package/test, this should not be done here
but locally.

However I agree testing the installer doesn't bitrot is helpful, so
*without* the "artifacts" section:

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

