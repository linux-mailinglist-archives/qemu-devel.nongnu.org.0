Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C04E41400F
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 05:32:06 +0200 (CEST)
Received: from localhost ([::1]:34872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSszN-0000n7-15
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 23:32:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSsy2-0008It-Jd
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 23:30:42 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:41610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSsy0-0008JC-Si
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 23:30:42 -0400
Received: by mail-pl1-x631.google.com with SMTP id v2so828616plp.8
 for <qemu-devel@nongnu.org>; Tue, 21 Sep 2021 20:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HK9CBsclwXg6OQFAppgK1STu6sDNQ2hweze891lHAkg=;
 b=ocR32tKunftBi31rIIhh9TxXeFZJynkEwWYtquZ+pkZqw2mBBWyPREQ3nOZ6UyLp0s
 Md0yMWQYuc1kJLvAvkgIERaUu29OkSgN3tJ6G0TM22qj8giI3Ei26ARFx3kmRLCvkI0P
 NeZnVAoKkXZzDFmYH6XYcteQHn4gxyy15jaK/0uPEjT1lyjmTW7vTFIeESr0JC5d2nSm
 WUz1DfsDt+dVHsvOTIanJYtGY6rRrZYR2Old2nFhx+XbUdgkY/wto8+/gJPQ6uMrffvC
 R5jQGhOGeUl3XD0MCiUuVsBN+Y7KJuQ21GLxWPNusfAVqvrI8KQVyJ8BWP5P4sr9WP6E
 IA+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HK9CBsclwXg6OQFAppgK1STu6sDNQ2hweze891lHAkg=;
 b=ZOncuw5tmFUkgG5n5166n0n9xncFM6kVPsGoS+6+y0FxLylIai8HST7+9LlGuYIgMt
 RlUh0nZZQT/YWUsNRz168xF0xg3gpI3jA39UnBbp9W+fuAkLsHivnqakjA+K3XvRsq4z
 QoVNTshPcQ4NBBh52XN6ithP7GxyJWeSk7LgWiRYkyIxc8VfAXhZi0iaVYXlIqban5FA
 9xbh90FaT+onLKHfoMJZDO0BucGXzEv9nryOpfuGmag3/yrbjG9rh8Wr3gELeF23hsDw
 FKoBuMGGp6iWKWIYKxImk05STga9Jtdxk2s2ejp/PHW3W6RpCOf6KbTtQguykeoYDO7u
 1TMg==
X-Gm-Message-State: AOAM5327mFYn0UhzigibpdCWfkoJd5LjMTO9rXVNf6/cf4V1xbfX4XfU
 QVnHKz3xXC95ymWAGxPrPXHEHA==
X-Google-Smtp-Source: ABdhPJygMX1464apc2XZb6ZUVHei60hF6BkBmXCsxhuojbym71w1gKtUmlyYCHl0uAHKiC99JvRxwg==
X-Received: by 2002:a17:90b:3904:: with SMTP id
 ob4mr8874237pjb.148.1632281439315; 
 Tue, 21 Sep 2021 20:30:39 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id 26sm621284pgx.72.2021.09.21.20.30.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Sep 2021 20:30:38 -0700 (PDT)
Subject: Re: [PATCH 4/5] target/arm: Don't put FPEXC and FPSID in
 org.gnu.gdb.arm.vfp XML
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210921162901.17508-1-peter.maydell@linaro.org>
 <20210921162901.17508-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e7cbadb7-b475-2fc3-7813-e42519282b59@linaro.org>
Date: Tue, 21 Sep 2021 20:30:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210921162901.17508-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Luis Machado <luis.machado@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/21/21 9:29 AM, Peter Maydell wrote:
> Currently we send VFP XML which includes D0..D15 or D0..D31, plus
> FPSID, FPSCR and FPEXC.  The upstream GDB tolerates this, but its
> definition of this XML feature does not include FPSID or FPEXC.  In
> particular, for M-profile cores there are no FPSID or FPEXC
> registers, so advertising those is wrong.
> 
> Move FPSID and FPEXC into their own bit of XML which we only send for
> A and R profile cores.  This brings our definition of the XML
> org.gnu.gdb.arm.vfp feature into line with GDB's own (at least for
> non-Neon cores...) and means we don't claim to have FPSID and FPEXC
> on M-profile.
> 
> (It seems unlikely to me that any gdbstub users really care about
> being able to look at FPEXC and FPSID; but we've supplied them to gdb
> for a decade and it's not hard to keep doing so.)
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

