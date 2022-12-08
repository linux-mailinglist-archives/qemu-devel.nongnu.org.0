Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5996469DC
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 08:48:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3BdD-0003pF-1O; Thu, 08 Dec 2022 02:47:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3BdB-0003p3-Bh
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 02:47:45 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3Bd9-0000XV-Lm
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 02:47:45 -0500
Received: by mail-wr1-x433.google.com with SMTP id d1so606942wrs.12
 for <qemu-devel@nongnu.org>; Wed, 07 Dec 2022 23:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=asU41KWFukc6qm9y2IancRRq9Rt3a25uzW7Wse5vBow=;
 b=lABDnJvlP1xvvN/nUMGbq/Ax2IyLNEerN64fh7oqZyroHD8Tpu1ZKEqbZKB9qxpLeg
 0cqwDyChYpj1djj43kDii4eXuiGJ06YCCKhtypTV7zm/fmJgEcd35LqIHyPAyiOg1JN3
 j8jLLPftXIF5vZeXl/PNL7CnFhMwSFaJSVhz8SNjKlaR6UYfTTxvg0NBdWPPoiTUM5bQ
 UaBzyd3lpEM+lj8LN//kuAPLpO9HZLuVt0gb/DXHU4ryxdStTDjy6Vl0koWNFRPh0zcM
 jVe4nRl/N+N6GpLFT34kPH3+R9EmkGCQ+Qka0U8D1Mx1SmQ9cKtop5N+f0JSMlNbYtgd
 IdLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=asU41KWFukc6qm9y2IancRRq9Rt3a25uzW7Wse5vBow=;
 b=4GOEQgqZMHSNgck04lqRleDxE0KaoeGWhQuNH0gyTfBT06a5uhypXglIkfyniH8Vqe
 qR7FsXUJT17vzrtwv3sSnadlbPs5bte0LGIoqHeGg7lPWWRKI0wGR0IgnmGri0y5o0Wf
 EgO2trmh5Gzf9OBl+URqLhoRAiVAv+UHP9uhvKW4MA/tFASz87yeu2DFyZWlPu3EMfwS
 WDo9qp5Jy4oxHqhSvq/9KjrrDg10wqrwhgYmItbb/xQoDMe/3S4MAIx55gC79rBHwjFm
 7cEsujlCsOZHHlrSkAxEfvdbETyXlEusVgqnG/hUVUDg6yQvQPDIYOQH7y0SIQ/+IYfW
 7lHA==
X-Gm-Message-State: ANoB5pn/BSX5CRyk0NUO7ZputLoBlfJQNecZyFMltPtOPrqlhXTSgLF0
 1gDfBnCbpr2uF2grG2SpDPIjBw==
X-Google-Smtp-Source: AA0mqf7hIx32Nl+dJ+X7KPdRMtPWHlKu7pdvuj/F/B7hQ6Uu6TKK0rNJ3ZwdowGs1WX/N3bxCOBTuQ==
X-Received: by 2002:a5d:5e8a:0:b0:241:f227:9c2b with SMTP id
 ck10-20020a5d5e8a000000b00241f2279c2bmr40738510wrb.106.1670485660983; 
 Wed, 07 Dec 2022 23:47:40 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 m186-20020a1ca3c3000000b003cff309807esm3996061wme.23.2022.12.07.23.47.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Dec 2022 23:47:40 -0800 (PST)
Message-ID: <ddd4ff9b-7d9a-6f1d-c725-e6fe649188ab@linaro.org>
Date: Thu, 8 Dec 2022 08:47:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH] FreeBSD: Upgrade to 12.4 release
Content-Language: en-US
To: Brad Smith <brad@comstyle.com>, Alex Benn_e <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Ed Maste <emaste@freebsd.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Warner Losh <imp@bsdimp.com>,
 Kyle Evans <kevans@freebsd.org>, Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org
References: <Y5GJpW/1s+NEah98@humpty.home.comstyle.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <Y5GJpW/1s+NEah98@humpty.home.comstyle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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

On 8/12/22 07:52, Brad Smith wrote:
> FreeBSD: Upgrade to 12.4 release
> 
> Signed-off-by: Brad Smith <brad@comstyle.com>
> ---
>   .gitlab-ci.d/cirrus.yml | 2 +-
>   tests/vm/freebsd        | 4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/.gitlab-ci.d/cirrus.yml b/.gitlab-ci.d/cirrus.yml
> index 634a73a742..785b163aa6 100644
> --- a/.gitlab-ci.d/cirrus.yml
> +++ b/.gitlab-ci.d/cirrus.yml
> @@ -50,7 +50,7 @@ x64-freebsd-12-build:
>       NAME: freebsd-12
>       CIRRUS_VM_INSTANCE_TYPE: freebsd_instance
>       CIRRUS_VM_IMAGE_SELECTOR: image_family
> -    CIRRUS_VM_IMAGE_NAME: freebsd-12-3
> +    CIRRUS_VM_IMAGE_NAME: freebsd-12-4
>       CIRRUS_VM_CPUS: 8
>       CIRRUS_VM_RAM: 8G
>       UPDATE_COMMAND: pkg update
> diff --git a/tests/vm/freebsd b/tests/vm/freebsd
> index d6ff4461ba..ba2ba23d24 100755
> --- a/tests/vm/freebsd
> +++ b/tests/vm/freebsd
> @@ -28,8 +28,8 @@ class FreeBSDVM(basevm.BaseVM):
>       name = "freebsd"
>       arch = "x86_64"
>   
> -    link = "https://download.freebsd.org/ftp/releases/ISO-IMAGES/12.3/FreeBSD-12.3-RELEASE-amd64-disc1.iso.xz"
> -    csum = "36dd0de50f1fe5f0a88e181e94657656de26fb64254412f74e80e128e8b938b4"
> +    link = "https://download.freebsd.org/ftp/releases/ISO-IMAGES/12.4/FreeBSD-12.4-RELEASE-amd64-disc1.iso.xz"
> +    csum = "1dcf6446e31bf3f81b582e9aba3319a258c29a937a2af6138ee4b181ed719a87"

I don't remember and wonder why we don't use the pre-populated image:
https://download.freebsd.org/ftp/releases/VM-IMAGES/12.4-RELEASE/amd64/Latest/FreeBSD-12.4-RELEASE-amd64.qcow2.xz

Anyhow,

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>


