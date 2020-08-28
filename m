Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E3F255E09
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Aug 2020 17:39:59 +0200 (CEST)
Received: from localhost ([::1]:33468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kBgTv-00065N-1Y
	for lists+qemu-devel@lfdr.de; Fri, 28 Aug 2020 11:39:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kBgT8-0005Z5-7Z
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 11:39:10 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:39079)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kBgT6-0000d1-Js
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 11:39:09 -0400
Received: by mail-pf1-x444.google.com with SMTP id u128so833369pfb.6
 for <qemu-devel@nongnu.org>; Fri, 28 Aug 2020 08:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=AtqzV06UXbTReoASyo8X3FegEkuwucufnEa7IYo/6FY=;
 b=yWhrmPPwT6+1LTF/IxjNQc86/CZXwjegmz6AtI8QZWsn8q0nwo7s7uy663Jk6sNrWA
 bmOfNy6vOmpY4dhru0cozbXfBEJg+OwY8wCD8krQNOFf0SNo4ppOuGgDhqKop4q6W+xm
 QLxaV4XrVgoZx2leakEaExxSekG7t1siZQ8MPj0W23sBgWS/yrS3wicYIytR3T7hUP7H
 ZZm9DcX1xRlkP8fboODrUWAKSCtZMS3Fd8lxXBuBctz5GM8WWF5DwdPJLQsTrDrWCfa+
 DL2MW9IN/SXVEmCdMdJkuvLUtbC2yJcvAI6bGe28erFmD7Kjl4ZHcMBQgznOendCpxPC
 vbaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AtqzV06UXbTReoASyo8X3FegEkuwucufnEa7IYo/6FY=;
 b=FXsknBbf4OPPPOmRl5D9BUkhdZ7cW+Bghx0B/H/ocNXhkJcibftpEBU4oMEM2I0lA2
 tvWXVIk8uLKrjgsubrihFgv2ETqGmnDJVdXCtr6BuUmYs2Pf9eVrYiHLtkW+H9gM5mxy
 QrZd3WrMVBENxxdLpfJ1l6x3RjC28jCP2I4zLb1TlqKhBrL5s2IY0uZqI5Loy/tlQpnD
 aXnSvkZnWdeCPWh9UrP7FIAZmGCnb8lFJIhTBc5mctzwhhy7KwTKzz87iCNEP47duaWE
 AOhyLNzG3N8ZMdZK9jMt122T7niIHAtLv2zAYTwPL0U0TrcCsZVYqSV8zzQWbdwpGFsu
 yx4Q==
X-Gm-Message-State: AOAM531kfssoWC3BsLB0WrF+43bfyR+uaVCwy6T80e1L31so9B3LqmE6
 +qwuOENc3VsQsV4+VHS4avbFJKdjMSuJeg==
X-Google-Smtp-Source: ABdhPJzHaoH2gBQP3Zp6Bup0vecz29gywJbSbMvkSPKbFGN5VUJrlVx0hHZZFB5dolSbA/85XmYtEQ==
X-Received: by 2002:a62:6547:: with SMTP id z68mr1851466pfb.286.1598629146862; 
 Fri, 28 Aug 2020 08:39:06 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id kb3sm1480691pjb.41.2020.08.28.08.39.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Aug 2020 08:39:06 -0700 (PDT)
Subject: Re: [PATCH RISU] arm.risu: Add patterns for fp16 insns
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200824143127.23170-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e3745cf2-d0b7-d451-6ea0-83c827efe0ca@linaro.org>
Date: Fri, 28 Aug 2020 08:39:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200824143127.23170-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.809,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/24/20 7:31 AM, Peter Maydell wrote:
> Add patterns for the fp16 half-precision floating point extension.
> Where older pre-fp16 patterns used to include UNDEF encodings
> that now mean fp16, constrain them so that tests generated
> from those patterns will give the same results on CPUs both
> with and without fp16.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

