Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CADF62D4430
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 15:26:36 +0100 (CET)
Received: from localhost ([::1]:34162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn0QN-00051h-K6
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 09:26:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kn0MI-0003WO-8i
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 09:22:22 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:38365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kn0MC-0001K5-Od
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 09:22:21 -0500
Received: by mail-ot1-x344.google.com with SMTP id b62so1487652otc.5
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 06:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=a6gvkfUsTRRHWI/Rey5l2+/c+vp3yPmPaJew6NyzHjE=;
 b=DECj6nhKAAqEdm1x0WJsQ2vxuD3Ww9SY2e7cpHEQ9Vg/DTKEH0tw93GByd7SXd2wOa
 K/Ik8mm5HNF0TehMv4HBB5n5Xp01Emx1KudhDmp7NcAI2O03pk+jCx6sR8tfNTDrcamB
 is2cp4iqOeV3cDt7Txu1o+qMZRRDOsYsCxYcIV7u3tSOt75VA7JwKTrwC0dFY2RApvdR
 iKwYRJjD0bt+VTNJgR+oGXvTyAV5sJugB+rGrHID2/Crfw3KRArepKEeWl659Lq4H67C
 yN7e4jw2wLNl6mVy5T3vi1reR03wTtCWLvLvEongY9PyDnYvit6A6CBTIIPFdSg/226Y
 srqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=a6gvkfUsTRRHWI/Rey5l2+/c+vp3yPmPaJew6NyzHjE=;
 b=GFQScoPhFJOWi8UVjTOMwGHU9soHYhhS83J6NeNhGHGTwvDodwhDVLBPagJ0QHy3X7
 dJCN/udEGAzd6XSukqrcq5Z+rS7/PjV2T5IJOFjmlBosgno56wNoJ93ttZFhUc/bauGz
 7t6JPs+mTBCxIBQNhLXQ0ylXE+DBBDpyUqIWz7iiGVSkYtexQ5C9A1OZYhvWBT7B8dYL
 mhqx9mI/FQ2qOruwaXk7XKLAtzuQ/4twKVFCrylnS4atPGdyKFIX4mY7AkjLLaowMiLU
 53JvhEOpZ3nEIVbKFMsDJD5zZZ6BGRinswsq2loKJ9ojSXgpSRWlKoBKjAU7AQeYRD15
 W1xQ==
X-Gm-Message-State: AOAM533gv5Pzt6Sf6fbTixjJecYx9KzLgZ5JJ8qr5HINFsbJ7r7gYu5x
 aj6ui2QwXuOZT5vz3tyXeOGZZw==
X-Google-Smtp-Source: ABdhPJw7XMngBm3czDkjfSWeOTqJeNsizltC9U0TuPpCCazPXyYZ0Ge7+v1Pu6fzJApPJFYyjWuWJw==
X-Received: by 2002:a9d:223:: with SMTP id 32mr1969215otb.84.1607523734362;
 Wed, 09 Dec 2020 06:22:14 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id e81sm327200oia.30.2020.12.09.06.22.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Dec 2020 06:22:13 -0800 (PST)
Subject: Re: [PATCH 05/13] target/mips: Remove now unreachable LSA/DLSA
 opcodes code
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201208203704.243704-1-f4bug@amsat.org>
 <20201208203704.243704-6-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <85c3de24-4e21-8108-a056-59b3bb3b33dd@linaro.org>
Date: Wed, 9 Dec 2020 08:22:11 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201208203704.243704-6-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x344.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/8/20 2:36 PM, Philippe Mathieu-Daudé wrote:
> Since we switched to decodetree-generated processing,
> we can remove this now unreachable code.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/translate.c | 29 +++++------------------------
>  1 file changed, 5 insertions(+), 24 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

