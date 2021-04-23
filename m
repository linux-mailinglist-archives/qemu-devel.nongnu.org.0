Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A59CA369CC5
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 00:32:58 +0200 (CEST)
Received: from localhost ([::1]:34224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la4M5-0001xW-Oq
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 18:32:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1la4KX-000166-Nw
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 18:31:22 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:37425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1la4KW-0008SF-59
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 18:31:21 -0400
Received: by mail-wr1-x42b.google.com with SMTP id j5so48792896wrn.4
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 15:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BR7Vfg0TTclc2klooFuRqeQGrfvNq6Enway+qYoTuwk=;
 b=SM6hTbF/LjAKri9/s26mB7oYyxXln+qv/nCZrUbCj7eK68UC+PyBAiOFm3jDd5IhZO
 dCCW4M19WUeZxtqSf2eG3WYnmuCn3891YmBGeqh5VXvJAXQAIdOrJjndH340J31nyxKi
 jkxSka0oyPcH+olCT1fyFxdMF28xC9IeQalTRXQUD2n7+NYrF0ga3M6VlSjLevXEzhib
 ycko/Rfu00EutnJ5A3KdYFR4EQumibogYNkbMNoZ/++/YD25WDjK77Nc+gNuGnz9E6lB
 gFNXVyG2dhe8J1z6yAyV6P89Iwii2adRbvmF3NVzPpyJhnFLQXUHLj1hMQdkh6kiuHcY
 bF6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BR7Vfg0TTclc2klooFuRqeQGrfvNq6Enway+qYoTuwk=;
 b=Uq/DNkcId2AC+ow9XRxywmVIRCyMT76h4WQN//6dEa6vllfVYcVtm+mnGLLCd7M/tn
 Gvl2YDwQXauGZ3WnSqL1B0uHb4IHxmFStCF6W8uoMrV+E3V8+XA8UYUhIlmE2hzG7ZdS
 MFIvmaXILrSEKbsYueoBY1wJ9zvis2+vIBJ8TMY82xBlXhJVsmv5w1FUazed2H/bxX9v
 cRDeDGeTAygGshNtY1u1Ws7gZS/l3JBxcfpA9f4MPi3xxHwOqX+8L9VM9nB+wZKaysGp
 bwBjuAYO83awjegIZm1jDCJGD1P9N37vnApcvHn3yWEh0ZH38kT75CqVZ9/zP9gcJLlS
 cJ7A==
X-Gm-Message-State: AOAM531q9hDCuhmpLGfKG0bvns+o5e1hFnRPXoq89R8IyiLe5k5KyOSk
 Sc5W/89PRw6cHEQz/XifwnQ=
X-Google-Smtp-Source: ABdhPJxIdDUa0IwDQJRBhqDDo/GvSrDQPT4muRU6303Btu1Sr+L9gRJZMpVlecqFU2fA4M4ZkT1X4g==
X-Received: by 2002:adf:fc01:: with SMTP id i1mr7153939wrr.374.1619217078627; 
 Fri, 23 Apr 2021 15:31:18 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id q19sm11992197wmc.44.2021.04.23.15.31.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Apr 2021 15:31:18 -0700 (PDT)
Subject: Re: [PATCH v1 11/25] tests/tcg: Add docker_as and docker_ld cmds
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210419145435.14083-1-alex.bennee@linaro.org>
 <20210419145435.14083-12-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <8653691d-3063-8a57-438b-b7b72a5dc747@amsat.org>
Date: Sat, 24 Apr 2021 00:31:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210419145435.14083-12-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, berrange@redhat.com,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/19/21 4:54 PM, Alex Bennée wrote:
> From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> 
> At least for the TriCore target no easily available c compiler exists.
> Thus we need to rely on "as" and "ld". This allows us to run them
> through the docker image. We don't test the generation capabilities of
> docker images as they are assumed to work.
> 
> Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> [AJB: fix quoting, only handle docker & clear, test -n, tweak commit msg]
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  tests/tcg/Makefile.qemu | 15 +++++++++++++++
>  tests/tcg/configure.sh  | 17 ++++++++++++++++-
>  2 files changed, 31 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

