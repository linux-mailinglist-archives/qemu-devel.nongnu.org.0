Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 521C94DC9B7
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 16:16:41 +0100 (CET)
Received: from localhost ([::1]:59492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUrrk-0007Ii-6P
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 11:16:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nUrmb-0002ze-0e; Thu, 17 Mar 2022 11:11:22 -0400
Received: from [2a00:1450:4864:20::631] (port=40649
 helo=mail-ej1-x631.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nUrmY-0008Fb-Uy; Thu, 17 Mar 2022 11:11:20 -0400
Received: by mail-ej1-x631.google.com with SMTP id p15so11391181ejc.7;
 Thu, 17 Mar 2022 08:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=R4t1Kyxu2BzrNpXgA1x5+ExroFdy6slzwTNpzZffidc=;
 b=hYmgiZ4xjntrmwHp0/Uql4QP3APcvOHqmQm+atTYJwzPRPKL7TsXP4NvsXGW4SpPMv
 z5ENmlPoaKH146MuJH8ERUgzmbIUe6Yn2A3jSXyRCyG544WEmBQBEHBa55d+CpAzMOWz
 7z7PWHQg/TK9DIZsyJIQBy8pCLVYLc14ZapiTKrfZ4eN2Y2Ly1awhp217IXiHbCn9oNQ
 4k03UUK4dbsT7g6aUoF5lgRXb0wbfWwgWoY26u5jTkjKEIhK05PzOyZBH9KGMU6Y4t1m
 GP0TIeKzfhmtVI4FcvBIvPHIvqlxmbCGzi3K0eJ8h3zJ1nr9f2BojH+Vj5YGeyz2jYIS
 oDlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=R4t1Kyxu2BzrNpXgA1x5+ExroFdy6slzwTNpzZffidc=;
 b=nz1GbWKSqZBXZDyxg84qoQ3bfJe1mTAY96Ib+jYb3Ye6KQTB0WXIDvo0evmAsrgUNz
 pFE1P5E3rugT8ZpBShnw5pswTUZvu2/04Qz7nEnePmF63AQ81rp276feJC7Ns8J8psQM
 cPyb7/YO1mpZ/XrfxdhPOckIVp+nF22CFTPnB9aWZ4a1KTFvhJZ/wNK7cN7a6TTIrPOu
 Z68ufd+7b6mkz/Kk1TrHC8ctsHuPbJi0YGBs7J9r7wZqefXE9XvsD8hc0XLc8+9OVve0
 6RhoTLs6vbP96wEhPdlZSD71CgTQJyGpThAF7d4dq/5NPlpIZc4NBXsbKqMHl6LdrwPa
 JQOQ==
X-Gm-Message-State: AOAM530wlEffbomQAF5xns9C47cvPGI38CYsdihmGqJXbptSKdrfQKwD
 u234FjFTDswrU4uC79Yn1lk=
X-Google-Smtp-Source: ABdhPJysvX7CLH5QAs+RonVWJI8fxX9odPU6BLwcmiQyAOtPai0nY4cJ1bEjS2bkGW8SnQJ/FSd5nw==
X-Received: by 2002:a17:907:3f29:b0:6df:7eac:7fa4 with SMTP id
 hq41-20020a1709073f2900b006df7eac7fa4mr4737750ejc.391.1647529876565; 
 Thu, 17 Mar 2022 08:11:16 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 eg28-20020a056402289c00b00418e989edf3sm2610098edb.87.2022.03.17.08.11.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Mar 2022 08:11:15 -0700 (PDT)
Message-ID: <d041cc7c-f437-3092-2485-ec9b2b0f8c96@redhat.com>
Date: Thu, 17 Mar 2022 16:11:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH experiment 00/16] C++20 coroutine backend
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <20220314093203.1420404-1-pbonzini@redhat.com>
 <Yi9MBGoc3WtOLx82@stefanha-x1.localdomain>
 <4528e387-8016-0774-9c8b-532a75566d9d@redhat.com>
 <YjCdKfbQsgfsw76N@stefanha-x1.localdomain>
 <CAFEAcA8zongmSfDAgorr=RfKK6Qsgyi1xNz5KBzdB0RGeSBSWA@mail.gmail.com>
 <dca7d15b-2f24-cfb2-9a31-47b5ffd9c3d5@redhat.com>
 <YjHY8GA52MzjBxLK@stefanha-x1.localdomain>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <YjHY8GA52MzjBxLK@stefanha-x1.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::631
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: kwolf@redhat.com, Peter Maydell <peter.maydell@linaro.org>,
 berrange@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 hreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/16/22 13:32, Stefan Hajnoczi wrote:
> You can define rules and a way to enforce a subset of C++, but I think
> over time the code will be C++. A policy that is complicated discourages
> contributors.
> 
> For these reasons I think that if code runs through a C++ compiler we
> should just allow C++. Either way, it will take time but that way no one
> will feel betrayed when C++ creeps in.

Fair enough.  We even already have some conventions that will make any 
C++ that creeps in less weird (for example, mandatory typedef of structs).

I don't think it would be a big deal overall.  I actually agree that we 
should "just allow C++", what matters more to have style rules that make 
QEMU's flavors of C and C++ consistent.

Most files are leaves (i.e. they just expose an interface via 
type_init/block_init/etc.), where almost always people will copy from 
something that already exists and which will be C.  What matters are the 
core APIs, and maintainers have way more authority there to say no to 
code they're not comfortable reviewing.  This way, code within a 
subsystem will keep some consistency.

Paolo

