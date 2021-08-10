Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4278C3E7D61
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 18:22:16 +0200 (CEST)
Received: from localhost ([::1]:42310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDUW6-00039t-So
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 12:22:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mDUTm-0000LC-70
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 12:19:50 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:38612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mDUTk-0003yo-NK
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 12:19:49 -0400
Received: by mail-pl1-x635.google.com with SMTP id a5so6113664plh.5
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 09:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ED3pTGZrFzDzNpTX+flpCcUjOMhh0cAET6wVnTkwo/c=;
 b=eYrE1DBU3hktgcc1/mRh9419FfHX26ZJnAoXU7cmnly0CayBCRaXZymzrOoF2+Dofd
 cFxl9AkZdWxsCo1Ms3nHpD3oOOmSv9zXzNk9HN1ggusKRmxnuMOHMUWchSDtCksPhwfy
 c9rWAOEpUiKsUPfSmuzUmkMrvHsyars5NNd4+A9DfmLs0ixGQPzvV0BHbzwxAimagJpO
 t7rMTaH0L64csFNeyqnMIDnKQiTFd9KAHKc6ejZgVwOn/i+MWAtz9lQIrW0Au0cnpYXM
 hIzhhmf2nCMse2+iu8/FD+dPny/QWOZl+eg0FsgQ39itDLGForFH96Jf7ssnyAlWlYjh
 H61w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ED3pTGZrFzDzNpTX+flpCcUjOMhh0cAET6wVnTkwo/c=;
 b=GuBIlWc7/3SCVLTeTTWJFJPUfMpSQm3T6MC7TVugqmEe3KwGaUiQHcnoqP8c/Usw/w
 yY75jMEeY97paav5oLLNx7FGddrTOyhoqi63faHloZyAEYRClWL4Ld2NnFpA/ILLlNBa
 FkGs8macTqbmoPiqyh1jhpJLHu89j0OlxODUgvRpVNFzPSCZNMfa87td8dGCO4czj9AZ
 j8j9DX3Wb+11haKSBgMSe4Ce2D5j7CWgV2oknqo0sKyn4Z1d1TraRmjkYSGWDE+3orYL
 6cdIs0oWza6KJOJ/k5sp0hxampe5kXTQLmsZGoAE2uqVhPIc5kWHZP6c5pL00CxGFXH4
 arIg==
X-Gm-Message-State: AOAM531DatIETrtksKqDyazKJtOndpAgAuF2cugdTnVvLqwls1JjjxiG
 buUQ4F/nmniPAVApsEQU96L9gg==
X-Google-Smtp-Source: ABdhPJyTz7LNugx4Ma+7PH76rVvpqZE/LhbdP2sveTlm7BCpYWcpitrBzW2izYvF+xKcVG9USdvECA==
X-Received: by 2002:a65:434c:: with SMTP id k12mr438227pgq.17.1628612387070;
 Tue, 10 Aug 2021 09:19:47 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id c2sm29281089pgh.82.2021.08.10.09.19.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 09:19:26 -0700 (PDT)
Subject: Re: [PATCH for 6.2 37/49] bsd-user: update debugging in mmap.c
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210807214242.82385-1-imp@bsdimp.com>
 <20210807214242.82385-38-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <426c50f9-0f17-ab31-0964-a8a6461bbd92@linaro.org>
Date: Tue, 10 Aug 2021 06:18:47 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210807214242.82385-38-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kyle Evans <kevans@FreeBSD.org>, Sean Bruno <sbruno@FreeBSD.org>,
 Warner Losh <imp@FreeBSD.org>,
 =?UTF-8?Q?Mika=c3=abl_Urankar?= <mikael.urankar@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/7/21 11:42 AM, Warner Losh wrote:
> From: Warner Losh<imp@FreeBSD.org>
> 
> Update the debugging code for new features and different targets.
> 
> Signed-off-by: Mikaël Urankar<mikael.urankar@gmail.com>
> Signed-off-by: Sean Bruno<sbruno@FreeBSD.org>
> Signed-off-by: Kyle Evans<kevans@FreeBSD.org>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/mmap.c | 49 ++++++++++++++++++++++++++++++-------------------
>   1 file changed, 30 insertions(+), 19 deletions(-)

Acked-by: Richard Henderson <richard.henderson@linaro.org>

For the to-do list: convert to qemu_log_mask or tracepoints.


r~

