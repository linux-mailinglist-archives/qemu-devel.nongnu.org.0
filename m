Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B564FCC02
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 03:54:47 +0200 (CEST)
Received: from localhost ([::1]:51702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ne5jy-0004Uu-S2
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 21:54:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ne5iD-0003Ht-Mr
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 21:52:58 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:46730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ne5iC-0006Qk-3l
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 21:52:57 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 h15-20020a17090a054f00b001cb7cd2b11dso1209055pjf.5
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 18:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=EJ+G8Qab2OL4CTcvGDCsXPDaCjzcoMzpeND2wskXWDo=;
 b=E1R8EmIivLzNZipQKYru2/7PXmsR7tKmw1qxOyyq+uHDg4VaKDbizZCo/Z4Tr0wd7B
 37jkEuVITXobFUNkZuC3RT8uhsu6GS7pSssW6+3nFi67x+yw3r/zMXaKvZ1PkJ9lPnRy
 IerJoeclRkXui3RWdJV8F5zyiOtrCE60vBnKlqmjnRNsMVDSRgjPVRHNoExk32l1eNT/
 RZQKpSfKzg00CxiV1KzHRsk6otFuDIvQHfnuZ+Xiypiy/3jjlWUhempzScCqrI4IWIyt
 M8J7CCS/pOnZOe8cRmT16vA0GqcSrWA2A/3lb1KZzoVL+Fs4YhqinCXRaSQrJDqBNxad
 alog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=EJ+G8Qab2OL4CTcvGDCsXPDaCjzcoMzpeND2wskXWDo=;
 b=KsaRO2MPayzMAzynb2vHBuk31xRrKqrLTBbZ6xKhVkF/9vL6AJusSAsA/Z6pTZBi4/
 Ql15mQYlRNBfnKOBx/Fd0Mr6hE5u4xF5GGTSM9qLKfJJdGsvdfgUhEjMJKSSTHFpkhjp
 f7m4PX7fY7gRWCtA//LY1D9rqD4NaApzi58YPWYyP49UZ4D3z2mJPJRVdQn9ccjDcIp+
 voxHTVG6tt4DNOoJ6gkFdiHjiwV7JV4eKELjiLjswj3ncZ1Y7kDMCQ9/Bu+oxjmZhppe
 731KcLJAwa9jeQvprQ3WJ0Y8+bbTN1TjqW6v9/2uPzxjZTEg4FeILEKB9YJkOBqovC3t
 7SeA==
X-Gm-Message-State: AOAM530MEAFmxDprJMiWzTUjUUDsRmZfDQwQ5v0wTI28JplNN+54fQAK
 W39VlsssRE6FAsMhbsB276Ih20KnUhko1w==
X-Google-Smtp-Source: ABdhPJw7DfZA9lxiNJYMFpElRpS1K+xlDl3VPb9xNCHdcN5TyXstBHTwxgk+hWGIEgztPLNPmyxT/Q==
X-Received: by 2002:a17:903:18d:b0:158:785c:5146 with SMTP id
 z13-20020a170903018d00b00158785c5146mr4342962plg.74.1649728374916; 
 Mon, 11 Apr 2022 18:52:54 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 y26-20020a056a00181a00b004fe3a6f02cesm24098560pfa.85.2022.04.11.18.52.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Apr 2022 18:52:54 -0700 (PDT)
Message-ID: <09831956-86b1-f768-8f22-750fdc257be2@linaro.org>
Date: Mon, 11 Apr 2022 18:52:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 3/9] target/ppc: Implemented vector divide quadword
Content-Language: en-US
To: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220405195558.66144-1-lucas.araujo@eldorado.org.br>
 <20220405195558.66144-4-lucas.araujo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220405195558.66144-4-lucas.araujo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
Cc: Greg Kurz <groug@kaod.org>, danielhb413@gmail.com, clg@kaod.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/5/22 12:55, Lucas Mateus Castro(alqotel) wrote:
> From: "Lucas Mateus Castro (alqotel)"<lucas.araujo@eldorado.org.br>
> 
> Implement the following PowerISA v3.1 instructions:
> vdivsq: Vector Divide Signed Quadword
> vdivuq: Vector Divide Unsigned Quadword
> 
> Signed-off-by: Lucas Mateus Castro (alqotel)<lucas.araujo@eldorado.org.br>
> ---
>   target/ppc/helper.h                 |  2 ++
>   target/ppc/insn32.decode            |  2 ++
>   target/ppc/int_helper.c             | 21 +++++++++++++++++++++
>   target/ppc/translate/vmx-impl.c.inc |  2 ++
>   4 files changed, 27 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

