Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA1243BB8B
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 22:28:41 +0200 (CEST)
Received: from localhost ([::1]:52712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfT3o-0006nw-Lp
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 16:28:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfT33-00066m-Fk
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 16:27:53 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:33533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfT31-0006Jv-VD
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 16:27:53 -0400
Received: by mail-pl1-x631.google.com with SMTP id s24so424128plp.0
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 13:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=It4ymI2MLcPQzSdGHw8A0dBmCqq3TZ0w2sfs+b8i7gk=;
 b=DwdqN/egqiXW59rf6VXJGmH3sox5vAFl5z+Wg7faovhTHmrRvz8Mb0QicJwyD/G0C5
 Q4WKN8h3Y7o/QSka38gzLoQKqHq8WZyT+7aOFFDmnkoQCPZMxJ0GUvbOwx1Xto7tOsnF
 m+6HSmMaPb3OWRR9Bc+8vuNadVrjsnZBAyH6oDWFI1rliDnAl5j/p6bwVz4+y9fh89d8
 qCrjTHdeXWl5olFyrJrL9xQFNZkbj4gWQCQZARJE1wJbWjpUgAnfq19SVlDs45Qxsp+U
 VyaSiZF2VmdZu+xiqDkO8uhw3XD7UUpk1RHvbnfTfrtD6z7UbNNC3fs+ZEu3sPb9lQRQ
 Gngw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=It4ymI2MLcPQzSdGHw8A0dBmCqq3TZ0w2sfs+b8i7gk=;
 b=MMloE6vB8jL67OF8wYuyMp4IrOtKHxJNaxxwWnBTYFT47pW/SHR+9WdX3CrAuEPDOe
 YiEn04ni05ToQhTdcDBNfnxRUsKUuOPVnokRDvVig+VUbaE0aoRtXTGymAxl5cPmEdAX
 i3m5ZMlmyy8z8gauM1c3MKngvKduPWUwZH2TkaVEDnSacX9uNKZaeTrGpJfwlQ8YYIII
 VoHS/b3jt/QAReytXhIlhYt3UT4DPE1xDy+42hd4S1hERtx2A80LuVmO6kdTpA7vWEy1
 AbC0twa2W82WrsMaTIRezAUuwKF4dn/BxUqLlw5SdlsTNQHsEO08v052uz4awPgTAIlB
 dEug==
X-Gm-Message-State: AOAM531LtVHQS8pJcykaDzp81mbvxrm8GPGBaVt/rgiYk3HKksPhLX71
 RaqB6nfXfd9VJwRfun/hs9nkRA==
X-Google-Smtp-Source: ABdhPJwglXsJleZwKZouuLUWDGPicOeP/FF26hQXNZtobJUO0EIYtMzCClMTwgrC6sfH28L6Sz6feA==
X-Received: by 2002:a17:90b:4b89:: with SMTP id
 lr9mr1084245pjb.11.1635280070500; 
 Tue, 26 Oct 2021 13:27:50 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y21sm10197200pfb.184.2021.10.26.13.27.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 13:27:50 -0700 (PDT)
Subject: Re: [PATCH v1 27/28] tests/tcg: remove duplicate EXTRA_RUNS
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20211026102234.3961636-1-alex.bennee@linaro.org>
 <20211026102234.3961636-28-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f647640c-b3db-de10-13a7-f768f4b618c8@linaro.org>
Date: Tue, 26 Oct 2021 13:27:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211026102234.3961636-28-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.215,
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
Cc: fam@euphon.net, berrange@redhat.com, pbonzini@redhat.com, f4bug@amsat.org,
 robhenry@microsoft.com, aaron@os.amperecomputing.com,
 mahmoudabdalghany@outlook.com, minyihh@uci.edu, cota@braap.org,
 stefanha@redhat.com, crosa@redhat.com, kuhn.chenqun@huawei.com,
 ma.mandourr@gmail.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/26/21 3:22 AM, Alex Bennée wrote:
> We set it bellow outside the #if leg.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   tests/tcg/multiarch/Makefile.target | 2 --
>   1 file changed, 2 deletions(-)

Surely it's better to have them inside the IF?
Why add tests that we're definitely going to SKIP?


r~

