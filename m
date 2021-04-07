Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59FB63578A5
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 01:49:24 +0200 (CEST)
Received: from localhost ([::1]:40950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUHvH-000111-FC
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 19:49:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lUHuS-0000MA-F1
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 19:48:32 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:41776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lUHuQ-00056b-QS
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 19:48:32 -0400
Received: by mail-pl1-x62c.google.com with SMTP id g10so77034plt.8
 for <qemu-devel@nongnu.org>; Wed, 07 Apr 2021 16:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=w73IJ0qTnRN9l8YKxnADHdhHDSfPQelOv7h1Qh01N/k=;
 b=K9HGmNHnSLrEESSLyIl1bV+cCcbXKXC7EUwdsk66wpsLzQX8z5NT7iPJ7ikO80XRfW
 sD9gpK8fXvfgAwvT0KrxsyfcKYqAquorNy42iP+GJXkpmKkOFI3zUiL8cyKWvVEtn6hs
 ACsNv21vSqWT7vvNi6v/00YPOHmfkJnhmGFzZn3UFlhTAkW2YZWNpvlC+KUwqiycwCVM
 BXVoSiC+WMMDspR2DonEygRdmjFzL+9co8wG3xUje2J3oshihYzVAABPth7pvaAHJDVD
 58YAKkeCoY4JBQqLB8soQ1BxKz4lvQIIgDW1uE/HWEthzpUEhHfL01fdNY0eCvTJ0AKY
 RczA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=w73IJ0qTnRN9l8YKxnADHdhHDSfPQelOv7h1Qh01N/k=;
 b=kNi273yIhnt70ZiUXgF9WROQW0tBq9WAEjizsHYYxcxA3QT0NlEXc0nbZinGBNLQOM
 XmNh6udWpLmh1N1mJcHsUcyoTaPytPDApT97XvM38EdU+IHdhj/4pGkIVRzLOQUW+3mD
 kV8D/eA+AWFODRksFeFgG2sv/3811Fjx20F+qOY7pXukflkjfQbmh8fLGmDsLtMFslVp
 3+gccN3nQGJI2OfKhYfLXKjPR4B+DaMJlJuJPpPcspNQu6ClO8+AfzfSCHJy9wDTqhT+
 +nrgDgoeCKPqAyWLnrC1tByCHmU9zeMs756FRUHXbBZijVICAy/c0uMdEJLqb/njBiSR
 pqWA==
X-Gm-Message-State: AOAM530Dsq/rgET+QTrVio+WRhMipgE0JwRkIiH5xJ0QHi21wZmE99Ua
 zvqgz1vzbPpgcMHGUt27RVqU7A==
X-Google-Smtp-Source: ABdhPJxXHeqO/FxEGrGS36tlerTOyNVIim+vP953mC+hgG8mSByDq3o2OKUI4lAp2aahUEHpoHFWJQ==
X-Received: by 2002:a17:90a:528b:: with SMTP id
 w11mr5600276pjh.162.1617839308791; 
 Wed, 07 Apr 2021 16:48:28 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id x19sm22452799pfc.152.2021.04.07.16.48.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Apr 2021 16:48:28 -0700 (PDT)
Subject: Re: [PATCH 22/27] arcv3: TCG instruction definitions
To: cupertinomiranda@gmail.com, qemu-devel@nongnu.org
References: <20210405143138.17016-1-cupertinomiranda@gmail.com>
 <20210405143138.17016-23-cupertinomiranda@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4bd6ab16-072e-0700-5911-6493ba70668c@linaro.org>
Date: Wed, 7 Apr 2021 16:48:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210405143138.17016-23-cupertinomiranda@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
Cc: shahab@synopsys.com, linux-snps-arc@lists.infradead.org,
 claziss@synopsys.com, cmiranda@synopsys.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/5/21 7:31 AM, cupertinomiranda@gmail.com wrote:
> From: Cupertino Miranda<cmiranda@synopsys.com>
> 
> ---
>   target/arc/semfunc-helper.c |    13 +
>   target/arc/semfunc-helper.h |    31 +
>   target/arc/semfunc-v3.c     | 14653 ++++++++++++++++++++++++++++++++++
>   target/arc/semfunc-v3.h     |    55 +
>   4 files changed, 14752 insertions(+)
>   create mode 100644 target/arc/semfunc-v3.c
>   create mode 100644 target/arc/semfunc-v3.h

And there's no good way to share code between v2 and v3?

r~

