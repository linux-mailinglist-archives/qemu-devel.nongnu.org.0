Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0AE72F2807
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 06:53:49 +0100 (CET)
Received: from localhost ([::1]:54664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzCcn-0002bv-1Q
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 00:53:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzCX4-0007Zi-A6
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 00:47:54 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:40251)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzCX2-0005Fr-Oq
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 00:47:54 -0500
Received: by mail-pg1-x532.google.com with SMTP id 15so710921pgx.7
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 21:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QtRWZNVx+/O8QZ7RfhyHbtfIVLRwdrGSvp3PHVAdGEU=;
 b=SAUM2TwW71YqzwgKKKCPQfh+kIQAxRKYUYmoZFFhh8HUJ+eqVQZ/Qe9V/Oq8ifTdor
 mvR+2XeTT3DUC55zDvXHPgjygBG1P+JWE0mCX28N7s5SKcspmNhCqiG0uJvsDK0i+DZ1
 DsSOBlXpdwqBYajmOGcTiQVc9G97lU0psXTJsK5xPtqxmQ4grxJFbrRN65hUJ/efc8JL
 UD/rSt6AUvEj7jP2J0gegOoA9sa7+YYoBcGvY1NxeCmz96e6kDrYXO0gBwwORhdXUCLL
 lXKsBdc/FbnhE+PrkNmYSYf/4adraUf4HqLw6HHC1XwgjkmpRzTnZwykbH21i5tlLJBF
 9riw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QtRWZNVx+/O8QZ7RfhyHbtfIVLRwdrGSvp3PHVAdGEU=;
 b=CppfeYVsmSkJLCIEN0CR7vVJ5MAnYBcmRecbDR4wlkF5A+YN/VlhFcGDmpB9AWHU7s
 G0PNTp1GwCRXlhdGVZFtdg+/hbQ1hYSmtpWPerLcTVDyGqnibyB7o/N5p8jB5gErJNSL
 0k7s58EwZ1NCnKWGEOh8WPVTmYooHzJnc7fNG6rNLf3HfSXMJT+lPp96hrZGMEEaI82O
 Tw/bIv30kwoUEthcqq3q6Wqj+Sfb3GQGgaHWF8iJDUESPqgGkbxsRtmzbKXFSsTY2Dvq
 jB49NhHc5d2YOsTSdd+H31zwY5cDhtlyR6wGObfmVC1I7RCg4aY9At9xkrLAN8L43KCJ
 xN1A==
X-Gm-Message-State: AOAM532UobQJzuFWShxhqZdu3oB29DCrgGWS0Vf6VNBpoWq2KXJIr+BL
 G1K60cc74VJGO8xdHZEqX2JKmtzrmVws9w==
X-Google-Smtp-Source: ABdhPJwMRHIJSk7HD+uZIaEdH4ca9zwXYEhqTc5yOL2F9QxSLCnDKhVgNnaCy25M1cnxWvtakkGNGA==
X-Received: by 2002:a62:ae18:0:b029:1a9:ac67:3b1c with SMTP id
 q24-20020a62ae180000b02901a9ac673b1cmr3038444pff.29.1610430471605; 
 Mon, 11 Jan 2021 21:47:51 -0800 (PST)
Received: from [10.25.18.36] (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id y27sm1507701pfr.78.2021.01.11.21.47.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jan 2021 21:47:51 -0800 (PST)
Subject: Re: [RFC v3 16/16] target/riscv: rvb: support and turn on B-extension
 from command line
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20210112022001.20521-1-frank.chang@sifive.com>
 <20210112022001.20521-17-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <acde5c9d-88ba-f4ae-5d05-e0266254b588@linaro.org>
Date: Mon, 11 Jan 2021 19:47:47 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210112022001.20521-17-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/11/21 4:19 PM, frank.chang@sifive.com wrote:
> From: Kito Cheng <kito.cheng@sifive.com>
> 
> B-extension is default off, use cpu rv32 or rv64 with x-b=true to
> enable B-extension.
> 
> Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.c | 4 ++++
>  target/riscv/cpu.h | 2 ++
>  2 files changed, 6 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

