Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70495652E1E
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 09:55:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7usB-0003Zk-UY; Wed, 21 Dec 2022 03:54:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7us8-0003ZD-JF
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 03:54:44 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7us6-00076e-Oo
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 03:54:44 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 f13-20020a1cc90d000000b003d08c4cf679so915935wmb.5
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 00:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1jAca+F3n/vRqvxczykWrkukpogBNLZO5L1OWv/O9tU=;
 b=jvN8VzKy2X58jPvD3LoI5ys71g5v7RKgREaVFQqhswweO/mf3CysLYfbR8rg0Bsg60
 4T80gUnW0EPZmkLd8g5omMRnLHVLVC1yor4bF1JDfuvsfb1dTQum7VbM0K02ScjmxLPl
 94/kaU7Ac1EnbeCjoDnE/892loETN4Ct/ICazqHzDL9EgTGTeIzLT97JtXMc8dmqr10+
 eSm87bd7jzVf9uWjJU9nspjllAZ5HTKEeCY3gNN4zueHJGUHu4c24Hm5/nMqgHLaxuLN
 cE8907EzSHiHrcTI0qHlHz4JfVWqsAlvAmSdVlNWTZp6FbmCHb+cskkASesAw7F1niXY
 dz5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1jAca+F3n/vRqvxczykWrkukpogBNLZO5L1OWv/O9tU=;
 b=DJbBeYa83w+dDOQ83pfTZRv1/N+kfn+UJJHY6PHXpvP5az1zkBNDi3cV9OtVcCKz9L
 gcakVwkFXtcMGLFMu/OFbUeADoVHiJqTif5CwXuSVQZohEFIoT0XFUYTA9S8/o6Xbdd3
 OaLy6aRbEKIbxNTEJnwFDeJif4MGL3/aB7CRDe2fIFZhcOVgLAUTud13jIcC6OuV5bEV
 yWCgxWdMD4Y8CD0QugUApsomPJro49/XyzIe+0l2BQmc8nQ8dYuHqiycpgeXcaPIJ1Ab
 4CTpGICBawY8jTcXHVL3M7hojMN1ia9LO71WXHjd6K48+IrcaXYt83y0qtrpJFh5Ex90
 N+eQ==
X-Gm-Message-State: AFqh2krki52jpi94yFGukDD0t7sPnIvAUXC5EjZ2PLGoNqabXhiFUQW9
 N6dcJG+TsHyflgo6BYsEuCYcAw==
X-Google-Smtp-Source: AMrXdXsXolJmrnQNJ6/REejMMaHmtHsQnhmsVlAajCd+NzFluEyTA2uqP7yXTm3Fsia/lX2JkmS1IA==
X-Received: by 2002:a05:600c:601e:b0:3d0:7fee:8a70 with SMTP id
 az30-20020a05600c601e00b003d07fee8a70mr1174671wmb.19.1671612881406; 
 Wed, 21 Dec 2022 00:54:41 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 l6-20020a05600c4f0600b003d351a9db76sm1612888wmq.30.2022.12.21.00.54.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Dec 2022 00:54:41 -0800 (PST)
Message-ID: <d379c4e0-508b-c801-2ce7-2c274b1d2d99@linaro.org>
Date: Wed, 21 Dec 2022 09:54:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [[PATCH]--edit 4/6] tests/tcg: fix unused variable in linux-test
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, stefanha@redhat.com,
 crosa@redhat.com, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20221221074252.1962896-1-alex.bennee@linaro.org>
 <20221221074252.1962896-5-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221221074252.1962896-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.161,
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

On 21/12/22 08:42, Alex Bennée wrote:
> The latest hexagon compiler picks up that we never consume wcount.
> Given the name of the #define that rcount checks against is WCOUNT_MAX
> I figured the check just got missed.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/tcg/multiarch/linux/linux-test.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


