Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B9C66B9A9
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 10:00:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHLLU-0000cZ-Op; Mon, 16 Jan 2023 04:00:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHLLT-0000c5-0a
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 03:59:59 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHLLR-00088D-7k
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 03:59:58 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 f25-20020a1c6a19000000b003da221fbf48so5275055wmc.1
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 00:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=si+NJhd7MlpxYIWvo5U8SpsQ7cE6BXqtIKEak8ZDeaw=;
 b=W+KkcyFVxCWJc/BDN8r8BkvZF956U1VQJuhVAhdMEP2DwGUZHV5GHbkgMlrpcIU6c3
 kuQZxazgxwIS0soQ4DvQMuccjDcncvq6FD0te9t0uKRxRORInhBNiSx/oxRAmuv3huUm
 QyGfLnojzswUG44w0FYzQb17Pb5IRx4JE+hXsxEaPdrrbv/lTV31hueJM+BNx7zXlwWU
 7kAFZgTRcUVLcaHnrJy5cxMQV7hBcu1N0cXX5XDHbFByOF+J1zPZqcv352c20GH90uoA
 Qr+lu3Erj6voNcsQ1nLgL4jVXrXmxkr8hCVIsuBUBgNIsLTINE1PsDugPsIZr/ms9C8g
 uKXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=si+NJhd7MlpxYIWvo5U8SpsQ7cE6BXqtIKEak8ZDeaw=;
 b=lEtHXW8zldyF4XbSx2w2lb7bhNx5D/K8nL+uuriBiUMHX8CFUh72c4pKFhcwQJSiCe
 ZeTFrFTLyRguodYxC0EgC6n9dQX+O4Nt0XYxaGdDZqKdvxMEXkVewjxxgsIvFo25KrJA
 Lz8wuniYurZpE+XtEHugrND1eNGojg+8X/1uKlnYhygcH0vjoWmWEwLZ99OZS2hCUhTz
 K6oO+Lz+HGle17PlOgOUnMJXmG7t89bkxZzteErmjKBlX1RLHr2nsyZ8nsSymCEbDtjd
 O/g4RJhqTh7yjarb2oON5DwGevMqfMwSRb9VuRwGY0xC27BHClMfdDZ0ptlD69gtpXTf
 1Dzw==
X-Gm-Message-State: AFqh2koClP7vLf5z9Sr5xQJVqy+GWxBrRmRJtiSomJK3HqFkMUSf7zXN
 gY0aj4SADn+xsvfmVDAxfvUoNw==
X-Google-Smtp-Source: AMrXdXtrLyHrTiE4tEmhcFrsCsFCzGebylquUBi9y+mhpdYsP0RU18kcnWWBJ/ncNyWm6eAt2MaX3w==
X-Received: by 2002:a05:600c:510d:b0:3da:f6ae:faa9 with SMTP id
 o13-20020a05600c510d00b003daf6aefaa9mr4063751wms.29.1673859594579; 
 Mon, 16 Jan 2023 00:59:54 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 fl12-20020a05600c0b8c00b003dab40f9eafsm6304392wmb.35.2023.01.16.00.59.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 00:59:54 -0800 (PST)
Message-ID: <64bdeb59-f390-1ab2-e511-63546feeaff1@linaro.org>
Date: Mon, 16 Jan 2023 09:59:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] tests/vm/haiku.x86_64: Update the Haiku VM to Beta 4
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Alexander von Gluck IV <kallisti5@unixzen.com>
References: <20230116083014.55647-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230116083014.55647-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 16/1/23 09:30, Thomas Huth wrote:
> The old Haiku VM based on Beta 3 does not work anymore since it
> fails to install the additional packages now that Beta 4 has been
> released. Thanks to Alexander von Gluck IV for providing a new
> image based on Beta 4, we can now upgrade the test image in our
> QEMU CI, too, to get this working again.
> 
> Note that Haiku Beta 4 apparently finally fixed the issue with
> the enumeration of the virtio-block devices (see the ticket at
> https://dev.haiku-os.org/ticket/16512 ) - the tarball disk can
> now be found at index 1 instead of index 0.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   tests/vm/haiku.x86_64 | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/vm/haiku.x86_64 b/tests/vm/haiku.x86_64
> index 29668bc272..8b0d1b8954 100755
> --- a/tests/vm/haiku.x86_64
> +++ b/tests/vm/haiku.x86_64
> @@ -48,8 +48,8 @@ class HaikuVM(basevm.BaseVM):
>       name = "haiku"
>       arch = "x86_64"
>   
> -    link = "https://app.vagrantup.com/haiku-os/boxes/r1beta3-x86_64/versions/20220216/providers/libvirt.box"
> -    csum = "e67d4aacbcc687013d5cc91990ddd86cc5d70a5d28432ae2691944f8ce5d5041"
> +    link = "https://app.vagrantup.com/haiku-os/boxes/r1beta4-x86_64/versions/20230114/providers/libvirt.box"
> +    csum = "6e72a2a470e03dbc3c5e808664e057bb4022b390dca88e4c7da6188f26f6a3c9"

Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>

To keep builds reproducible I'd rather stick the repo
with the base image used, something like:

  release_tag = 'r1beta4'
  self.ssh_root_check("pkgman drop-repo -y Haiku")
  self.ssh_root_check("pkgman drop-repo -y HaikuPorts")
  self.ssh_root_check(f"pkgman add-repo -y 
https://eu.hpkg.haiku-os.org/haiku/{release_tag}/$(getarch)/current")
  self.ssh_root_check(f"pkgman add-repo -y 
https://eu.hpkg.haiku-os.org/haikuports/{release_tag}/$(getarch)/current")

Note I used ssh_root_check() because the current script failed on a
heavily loaded machine, since ssh_root() doesn't check for failure.

Comments related to pre-existing issue, so:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

I can send my suggestions as followup patches.

Regards,

Phil.

