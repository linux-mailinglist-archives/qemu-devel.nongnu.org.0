Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D42E23BF03
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Aug 2020 19:46:36 +0200 (CEST)
Received: from localhost ([::1]:57642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k311H-0008U9-LY
	for lists+qemu-devel@lfdr.de; Tue, 04 Aug 2020 13:46:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k310N-00080M-Ea
 for qemu-devel@nongnu.org; Tue, 04 Aug 2020 13:45:39 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:41219)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k310L-0003EG-P3
 for qemu-devel@nongnu.org; Tue, 04 Aug 2020 13:45:39 -0400
Received: by mail-pf1-x444.google.com with SMTP id a79so5127854pfa.8
 for <qemu-devel@nongnu.org>; Tue, 04 Aug 2020 10:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=e8VwQ2DAimqR0k+HYkVrPHcD1mRViEpgjV31i2PESbw=;
 b=OYrrBZ0LBLsLmekMR1sdJJfZrIAmn5Wb4JpXJv8lGA1YKqGZV1M0fEro2e1QdeMDPI
 v/ipVpzYUZTaXvzDsvNO6hZCmD+yn10LS1tEoHhSG0xh6ilPzkC/DPy8mGD64RMU7Oa8
 iJS2TA/fXaIoQyPcaXT6mnxtZoroSZbA8sGpwi2dgVyTX3jijZ4yL3JMK3IXWXHbytsN
 OAnk42q9wQ4eo9M06MbUBd00AEz1oEWkxA/6LxakXc9VzLy6imYG89YkqfGh9bdCQX9/
 q2fYMTll6pupDtnu7MMVEtcyYWYTe9Ef1KI8NZZbL+XZZf25pCSNWfk8kzm83dGhiozd
 A/uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=e8VwQ2DAimqR0k+HYkVrPHcD1mRViEpgjV31i2PESbw=;
 b=TSrpvA54TtHZ3z7mrl7iRoq0+ModCTiVvXLAewVvVf3QqZVjX2sxfKPYVt/1yAZKb4
 LQgs9mTzPVxS54NXXhmZIYXuoMuyS/x/44K9Gqi5TVaoq4ikKfgCRrb77ZQDtcRWRbjt
 8RYvzDyDroLgcPWlICl5WBFollqK2UTNlWZ6wXR5pJzXCicnMyi6efbK608gsAkgcKeg
 9M3WRV8CRg34etLz/GlwlQS8QKSmbB38kiaTZ7ASnjRH8/yGobKzWCmGUmHm4VyYn0aV
 PyZHPjVXcnDX5KuH8sdOzCxiS2Og9MJxHAnMZdvPDVIjvM+v+5xbe7m0Won+DXSPF4j0
 wlng==
X-Gm-Message-State: AOAM532xLyI3cZmRI4+tN2vpUIkYkjZnh0E5IATYDLGAEDbhOxub4DpY
 HP5dTOvDf1+KsnZGiVrtn1gCkw==
X-Google-Smtp-Source: ABdhPJxmCX9M1W2VHH9sD2B+b93S6xRidE+z18rEc2TptGIDonm795Rs5gNpyydFY8gvoVoUgUOV3Q==
X-Received: by 2002:a62:1e43:: with SMTP id e64mr20676707pfe.249.1596563135944; 
 Tue, 04 Aug 2020 10:45:35 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id i66sm23402975pfc.12.2020.08.04.10.45.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Aug 2020 10:45:35 -0700 (PDT)
Subject: Re: [PATCH 06/11] tests/Makefile: Add $(EXESUF) to fp-test target
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20200804170055.2851-1-thuth@redhat.com>
 <20200804170055.2851-7-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c384752d-6d7a-965d-31c2-43c552f40249@linaro.org>
Date: Tue, 4 Aug 2020 10:45:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200804170055.2851-7-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Stefan Weil <sw@weilnetz.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/4/20 10:00 AM, Thomas Huth wrote:
> In case we ever want to compile this for Windows, we need the $(EXESUF)
> here.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  tests/Makefile.include | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

