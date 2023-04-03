Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D40F6D3E80
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 09:57:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjF3y-0001Rt-PX; Mon, 03 Apr 2023 03:57:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pjF3r-0001PO-3J
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 03:57:07 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pjF3o-0004xw-F5
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 03:57:06 -0400
Received: by mail-wm1-x32b.google.com with SMTP id n19so16525619wms.0
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 00:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680508622;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+5CUmS9uiUc6wBzNHLYhRjJc44NvJVtnZp/INg+khjg=;
 b=i1AQXT4BL+dqc5dLPKaW8EoSElLNwlSG6V4yrajIp1XN5B7XhVdHzbasUq3VTI93sK
 R5RXekYcJb1Kg7PdbRRTExfyoGry8/VcNZb1OQJtvmeWcdsnmH2M8lJuJ0Dx16XJ3Vib
 tPj6W8kY/UHsRE2mOhb6X57hiAZ3FZpxV3pfoeURvALctR8mz5cJ3g80CCqowLE8tBaZ
 hJWPRo41nsmqGz+I5QC73Ar6+Y4KsOR54uGF6TIgFj6qgxxJJz9MhWJ6ei1B3/HEvQ8R
 lg2lhuP82+cGMD0nWmAqJUI8Zzvop0/ck/ra+V0zAKz83uQI3gMd+K2nG7WihGRGFGxU
 6VJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680508622;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+5CUmS9uiUc6wBzNHLYhRjJc44NvJVtnZp/INg+khjg=;
 b=cTkuoxOAFLedtvv/qvHBV86jvdnBz9qF8iGxn5cAH8O6iGQHGznHbfekUqnB7Zg16a
 vBpVn3hsY3ZxChrcyij/nmeyAJINk5GYhyCMgdwgC7B3iLPsj0HukK7AArybGSapfN5R
 XL31z1gol3lK6CnxqEtqHY5OfRAXkUBvigQxeNtZzoNweD9FuT4pz2aCT19of13nhdee
 wDaF2TQ28gcbzCDOBtQ+ZDuUkyT9MFRmZ1ss08O4dP+efVX5IlUr0BIcp7QXixmDZOwU
 rsIgn7ruTvJoVSqECm+M2A8XkcqjmoVZfb13pWhDrBWiy/LI6On+FsRHoW7/8fDhriLu
 Gw1A==
X-Gm-Message-State: AO0yUKWmTKhk3jsou/rkNkTEW93zfB2f2Ird7N1FLdjNPQ9KtXsV+cI5
 7NvlDQh5hFhXgdt3GLrkf1X9sg==
X-Google-Smtp-Source: AK7set+mnRoGh33p3jpassjg2zuMAy/tYjGTxDnzolgAcUeGNW4In5cZ/IF0/8d9vW84mvFBQm8O/A==
X-Received: by 2002:a05:600c:2049:b0:3ea:edd7:1f24 with SMTP id
 p9-20020a05600c204900b003eaedd71f24mr25210078wmg.39.1680508621881; 
 Mon, 03 Apr 2023 00:57:01 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 ip21-20020a05600ca69500b003edf2ae2432sm17889718wmb.7.2023.04.03.00.57.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Apr 2023 00:57:01 -0700 (PDT)
Message-ID: <a8ab630d-e807-3928-fd7c-3a57b210fc8d@linaro.org>
Date: Mon, 3 Apr 2023 09:56:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH 03/11] MAINTAINERS: add a section for policy documents
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Warner Losh <imp@bsdimp.com>,
 Ryo ONODERA <ryoon@netbsd.org>, Kevin Wolf <kwolf@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 Kyle Evans <kevans@freebsd.org>, Reinoud Zandijk <reinoud@netbsd.org>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Kashyap Chamarthy <kchamart@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>
References: <20230330101141.30199-1-alex.bennee@linaro.org>
 <20230330101141.30199-4-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230330101141.30199-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.37,
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

On 30/3/23 12:11, Alex Bennée wrote:
> We don't update these often but if you are the sort of person who
> enjoys debating and tuning project policies you could now add yourself
> as a reviewer here so you don't miss the next debate over tabs vs
> spaces ;-)
> 
> Who's with me?
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: Daniel P. Berrangé <berrange@redhat.com>
> Cc: Markus Armbruster <armbru@redhat.com>
> Cc: Kashyap Chamarthy <kchamart@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Philippe Mathieu-Daudé <philmd@linaro.org>
> Cc: Bernhard Beschow <shentey@gmail.com>
> 
> ---
> v2
>    - s/your/you are/
>    - add some willing victims
> ---
>   MAINTAINERS | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9e1a60ea24..2c173dbd96 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -64,6 +64,19 @@ L: qemu-devel@nongnu.org
>   F: *
>   F: */
>   
> +Project policy and developer guides
> +R: Alex Bennée <alex.bennee@linaro.org>
> +R: Daniel P. Berrangé <berrange@redhat.com>
> +R: Thomas Huth <thuth@redhat.com>
> +R: Markus Armbruster <armbru@redhat.com>

Please add me too.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> +W: https://www.qemu.org/docs/master/devel/index.html
> +S: Odd Fixes
> +F: docs/devel/style.rst
> +F: docs/devel/code-of-conduct.rst
> +F: docs/devel/conflict-resolution.rst
> +F: docs/devel/submitting-a-patch.rst
> +F: docs/devel/submitting-a-pull-request.rst
> +
>   Responsible Disclosure, Reporting Security Issues
>   -------------------------------------------------
>   W: https://wiki.qemu.org/SecurityProcess


