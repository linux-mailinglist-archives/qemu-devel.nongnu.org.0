Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CEF44033E
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 21:29:32 +0200 (CEST)
Received: from localhost ([::1]:41906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgXZD-0004gD-Ed
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 15:29:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgXLX-0005jn-Vc
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 15:15:24 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:45955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgXLU-0005ON-WD
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 15:15:23 -0400
Received: by mail-pg1-x52d.google.com with SMTP id f5so10730234pgc.12
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 12:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=eh3Cy1VKrBgIo2yOgwtqENvH5BiQzt6ZjT9FB3YgTJI=;
 b=wlVhqOvF6pFyvFl5/qfNNhtJf/bzm0OV8p6xllkKeqLcbGKWbiIbxUot1RYO9zDYjL
 rT34VRu1OmvHFmqC4ChYAs9cp4eVx0PgdyvsO2u/MaazS7ImEJnA1L2r2h0286Ngs3rP
 +H9CguepgYUnmBnjHBdn+otWyckFzgjL5iIpiWJqz95voozq47Qyo1atPjojcV+wUhxP
 SUJJ2L0/VTCcQr3xojBKgPliuk7LDVzVjG/birdg1UH6WK1lBCwCAxCg06e11DvtAO08
 I63K1egHLw63935g6KJQ2VxQuPVmCHyIpsLCfd5rZSu6yUp7Lygh+onU1GMZlJQIBj8L
 Gk1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eh3Cy1VKrBgIo2yOgwtqENvH5BiQzt6ZjT9FB3YgTJI=;
 b=ha7GnnA3TwJk2GAS6oUNQxI/kUm1L2S1UeKty4FRfEWGwA1d5Ja0e90r3WwaZla7s5
 qx3Vnb4X//podmsMRUhfkfP7KibvnnomAqaDzaTaTyXo3QSeF062bv+tAjyp0pujg+wk
 4UKDZOZBiLM1onHQj25fc7idIszKzJZQpNUsKiRV/ahEouOZjPNkTnvGVsFKYduIzHdf
 ztVk36iw/OpCmOK5a7veitI7W9liI+CZZwkg1K6XyGMhaJjuLQuNHC3KC294/vHyqBI+
 0lsKsUB4fNnLHvOiJNmBUnAiMfpTTxGLBa+KOtON7eSTo5vfDxzgUd4TYYO9xP9b2+US
 YFjA==
X-Gm-Message-State: AOAM531/V4yUgrPHXKfR6kWrLiXAWk4W8zm1XXMfcd1SFIGAgjQi1UyR
 QuLP5UWmykOnvm25FaDAPY1o6A==
X-Google-Smtp-Source: ABdhPJy6rik5eNqm+dEoXIRx5CqOX+/Bbg8SIZ+TvMxpnU9wmsCQEQZHXjdhc7bJkiyZXQ1GT20tHg==
X-Received: by 2002:a63:1717:: with SMTP id x23mr9588510pgl.182.1635534919388; 
 Fri, 29 Oct 2021 12:15:19 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id fv9sm11529321pjb.26.2021.10.29.12.15.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Oct 2021 12:15:18 -0700 (PDT)
Subject: Re: [PATCH v4 30/30] Hexagon HVX (tests/tcg/hexagon) histogram test
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1634033468-23566-1-git-send-email-tsimpson@quicinc.com>
 <1634033468-23566-31-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a0debdd9-30cc-635d-9504-6f1e6fa533e6@linaro.org>
Date: Fri, 29 Oct 2021 12:15:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1634033468-23566-31-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.512,
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
Cc: ale@rev.ng, bcain@quicinc.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/12/21 3:11 AM, Taylor Simpson wrote:
> Signe-off-by: Taylor Simpson<tsimpson@quicinc.com>

Signed.

Second instance that I've noticed; you might grep for it across your patches, just to be sure.

Acked-by: Richard Henderson <richard.henderson@linaro.org>


r~

