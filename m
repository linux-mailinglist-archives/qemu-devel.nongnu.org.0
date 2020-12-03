Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C36C12CDF17
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 20:36:24 +0100 (CET)
Received: from localhost ([::1]:43090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkuOs-0000JR-NS
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 14:36:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kkuNL-00083y-IT
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 14:34:47 -0500
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c]:41953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kkuNJ-00056a-Os
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 14:34:47 -0500
Received: by mail-ot1-x32c.google.com with SMTP id j21so2886595otp.8
 for <qemu-devel@nongnu.org>; Thu, 03 Dec 2020 11:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BZCs6GgM65GWKYoKneNIjlM8hhwrNhohlnoB0m0cHo4=;
 b=AttH0cUYUC/z9Z/5DQO7uGNxPVcJ4GP1+qI2BxVKWqs7wnbhSFyrgxaRX78vCXCKam
 p/suUWVxSgqOSJkyrwFGi1GSKkpkU05JsUxbBU7uwP9+tzqircz7dstx8/9S3BBV0o8E
 l5+tnu/mdwJnza7r/tLrYChB4BVLFb9tSxvjjuxVnpeLch00m62vt9UwfulqhG+QhKF3
 qe+Iqjig1A0W4CKJpS5Fql9oGkyfiW6AM8VjADrjQIMHwfrI6cvdVciyItTFmz0EEB/X
 RUpf5pwLpCN0NRvNPsjKlxeR5DCI+jtCCImhmw3Y7bvmP8rFZzGXdxTRF/+edk2I71QE
 9fOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BZCs6GgM65GWKYoKneNIjlM8hhwrNhohlnoB0m0cHo4=;
 b=cJRPzIlvSXqxBQ7CEACxxAaNubYkXY5MnKLMVltOdniongdwZtY2Adm2VBmanjBxyo
 aTWfkIxamYHlkEnrMmMRAf/qKhkX/aRk85ZqC7ZtqHkei3h2KW6gi14zwxn6uJjlF3Jq
 zV4BddVGchcTjyMGIIfE/1K7uEXGWZjjUDiBhvebK/k/TZf8ZbviL9qjm67Q9At/a5Kt
 5ToRBadOWqX4n0NmHfkbZWoub/MhRTCQtXHMx0bWCZ/XDJX0ukFY8N84O6Sd+1Ga7BaZ
 pcHda7KlD+8MyTQwNiLftYp3cTk4mBmic7RWHh2T6STVIhRuGA5qqqR2QcBnMTLO4wdO
 qb8A==
X-Gm-Message-State: AOAM532AvI3/PTiiA4R/fqq1rCm1fOWtWRIxQG18D1Zemh+T8rZnr5pq
 ZSvtwExpPbpWs2SgRfpoBW2ELw==
X-Google-Smtp-Source: ABdhPJxakpeUG7JBrebXN5jWL9LGQ7sCKfU38gOhLOJpgSB0p1m9GfAMR5Gpo37u/CG9TZQT0V0ZrQ==
X-Received: by 2002:a05:6830:609:: with SMTP id
 w9mr614867oti.263.1607024084397; 
 Thu, 03 Dec 2020 11:34:44 -0800 (PST)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id u63sm62001oia.50.2020.12.03.11.34.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Dec 2020 11:34:43 -0800 (PST)
Subject: Re: [PATCH 06/15] arc: TCG instruction definitions
To: Cupertino Miranda <cupertinomiranda@gmail.com>
References: <20201111161758.9636-1-cupertinomiranda@gmail.com>
 <20201111161758.9636-7-cupertinomiranda@gmail.com>
 <74cfc5bd-d02c-768b-37e4-18ff8c88656b@linaro.org>
 <CAHW_PjKs5LDkrFkqSGEKgw4sL3tuyc3-n6Uo4xYfHa8=376_Ew@mail.gmail.com>
 <1dbd9a59-8e6a-ee80-f7ae-a2990a059b21@linaro.org>
 <CAHW_Pj+0Ex_PWhUzv_Fkcp2B5yOcD=p31Lu2xH+Xp9M6mAf4Vw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <836f6aed-8f2a-cecc-d796-be7286333160@linaro.org>
Date: Thu, 3 Dec 2020 13:34:40 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAHW_Pj+0Ex_PWhUzv_Fkcp2B5yOcD=p31Lu2xH+Xp9M6mAf4Vw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32c.google.com
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
Cc: Claudiu Zissulescu <claziss@gmail.com>, qemu-devel@nongnu.org,
 Shahab Vahedi <shahab.vahedi@gmail.com>, Shahab Vahedi <shahab@synopsys.com>,
 Cupertino Miranda <cmiranda@synopsys.com>, linux-snps-arc@lists.infradead.org,
 Claudiu Zissulescu <claziss@synopsys.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/3/20 10:54 AM, Cupertino Miranda wrote:
> Our generation tool has different levels of verbosity, expressing
> instruction semantics from a pattern level up to what it is shown in
> <semfunc.c> as comments, which is later converted to TCG format.
> For QEMU purposes I would say that input format should be what is
> shown as comments in <semfunc.c> file.

That seems reasonable.

> Also, as is, the generator is done in Ruby, and to be honest, would
> not be very easy to redo in some other language. Would this be
> considered a problem if we would include it as Ruby code ?
> IMO execution of these scripts should not be a step of build process
> but rather a development one, such that Ruby does not become a
> requirement to build QEmu.

It's not ideal -- I would have preferred python or C -- but I won't object.

At minimum, I would expect build system changes that detects ruby support in
the system, and a manual build rule that rebuilds the generated files.  This
build + check-in process would want documenting in target/arc/README or
something.  If there are any ruby packages required apart from the base
language, this should be documented as well (I know nothing about ruby myself,
just guessing based on what happens with python and perl).

Even better would be build system changes that, if ruby is installed runs the
generator, and only fall-back to the checked-in files if ruby is missing.

In this way, anyone who wants to modify the code generator would merely have to
install the ruby packages on their system, but they would not be required for a
non-ARC developer to build.


r~

