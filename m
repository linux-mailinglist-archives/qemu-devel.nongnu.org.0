Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 163906F6983
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 13:06:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puWn0-0000o7-Dw; Thu, 04 May 2023 07:06:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1puWmy-0000mu-66; Thu, 04 May 2023 07:06:20 -0400
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1puWmw-0004Yn-Go; Thu, 04 May 2023 07:06:19 -0400
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-18ef8e9ab4fso301438fac.3; 
 Thu, 04 May 2023 04:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683198375; x=1685790375;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hgB6Ap4s/hGlIvgBparzAbCTC/8fa8DcT3um5IkGOPw=;
 b=d2r+EN27sAHTuKZLe877+uvZAoDX1kTBPMk9U8KzIkkS4GwneH/zrAAg7t8aYb0g/S
 nbVmE/QjAXGrPPTNwUkijsk45lwLsZpMHw6tHeBebrvzth6LotzBD+wxIjYjZ6NZNxhQ
 +6dn5qopSsDi4X97SwVYsfDZMAaidpVpoT6Wn8dnQ3C4It/XyCP2XCQXsS+mjs68Kta8
 krg+XK184rIEZQ/H25qVXI/zL/b4BDmQzcOPI5Pta4lA1eNTtO+ZfEB6brmR0rSycBPi
 mSeKdBGFNoj9QdDt/17tTyphttUAObWVsNF0tU5XIXRgAuoiDMQC9/TDrkDiDq1Hox6h
 7kog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683198375; x=1685790375;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hgB6Ap4s/hGlIvgBparzAbCTC/8fa8DcT3um5IkGOPw=;
 b=Yda251KrDCqXJFc53sKzLk4C10hNBts0o1JP7XbEZuCjLsT7S2PXETQB2zuWewqO5V
 N2uipqf4kNscpgnX+ScxU2nVbDwAyhfTTAdnqN2pFXJWkz9NlIABrxOljbo1mxrAs8tx
 +YQlOPnmnDnbxhK8ujyozn8PXPXZSkkbBemVbmuAMZhKs2fjhTJ00r3tcjzkB4SOPHuK
 /lpH5afyfv9X/Gj46ov/B1lRaQIwvLfP0taH1p95unjZknEAusxt7MBGaAmrzZfRzJMq
 dlX3hdxPJoGgZd1d9hWa1fPkBwfxH+v56p2rLMLYMdu/XqdxZ5Y3NknKyPfYOpyiX1zU
 X6Pw==
X-Gm-Message-State: AC+VfDzNcX5xphuug6xSCR3NGjS41IwkU2zeMK7faGoXTo2Tcndlo/QA
 3soNPEuyG58vxESW9jgoW0U=
X-Google-Smtp-Source: ACHHUZ7p3Z0xwZvov1/6MovoKmfOdHltDBL8gAJljjc7FyQuuCblJnPCCEAIE4DreqXjygLkY1KjYg==
X-Received: by 2002:a05:6808:2010:b0:38e:46ed:7738 with SMTP id
 q16-20020a056808201000b0038e46ed7738mr1711948oiw.0.1683198375604; 
 Thu, 04 May 2023 04:06:15 -0700 (PDT)
Received: from [192.168.68.107] ([179.111.98.125])
 by smtp.gmail.com with ESMTPSA id
 j7-20020aca1707000000b0038c49afdf76sm1488190oii.0.2023.05.04.04.06.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 May 2023 04:06:15 -0700 (PDT)
Message-ID: <d0c218dd-4148-9439-876e-5998a8ac6c15@gmail.com>
Date: Thu, 4 May 2023 08:06:11 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 0/2] tcg: ppc64: Fix mask generation for vextractdm
To: Shivaprasad G Bhat <sbhat@linux.ibm.com>, philmd@linaro.org,
 richard.henderson@linaro.org, lucas.araujo@eldorado.org.br,
 qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au,
 groug@kaod.org
Cc: john_platts@hotmail.com, qemu-devel@nongnu.org
References: <168319291781.1159309.7376486961333644798.stgit@ltc-boston1.aus.stglabs.ibm.com>
Content-Language: en-US
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <168319291781.1159309.7376486961333644798.stgit@ltc-boston1.aus.stglabs.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x32.google.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-4.28,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Queued in gitlab.com/danielhb/qemu/tree/ppc-next. Thanks,


Daniel

On 5/4/23 06:35, Shivaprasad G Bhat wrote:
> While debugging gitlab issue[1] 1536, I happen to try the
> vextract[X]m instructions on the real hardware. The test
> used in [1] is failing for vextractdm.
> 
> On debugging it is seen, in function do_extractm() the
> mask is calculated as dup_const(1 << (element_width - 1)).
> '1' being signed int works fine for MO_8,16,32. For MO_64,
> on PPC64 host this ends up becoming 0 on compilation. The
> vextractdm uses MO_64, and it ends up having mask as 0.
> 
> The first patch here fixes that by explicitly using
> 1ULL instead of signed int 1 like its used everywhere else.
> Second patch introduces the test case from [1] into qemu
> tcg/ppc64 along with fixes/tweaks to make it work for both
> big and little-endian targets.
> 
> References:
> [1] : https://gitlab.com/qemu-project/qemu/-/issues/1536
> 
> ---
> Changelog:
> Since v1 : https://lists.gnu.org/archive/html/qemu-devel/2023-04/msg01958.html
>   - Added "Resolves: " to first patch description
>   - Rebased to top of the tree. I see with d044b7c33a5, Alex has limited the
>     scope of plugin tests to just the MULTIARCH_TESTS. So, removed the plugin
>     tests for the test case added in the second patch.
>   - Changed the test case to use the HOST_BIG_ENDIAN from compiler.h
> 
> Shivaprasad G Bhat (2):
>        tcg: ppc64: Fix mask generation for vextractdm
>        tests: tcg: ppc64: Add tests for Vector Extract Mask Instructions
> 
> 
>   target/ppc/translate/vmx-impl.c.inc |  2 +-
>   tests/tcg/ppc64/Makefile.target     |  6 +++-
>   tests/tcg/ppc64/vector.c            | 51 +++++++++++++++++++++++++++++
>   3 files changed, 57 insertions(+), 2 deletions(-)
>   create mode 100644 tests/tcg/ppc64/vector.c
> 
> --
> Signature
> 

