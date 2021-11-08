Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A6D447B47
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 08:44:13 +0100 (CET)
Received: from localhost ([::1]:40632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjzK8-00034r-4E
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 02:44:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mjzIa-0002Jx-Gy
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 02:42:36 -0500
Received: from [2a00:1450:4864:20::434] (port=39928
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mjzIZ-0007Qp-21
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 02:42:36 -0500
Received: by mail-wr1-x434.google.com with SMTP id d27so25213591wrb.6
 for <qemu-devel@nongnu.org>; Sun, 07 Nov 2021 23:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YdB10ZVRylHVmT4H1qBD74R2pX/eu7QQD7UCVz9FydY=;
 b=I/42A9gqyzSnEoO8sm8yOdjoJACTX5lKRhxwQH29P11byrmHPI1LIlAQ02CwusL2iU
 ACUpvGaBMeXxDHuI74Zh61IJYJrf1KGT0HpAwWNkxKA64HmW2MkCf+3/tS07yLPLKxVK
 CpGiEPnLUYlN4n1fDfrQRiZer71FwSL/xMCgNHctFS+QLU4UmvELIjmDgvUk6Krgk/gR
 fth35o2qhaXFYuCeJAq/eWQM2GXCT76mnrIWDa0uoHXFQDhcsiO59c8QSJco4jPy2MR+
 EPHkaOLCqAk0Pam7limnk4e7b2TL2bWaUurYtytaPGPKY55swhnUxClameUuHOk/VKAe
 6IpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YdB10ZVRylHVmT4H1qBD74R2pX/eu7QQD7UCVz9FydY=;
 b=2t1fGf29IvJ21nLbNLqG8jWdVk4+DC7j8WIDNHywrJK33BWhpdfKiu3qVE/2Of10s7
 A4SLzBdiRaCoqssFgYzqBNHT89HIPOoxyqaXpwwqKsXsK2kpcxjLtRAnv5dpvdUf59ml
 ySSLlTqRWYBQ2f6XYU5JcEiOp6gscvMOFyiSi+K8SXfLsQ/0mjnydcypxHE9qUbLCVhC
 szkdL6gE36EHC6I+i/q9Rfd0G85JvOqW2CVOPD6FEraLWwuqWjh0i6kqkHG+QQajEMWv
 dS5L6kMzVtvHJ308kumCZHVbPU8doIjbmM9SuUOcLt6+3jF2ySeImMNVdCfQQrAWZ+CD
 qjHA==
X-Gm-Message-State: AOAM531RpFw4MLfMS6E7s0B9/TGU/2Sr0M4yCpSqu1GYSRx2lmy4KafY
 Zff8Esij2U5XVr5xAGGXhII=
X-Google-Smtp-Source: ABdhPJxJT/6QE7N1Y6/5BWcHF3fzffZC1nx6RPzEyjnlaLTUEwrHlhIlKP+C39xmSJC4wQbiXOf+uA==
X-Received: by 2002:adf:fb09:: with SMTP id c9mr38403489wrr.223.1636357353141; 
 Sun, 07 Nov 2021 23:42:33 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id f7sm9880491wri.74.2021.11.07.23.42.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Nov 2021 23:42:32 -0800 (PST)
Message-ID: <9e73bd0f-2820-2a8d-9194-559d5bf94223@amsat.org>
Date: Mon, 8 Nov 2021 08:42:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 1/4] linux-user: Split out do_getdents, do_getdents64
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211107124845.1174791-1-richard.henderson@linaro.org>
 <20211107124845.1174791-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211107124845.1174791-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-3.06,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/7/21 13:48, Richard Henderson wrote:
> Retain all 3 implementations of getdents for now.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/syscall.c | 325 +++++++++++++++++++++++--------------------
>  1 file changed, 172 insertions(+), 153 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

