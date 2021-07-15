Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CF03CA1C0
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 17:57:24 +0200 (CEST)
Received: from localhost ([::1]:46914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m43jn-000548-Hl
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 11:57:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m43fu-0005cU-HI
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 11:53:22 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:44661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m43fs-0003NF-Eh
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 11:53:21 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 p4-20020a17090a9304b029016f3020d867so4708163pjo.3
 for <qemu-devel@nongnu.org>; Thu, 15 Jul 2021 08:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=MSDiUHCU5OFzN/mwClp6e5wQRwqIjA9kT3UM3qfIszk=;
 b=XkorAmYyYnYnjemnrQuTkIeLG2X7fP1eY7O2A/Jw22dU+ZDQS37M1b9xxrK0oa/Te3
 oGPi4tZOQEadDxDcUNm9NzUbmr2fLP9P7VSW7FGzJLfkNGrvyto7RBD8caPF9IxttOa9
 oAobJFVmWuQ4ppxWItZ7l/3SBwR9EzLUwBy1i2nyLxoZ6DSHMTzbatZH+7Nz5G6syI0q
 XZEqBbqp+KQksNG9Cz0iz+7TF1lixsU4/8axc628Udqzql6J4Jum3zZFqv6lnODWs2hu
 Y48o3fGDC4uio3WyhimR1Jn7cqaVv0u1CGcU+fhv88K2PMETgVlv+52e5rZYVoy+4fYO
 exoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MSDiUHCU5OFzN/mwClp6e5wQRwqIjA9kT3UM3qfIszk=;
 b=jO0OMHQ4IodB9axSPOZeWLuXitgrqVAC0SDVtWdkyiTvBJx/yoRU4ztXRfRoMTX10o
 R5w9rXM8r1a9fiUSiVEDxniLlxxY8wSOIe4wGFWUMFNkhfOlArQiXpRfsuH9aLfWvQ4q
 bgUoct32LmPest3WelXmDg6Il0DZsxnzwX4sF+b0I79sctM7b64Q74ASqn0c6H8z2ViZ
 rCtU2iCmRDFcfZyJlt/CiK+oE3vG8UySqKsXZ35/4eD+9H9nMgJtEDqcRxrPwj1Sy/Vx
 tZYTX67OsYjZwoQjrcFuc/dcEaDHufkAzfGq2g8uS6AVzTDcEfK8JAxdcyC5470fLt53
 iP5Q==
X-Gm-Message-State: AOAM530RiRUb2fU38Mm+nBf8O+3lLjU4U6bdpn+sAxtYnzPYNnh+T3BE
 nLP44WTPYgJBpDML/j1PJ3VHaUPFNsm0nA==
X-Google-Smtp-Source: ABdhPJxU1gNV1/05NzfUihJANLomPbugi7bF+BFuz51vi7GXDPuM7M5YgAQmVHaEX0samXhuC3YeVg==
X-Received: by 2002:a17:902:a9c7:b029:12b:349:b318 with SMTP id
 b7-20020a170902a9c7b029012b0349b318mr4043496plr.13.1626364399120; 
 Thu, 15 Jul 2021 08:53:19 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id b65sm7304537pfa.32.2021.07.15.08.53.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jul 2021 08:53:18 -0700 (PDT)
Subject: Re: inline expressions for decodetree !function syntax
To: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <CAFEAcA85CpJ6x3P=XG6VnR9NGaQFhEDN_u4UbWP9Zfia7rXYoA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e8bf40d9-04af-2a37-3ed6-cd25367c4400@linaro.org>
Date: Thu, 15 Jul 2021 08:53:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA85CpJ6x3P=XG6VnR9NGaQFhEDN_u4UbWP9Zfia7rXYoA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/15/21 2:33 AM, Peter Maydell wrote:
> I have found myself wondering whether it would be a good idea for
> decodetree to support some minimal syntax for defining constant-modifying
> functions inline in the decode file, so that instead of writing
> 
>     %imm4_16_p1 16:4 !function=plus_1
> 
> and then having to define a "plus_1" function somewhere in a .c file,
> you could write something like
> 
>     %imm4_16_p1 16:4 !function="x + 1"
> 
> and decodetree would just wrap the quoted string in
>   "static inline int fnname(DisasContext *s, int x) {return %s;}"
> (autogenerating a unique function name for it).

Seems workable.

> (target/arm actually has three separate implementations of
> the "add 1" function right now :-))

Ew.  :-)


r~

