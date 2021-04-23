Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23FBE369D39
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 01:18:35 +0200 (CEST)
Received: from localhost ([::1]:47460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la54E-0004B5-7b
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 19:18:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1la52Y-0003Xo-PQ
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 19:16:50 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:52004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1la52X-0003kf-40
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 19:16:50 -0400
Received: by mail-pj1-x1031.google.com with SMTP id lt13so15013633pjb.1
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 16:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=v2Sgysfd+v4XIOyv2agwcIl2m1KfAWANubE/ThwJnNA=;
 b=pszbQUy6OWwq9wE4PaVkBya9gJjHnO9ho6zODAMjqxXz1X6Fd0XDefkQy53cVwL6kh
 iO5FVcdQ0czdW9JWxc06ZHZWM2V1IRbfs0Zmg2NsnccvUr/Q6VOLwI/d43nzFkMaEDc8
 JC8pzqmfTZluffM7P3tWFSRMszhjFfwghKUDvxOp/CwFep2LDRxOHqsQr8ti+Ovqwb03
 kEQhTZuDrkRu9AtAqvYi2CYUXzUlreEHc0FUxKggFN+Q0Yy9XCY6JCmqcVX7G2aKklAw
 573cnNeNZq6ThuchrCVta7G5QPbvj1Vgtl4HiiaFCtM3i2JycMlQ6giupcIzEPR/X2Gf
 9bdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=v2Sgysfd+v4XIOyv2agwcIl2m1KfAWANubE/ThwJnNA=;
 b=bnnGfCpCP8lfuPxXhPReyV/pdOqOpKk+jZCJgE/uTMLebk0SqW0oWFgbNLr0Cw5tUB
 GO8IXjsOHnXB8+empogvEEHSraM9rvpJRyWoDmz83yKajHuJJTFK8esuxYxMRjvWIcLn
 59SZ2ykrfWfAmbHEztQLce0LVQGeB4vgoOoi1Y5R6H00G12SjDYpBx8NOyT4FyPoVzfY
 LQHf0eCi5rkDI2AnvY35L63FzQP8p5H82ehfh7YuSuJ19tUTnCkk/QbUKAaXMoBjMsL5
 j3MyYucvKQHKi3Ikk8qOx2MvHDXC5Rsxs+lffxMPGtf3D2XzGld9YnRzNalHoEjYWl+I
 Z0Ow==
X-Gm-Message-State: AOAM5324iWSqG4ag/WuxaMS3K3DL5nOyQ2Ipa8bNAPiU9ue6droC9hlH
 ncVnlfTTiPelKbJuEeaiZuMZfw==
X-Google-Smtp-Source: ABdhPJyfKSpQaOImEHr4IgR7yL6LWf+eR12h1WV4C40amLPT322gb/F6rXLP/JyCjSI81cv1HPqDtQ==
X-Received: by 2002:a17:902:c209:b029:ec:7add:e183 with SMTP id
 9-20020a170902c209b02900ec7adde183mr6273294pll.74.1619219807568; 
 Fri, 23 Apr 2021 16:16:47 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id f135sm5428685pfa.102.2021.04.23.16.16.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Apr 2021 16:16:47 -0700 (PDT)
Subject: Re: [PULL 20/24] bsd-user: introduce host_os.h for bsd-specific code
 and defaults
To: imp@bsdimp.com, qemu-devel@nongnu.org
References: <20210423203959.78275-1-imp@bsdimp.com>
 <20210423203959.78275-11-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ccc69856-3b2e-520d-455b-295f34705225@linaro.org>
Date: Fri, 23 Apr 2021 16:16:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210423203959.78275-11-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kevans@freebsd.org, arichardson@freebsd.org, Stacey Son <sson@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/23/21 1:39 PM, imp@bsdimp.com wrote:
> From: Warner Losh<imp@bsdimp.com>
> 
> Introduce host_os.h for frebsd, netbsd and openbsd. This sets the default bsd
> being implemented today. In the future it will have code that is per-BSD
> specific. Abstracted from a larger c93465b6208c4c95cc0a394ffef4180ba6ccf27a in
> the qemu-bsd-user repo.
> 
> Signed-off-by: Stacey Son<sson@FreeBSD.org>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/freebsd/host_os.h | 25 +++++++++++++++++++++++++
>   bsd-user/main.c            |  4 +++-
>   bsd-user/netbsd/host_os.h  | 25 +++++++++++++++++++++++++
>   bsd-user/openbsd/host_os.h | 25 +++++++++++++++++++++++++
>   4 files changed, 78 insertions(+), 1 deletion(-)
>   create mode 100644 bsd-user/freebsd/host_os.h
>   create mode 100644 bsd-user/netbsd/host_os.h
>   create mode 100644 bsd-user/openbsd/host_os.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

