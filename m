Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA26349DA8F
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 07:22:13 +0100 (CET)
Received: from localhost ([::1]:41088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCyAe-00048z-JO
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 01:22:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCy5a-00024y-J1
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 01:16:58 -0500
Received: from [2607:f8b0:4864:20::432] (port=35724
 helo=mail-pf1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCy5Z-0003Fa-1V
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 01:16:58 -0500
Received: by mail-pf1-x432.google.com with SMTP id u130so1756375pfc.2
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 22:16:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=3hlmuRXTTz4T6ywMVlNkiWMyrYLf/R8uHWXzu0EqrmM=;
 b=CC3r0eLm3NbMeJmtTE3RdknPtffJWReadqFGzeX3TxoGAAGidB49GtatZJVBuf212O
 T2ruPmWbgR2V+CCjqTkbD7hhLUzGU/rtULsnw0JVmfRTGG1w5cidZBz1F7I3p6Uh1Df/
 44mVU4DftYZ+b8Bi5Iu2axOjE+e/KG9VulUcPNhosJ3nIgUIIy9wiSH0m3Wh9RgjQ2u+
 dzmJAf7CJoU1NGe6Bde32BEMFXHD6BeiFGU3sFfwCM5Z969QYsOhrAtH/D6bNtiqt5ep
 36lzyY8yNmhzAoMcx2WlxPZPBECA50yO5YuCbmxIZM77bixPXjdATbwnnDpPa8zK3Iw0
 3O/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3hlmuRXTTz4T6ywMVlNkiWMyrYLf/R8uHWXzu0EqrmM=;
 b=8LTdq2TwuJOgadgXdWrMV3RGMN3+et6rD04htc9cLomFq1fw8vfG0Gc6YbSaeQpsg/
 xrvNT34fDY/O48kHEL6/5k+qAHWJTwOJ3LKqKsrW+hFoU9eCVng3mKCT/gqqO39qBw+E
 1OJhHGbEHHbvly9wc0F8LCefGv/e1pUJWWSCQ6LZ+2gz6kWDwN10Bpa/sGMvZpj7Nz9D
 GOZvEvSdo0oUia0ymJG8dneOH6eF/XMZEAC+YM9asDaosBb3TZLqnsqW8guUyxtFy7ws
 sX0pBuU5IuiCEtvqk88wCj0o9taQC4gGupC8urdLWSXuMv5AjleRW1NBeyV6cwLaVY0h
 0+sA==
X-Gm-Message-State: AOAM5320RS06KVsjW0JnKZQHmVQ0Lm+JzfjP8l/UqErRnYliyiH016Q/
 2P5uLSaF81nYL9LvQW5ixE+ncw==
X-Google-Smtp-Source: ABdhPJw1QgRSbj13U30N/0AlpdXdoRZYNvzaJem6ft6dwyrs2Ryb1xXhdmvKs3+d4GbYnrVvhHPnnw==
X-Received: by 2002:a05:6a00:a16:: with SMTP id
 p22mr1695695pfh.40.1643264215448; 
 Wed, 26 Jan 2022 22:16:55 -0800 (PST)
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id m1sm4097144pfk.202.2022.01.26.22.16.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jan 2022 22:16:55 -0800 (PST)
Message-ID: <26b627f4-fee3-4c1e-dfe1-780b45880a87@linaro.org>
Date: Thu, 27 Jan 2022 17:16:49 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 06/40] bsd-user: Bring in docs from linux-user for
 signal_pending
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20220125012947.14974-1-imp@bsdimp.com>
 <20220125012947.14974-7-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220125012947.14974-7-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::432
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Kyle Evans <kevans@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/25/22 12:29, Warner Losh wrote:
> This is currently unused, so no code adjustments are needed.
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/qemu.h | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

