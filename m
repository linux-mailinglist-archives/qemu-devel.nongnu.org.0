Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0BE5EAD77
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 19:02:34 +0200 (CEST)
Received: from localhost ([::1]:60468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocrV3-0000xw-48
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 13:02:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ocqxF-0002si-MY
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 12:27:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ocqxD-0006Yd-2D
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 12:27:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664209654;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dAVQXmZqXnCHyU2Kkc+aMRAEKVx09KkmoHedQqDQggE=;
 b=ZYP7ZtblNdu61j7OxAJRkcnuNYZG0+kb2OvA4qsvtcJ6XhmASnZ386FGIPWNJUpUbv9IFX
 7BYmPrHtpxq44QlV02bEf4mIT9m1LceETAJvValwFiAX5YAsDghiSlsgrJ7s8jDqSPndr4
 dGUz/4bm0uHVOwNXsXAT6Fj5wUGs1D4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-21-jqNs0OUpPYWeUIPuLuNQxw-1; Mon, 26 Sep 2022 12:27:33 -0400
X-MC-Unique: jqNs0OUpPYWeUIPuLuNQxw-1
Received: by mail-wm1-f69.google.com with SMTP id
 r7-20020a1c4407000000b003b3309435a9so6881353wma.6
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 09:27:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=dAVQXmZqXnCHyU2Kkc+aMRAEKVx09KkmoHedQqDQggE=;
 b=8DF1WLNUjqHcPZtDUQZ8Z78mFo/W6PvnmsUzYS8mwkjzSZSq4G2S1w5z6wk4q2Z/mN
 4r4bmDwsd1/qEYG6S06XFk8m1svKQiyMWfSOdikzzH6JBUnm2fjv5XDtkDmgf/znb7oF
 yvRunmu9BYQmTH5g9e9802PMbEyFwsHZuTR1nWnGu1f1I0TtvLevFjFSkwA7NFSkldmn
 6PZGas7Vc/u+/wJ9t87LpJUKRFCXCQZ3izwQ9zFQQT63YR8RaevjpOf9IZpCEjtvD3bT
 GCHak9vF9XpK18j884vC6F/IncmjL1anB8tB5PeTiGF+L9Pj5q6L9cfDd/tkkLTr6iLN
 hEgw==
X-Gm-Message-State: ACrzQf0Fw7/PvHQn3p+ZBBqbtiF3PYsZ+1mVmzlrwcegbfTPDtu87fHZ
 iE3NiwCTzL6CQPb5XAy3Gx4tqSlZc809LZLWqrsGGTqOYRYgBuUdzoo92FJCiWlw3adFpeXOfpT
 ag8rTI2+rQyxZFa8=
X-Received: by 2002:a05:600c:594:b0:3b4:7637:9444 with SMTP id
 o20-20020a05600c059400b003b476379444mr23176146wmd.52.1664209650721; 
 Mon, 26 Sep 2022 09:27:30 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5n+dLn7nXpxynmMysvd9B2mAQ/4qcI4Ige4IZ0JCEnbQ0ziJgARlqiXH9vNh0vKcpSuqDFFQ==
X-Received: by 2002:a05:600c:594:b0:3b4:7637:9444 with SMTP id
 o20-20020a05600c059400b003b476379444mr23176125wmd.52.1664209650440; 
 Mon, 26 Sep 2022 09:27:30 -0700 (PDT)
Received: from [192.168.8.103] (tmo-064-141.customers.d1-online.com.
 [80.187.64.141]) by smtp.gmail.com with ESMTPSA id
 r21-20020a05600c425500b003b47e8a5d22sm11165780wmm.23.2022.09.26.09.27.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Sep 2022 09:27:29 -0700 (PDT)
Message-ID: <78b949b4-509a-1989-89f4-c51daa18df5e@redhat.com>
Date: Mon, 26 Sep 2022 18:27:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PULL 04/30] tests/avocado: add explicit timeout for s390 TCG
 tests
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: stefanha@redhat.com, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 "open list:S390 general arch..." <qemu-s390x@nongnu.org>
References: <20220920171533.1098094-1-alex.bennee@linaro.org>
 <20220920171533.1098094-5-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220920171533.1098094-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.319, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On 20/09/2022 19.15, Alex Bennée wrote:
> We don't want to rely on the soon to be reduced default time. These
> tests are still slow for something we want to run in CI though.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Message-Id: <20220914155950.804707-5-alex.bennee@linaro.org>
> 
> diff --git a/tests/avocado/boot_linux.py b/tests/avocado/boot_linux.py
> index 67a24fe51c..4f07c27ac6 100644
> --- a/tests/avocado/boot_linux.py
> +++ b/tests/avocado/boot_linux.py
> @@ -130,6 +130,8 @@ class BootLinuxS390X(LinuxTest):
>       :avocado: tags=arch:s390x
>       """
>   
> +    timeout = 240
> +
>       @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
>       def test_s390_ccw_virtio_tcg(self):
>           """

I've configured my QEMU with --enable-debug and thus this test takes much 
more time here, ca. 550 seconds, so it's currently failing...
Should we maybe scale the timeout values if --enable-debug is enabled?

  Thomas


