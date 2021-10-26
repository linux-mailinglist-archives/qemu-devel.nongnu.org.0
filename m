Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF5C43B543
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 17:14:41 +0200 (CEST)
Received: from localhost ([::1]:50372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfO9w-0004fU-7f
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 11:14:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfO6x-000238-HX
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 11:11:35 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:35810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfO6w-0004K4-2u
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 11:11:35 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 131-20020a1c0489000000b0032cca9883b5so2186812wme.0
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 08:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ynyI8XQVeF7fSQSV0/HfyTmXM6rLsI5E4/wTfg3YeKc=;
 b=ejJJDvBrdhJNVx9Fptzlat/aw2l+Rdy7ifUFgKMbI9nvTnKRBtk8GTqKUqYD3IBNK1
 hBVGvxXn679d42AvS/dn6QMOdzw6W5gBjx3ismMYSt+AG9g/62sTHSpwSiMgtFS8Bexq
 Vuu9UTGGAJfK/B2MW6/eeitp5/7AF4RH1tqQAKcLySMxWF0QIjo1e2nuy4tqjYOBsUL1
 GAlAIDdAIReMLN9ferOv5Mp8uWnIzGUfXp+6tH4ifJdjCIfnHntPwTWk3zcKyczUK1Qk
 7yGtVwRuz9xwbFpITWwSZMNAG18X+N1ioCp3dgaVJ18Ir34qjG+lDKIAlJuLkObTCJrW
 B1Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ynyI8XQVeF7fSQSV0/HfyTmXM6rLsI5E4/wTfg3YeKc=;
 b=n6cdThPdMN+zccn/bjVE/h67NkXDQKaKiJ3GbDI3Uq3k55Sm39Hg7KW9PmPn5F8qQR
 d/20K/DjkYt6lMCmDxTDIhCR8sg0UejIm/LDkTPU26/ygAebB48WtyZV34AXzSSrBsB+
 uSBT8gCCG/Zvb8t4A5auNsvlXwgct8pG4BcfTTz5oUzUZJQgjsS5LBMQGTM6juMdJIn+
 o3dGsjcMqD/wNFj9gdZNDTlb5yFPFkzPl1eAKZroPsFuUOurto7sziTqu3rvo7AsOcB1
 8vqNy3L3pt34Fx7UBr3xkDYkPSrg8C6yZJXKDaOHEgDHgbQmGwZEqCbnJObNpcwahlqS
 5kkQ==
X-Gm-Message-State: AOAM530PaTfKoO1oHiIq6DSQ0yGSX7IdkPn5vnBKz7don+uDDUPZhyLZ
 BMEKhaUpWN4xVC91eFRs6Io=
X-Google-Smtp-Source: ABdhPJx0jL1so0yzNL/7wiwGQLjrdAHMGAmKRGOjpWHDQ9q2VORhFFtLaSO2CT8Ssf7fJfuvYwsAwQ==
X-Received: by 2002:a7b:cd90:: with SMTP id y16mr13478332wmj.34.1635261091970; 
 Tue, 26 Oct 2021 08:11:31 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id g2sm18761269wrq.62.2021.10.26.08.11.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 08:11:31 -0700 (PDT)
Message-ID: <cfb25c6d-e7da-efc3-72d9-055cfa86aff0@amsat.org>
Date: Tue, 26 Oct 2021 17:11:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v1 27/28] tests/tcg: remove duplicate EXTRA_RUNS
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20211026102234.3961636-1-alex.bennee@linaro.org>
 <20211026102234.3961636-28-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211026102234.3961636-28-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.215,
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
Cc: fam@euphon.net, berrange@redhat.com, pbonzini@redhat.com,
 aaron@os.amperecomputing.com, robhenry@microsoft.com,
 mahmoudabdalghany@outlook.com, minyihh@uci.edu, cota@braap.org,
 stefanha@redhat.com, crosa@redhat.com, kuhn.chenqun@huawei.com,
 ma.mandourr@gmail.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/26/21 12:22, Alex Bennée wrote:
> We set it bellow outside the #if leg.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  tests/tcg/multiarch/Makefile.target | 2 --
>  1 file changed, 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

