Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0503A39C465
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Jun 2021 02:28:48 +0200 (CEST)
Received: from localhost ([::1]:36520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpKBC-0007UK-I2
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 20:28:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpK9u-0006dw-Ga
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 20:27:26 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:36453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpK9t-0004U3-49
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 20:27:26 -0400
Received: by mail-pf1-x42e.google.com with SMTP id c12so8632708pfl.3
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 17:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MbIW4uMsR0lTBT446lTKlhTg79AXP8x4USmz0r+2nBA=;
 b=JLk6f7avBChex3GsZBX++AYNaD5WPnsVHwXH3F2177I3PJSRGND+nD2/Va2TS9N+q/
 82PSWr7mnFU/XFwOLqjQSWcSkkJBfG8xZqAR4bXCcY/gskVtM4tprRcRxtwCUaoDc9XB
 BYxhM4GKTGNBdA/Z94fUdicTdBhlKQPpWKKV2G0c3vxmK7jY+wdUdUYfUJRsVdI+wWC4
 tbHIrjUuWhaWnPddZcstnwnvxUBDODLW9Zsp1mMGP2mG9P4/4P3q1NOAgazRvx4b+JP3
 PMINlT1I90OzeCHbnyfk/avYVT8ByjSA3qyK/EhEnJI2Ee/e+TnYUuk3K0Wnodapc6mS
 0XCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MbIW4uMsR0lTBT446lTKlhTg79AXP8x4USmz0r+2nBA=;
 b=Stw8cvjkbrKPxVwIO0j5MkrkVnFEbPtPs1AVoALUmqSopTXsQ6j9IDMQFztwE53bPv
 JzBAmwN9nag6tFdFkRd2JxRwEFrsfas4fOLK4Gd+ib7/I9qzA1wRXb5szdh42BvoFX8w
 BPL0qC51++yNKGmpYlNS2eu/+OmnyDz5/Aw7mMAFNo782MGBiSMIG9Hfc7EdA2tyi3gD
 hhuRyVklJ9LfNv6OntA/EoX6sGqx4Y5hPPnpWrk2gl5FI8CpjndE9OEuoAZtqBxAzYYd
 3zv2zgvJxh4d60OuGdkQ9lCzeOHNPJQX8puHUS9Q3EiLi3fULVe4mdb7YulDnfrIG+71
 D7kw==
X-Gm-Message-State: AOAM530yahBpCC+Je2afwU2PaEA1K87OhflySYib0kfiH0EfSr0bLqC1
 jRGr7J/uFY3Uyjjy86D3OM69fg==
X-Google-Smtp-Source: ABdhPJy1FgpZ58d69KUP7jnVPbVmeDkYVs6cvTpIRNGkwlRngXmAXNjJFgXgKh++oRBNDBgGjhK+zQ==
X-Received: by 2002:aa7:8543:0:b029:2e9:e077:21f6 with SMTP id
 y3-20020aa785430000b02902e9e07721f6mr6867647pfn.69.1622852842761; 
 Fri, 04 Jun 2021 17:27:22 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 q13sm218034pff.13.2021.06.04.17.27.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Jun 2021 17:27:22 -0700 (PDT)
Subject: Re: [PATCH v16 43/99] target/arm: move a15 cpu model away from the
 TCG-only models
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-44-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <51fbcf63-a205-8848-95f7-b2c7e74754a9@linaro.org>
Date: Fri, 4 Jun 2021 17:27:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-44-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.59,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/4/21 8:52 AM, Alex Bennée wrote:
> From: Claudio Fontana<cfontana@suse.de>
> 
> Cortex-A15 is the only ARM cpu class we need in KVM too.
> 
> We will be able to move it to tcg/ once the board code and configurations
> are fixed.
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   target/arm/cpu32.h   |  4 +++
>   target/arm/cpu32.c   | 73 ++++++++++++++++++++++++++++++++++++++++++++
>   target/arm/cpu_tcg.c | 67 ----------------------------------------
>   3 files changed, 77 insertions(+), 67 deletions(-)

I don't follow this one.  Why would kvm, which is 64-bit only, require a 32-bit 
only cpu?

I guess I can accept that our board configurations are old and fragile, and I 
realize there are already 99 bottles of beer on^W^W^W^W patches here, but what 
needs to happen to fix this properly?

I guess I can give it an
Acked-by: Richard Henderson <richard.henderson@linaro.org>

if it helps us move forward.


r~

