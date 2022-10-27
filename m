Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30446610544
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 00:01:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooAvV-00031w-9Q; Thu, 27 Oct 2022 18:00:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ooAvM-0002oA-Ie
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 18:00:32 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ooAvF-0001zh-Ld
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 18:00:28 -0400
Received: by mail-wr1-x42e.google.com with SMTP id y16so4409095wrt.12
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 15:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=18sC9YWYTVVqkC6+FThGOxdohBGH65Pl4pmshuYK9Xg=;
 b=abu1/TVUfl3PiVQgNN5Qr+6VHJFRkVL2GpM7dCc8ccOHRa0w+KEi8+bD28RMSKnTzC
 O4JQM8gUUrfaFr2fNa2ZHLZiyOd2xFELoA6wyJ+oy10rhAmZizbP9CUj/qeGgCvWRRwa
 ICv9MGevEwOI4CGotWQgN+j3PpHJf1UONmRNUexnt4Be3hZN6xSs+NCSg80MbWGxXVbk
 NhtGcdtSpdUvFysZ5NTBWurUunUfv296a4LJhejjA6mx0YWXLqDmUGaLfTcPlttIvmVx
 gOWNdIyAFNu9Mp1bAqY04FANSu9fU52WMzG5isTlfQHTrQ2z0ueT1j8bTLKXm5TE1qBV
 GS9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=18sC9YWYTVVqkC6+FThGOxdohBGH65Pl4pmshuYK9Xg=;
 b=KbXYX+8ZSf2mvX+ynAkvHzWcCdm8C1V2u7dI76KqSMkSiCJfZRx6fejTt+86rApovK
 9SUmSLJU9nRFuK369vRlune2yx2VHtB44rpLeIco6E7PchUbuydh0fwjXceraRXJutMh
 WNINw6X8FyhRWjGNSSntWpHXh6/R5uesliT4VBnuZrQJBs8iYRulyIFFTWAqAUtpes9a
 f0ojBzbgwgcWPX36zHdnEM7BhD859Px/38hPhn3xBQMO+9qVydKjj0GH8paNSBFmXgJb
 8gxpGx15tO+zuW64HsHwcNtOl7XbJdYf3uvdIgtFkG14tcra9yxp2TVro0C45JcpyFyF
 O+8w==
X-Gm-Message-State: ACrzQf1GZyDrFMcXjuVryCAS1hfEDTccf7uvMgyT9cRS/fY5FTR+L6dw
 UyG1+GTU6roC3bmY5WIE+xefHw==
X-Google-Smtp-Source: AMsMyM5+p+1LPRFrIXQeq9XqFpPsA5njvIYpZDYsF6osIiPX4pGv2NKXbdA8o8ZOuf3yjV5dD7PbfQ==
X-Received: by 2002:a5d:5082:0:b0:236:7046:8958 with SMTP id
 a2-20020a5d5082000000b0023670468958mr15635007wrt.214.1666908019845; 
 Thu, 27 Oct 2022 15:00:19 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 v12-20020a5d610c000000b0023677081f3asm2047485wrt.42.2022.10.27.15.00.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Oct 2022 15:00:18 -0700 (PDT)
Message-ID: <5d7f527d-53ee-b7cc-a1a8-334b7fc8622d@linaro.org>
Date: Fri, 28 Oct 2022 00:00:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH] target/i386: Expand eflags updates inline
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, eduardo@habkost.net
References: <20221027102615.253354-1-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221027102615.253354-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 27/10/22 12:26, Richard Henderson wrote:
> The helpers for reset_rf, cli, sti, clac, stac are
> completely trivial; implement them inline.
> 
> Drop some nearby #if 0 code.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/i386/helper.h        |  5 -----
>   target/i386/tcg/cc_helper.c | 41 -------------------------------------
>   target/i386/tcg/translate.c | 30 ++++++++++++++++++++++-----
>   3 files changed, 25 insertions(+), 51 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


