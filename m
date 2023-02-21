Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB4969DBB9
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 09:16:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUNo3-0001iQ-Oz; Tue, 21 Feb 2023 03:15:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUNo1-0001i1-4o
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 03:15:21 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUNnz-0005A6-7L
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 03:15:20 -0500
Received: by mail-wr1-x42e.google.com with SMTP id l1so3152400wry.10
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 00:15:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GkdvSA3B9MAnPlexsirleT3iFcjOsfVMyKUcJWwnC8M=;
 b=sJS0j/IssJf9c8Evb/Zw3hc/dFqtgDJWCZEyoOp/sKEeER3oUGIE1WVgrLMP8tneYd
 SEYRU5FHQiTjj4W/qZUn6hhMMeRKRDNRR0NMFsMuR27a9uB9XMJd57oDanb+xiQwrtS3
 ECEUqhu7Xs3FHir/SVCGqHVLO51BzDQY5XY+MdTlgrsGKbO0WU3jWsqq1tAxJXOyNMht
 QE7t6+Fg83llxIbjmpXX9S82rtT3gUgUJDNm7fDGfbRDz1Wn2zVg26Q0NiiRPXrb5nSj
 T+VcWpRCmSGskOKmKibNL2Su2aG51wMw7Pkbb2CuMrfSxRJiosPRMXhqNRg98un+d386
 Xohg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GkdvSA3B9MAnPlexsirleT3iFcjOsfVMyKUcJWwnC8M=;
 b=fpu0yd36E23prvxPr5B4tcaRG0cDYkdsW9JwX4HGQYCmYxUfWqq29KAx5CupiX6N22
 d3c0z6MUGXgf1If6rBNdfKAE5CFOAFidhpOW0Z7ksIoKw/1WWhfxZT2nTot9TD0pkc5q
 nkpSFwHIfOh5TThEqmhUJbhSAIy52LdSVYlGZVRsmabjxX9veXIXH29GTyMlXz/qKLAm
 Rz3b8QBPOLbGRNSUkdPbupUCjNQXmfDUUCi/3BfKgJKWLNZ3zFaSVJleuWfrOj2rg+4H
 rfMROWOTWSn/tjkTB/svpLZRt6EP53Kw3272AyboyUOvf4Qel/XQgRpaUFqwKmCwn2F/
 aP9w==
X-Gm-Message-State: AO0yUKXe328YZfSSkuEMRH0e0B5l7X4IgP5z+J/U3jKdcFJ3jFksR7M4
 grcCK4jNOaPloRycliPaGAZV6A==
X-Google-Smtp-Source: AK7set8g/mswbfCHTuRovYIEty0LKPSErInxYTatOdxzFTsC7uDRrb8fQhQC1Fn7BK+4HJ0uZgIqjA==
X-Received: by 2002:a5d:4d87:0:b0:2c4:80a:e852 with SMTP id
 b7-20020a5d4d87000000b002c4080ae852mr4388686wru.65.1676967317405; 
 Tue, 21 Feb 2023 00:15:17 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 m2-20020a05600c3b0200b003e204158ac7sm14901799wms.47.2023.02.21.00.15.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 00:15:16 -0800 (PST)
Message-ID: <790be50d-9a52-6f92-f053-ee9a4eec0a31@linaro.org>
Date: Tue, 21 Feb 2023 09:15:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] qga/win32: Remove change action from MSI installer
Content-Language: en-US
To: Konstantin Kostiuk <kkostiuk@redhat.com>, qemu-devel@nongnu.org,
 Bin Meng <bin.meng@windriver.com>, Stefan Weil <sw@weilnetz.de>,
 Yonggang Luo <luoyonggang@gmail.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Yan Vugenfirer <yvugenfi@redhat.com>,
 Evgeny Iakovlev <eiakovlev@linux.microsoft.com>,
 Andrey Drobyshev <andrey.drobyshev@virtuozzo.com>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>
References: <20230220174142.240393-1-kkostiuk@redhat.com>
 <20230220174142.240393-2-kkostiuk@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230220174142.240393-2-kkostiuk@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 20/2/23 18:41, Konstantin Kostiuk wrote:
> resolves: rhbz#2167436

"You are not authorized to access bug #2167436."

> fixes: CVE-2023-0664

This commit description is rather scarce...

I understand you are trying to fix a CVE, but we shouldn't play
the "security by obscurity" card. How can the community and
distributions know this security fix is enough with the bare
"Remove change action from MSI installer" justification?
Can't we do better?

> Signed-off-by: Konstantin Kostiuk <kkostiuk@redhat.com>
> ---
>   qga/installer/qemu-ga.wxs | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/qga/installer/qemu-ga.wxs b/qga/installer/qemu-ga.wxs
> index 51340f7ecc..feb629ec47 100644
> --- a/qga/installer/qemu-ga.wxs
> +++ b/qga/installer/qemu-ga.wxs
> @@ -31,6 +31,7 @@
>         />
>       <Media Id="1" Cabinet="qemu_ga.$(var.QEMU_GA_VERSION).cab" EmbedCab="yes" />
>       <Property Id="WHSLogo">1</Property>
> +    <Property Id="ARPNOMODIFY" Value="yes" Secure="yes" />
>       <MajorUpgrade
>         DowngradeErrorMessage="Error: A newer version of QEMU guest agent is already installed."
>         />
> --
> 2.25.1
> 
> 


