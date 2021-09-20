Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CACA741292E
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 01:07:11 +0200 (CEST)
Received: from localhost ([::1]:54076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSSNS-0004P4-TC
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 19:07:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSSL5-0001Jb-Cy
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 19:04:43 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:40938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSSL1-0006Ii-T5
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 19:04:42 -0400
Received: by mail-pf1-x434.google.com with SMTP id y8so17630500pfa.7
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 16:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VVepfkQJy4defVvjhePMWZShOxAryUIQK5Dbg36rEU8=;
 b=bu/kD4bHHtKCz7i7LjQIlB1ig8sFvgh73Tgqe+QJnvCn4TrYs+8ieCW+AOTGQB3Unw
 lgAvFmW9W2lWwWdoNIeOuKk8yEXVUZJGU1NfUsstV9h8vmPWVnmZ2sJ8IahZOW4IP5DJ
 AhVqbe+d0Mf5U4DcqyreljOFZLcX0X+beBKZfsQSZHeCS3t4ynwzoaMqxTQLBNaF6rzF
 2xwhTo5TC71tNHn/nmkPxhjRaXNn75NHE5wKum2hNgm/AhGwSTaRudIGy9/YU2KYo9Gt
 MSyAOyRfrTsspwemAZSfhPseT3CQRdR8NkSpnc21ximANB/ZrNKcnnqUlq4hELPP2soo
 c+Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VVepfkQJy4defVvjhePMWZShOxAryUIQK5Dbg36rEU8=;
 b=vqqmVXCJtru7/3oqNmnsrqJVQSbkboeuyHdtv60jSYBqBjq0NHjqVJj6k1Ja4i5TcA
 9ds4Ckw7AkwirFeiHoKAmHJg+Br4DITkZGaeYEI3VhIPbhXuvRjLavD9vXsn2ttkBw/0
 G4CcodtGfTL/J9+Y5gGD+shvdjr3DtFYyF0wzH/ByuCHvGzB2A7yXfxbAaBO0x/R1eFF
 rYAE2X/IH4bGH2SFcw0MVHYkzmTHBa3fDrUEL1pZbJ6f7YU3JvuLNhFHbM40OG/S2vDT
 eQcymvrv1rDvu3zEGb1Jn95IP4u7hB9MAf9uikCIwgwBmhIAnOzBYsNHBjOZln9qFQb1
 MDyA==
X-Gm-Message-State: AOAM5314M5yBxbnx7fHt93iNCKYyanX2JG5KRibR1wbzq8gsxBAzA+Vs
 ZHXwwFHOaTVtBzYdYS9Why6WbEytKwt+ow==
X-Google-Smtp-Source: ABdhPJzvp8Y5/t1oPRTtBLoyiyXbF9Rg7vHw0hvMm8sPY43KeDlcdNzc9AldOi8P6/HWNqaSx+o+5Q==
X-Received: by 2002:aa7:9833:0:b0:444:d028:5edb with SMTP id
 q19-20020aa79833000000b00444d0285edbmr20036967pfl.55.1632179078373; 
 Mon, 20 Sep 2021 16:04:38 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id c9sm819825pjg.2.2021.09.20.16.04.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 16:04:38 -0700 (PDT)
Subject: Re: [PATCH v3 09/30] Hexagon HVX (target/hexagon) C preprocessor for
 decode tree
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1632173065-18522-1-git-send-email-tsimpson@quicinc.com>
 <1632173065-18522-10-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <05240e82-1141-b01a-35ce-acd967121f4f@linaro.org>
Date: Mon, 20 Sep 2021 16:04:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1632173065-18522-10-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
Cc: ale@rev.ng, bcain@quicinc.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/20/21 2:24 PM, Taylor Simpson wrote:
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   target/hexagon/gen_dectree_import.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)

Acked-by: Richard Henderson <richard.henderson@linaro.org>

r~

