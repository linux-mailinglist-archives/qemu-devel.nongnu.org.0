Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFEBF57F602
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Jul 2022 18:31:49 +0200 (CEST)
Received: from localhost ([::1]:59726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFeWB-0000VA-IJ
	for lists+qemu-devel@lfdr.de; Sun, 24 Jul 2022 12:31:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oFeTC-0007Ek-NY
 for qemu-devel@nongnu.org; Sun, 24 Jul 2022 12:28:49 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:35511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oFeTB-0000zc-4b
 for qemu-devel@nongnu.org; Sun, 24 Jul 2022 12:28:42 -0400
Received: by mail-pl1-x62c.google.com with SMTP id g17so8430943plh.2
 for <qemu-devel@nongnu.org>; Sun, 24 Jul 2022 09:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=F8V2wT3E5JLC6hCVnV42fyxrb5Q4lqb3AASm1itpzIw=;
 b=VWqN1KENlU4x/uyfvZBgrTEtv3EDPoqu2TtIE7kUTQdkNG4i4kQCZWG0uiKqUha26J
 IH775yOOvo1q4ue33OqEhOk2xN2VtoRrloS1FcEqJIQqiEW5OTbQUiiOej2XMCz6tW30
 GuA/uK84JaQdOK/FKT/azoHg5M/Q9BNA0ETatCdmxz8Tu3p4Q+ApIZg0aORyfjTMBvOd
 3zMgURxkvSc5Dr+CFHedwtmzThaBnAbGXJoRCxNVHVYFdZIbl6ia+q8cxePhcPxAHknl
 eBlwHYR7y8M6wW04kfluKGMtsCGn5b392x6KJfsSffLONG5pQ7jaXBZbSmyPHXc45ui/
 BgSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=F8V2wT3E5JLC6hCVnV42fyxrb5Q4lqb3AASm1itpzIw=;
 b=doZMpGRm0FJ6ysJBt7TmSu8p4rf/vzzzB7EpMHgOxXMjPBDdQx/rI2FUyWX2n2VFah
 07L38snS1D+J/YA38w3TBk41jAC35NVFFgv8l27NVHQqObz7DLmrs3nA7ICxsh41RKIf
 9lBLv7VBWrMcvge0tEUa9xtZDosTF3yfp44x5el5CJKybcllSvYy1LLDOsfeKmwEDa7b
 FRpCJp36Btida7vkNeOfysaMYwXlNM+8ACylRJcQIo2wO81T9rRt8EXaVkHo2xgzM9Z0
 WUpAoYSSStbn/O+MosHNKSTAJUGQM2gbt4e6Y3DQRlFD7h3xM7YlBl7xAiBs2J/uFK0M
 3+rw==
X-Gm-Message-State: AJIora891PrDox1/bueBg9ZYou3kKcZfwxxPMRi/QwpcmT4mpMDNfEoX
 gz9Cokf6GgqIr8g/AdeN5aemlQ==
X-Google-Smtp-Source: AGRyM1tevnqsRvFXIlbF1/+Sz8O83pQGyetW8/znD04ZwrT5zJlP1Z2s0WDS8SYgD3U8fl589q1zMw==
X-Received: by 2002:a17:90a:4e4d:b0:1f2:5dff:3c43 with SMTP id
 t13-20020a17090a4e4d00b001f25dff3c43mr9407834pjl.134.1658680119496; 
 Sun, 24 Jul 2022 09:28:39 -0700 (PDT)
Received: from ?IPV6:2602:ae:1549:801:f67c:fb58:6d94:30be?
 ([2602:ae:1549:801:f67c:fb58:6d94:30be])
 by smtp.gmail.com with ESMTPSA id
 j3-20020a62c503000000b005251c6fbd0csm7731508pfg.29.2022.07.24.09.28.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jul 2022 09:28:38 -0700 (PDT)
Message-ID: <40af247b-ad3b-ffb5-c40c-6e618a3ebae2@linaro.org>
Date: Sun, 24 Jul 2022 09:28:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/4] semihosting: Don't return negative values on
 qemu_semihosting_console_write() failure
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20220719121110.225657-1-peter.maydell@linaro.org>
 <20220719121110.225657-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220719121110.225657-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 7/19/22 17:41, Peter Maydell wrote:
> The documentation comment for qemu_semihosting_console_write() says
>   * Returns: number of bytes written -- this should only ever be short
>   * on some sort of i/o error.
> 
> and the callsites rely on this.  However, the implementation code
> path which sends console output to a chardev doesn't honour this,
> and will return negative values on error.  Bring it into line with
> the other implementation codepaths and the documentation, so that
> it returns 0 on error.
> 
> Spotted by Coverity, because console_write() passes the return value
> to unlock_user(), which doesn't accept a negative length.
> 
> Resolves: Coverity CID 1490288
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> console_write() doesn't need to pass the length to unlock_user()
> at all, as it happens -- see the next patch.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

