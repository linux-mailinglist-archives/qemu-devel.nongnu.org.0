Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BBE3AFD67
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 08:52:31 +0200 (CEST)
Received: from localhost ([::1]:36418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvaGs-0004Or-Os
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 02:52:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lvaDP-0001eZ-JS
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 02:48:55 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:45580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lvaDM-0003Jx-80
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 02:48:53 -0400
Received: by mail-wr1-x430.google.com with SMTP id j2so11708010wrs.12
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 23:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1KgtOew3LOWdc8oPMDCQq0XQvzD3y6Osr3pfK+djtCg=;
 b=dplb0eZ8ZE31xUHcyN7zEZZqg7063MlO3S5HZwQgnbHBEjrT12YJP0ljfJDmP1EUAf
 HSZCr4V8lr7eeDJLJ4tU00AcyTa8gkUWOawsZ2ARHuSGR2aB1ajVI9eiPa4iZlizhxDZ
 qplxr5HAVLgy2AOuiODBtQsoRFqEISK/hsil2QV4dyMoUJLS1BlPV+Hv+TklGKbLtDlW
 2CAJ0UIhOELic9D5xgaUQzVKXADutKfHl8J7q698Eb2CDwaUF26xiqGFperWauDQZM88
 D88V2ov+ZcZN8cqWES3cZKvRjnQwSnxH13wkpWMLlR57wa4YMDHPPFT53hA5QgzLUO4L
 1HCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1KgtOew3LOWdc8oPMDCQq0XQvzD3y6Osr3pfK+djtCg=;
 b=MW4tdjAO7rsKrWve6NWBSGoa+Qz4B2WFBrfAelSOSQQM3kofj8RZ/GctGVrALPX244
 JKubPBBhvAGZBcO9aAxMgvoga8bnnaSvkPy1hCj5CoixqGNRB6Ri8m0Mnq09SHlWGSji
 NBvUnOxhFGBzJRN4l/PmjTQKTxEAwmsbjUyoWxVnzFyUjMs2RsKzOQcqdUYJMPuEznj0
 oBy1+1PwYYU3lFE1U286D5MGuR3qCa5zCZJJ4Yx1pcVczdjd2pe5F7GFlyCXDhpeVrc9
 Xkxi15YW2xf8cBKU3MwNVx49hIrncoMOEN/AebbhpA/qWuvkZ7Lh1zQspVX8VHVPxefq
 4tDA==
X-Gm-Message-State: AOAM532Knty9XQG027ucBxfxxGnjMYPK+GUE7vSiH5/bTSdKAX0vioz2
 dTonpt1oTVct5x85XODgnu9VD7odPz0S+w==
X-Google-Smtp-Source: ABdhPJzyQ4Fh4qTE08FUZLe/22/aHS+FDzrUTTM7fKQ3kHcJjLTd7LomChGGH3xwD17Y+Uf3nwiJZg==
X-Received: by 2002:adf:ebc6:: with SMTP id v6mr2782191wrn.398.1624344530375; 
 Mon, 21 Jun 2021 23:48:50 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id v18sm11088463wrv.24.2021.06.21.23.48.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 23:48:49 -0700 (PDT)
Subject: Re: [PATCH v2 14/29] tcg/mips: Support bswap flags in tcg_out_bswap16
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210621231849.1871164-1-richard.henderson@linaro.org>
 <20210621231849.1871164-15-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <3d1b0a2b-4934-4ef4-4b5c-27cdf21983f9@amsat.org>
Date: Tue, 22 Jun 2021 08:48:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210621231849.1871164-15-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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

On 6/22/21 1:18 AM, Richard Henderson wrote:
> Merge tcg_out_bswap16 and tcg_out_bswap16s.  Use the flags
> in the internal uses for loads and stores.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/mips/tcg-target.c.inc | 60 ++++++++++++++++++---------------------
>  1 file changed, 28 insertions(+), 32 deletions(-)

I reviewed v1 before noticing v2 and suggested to add comments
if possible.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

