Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C90507975
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 20:53:08 +0200 (CEST)
Received: from localhost ([::1]:40266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngsyI-0003q6-GZ
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 14:53:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ngstV-0007h8-NC
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 14:48:12 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:34394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ngstU-0003DG-6B
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 14:48:09 -0400
Received: by mail-pl1-x62e.google.com with SMTP id n8so16658541plh.1
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 11:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=i2UkB+JLKKKOdqkk2GYTY+zw9waMcxOpisxjMGoSIVE=;
 b=DswTSGH7RK8jJxEDy8CGtFg8+W3nNfliTdQt/nuFZVUs9hw6MgvIu/4bcEQc9NggbC
 jfNHw0duamv6Rp08s87cmIRT1+mWur1tlWHR1lO+VNSt/fBlM0Bu1lJcsMHMp56KkUM7
 6idvMdpNv+2vqqr0frCA6Gt67JzsGr5l50di4iwySb3YO0fdtjgnS91Vow5U+G3+t97G
 AvQBd1NS7xSjFDlM/n2qTbGMyZMO1tbU5uh6/IcItc1+rewHOVRIVFtE++YTBQauP2I/
 0JSmOQ4TW6tjq1c56q8FMIDl+eCgPu/WvzC0A7OjjXe6Ln05sZrE8f1xltmqxBBi08Eb
 yPow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=i2UkB+JLKKKOdqkk2GYTY+zw9waMcxOpisxjMGoSIVE=;
 b=mwbn3+fIemHFc8BYz0FH/yMptLqMnF+ZvsX3USAjkZrTfYd4HgsMXkl7U+RKee9pnn
 OADdZi3pY8YA1UKeQBWUCneHZ6oQbsuh4sAU42iCKa4EIScM86MBvQATcZnpXYOrdAuJ
 OBkFnHt6xU6/DFXPPiNJba/DvWX5OZ5NMRH6eKawQS0wiOo4ajx/D0ftq6KLDeaqhfoo
 DZcDjtQsxJP83lOyD4mr7fLpLv68gPW6v+y1T7cp0RAIWR+vq4jFzAr9pDXm7q09vfRQ
 N6aoFmfcxplmsGdMl1v662pLAt0UadUQzghpRRJb/mC6ziCrKrR+0yHAmr92nPoh/8UT
 pMaA==
X-Gm-Message-State: AOAM531O/cRIX274Pvcl/T752/OREQ6Oco2d1CwT14MAtXXYST1i0JUQ
 qWUZpIX1VdGpSaf0BY9/qfqBfA==
X-Google-Smtp-Source: ABdhPJx5LwRBMi6sqGRfTZTRxsL3xXC6USi5qZ8KA8RP7xzN2AQMizjGZtyKXXnK/ZgtJHb7UfTXgw==
X-Received: by 2002:a17:902:e1c5:b0:158:e060:4f6c with SMTP id
 t5-20020a170902e1c500b00158e0604f6cmr16832548pla.163.1650394086869; 
 Tue, 19 Apr 2022 11:48:06 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 b17-20020a056a000a9100b004e1b7cdb8fdsm18432137pfl.70.2022.04.19.11.48.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Apr 2022 11:48:06 -0700 (PDT)
Message-ID: <a4acb584-2a75-69ba-74f6-f3132dbd0cf4@linaro.org>
Date: Tue, 19 Apr 2022 11:48:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v1 12/25] tests/tcg: add compiler test variables when
 using containers
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220419091020.3008144-1-alex.bennee@linaro.org>
 <20220419091020.3008144-13-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220419091020.3008144-13-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
Cc: fam@euphon.net, Peter Maydell <peter.maydell@linaro.org>,
 berrange@redhat.com, f4bug@amsat.org, Eduardo Habkost <eduardo@habkost.net>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/19/22 02:10, Alex Bennée wrote:
> From: Paolo Bonzini<pbonzini@redhat.com>
> 
> Even for container-based cross compilation use $(CROSS_CC_HAS_*) variables.
> This makes the TCG test makefiles oblivious of whether the compiler is
> invoked through a container or not.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> Reviewed-by: Alex Bennée<alex.bennee@linaro.org>
> Message-Id:<20220401141326.1244422-10-pbonzini@redhat.com>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   tests/tcg/aarch64/Makefile.softmmu-target |  2 +-
>   tests/tcg/aarch64/Makefile.target         | 10 +++++-----
>   tests/tcg/configure.sh                    | 17 +++++++++++++++++
>   tests/tcg/i386/Makefile.target            |  2 +-
>   tests/tcg/ppc64/Makefile.target           |  4 ++--
>   tests/tcg/ppc64le/Makefile.target         |  4 ++--
>   6 files changed, 28 insertions(+), 11 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

