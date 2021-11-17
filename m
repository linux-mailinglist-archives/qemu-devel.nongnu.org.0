Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29ADE454299
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 09:27:02 +0100 (CET)
Received: from localhost ([::1]:44352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnGHV-0004Os-AE
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 03:27:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mnGEB-0001AZ-2p
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 03:23:35 -0500
Received: from [2a00:1450:4864:20::336] (port=41605
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mnGE9-0001as-EI
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 03:23:34 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 f7-20020a1c1f07000000b0032ee11917ceso1459019wmf.0
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 00:23:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=32xlkqO5fKPijRgy6hWPEn3T+6CHduefpcTbwIRRVk0=;
 b=VfIgxlReUCegBVq3b1OzqlOkwNr/uqtwbkuPpcH0InglgyMy1KvJ74Q3oPrPjeGgaU
 g8yb2wuVdFmDxI+42SHUFYnI0xfN83a6DYl27zrs2mBnVjul3w8qrshVNSq5Zsq4kjeI
 CLHBToa0aonRPznUFIm/iyId7uFwjrh9PaZipz6JzsSr04Nb/DdKJ1bFAYmg0N6Q9V1S
 iSajStwIDL397Kt4YAFYgO20+wsrMNTqe+M/H0gvadgNoipDs8Hwe9ysgb64IMRhrq3/
 Xg1bib6dUjWTTCHNSOLhFim3+KTLtKtE8vWe3svzNxOkxE0RIaWxn2p1Wfsyd3T+v0PX
 XQCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=32xlkqO5fKPijRgy6hWPEn3T+6CHduefpcTbwIRRVk0=;
 b=jnX8I9c1vGgzCHiT1KGKDCPbx1Mx62uzCvcu6Dmf3uhLAyeDsey6qInsMNYykNYSWT
 J68GV0wZ1o88ICEVo6Y3Yhsz1enUXVaIyi8mIbafVnrikWs0c9oiaQWUeTQRTF/NJhTH
 +gnHapKfgIIwyQhcUQ1sCiZBvpLYC23ouXci6ccJrE9xkfWLyrm07vSmESt1b5rrTP+s
 QG81D8CkgOE6XH1So+k1dA11xK8Fn8UZkShzURroTnFx25c/4WheYKb1HsQhxSKxyto8
 HAdnj9LqEp2yPH94uWHonFPSfgVfghNyMERCE8OnB95GcASZ2qL/M0x/4gOgJAYTOGN/
 g8rg==
X-Gm-Message-State: AOAM530WeL7C0epzxRI+Bb8m2YoYzWWGDUxBxLGPUakHLZJ18Z49G7ll
 lylucO5U5hte4aZRYc7A8f+EeOId6Yk=
X-Google-Smtp-Source: ABdhPJzqQRhmyhKZ+tMvTvxtTZj/nrVW8+1YnKo/WQO2rXf+TqoGmMdDT2B0yiVQhMOIDiZ39wV2ZA==
X-Received: by 2002:a05:600c:3584:: with SMTP id
 p4mr15680215wmq.65.1637137412049; 
 Wed, 17 Nov 2021 00:23:32 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id n13sm19953896wrt.44.2021.11.17.00.23.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Nov 2021 00:23:31 -0800 (PST)
Message-ID: <dddc2e78-27ae-dcb3-6f10-29f935fec9c4@amsat.org>
Date: Wed, 17 Nov 2021 09:23:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 8/9] common-user: Adjust system call return on FreeBSD
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211116110256.365484-1-richard.henderson@linaro.org>
 <20211116110256.365484-9-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211116110256.365484-9-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.009,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: laurent@vivier.eu, imp@bsdimp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/16/21 12:02, Richard Henderson wrote:
> From: Warner Losh <imp@bsdimp.com>
> 
> FreeBSD system calls return positive errno.  On the 4 hosts for
> which we have support, error is indicated by the C bit set or clear.
> 
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> [rth: Rebase on new safe_syscall_base api; add #error check.]
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  common-user/host/aarch64/safe-syscall.inc.S | 12 +++++++++++-
>  common-user/host/arm/safe-syscall.inc.S     | 11 +++++++++++

Can we split this in 2 patches?

>  common-user/host/i386/safe-syscall.inc.S    | 10 ++++++++++
>  common-user/host/x86_64/safe-syscall.inc.S  | 10 ++++++++++
>  4 files changed, 42 insertions(+), 1 deletion(-)

