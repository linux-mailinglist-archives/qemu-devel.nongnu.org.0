Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADFE3507A29
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 21:22:00 +0200 (CEST)
Received: from localhost ([::1]:51868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngtQF-0006uI-QT
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 15:21:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ngtNS-0004pa-FT
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 15:19:06 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:34741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ngtNR-0007sA-03
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 15:19:06 -0400
Received: by mail-pf1-x436.google.com with SMTP id x80so598146pfc.1
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 12:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=rJ087C9j+P0UOqgOxqKLdWKwfFKDCumPzXjc/aRekn4=;
 b=b//w36p9lr5P+9p9dsQbgxGqaQMPyLl+h2QDYKmyG2sbQjL6pnIjWbfrAwjtCkiBYd
 nIpxZOkSjeNkQQYBcMGG8pNw1A381c6IAcFZK9aIFGMDF/X3OKf+HElu6Hg83tyvm2NT
 zBd4rGrPWolhZ56DaZdzB3ldLxkxD+tdThwOo4es+xj5bAc/ibEnLs7lcSFzWBFgHbKa
 61yP2GrfLFVWDY1BCBW6sEWncSib3/BnNpJRF/ijWEWXDWyxSMk+nmBknmYKZMoq4Kll
 xM8dSHcQELTBBFcmup7afHTgLG8nb0obuVcVG4wP0RQS4DHC59+Zdw86JU5dSMTYzTEw
 y7aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rJ087C9j+P0UOqgOxqKLdWKwfFKDCumPzXjc/aRekn4=;
 b=KnAZH652+NHmceJtqOk/5Y82i6jEReCJsDBppgbjj2o9askf7EEdcwcjj7DJNa9kKM
 z8lBX0//c8KZSmOMUhgwvH4oWZMn9jqajAGSXXtMDhPaQa4nNYhW0wp8tHPm0IkjQMuH
 m0uKz6NYHFmbnktXBQMAetByf6YZ5in/JxNN205kvBN3HHpoPWT2qQPVAoR2kH93IeU4
 bAr8ML1c+xUBOdp1pw5EK5X82eU7vmDRKdURekvn9Pz7FbzOOsgC+8IQdsJPc621fzTE
 nCcczOoVYnVhPv7M5F4QIiDajN7Lo5cFB/xtgURxy6FUdMuuHpQ18dcrXULVwPqHu5f4
 8yxA==
X-Gm-Message-State: AOAM532NE9ts8vdgwElzf9Ew7HfLAiZVJQtMz6CVwfS40qbElRur6LNS
 cynu8QsT0sSA/YTnRSBni+AFiA==
X-Google-Smtp-Source: ABdhPJx0fEmswRVenugLvZwyDWBWQHyGp5zTShOCyAdq17TqQEacW71lvnc8J7s68BfKlvL8NcS9FQ==
X-Received: by 2002:a63:b0b:0:b0:39d:3808:7cb5 with SMTP id
 11-20020a630b0b000000b0039d38087cb5mr16033694pgl.567.1650395943372; 
 Tue, 19 Apr 2022 12:19:03 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 81-20020a621754000000b005082073f62dsm17910179pfx.12.2022.04.19.12.19.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Apr 2022 12:19:02 -0700 (PDT)
Message-ID: <2ef83fac-aae9-cdfd-27c7-5a323f4ab7a2@linaro.org>
Date: Tue, 19 Apr 2022 12:19:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v1 25/25] tests/guest-debug: better handle gdb crashes
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220419091020.3008144-1-alex.bennee@linaro.org>
 <20220419091020.3008144-26-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220419091020.3008144-26-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 Gautam Agrawal <gautamnagrawal@gmail.com>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/19/22 02:10, Alex Bennée wrote:
> There are a number of GDB's on various distros which fail fairly hard
> when attempting to talk to a cross-arch guest. The previous attempt to
> catch this was incorrect as the shell will deliver signals as 128+n.
> Fix the detection and while we are it improve the logging we dump into
> the test output.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Reported-by: Gautam Agrawal<gautamnagrawal@gmail.com>
> ---
>   tests/guest-debug/run-test.py | 11 ++++++-----
>   1 file changed, 6 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

