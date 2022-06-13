Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C16054A1CB
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 23:51:23 +0200 (CEST)
Received: from localhost ([::1]:41582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0rxy-0002bx-OH
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 17:51:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o0rus-0006h8-Pz
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 17:48:11 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:34599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o0rur-0004OC-7w
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 17:48:10 -0400
Received: by mail-pl1-x62e.google.com with SMTP id i15so6208667plr.1
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 14:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=zF5y3QLiBQQssB01TNRdCaLhzQW5J8c2feTPPbcQmlQ=;
 b=LW/q7juMfDV//mxhBRecbK23YujJXkX+L5yP9y8Dvl8IjTr3KUxmm2R7sdwTBZ+PqD
 P24F878A82Wr/6ufCjlHmrGo4YFyPdSiso+LHfzovgOA/sRVYs10OItAL0+do/Sm6wYD
 YvM09rOf6zIwB1gJgeeU2qo/dXD2BzMYs0achs4eqz3eaDHkM5cwvOaQc4UVrE0WnNVZ
 Ieg7OsNtmYnT/McxeSNCWJbpHliGr+bMrOd7InyM10YpTm9Leb7qJG2RXBmpU9eRyi7j
 oZ5t6BhFAIiubjRyN1gzfvGK6DmPrnLqWXaaNtKj9ptBqwaf56F05GGsHD488WRO42yZ
 fjIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zF5y3QLiBQQssB01TNRdCaLhzQW5J8c2feTPPbcQmlQ=;
 b=4HO7ujJuoN4wmgp3UPqVW5cgzQ3Emg4cGHymKKoQEq+I7M1aTi4/K0vDEA0fcs4sal
 U1DF1kZXtCfOrHlGxvAeKk43ick9QfDM17V+CBtm8vFgpIVpBR1fSRFhAlepBNxymQli
 qbkgaIdv8IW7n8JQvYNjoeszwRWSZb2y/1/Fw6cVkDPOv8TSnhqSbc/zbRvOdVbIlUd5
 KNoKmz3pL51FVBSuiT7wD6o758hVknb2rhGRiyK1fILMIdY8YLegKhkrCnY+ASgDryIa
 de5DSF92InJcitF4oPSZH8pM0d+BLROPnSao+Idfbk8DWecLCS+SFD8/YYSyfrhRJrxC
 NMVg==
X-Gm-Message-State: AJIora9SPJt+nRoJ39JG662vwf+9CHLt8/bhPIV7F1856WOlWFYl7CbD
 frA5Fyeeeva8t8vsopsXBSUU7Q==
X-Google-Smtp-Source: AGRyM1urtfnB5WIs9AoJ1cTb+nd4l1v0zo/YgmYJVlARAX3iCTEdkwgHN9IJFyt4dqHo2yUYfXZIAQ==
X-Received: by 2002:a17:90a:e2d3:b0:1e8:ab66:c0be with SMTP id
 fr19-20020a17090ae2d300b001e8ab66c0bemr871000pjb.12.1655156887996; 
 Mon, 13 Jun 2022 14:48:07 -0700 (PDT)
Received: from [172.21.2.253] ([50.208.55.229])
 by smtp.gmail.com with ESMTPSA id
 x14-20020aa7918e000000b0051c0fe8fb8csm6059924pfa.95.2022.06.13.14.48.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jun 2022 14:48:07 -0700 (PDT)
Message-ID: <bacf383f-16cb-64f7-d8e9-20e867a0fb9f@linaro.org>
Date: Mon, 13 Jun 2022 14:48:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v1 7/7] .gitlab: use less aggressive nproc on our
 aarch64/32 runners
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20220613171258.1905715-1-alex.bennee@linaro.org>
 <20220613171258.1905715-8-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220613171258.1905715-8-alex.bennee@linaro.org>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/13/22 10:12, Alex Bennée wrote:
> Running on all 80 cores of our aarch64 runner does occasionally
> trigger a race condition which fails the build. However the CI system
> is not the time and place to play with much heisenbugs so turn down
> the nproc to "only" use 40 cores in the build.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   .../custom-runners/ubuntu-20.04-aarch32.yml   |  4 ++--
>   .../custom-runners/ubuntu-20.04-aarch64.yml   | 24 +++++++++----------
>   2 files changed, 14 insertions(+), 14 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Richard Henderson <richard.henderson@linaro.org>


r~

