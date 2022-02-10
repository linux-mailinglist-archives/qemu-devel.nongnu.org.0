Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7184B195B
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 00:22:19 +0100 (CET)
Received: from localhost ([::1]:41336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIIlW-0004lo-N6
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 18:22:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIIjS-0003DW-Bz
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 18:20:10 -0500
Received: from [2607:f8b0:4864:20::1029] (port=44926
 helo=mail-pj1-x1029.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIIjP-0003vG-7n
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 18:20:09 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 d9-20020a17090a498900b001b8bb1d00e7so7106933pjh.3
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 15:20:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=iSRmoYAPQFWkILcin0mdXqBv2dDSe+NftvfwoTKvChc=;
 b=nA5jDwP5FbuZRkfSGNNMhgW1bors/ATlbok6VWRyngoK8hkIxc9B1iXs//YOvacy1N
 G1NWlJ07FK1xG4S6yvmWs5OA4t3YPWH7ciKCMnufF/MnPdHJIvRhQVx936XXHy4U7C6U
 0/hI8jYlNFhdtnPquJtkvV9AJ+zxsjxHiJF85JfVD38MV+cY5GXjFUU8KjOWlVcp4l58
 lKsXpToJstc/Xz94lDq0gmoBHCBtl8e/Gv/HS5cxNeKHXOQqdP8+doPXT1TVY+qfICBE
 A2Run/GVIxFfmz3KguWkKvW74nqnIhl4ufms+v/xRTmJt59K4qvwjBLmq8ZrAJn3w+8C
 AJeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=iSRmoYAPQFWkILcin0mdXqBv2dDSe+NftvfwoTKvChc=;
 b=eO/nS4vaUf6Mmj6cwQox5+pxpogKyC/41jcFeHOSD+ZuRxl6b9+7o2q69KclJ8dftC
 iKrWZNGRonGNh/Je8OdSsYrHH4pTkIun0vdiLCD2KZYeU1bMVfqoFB3Z7/yob+UPjM/o
 U2ahaQ7f08JEXtRkYs0IwUg5uNatXPg5NhhAz9v1jL3kJQPd1JL4EIk+molJ8gfc0DsX
 X4Qq874T5e5LdOC/ftLK4VKNEV/0WJDufcdCxQUCbSSU7+3cpNj40x0yUz/LeRDE2vMx
 +yguWbgdta9QZAvZspnqMQnx3a75haidQPoakevTG8TwYC7hRhJODr2TBJtHX0n/ERZZ
 cRkg==
X-Gm-Message-State: AOAM5309MPlrODCtoRltEVs0z6mankCniz4NfZ7qDmIMRleVWelE8333
 LUwIqlQG8cY/Ju5C2w3JyYgMtQ==
X-Google-Smtp-Source: ABdhPJyW/yf85vrgird4T/bPzk6sgBZsIZUa4Rec+5VYTEv9OhGTAXDrhv4+wVWsgTBRHH34yDO+7Q==
X-Received: by 2002:a17:902:ec88:: with SMTP id x8mr2554148plg.9.1644535205771; 
 Thu, 10 Feb 2022 15:20:05 -0800 (PST)
Received: from [10.0.0.163] ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id o1sm26974409pfu.88.2022.02.10.15.20.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Feb 2022 15:20:05 -0800 (PST)
Message-ID: <cdd11da9-a90d-75ac-40f7-7086e7e40f66@linaro.org>
Date: Fri, 11 Feb 2022 10:19:26 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 7/9] user: Declare target-specific prototypes in
 'user/cpu-target.h'
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220209230030.93987-1-f4bug@amsat.org>
 <20220209230030.93987-8-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220209230030.93987-8-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1029
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/10/22 10:00, Philippe Mathieu-Daudé wrote:
> Move user-mode specific prototypes from "exec/exec-all.h"
> to "user/cpu-target.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---

Why a new cpu-target.h, and what is it supposed to mean?  What else is going in there?  It 
all looks cpu_loop related so far.

Why is this separate from the next patch, with "cpu-common.h", which also appears to be 
basically cpu_loop related?


r~

