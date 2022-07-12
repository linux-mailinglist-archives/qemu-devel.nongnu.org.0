Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5E4571115
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 06:07:23 +0200 (CEST)
Received: from localhost ([::1]:40556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oB7BC-0008TP-Gh
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 00:07:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oB73Y-00020m-ED
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 23:59:28 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:42601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oB73T-0007Sb-6y
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 23:59:25 -0400
Received: by mail-pf1-x430.google.com with SMTP id d10so6432921pfd.9
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 20:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=vBntsFNsbTIlGBQ+xO+RK6w54wfmJlSRCmCqNVOtBWw=;
 b=AufB7pZc2cutuIwyYCgxA0zsPmIrxh/tlBl/Gb+AbGm1iVTs5D8suPvWLj1WL1fjFc
 exh9vXtthCpejfmdR/seb6i8Kl28Q8AP+hWCzAduP7iNO0J+cI7NQCvEEKPJC9pftsjK
 SiofGaIah5uh294F+bDJk2S4u3t5gtajHrrJmW/OSF5T+KODjdwCmblb42ZDdmDyOjAU
 +68g7cuEGODssp1GYcO8qZwy63xSBedUqfLqUyZDV5NsBo2spE1h9eP94ndp1AOj/pPw
 c1HqvebjafWw9O9bxOQLlHq0mWA5u3fvZ9dArluZinop/4OcyR2lcrdniPY7CQbuDTfN
 Qw8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vBntsFNsbTIlGBQ+xO+RK6w54wfmJlSRCmCqNVOtBWw=;
 b=Iji9rRBttTE7D8ociQhYokOyGfTPfo7sq+9AvjzRiAdVJHo0wtTLAQjcsTAtx1Cf/9
 yeXsAU6LVblx2M3CZ3IjkKpw4KGgbDN+XWR1wGI+igKsxeMmjzNKK4y7lVC61ImxT0L0
 TV/roOS0MECGl0v84T3MEC86Cw79MYupPHV2f+QE47p1981aPuSCvPRMFQlAbN5FN+zz
 FyeYo1gKgFm58uoMFzZvGxTbX0kJty41YXoQM8jDrVa6LgbnE6SiLZcanIIoDZGMsJj5
 e73UQdIcPeBoy8X9vxeV6pgD0bZueZW1NwG8gwpnkAyl1iL6BibQ6r1iMuhyrv5oS7b1
 7ATQ==
X-Gm-Message-State: AJIora/Yx0w0LH2hEKLl4roNHs3XqytM1wGJvMBGyfx3dMnRiMQ9kZD2
 5qFtFA34idvxUKPIOBuEJWigBQ==
X-Google-Smtp-Source: AGRyM1tvK4QUc9IT1dJho14bU+s4B7RvGtwky0luZQCnfODm++NoLA6N8cqUrXWT8lYlMoePqBdxiw==
X-Received: by 2002:a65:6a50:0:b0:3f6:4566:581d with SMTP id
 o16-20020a656a50000000b003f64566581dmr18489733pgu.122.1657598360129; 
 Mon, 11 Jul 2022 20:59:20 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 l18-20020a170902e2d200b0016c3d9ae24esm4042390plc.60.2022.07.11.20.59.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jul 2022 20:59:19 -0700 (PDT)
Message-ID: <3a62599d-a8b6-3239-87d5-3bbadc7bbfb2@linaro.org>
Date: Tue, 12 Jul 2022 09:28:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v4 05/12] tests/vm: upgrade Ubuntu 18.04 VM to 20.04
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Daniel Berrange <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Michael Roth <michael.roth@amd.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20220708153503.18864-1-jsnow@redhat.com>
 <20220708153503.18864-6-jsnow@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220708153503.18864-6-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 7/8/22 21:04, John Snow wrote:
> 18.04 has fallen out of our support window, so move ubuntu.aarch64
> forward to ubuntu 20.04, which is now our oldest supported Ubuntu
> release.
> 
> Notes:
> 
> This checksum changes periodically; use a fixed point image with a known
> checksum so that the image isn't re-downloaded on every single
> invocation. (The checksum for the 18.04 image was already incorrect at
> the time of writing.)
> 
> Just like the centos.aarch64 test, this test currently seems very
> flaky when run as a TCG test.
> 
> Signed-off-by: John Snow<jsnow@redhat.com>
> Reviewed-by: Daniel P. Berrangé<berrange@redhat.com>
> ---
>   tests/vm/ubuntu.aarch64 | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

