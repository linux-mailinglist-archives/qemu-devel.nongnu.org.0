Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CED4E50FF
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 12:07:09 +0100 (CET)
Received: from localhost ([::1]:42084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWypY-0005PO-G3
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 07:07:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nWyeP-000451-9N; Wed, 23 Mar 2022 06:55:40 -0400
Received: from [2a00:1450:4864:20::32a] (port=44951
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nWyeN-00027w-Ix; Wed, 23 Mar 2022 06:55:37 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 bg31-20020a05600c3c9f00b00381590dbb33so701975wmb.3; 
 Wed, 23 Mar 2022 03:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=lME5d4aV9ZX4MLs/VOansnemt5E+4igMNrwqGAcIRz4=;
 b=hR+JUTvZvMwznpTAGr9KHOykgSHUv7j3IJqjzC/NIKBmbWSM8Yd3Wu/ksJ1ZeY0xaJ
 e0asVPl8FE341H2IQG6odEEH2wOzfRqvjQbiBEm0FdWoghFvrP2wzk/Z16oXY2JK62Dr
 8Xo5mzotHcEzmFB//NKSFhRToaw1uW+UPZuAGpXmiNVNSaMZmH051jfsbCQOO6fUzKcO
 n9Zg69lZ3jMMd2FcfHBxGa4C4kcCWFNCY6xVY2WnxRm4X2oPmv1rYc3aOXflyUVI5nwd
 R5m3xU76qj3VXT5rYS4L4eK6Gq/lL/YVyAUj3sAAritYeK4KykZdme4087mfjCttmGlz
 URwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lME5d4aV9ZX4MLs/VOansnemt5E+4igMNrwqGAcIRz4=;
 b=ncLvgBb//sN2La7gqd7caxpM4+lWsOrMznVWKo5xtfdpVP93I4ZBWd96QGinIWVzoU
 Pvn01GmF+jRSD2gL7vLdb1kU/WhqS0IENW5D747VQAsEgEwzgUEu+SjSzxh+1i5N8lrI
 VMix8iE52IvEC9Q0FB7ydMDZBNOimg+BM296e1u+0A11lRfRmw9jjYovYNEiCvaBXlIO
 jq5c8Wt4jRgQtyj/v2idHFIZXS1pkgtjfB1V/xitj+BPCQthEXKVGjEkOVsMk7yj3rlY
 8XPIVZ6V5nqUr6BIzxotRL0M0ox/bDbwZiEZxof4W15QhGjM6WQ0UMwhvpHalxoe4wVT
 EfVw==
X-Gm-Message-State: AOAM533Qg4FX1VeXpsS4D/dOyqRgH9JxE47VepFwXEu98WnmI7oCZOBk
 rW3yO86ECyxHfR0LGUmG200=
X-Google-Smtp-Source: ABdhPJx5XXRD+X/5aiCZlIs/Ayd/jd5ySLo0EMIIoQQuHVvmqQZfmhO4sPIHR0mAIJlJVYhxaHXj/w==
X-Received: by 2002:a1c:4e01:0:b0:38c:b316:e6f5 with SMTP id
 g1-20020a1c4e01000000b0038cb316e6f5mr8514456wmh.93.1648032933841; 
 Wed, 23 Mar 2022 03:55:33 -0700 (PDT)
Received: from [192.168.1.33] (198.red-83-50-65.dynamicip.rima-tde.net.
 [83.50.65.198]) by smtp.gmail.com with ESMTPSA id
 j16-20020a05600c191000b0038c9249ffdesm4593716wmq.9.2022.03.23.03.55.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Mar 2022 03:55:33 -0700 (PDT)
Message-ID: <8b0f1662-5b44-d057-362b-db59cf595c94@gmail.com>
Date: Wed, 23 Mar 2022 11:55:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v3 3/3] misc: Fixes MAINTAINERS's path
 .github/workflows/lockdown.yml
Content-Language: en-US
To: Yonggang Luo <luoyonggang@gmail.com>, QEMU Devel <qemu-devel@nongnu.org>
References: <20220323080755.156-1-luoyonggang@gmail.com>
 <20220323080755.156-4-luoyonggang@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220323080755.156-4-luoyonggang@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=d0=b8?= =?UTF-8?B?0LY=?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5u0LjQtmU=?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/3/22 09:07, Yonggang Luo wrote:
> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> ---
>   MAINTAINERS | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 01d2ce93bd..0e93d02c7e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3615,7 +3615,7 @@ M: Thomas Huth <thuth@redhat.com>
>   R: Wainer dos Santos Moschetta <wainersm@redhat.com>
>   R: Beraldo Leal <bleal@redhat.com>
>   S: Maintained
> -F: .github/lockdown.yml
> +F: .github/workflows/lockdown.yml
>   F: .gitlab-ci.yml
>   F: .gitlab-ci.d/
>   F: .travis.yml

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

