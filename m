Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69EE948381D
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 21:57:49 +0100 (CET)
Received: from localhost ([::1]:39956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4UOq-0006Uy-Hs
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 15:57:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n4UNz-0005nt-Az
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 15:56:55 -0500
Received: from [2a00:1450:4864:20::42a] (port=37397
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n4UNx-0002rN-DQ
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 15:56:55 -0500
Received: by mail-wr1-x42a.google.com with SMTP id t26so72029800wrb.4
 for <qemu-devel@nongnu.org>; Mon, 03 Jan 2022 12:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YOGPTCqsGe0RvAC1N3hJM5+buBZxUjuBMLPC7Y8VPYw=;
 b=GrqDKXHOUI+bwyvi23QbCvxoboH8F14XY2goZpl/WkrfACnRX2WhJgOWhVO19UtjQz
 zgSa6tl83aFb7nPmGcjaOSHdNnD2bjHKJFJGwr9pDsfMa3TVvjULqRXMv8FXORgaT+UC
 WwyR677GWTVdAlbmX3ZgHphyUoUr4I6NLEDYihvN07CG3joumClo25JTmj6DtZDqIFhN
 rNsPiK1kX2Le+45LlWIHnmzfLMdE24KjjAFvcFKSyPTqxeHQYXdG4i5q86XdwH2UdLEg
 4+y8ay9TAZxhvMkHTuDMmvp+YfOIXMf0Wz1ge7mA1TUBygHJO8qPtNeYwQD0AUXCGpOD
 ha/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YOGPTCqsGe0RvAC1N3hJM5+buBZxUjuBMLPC7Y8VPYw=;
 b=4hnySfTLcbo1R5kP09bSlTggoGO6unRSuDpianIf9i+ZJvzbJzXQReINvYJLzJDfTk
 qVULtxniYV0Re+pY6oK5bL5c/dd1VFG0nLkBMRZj0yuWr9juplsk9+fH5zijMbFAzJk3
 GyG4xgSZtvZ1x4EeUlcbQ4s+0R/RVP9Ym5K0Ja8jIpTdQlScpPUupfA9DiTPclMxBIlo
 soQyFTVO73wkSoI59vmOgRy/3h2l+ceAtxLF2miwA+8shINo7z8evTB39cqksCR/i3G8
 ZWslOa3RQsd73GyrkWeP3RN6/VqemVyPFHsVcp1dW3SFhhlEnF1hC5Q0eo44jd0IfBa/
 P1cw==
X-Gm-Message-State: AOAM530DeSWAwJyRh+enbxFgMJWk84ElkhdUFVy4gLN5xkgdPqd/i/oy
 +T55RskuPoLmovjN3pms+aw=
X-Google-Smtp-Source: ABdhPJzQFXdkzQqXG8UCUwJnfE2UuHWMhFZqjg9opHIZwhOeP/VbpwepoDgtdeREDAUNJ0HoGwC8oQ==
X-Received: by 2002:adf:df8f:: with SMTP id z15mr31552886wrl.413.1641243411893; 
 Mon, 03 Jan 2022 12:56:51 -0800 (PST)
Received: from [192.168.1.37] (26.red-83-50-86.dynamicip.rima-tde.net.
 [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id l26sm35324243wrz.44.2022.01.03.12.56.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jan 2022 12:56:51 -0800 (PST)
Message-ID: <ca12e6d4-f439-4ee7-b4b2-6e72bd4922db@amsat.org>
Date: Mon, 3 Jan 2022 21:56:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: [PATCH] FreeBSD: Upgrade to 12.3 release
Content-Language: en-US
To: Brad Smith <brad@comstyle.com>, qemu-devel@nongnu.org,
 Thomas Huth <thuth@redhat.com>,
 WainerdosSantosMoschetta@humpty.home.comstyle.com,
 Beraldo Leal <bleal@redhat.com>, Alex Benn_e <alex.bennee@linaro.org>
References: <YdNgg/FI6LdYmDJ5@humpty.home.comstyle.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <YdNgg/FI6LdYmDJ5@humpty.home.comstyle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-3.354,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/1/22 21:45, Brad Smith wrote:
> FreeBSD: Upgrade to 12.3 release

Maybe some mention like:

'''
Note, since libasn1 got fixed in 12.3 [*], this commit re-enables GNUTLS.

[*]
https://gitlab.com/gnutls/libtasn1/-/merge_requests/71
'''

> Signed-off-by: Brad Smith <brad@comstyle.com>
> Tested-by: Thomas Huth <thuth@redhat.com>
> ---
>   .gitlab-ci.d/cirrus.yml | 5 +----
>   tests/vm/freebsd        | 8 +++-----
>   2 files changed, 4 insertions(+), 9 deletions(-)
> 
> diff --git a/.gitlab-ci.d/cirrus.yml b/.gitlab-ci.d/cirrus.yml
> index d273a9e713..18ded37c77 100644
> --- a/.gitlab-ci.d/cirrus.yml
> +++ b/.gitlab-ci.d/cirrus.yml
> @@ -52,14 +52,11 @@ x64-freebsd-12-build:
>       NAME: freebsd-12
>       CIRRUS_VM_INSTANCE_TYPE: freebsd_instance
>       CIRRUS_VM_IMAGE_SELECTOR: image_family
> -    CIRRUS_VM_IMAGE_NAME: freebsd-12-2
> +    CIRRUS_VM_IMAGE_NAME: freebsd-12-3
>       CIRRUS_VM_CPUS: 8
>       CIRRUS_VM_RAM: 8G
>       UPDATE_COMMAND: pkg update
>       INSTALL_COMMAND: pkg install -y
> -    # TODO: Enable gnutls again once FreeBSD's libtasn1 got fixed
> -    # See: https://gitlab.com/gnutls/libtasn1/-/merge_requests/71
> -    CONFIGURE_ARGS: --disable-gnutls
>       TEST_TARGETS: check
>   
>   x64-freebsd-13-build:
> diff --git a/tests/vm/freebsd b/tests/vm/freebsd
> index 6e20e84322..805db759d6 100755
> --- a/tests/vm/freebsd
> +++ b/tests/vm/freebsd
> @@ -28,8 +28,8 @@ class FreeBSDVM(basevm.BaseVM):
>       name = "freebsd"
>       arch = "x86_64"
>   https://gitlab.com/gnutls/libtasn1/-/merge_requests/71
> -    link = "https://download.freebsd.org/ftp/releases/ISO-IMAGES/12.2/FreeBSD-12.2-RELEASE-amd64-disc1.iso.xz"
> -    csum = "a4530246cafbf1dd42a9bd3ea441ca9a78a6a0cd070278cbdf63f3a6f803ecae"
> +    link = "https://download.freebsd.org/ftp/releases/ISO-IMAGES/12.3/FreeBSD-12.3-RELEASE-amd64-disc1.iso.xz"
> +    csum = "36dd0de50f1fe5f0a88e181e94657656de26fb64254412f74e80e128e8b938b4"
>       size = "20G"
>       pkgs = [
>           # build tools
> @@ -65,8 +65,6 @@ class FreeBSDVM(basevm.BaseVM):
>           "zstd",
>       ]
>   
> -    # TODO: Enable gnutls again once FreeBSD's libtasn1 got fixed
> -    # See: https://gitlab.com/gnutls/libtasn1/-/merge_requests/71
>       BUILD_SCRIPT = """
>           set -e;
>           rm -rf /home/qemu/qemu-test.*
> @@ -74,7 +72,7 @@ class FreeBSDVM(basevm.BaseVM):
>           mkdir src build; cd src;
>           tar -xf /dev/vtbd1;
>           cd ../build
> -        ../src/configure --python=python3.7 --disable-gnutls {configure_opts};
> +        ../src/configure --python=python3.7 {configure_opts};
>           gmake --output-sync -j{jobs} {target} {verbose};
>       """
>   


