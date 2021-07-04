Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8DF3BACAB
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Jul 2021 12:02:00 +0200 (CEST)
Received: from localhost ([::1]:60154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzywp-0002m7-BJ
	for lists+qemu-devel@lfdr.de; Sun, 04 Jul 2021 06:01:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzyvF-00023i-QN
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 06:00:21 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:47073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzyvE-0007SC-9a
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 06:00:21 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 k16-20020a05600c1c90b02901f4ed0fcfe7so8162012wms.5
 for <qemu-devel@nongnu.org>; Sun, 04 Jul 2021 03:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=X43G2vqHaiStyCF5QNVnvA+3bCmk1QKUPRJquYz8x98=;
 b=Jx5lZ7Qrnh1etzdClTy9h4tig5Z3nHnsYWhqh1z8o4mDYo+//WEM6dGIDZGc8fIl+1
 p1UdcQBs7+TrJ2o8CQTt83l9c7fU2SsxUouz7tDr4WlgBPPKYSJgGnzvs4Dh71SJ2Yk2
 xeJ4dpWUIeQnSKZqwnEBF/r7tkQk5ZH0UVeNzaLprGVnynt93o5dvnzm8Vcy86DbhlLT
 Sc2/ZcEOIHMopTeqlWRnmY4/u0pJsDi2vlRsB/TTyM9HJ7d+QRXOBOTFwCfTWTUMD6ne
 RAW8tJ1jID1vLf5h5Gx6oqEXSjMVyQDBt3NKOXOKWDAJQdZYYv9Wq1XdYsNkeHGC0RYH
 xFHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=X43G2vqHaiStyCF5QNVnvA+3bCmk1QKUPRJquYz8x98=;
 b=icKzh8Tejap7NEkuuP+Iq8Y5/Ri9lvKTGC+lW7DuqZZu6gHaqh5o5JMv814c0QRBZv
 pLP61Fhj/p938FHJl3DpaJoaFngHRbpPeFmnai/ASKZ9V5YkP43wWMao7N+67oTypytM
 iC/JYQZZ4jecceSc8fncIf2WfuKfR/ImSRPMDXjI3k7tQkPh7Vdn9JRYM+2345/xbmek
 DjLd4vNSIgofqb3q/pHHzXq/azkiQsMX1Os1oQSgZ06Du8xCAhvimTErH8tHBw6llwqB
 H3M2P2UjTYTaQWDkajvbFR4Yf1nO6P5YG/chfnWjBSiuGSoVtmWuAD9JYU+lDxeBjwBY
 ax5Q==
X-Gm-Message-State: AOAM5327ldEKIqRbh2W/ON1+vgDEYR8osgTJz7QyzyXx/CdcG0X5wXDW
 At9ZatX98WVOyH2IM3UxRYBmvvhX7qs=
X-Google-Smtp-Source: ABdhPJxJi8jNWKkaqz2H3Wkb3dmORVbwd44A3JwOWxDSuD3Yhw+fzV1vjnpameUt93rh571FezhHqA==
X-Received: by 2002:a1c:c90f:: with SMTP id f15mr9188930wmb.142.1625392818399; 
 Sun, 04 Jul 2021 03:00:18 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id p18sm5678844wrt.18.2021.07.04.03.00.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 04 Jul 2021 03:00:17 -0700 (PDT)
Subject: Re: [PATCH 2/2] Fix for Haiku
To: Richard Zak <richard.j.zak@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <CAOakUfOz=89WuCyAQhrebNj_K_3_2ZYAJ_=aRR2bAuKT5=9uow@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <5d7c7f63-381a-836e-be8f-68e3fb938d4b@amsat.org>
Date: Sun, 4 Jul 2021 12:00:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAOakUfOz=89WuCyAQhrebNj_K_3_2ZYAJ_=aRR2bAuKT5=9uow@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/3/21 11:12 PM, Richard Zak wrote:
> Fix for path to env
> 
> Signed-off-by: Richard Zak <richard.j.zak@gmail.com
> <mailto:richard.j.zak@gmail.com>>
> ---
>  Makefile | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index 30f19d33bb..ced9b97372 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -14,7 +14,11 @@ SRC_PATH=.
>  # we have explicit rules for everything
>  MAKEFLAGS += -rR
>  
> +ifneq ($(BE_HOST_CPU),)

Where is this variable defined and what is it for?

