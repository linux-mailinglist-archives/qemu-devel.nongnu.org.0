Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8524635B6D
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 12:17:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxnjv-0000FS-3Y; Wed, 23 Nov 2022 06:16:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oxnjc-0000ER-NO
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 06:16:08 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oxnjU-0004Fy-LG
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 06:16:08 -0500
Received: by mail-wr1-x436.google.com with SMTP id x17so15419190wrn.6
 for <qemu-devel@nongnu.org>; Wed, 23 Nov 2022 03:15:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YV5GjfqlGMYqnHplbI75uo+sg4za+NNKjasDAwq1fCg=;
 b=Kd/HF14xXMzAbBsh9f6vVapVbS2Nn/uRgVWWzdCSphRnMWIoCLxeB2o6XuR4+HFZXe
 I7gwaehQFk7JROUfoxmFNd5JKyMvNO6F6uw7mwBM3fogD5ELs06u7vpOv5WUuVCalG0U
 Hhl3iwbN0Or2tTTFUufRu1Gm7hy7GvZdlCM4NhasuhFNb0I3hkYKUVUdAkNxZYVUONr7
 VDg/AqD+9u2i/QbgU97zsUxoT0M+w0rD/9JLAxaJJMsAb2IX6fXatJYn0aos+o8Cmd7Z
 hHOgAftUPAurqFo0LaXctKtDCjIXfGzsxTKUgy7FeZcNUAFt6re0kS3Heuh8KOWO50yf
 +ZSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YV5GjfqlGMYqnHplbI75uo+sg4za+NNKjasDAwq1fCg=;
 b=W0PKi55zUcbpi/pDkrJB1A5Mb26T2Nog3t7MeNJINJd3tQ5tFy8rzLm1a8irwma8e7
 Bdmt5G5erSREH2AMhIsnLTpqlgAuP+0ncnoX5A4ZOS2ST4yRrJeiR40l69YT6ewr/1AP
 R5vMKRGevwh0O6UvnVGtu2lRa1xTWhjRRSYqGXVBTk7V4O9dBoscy74UylVEzyU2SJc6
 SvDxy/d9STtmrmQKHH1bLWoJfK9MX7hNaInd31Et8IR04/UhlqJeN6oeCW7p1fGmydV3
 LAlQ8xh2z5qiQb5XfsmeYZpCF61uhbBk9S3dVA/5F3iqGZpgXK+A68vyc6o1nZ8ZyRHB
 tUjw==
X-Gm-Message-State: ANoB5pkJbfs7SmOAjlKMkW1baGDjiPjj7w542+2lSfrV3LLHCbZLMfK/
 bT2wRZKzD1OmKQRKJieyc45nbA==
X-Google-Smtp-Source: AA0mqf5jaTQFrS1ssTI1gKi9rSFsexIy1OUMt2+3fsDxo69koO3EJdo8F58gpgAIHMd81+fc73NcTQ==
X-Received: by 2002:adf:db10:0:b0:236:58c8:2ba2 with SMTP id
 s16-20020adfdb10000000b0023658c82ba2mr16680726wri.224.1669202158559; 
 Wed, 23 Nov 2022 03:15:58 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 o42-20020a05600c512a00b003a3442f1229sm2099959wms.29.2022.11.23.03.15.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Nov 2022 03:15:58 -0800 (PST)
Message-ID: <8c4b6387-450d-88af-c1d4-3171a9c3067b@linaro.org>
Date: Wed, 23 Nov 2022 12:15:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [RFC PATCH] tests/avocado: use new rootfs for orangepi test
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>
Cc: qemu-arm@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20221118113309.1057790-1-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221118113309.1057790-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 18/11/22 12:33, Alex Bennée wrote:
> The old URL wasn't stable. I suspect the current URL will only be
> stable for a few months so maybe we need another strategy for hosting
> rootfs snapshots?
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/avocado/boot_linux_console.py | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
> index 4c9d551f47..5a2923c423 100644
> --- a/tests/avocado/boot_linux_console.py
> +++ b/tests/avocado/boot_linux_console.py
> @@ -793,8 +793,8 @@ def test_arm_orangepi_sd(self):
>           dtb_path = '/usr/lib/linux-image-current-sunxi/sun8i-h3-orangepi-pc.dtb'
>           dtb_path = self.extract_from_deb(deb_path, dtb_path)
>           rootfs_url = ('http://storage.kernelci.org/images/rootfs/buildroot/'
> -                      'kci-2019.02/armel/base/rootfs.ext2.xz')
> -        rootfs_hash = '692510cb625efda31640d1de0a8d60e26040f061'
> +                      'buildroot-baseline/20221116.0/armel/rootfs.ext2.xz')
> +        rootfs_hash = 'fae32f337c7b87547b10f42599acf109da8b6d9a'
If Avocado doesn't find an artifact in its local cache, it will fetch it
from the URL.
The cache might be populated with artifacts previously downloaded, but
their URL is not valid anymore (my case for many tests).
We can also add artifacts manually, see [1].

I'd rather keep pre-existing tests if possible, to test older (kernel / 
user-space) images. We don't need to run all the tests all the time:
tests can be filtered by tags (see [2]).

My preference here is to refactor this test, adding the "kci-2019.02"
and "baseline-20221116.0" releases. I can prepare the patch if you /
Thomas don't object.

Regards,

Phil.

[1] 
https://avocado-framework.readthedocs.io/en/latest/guides/user/chapters/assets.html#registering-assets
[2] 
https://avocado-framework.readthedocs.io/en/latest/guides/user/chapters/tags.html#filtering-tests-by-tags

