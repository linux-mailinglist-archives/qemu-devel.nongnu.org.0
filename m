Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B1B365B9E
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 16:59:45 +0200 (CEST)
Received: from localhost ([::1]:35820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYrqq-0000pn-5O
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 10:59:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYrpQ-0008E1-OG
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 10:58:17 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:41723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYrpM-00061Z-MW
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 10:58:16 -0400
Received: by mail-pf1-x42b.google.com with SMTP id w6so11189414pfc.8
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 07:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VbOGwNqgctFLfVMUsQJ3XTQrUE+EcjRuBe2GLreSvLA=;
 b=KcZax2FURVUOA2M5FZ389m88Rt83JlgGeK7z+x9SQB0gna9Nh2UPXsSLzp6bFIVuWd
 E15z0fHAjpFV2hbDt/dNbsgtLtTu5zmTf00MN2QDVce/VirOXnbQdWi3jezskRMbhCc7
 3zoFfslpTsC/6+FLQ1V0CDsFMxnu/knhr3kO+OCMhvagX+kn4l9cxt6mWgqM855AYHMt
 xTDesXJwmUE1jOD3WH0QQg9xes2MbSnqUl3MxdSNA62uZ874w//XOz/kna9Xr6Qd3Rmf
 87wESyeWZXV0P/YuFBSR39sPxTkZjhNiuzXuauP7woIp063gHg/rP03R//GrEI7WJfEa
 EajQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VbOGwNqgctFLfVMUsQJ3XTQrUE+EcjRuBe2GLreSvLA=;
 b=DoWvVqs119hQdD7vNdgfPfKfjI99SHL2jhwdpCX7qIqc62wzcmLRzjDNaK3N4dvbnA
 cIiquNU9R9HQbEiPFxtluZKhOHzauu+cR8rkj/FtMG3d0G3huoTUXF5ZZ4EjeajtdMUr
 fKw11OhAuIkJsjOUPqo+I6XDcTuJgxsLjF9Ni98UsHhns5QxmGzViFhKqoKy5JAOvPR7
 y3lQCZOQZ99U1dDcwgavPRaZ0HfeDM5BJfsu+aA/Bj8HacMuabd61hFddfA1g+Kb1dPT
 i8ijbvC8+672hQBgkLm1jvPIogbUdg2Jgkq497TO3If8FzObUZBbOFS6EIuxS24R4WNs
 /7Ow==
X-Gm-Message-State: AOAM532SJxcGrxDBjySb+j7tzmBWzD5RBtTQjOtFQo3wQhRry6H+7mG2
 hy2VJNy7o0/VWEaAhr6237Yr6g==
X-Google-Smtp-Source: ABdhPJw+hD2IVOwuKSeH733mRdwPqsrlKx0jiy9P6eBQ2nofRlbXtGtOAb7L7uildyK8/CH3a+OqeA==
X-Received: by 2002:a62:770e:0:b029:261:d9ed:fd6a with SMTP id
 s14-20020a62770e0000b0290261d9edfd6amr7311045pfc.75.1618930689628; 
 Tue, 20 Apr 2021 07:58:09 -0700 (PDT)
Received: from ?IPv6:2607:fb90:80c9:59f9:3594:91a:8889:c77a?
 ([2607:fb90:80c9:59f9:3594:91a:8889:c77a])
 by smtp.gmail.com with ESMTPSA id w23sm16623902pgi.63.2021.04.20.07.58.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Apr 2021 07:58:09 -0700 (PDT)
Subject: Re: [PATCH 2/2] tests/tcg/ppc64le: tests for brh/brw/brd
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org
References: <20210420013308.813323-1-matheus.ferst@eldorado.org.br>
 <20210420013308.813323-3-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4bb0154c-f809-384a-c4dd-a1a109558693@linaro.org>
Date: Tue, 20 Apr 2021 07:58:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210420013308.813323-3-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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
Cc: gustavo.romero@protonmail.com, f4bug@amsat.org, qemu-ppc@nongnu.org,
 bruno.larsen@eldorado.org.br, alex.bennee@linaro.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/19/21 6:33 PM, matheus.ferst@eldorado.org.br wrote:
> +    var = 0xFEDCBA9876543210;
> +    asm("brh %0, %0" : "=r"(var));
> +    assert(var == 0xDCFE98BA54761032);

Incorrect inline assembly, you are not declaring an input.
Use "+r" for in/out argument.


r~

