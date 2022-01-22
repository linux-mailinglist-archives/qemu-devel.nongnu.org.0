Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E47F9496B90
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Jan 2022 10:48:23 +0100 (CET)
Received: from localhost ([::1]:53574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBD0Q-0007mr-MH
	for lists+qemu-devel@lfdr.de; Sat, 22 Jan 2022 04:48:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nBCzQ-0006ym-AE
 for qemu-devel@nongnu.org; Sat, 22 Jan 2022 04:47:20 -0500
Received: from [2607:f8b0:4864:20::631] (port=34668
 helo=mail-pl1-x631.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nBCzO-0008To-Pi
 for qemu-devel@nongnu.org; Sat, 22 Jan 2022 04:47:19 -0500
Received: by mail-pl1-x631.google.com with SMTP id l17so4722590plg.1
 for <qemu-devel@nongnu.org>; Sat, 22 Jan 2022 01:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8G9Ipw+VkmChINy5RB4CIH/55NG3DhD/hy6bw2I2M7U=;
 b=OXgWtIhIK6OHbl8iOWCYMdDsHtYMAR1Jixh5jPqUSUNN0gLEt1AY6A5NxiBZLdykAq
 1gtaz/g/Dww5dKdb1pORHjOfo1qx37OWgPi1giHcMk82qSX+57dgPP+30WEk89mm7FVg
 7YBxaVknNMD+CnnpbX8HeYPkR6N3ROG6FitHPTUqyBWZlaXIEIoIu3qCCWFPljAxDbiy
 HZm6sEUdwF1Wk3V/k+8vEvyxIp9czbw0MhfpBJxoXbECX+aNBSuhartkL4+IwSy170Wg
 +DZjotbWKcpmoEE6lbcI7Bub3fflkCTCCGezQgVx9o86f7Jcev0acuW3uxNiTWxdThp1
 /ssw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8G9Ipw+VkmChINy5RB4CIH/55NG3DhD/hy6bw2I2M7U=;
 b=ij2kuR4KhjF1dP9cT29rZdjKD/uxE5j6hDBdnKsii861spM3EGS5P09ytKBGmJrElh
 b4QItdKF9OuOyoc7UANwnNnfe7qYRlfpJl/GJDPJC5rza+xRq2hWWzd+I6AUv1eDSf6x
 8A49VBiacvd/JeJ6uw5tbL/KlJHvR9Gtr5qp7EKW9DoEVYjPnW4JECcaZOSSJJFHRcgD
 C2W07BaIX3be2PQ521LvNZXj7zYU3Ks52OSpxl1wHaH6jj5G00Nxb/usSg8kNzFqNaLZ
 UEl6ZeS1QnVyTsruh/nNsZZWUucc2ySBG4CWxkq0ol63QlRxC75ohlQ1zqFrd6lndCEC
 2lOw==
X-Gm-Message-State: AOAM531XtNc/MruPTeAA3HXLJfWyiYQvDW04FAcNLSYSwPuPxfYQ3xAh
 +/fNgRhPzUXTsJ2xSvhAKcg=
X-Google-Smtp-Source: ABdhPJwMwsh6xmTlSrM/TvjP0/qJv2cAfy4UzD1mfALCw8GR9To8DbNtMQkg/3h8CwZ38KylOKaSvA==
X-Received: by 2002:a17:903:2448:b0:14b:1d14:8ddb with SMTP id
 l8-20020a170903244800b0014b1d148ddbmr6368228pls.147.1642844837509; 
 Sat, 22 Jan 2022 01:47:17 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id u8sm10084628pfk.88.2022.01.22.01.47.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Jan 2022 01:47:17 -0800 (PST)
Message-ID: <a79c92dc-dc6c-0c26-f3f8-c10d8d32b787@amsat.org>
Date: Sat, 22 Jan 2022 10:47:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH] configure: fix parameter expansion of --cross-cc-cflags
 options
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, thuth@redhat.com, richard.henderson@linaro.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20220120173142.2755077-1-matheus.ferst@eldorado.org.br>
In-Reply-To: <20220120173142.2755077-1-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::631
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x631.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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

On 20/1/22 18:31, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
> 
> Without this fix, any use of --cross-cc-cflags-* causes a message like:
> $ ../configure --cross-cc-ppc64le=clang --cross-cc-cflags-ppc64le="-target powerpc64le-unknown-linux-gnu -sysroot ..."
> ../configure: 1: eval: cross_cc_cflags_--cross-cc-cflags-ppc64le=-target: not found
> ../configure: 3816: export: cross_cc_cflags_--cross-cc-cflags-ppc64le: bad variable name
> 
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
> ---
>   configure | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configure b/configure
> index e1a31fb332..4735c1bffc 100755
> --- a/configure
> +++ b/configure
> @@ -402,7 +402,7 @@ for opt do
>     ;;
>     --cross-cc-*[!a-zA-Z0-9_-]*=*) error_exit "Passed bad --cross-cc-FOO option"
>     ;;
> -  --cross-cc-cflags-*) cc_arch=${opt#--cross-cc-flags-}; cc_arch=${cc_arch%%=*}
> +  --cross-cc-cflags-*) cc_arch=${opt#--cross-cc-cflags-}; cc_arch=${cc_arch%%=*}
>                         eval "cross_cc_cflags_${cc_arch}=\$optarg"
>                         cross_cc_vars="$cross_cc_vars cross_cc_cflags_${cc_arch}"
>     ;;

Commit d422b2bc23 subject is "configure: allow user to specify
--cross-cc-cflags-foo=" but then documented "--cross-cc-flags":

$ git grep cc-flag
configure:409:  --cross-cc-cflags-*) cc_arch=${opt#--cross-cc-flags-}; 
cc_arch=${cc_arch%%=*}
configure:1338:  --cross-cc-flags-ARCH=   use compiler flags when 
building ARCH guest tests
docs/devel/testing.rst:1327:There is also a ``--cross-cc-flags-ARCH`` 
flag in case additional

$  git grep cross.*flag
configure:409:  --cross-cc-cflags-*) cc_arch=${opt#--cross-cc-flags-}; 
cc_arch=${cc_arch%%=*}
configure:410:                      eval 
"cross_cc_cflags_${cc_arch}=\$optarg"
configure:411:                      cross_cc_vars="$cross_cc_vars 
cross_cc_cflags_${cc_arch}"
configure:1338:  --cross-cc-flags-ARCH=   use compiler flags when 
building ARCH guest tests
docs/devel/testing.rst:1327:There is also a ``--cross-cc-flags-ARCH`` 
flag in case additional
tests/tcg/configure.sh:48:: ${cross_cc_cflags_aarch64_be="-mbig-endian"}
tests/tcg/configure.sh:51:: ${cross_cc_cflags_armeb="-mbig-endian"}
tests/tcg/configure.sh:53:: ${cross_cc_cflags_hexagon="-mv67 -O2 -static"}
tests/tcg/configure.sh:56:: ${cross_cc_cflags_i386="-m32"}
tests/tcg/configure.sh:65:: ${cross_cc_cflags_ppc="-m32"}
tests/tcg/configure.sh:67:: ${cross_cc_cflags_ppc64="-m64 -mbig"}
tests/tcg/configure.sh:69:: ${cross_cc_cflags_ppc64le="-m64 -mlittle"}
tests/tcg/configure.sh:73:: ${cross_cc_cflags_sparc="-m32 -mv8plus 
-mcpu=ultrasparc"}
tests/tcg/configure.sh:75:: ${cross_cc_cflags_sparc64="-m64 
-mcpu=ultrasparc"}
tests/tcg/configure.sh:77:: ${cross_cc_cflags_x86_64="-m64"}
tests/tcg/configure.sh:244:  eval 
"target_compiler_cflags=\${cross_cc_cflags_$arch}"

OK, 'cflags' wins over 'flags'.

I agree this requires cleanup, but all occurrences need to be updated.

Please Cc Alex in v2, and add:
Fixes: d422b2bc23 ("configure: allow user to specify 
--cross-cc-cflags-foo=")

Thanks,

Phil.

