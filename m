Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC825ADACF
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 23:12:33 +0200 (CEST)
Received: from localhost ([::1]:43422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVJOS-0001aH-5V
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 17:12:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oVJMW-0007AU-Ap; Mon, 05 Sep 2022 17:10:32 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:52202)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oVJMT-0002tK-Ux; Mon, 05 Sep 2022 17:10:32 -0400
Received: by mail-pj1-x1029.google.com with SMTP id mj6so9334200pjb.1;
 Mon, 05 Sep 2022 14:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=W2UneUiCbPNUwuXuRnkW3oSZVMtHDwsImS6DsCTtNWw=;
 b=H5+lqSjLxLKLovrs63dETSS8BYqE7TVuYKshE2pCq8ylrTIJ4zWd/50YaScOuhTCsZ
 R2pfrSgT0R+Hi94po68eV0BQ2dzpd0/qzGdiTYaxq02zmjSXTC5UiqcThjtttOzsufHe
 XBwf57z+xxfdfT3W2IB9P+GC1zCWQ/95b+nJ06AnHfU6rDM6hx+4kGSNNmNh2tefeAEZ
 e4UXZTT4g5v+PIS4LRCawFne55+oZEMyFH3yaZYs5wapP5cHs2Ng+m8eu5BT9I9RXi3M
 bBYMnf5028PuJcRI90bKHQgWlu093KjmyNNL8TknQn0Uo0NNMmMONPWNYNHprZe/vquE
 5z+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=W2UneUiCbPNUwuXuRnkW3oSZVMtHDwsImS6DsCTtNWw=;
 b=Y/NuKtSrdh+JDgCtFSNWRQ0BrJW4eVTj0FnOKeOYJXhrIP9z5dnRM/YmJyaUN5yfva
 JSsuJr1HbWYbtTGRRiXWwSXjeDvNd0xav146BAQvahmiAIOChnZaU7iY0lNUaK5iOq9y
 TiZiPUjwf/jaIwuIM+Nj6yt4i0KTiQvNc34yXA4QfWJdnEKvK+dTJyEFvvHuG+33+bkK
 gErVEx4YcYORaRnRMohU7w2qhUAleLQqChbX5OL7WKGhNilIdOTNDWjyXMc/nRVr5DDN
 XIoovx8YvDDLZis4OFyUITDo3YcfioByIQ9cMVNkYQMe0KWgwUlwdgej0Ri/PVPj/MHU
 /V6Q==
X-Gm-Message-State: ACgBeo3LTZ5HvLgOzya9hANU8l8gV1YTTpiMHZ/VTIgRQ7ffnF2fbRhz
 255l6ugIvSYqiJYsN12Yehw=
X-Google-Smtp-Source: AA6agR536/MvYwgu5V8SdWOSicbd9aJIMdWq9io4pnrJD5Nfa2dKTV0ubjlER4Aqz1znc+G0fod8AA==
X-Received: by 2002:a17:902:9889:b0:176:b281:b911 with SMTP id
 s9-20020a170902988900b00176b281b911mr5627876plp.79.1662412227205; 
 Mon, 05 Sep 2022 14:10:27 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 s2-20020aa78bc2000000b0053e0d6f353esm320079pfd.27.2022.09.05.14.10.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 14:10:26 -0700 (PDT)
Message-ID: <8171d882-f12e-4dbb-7f46-695b9eab27ff@amsat.org>
Date: Mon, 5 Sep 2022 23:10:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v3 4/6] accel/tcg: Introduce probe_access_full
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, pbonzini@redhat.com
References: <20220905202259.189852-1-richard.henderson@linaro.org>
 <20220905202259.189852-5-richard.henderson@linaro.org>
In-Reply-To: <20220905202259.189852-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.716,
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 5/9/22 22:22, Richard Henderson wrote:
> Add an interface to return the CPUTLBEntryFull struct
> that goes with the lookup.  The result is not intended
> to be valid across multiple lookups, so the user must
> use the results immediately.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/exec/exec-all.h | 11 ++++++++++
>   accel/tcg/cputlb.c      | 47 +++++++++++++++++++++++++----------------
>   2 files changed, 40 insertions(+), 18 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

