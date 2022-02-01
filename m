Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C38524A6981
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 02:13:14 +0100 (CET)
Received: from localhost ([::1]:56888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF4Cv-0007h6-De
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 20:13:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nF0t8-0006gX-7U
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 16:40:36 -0500
Received: from [2607:f8b0:4864:20::1033] (port=55045
 helo=mail-pj1-x1033.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nF0t6-0005Ic-Or
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 16:40:33 -0500
Received: by mail-pj1-x1033.google.com with SMTP id r59so18359059pjg.4
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 13:40:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=/+4XiE47HxdmM7HWg5hpYzUE5onrtY6AOuwWDWFgF9o=;
 b=jXggXBJGWZESaIs1aALB8SzTrFrKJ0dpFUSWIbctERFt689aRh/QSZAJCSvapQ83qW
 5G1GFkbjInAsEN7iYA6MmjmNorGMz4Fi/q86HhcNshiJNT8EWfyh+JUXhon33g2y7B7r
 zhvrqlOCjQqOjte98vpsoE+FZ3AAmw5/6wOJmsda28aWV+d2deRsyBLl1IaQix9pIbWK
 6VypFrC/rx2zeLOOnUec//pZ5MZqEIPxPeFp9Ot1ArmsAgKdI5NrCbcwYn0JBQecaGIM
 qsC5dP4umEWaHWgiC5mBvdkm0Fi8nOgmYBr6XKAdGTCEGsx5VOfYvt01+5l0OrBx2pY4
 p5IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/+4XiE47HxdmM7HWg5hpYzUE5onrtY6AOuwWDWFgF9o=;
 b=qdDd0g/W3SiMV56mFzPmMmhLq/Oe82El5+x9gIz8PzjEPkJVxmMBUCMemP72whcrBC
 rcfOVhP5l6c/9iNosOZBJSns0q14GUCAA4Jx0JgZIITZUPN1GrPbtrrapqrj9kzqPAJf
 k9VCXgQEgp9hgIFsy2F/TKvUVIEBV0AHNcTpg2GW9Bd0I0FtRmnY4fnWlDjhwQUQnwkG
 RUjPt6BnbHyY6W2123PI85yKl+NDM57stjJMF0KxC7khT+eBRG7jxlHHpNDn8LzE9jCH
 wZchvPw5hYtjoCSq48sXjnvDNuqJVEyH0oA3vyClPGk3sWSIauw7YsFXzLLrose0m1ov
 YLEA==
X-Gm-Message-State: AOAM531ZGG7rJaHOxvBFyoucXupnbMHlJMKlzrVuV/+EdC1NQaBUD918
 1ZHepKjVkrlMY/ydMDQfdcbwKg==
X-Google-Smtp-Source: ABdhPJwvnSGqJUjtm+Vnr3xdsWZCwCICeO/l0cfgmmzQrP7AQVFLcUqe5tpTwrZwXOE2QxkkJquT/A==
X-Received: by 2002:a17:902:6847:: with SMTP id
 f7mr6176758pln.26.1643751629000; 
 Tue, 01 Feb 2022 13:40:29 -0800 (PST)
Received: from ?IPV6:2001:8003:3a49:fd00:4f14:faaf:dae:66e4?
 ([2001:8003:3a49:fd00:4f14:faaf:dae:66e4])
 by smtp.gmail.com with ESMTPSA id g19sm17524819pfv.4.2022.02.01.13.40.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 13:40:28 -0800 (PST)
Message-ID: <42f97813-b487-d57a-89db-561558f95dc9@linaro.org>
Date: Wed, 2 Feb 2022 08:40:23 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2] bsd-user/signal.c: Only copy the _capsicum for
 FreeBSD_version > 1400026
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20220201212809.59518-1-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220201212809.59518-1-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1033
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
Cc: Kyle Evans <kevans@freebsd.org>, alex.bennee@linaro.org,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/2/22 08:28, Warner Losh wrote:
> The capsicum signal stuff is new with FreeBSD 14, rev 1400026, so only
> define QEMU_SI_CAPSICUM there. Only copy _capsicum when QEMU_SI_CAPSICUM
> is defined. Default to no info being passed for signals we make no guess
> about.
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/signal-common.h | 5 +++++
>   bsd-user/signal.c        | 5 +++++
>   2 files changed, 10 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

