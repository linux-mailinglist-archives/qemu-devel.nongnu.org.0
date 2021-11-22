Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36822458BAB
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 10:35:32 +0100 (CET)
Received: from localhost ([::1]:44712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp5jX-0000js-BD
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 04:35:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mp5h9-0007Se-Gw
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 04:33:04 -0500
Received: from [2a00:1450:4864:20::436] (port=35412
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mp5h4-0006US-TP
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 04:33:03 -0500
Received: by mail-wr1-x436.google.com with SMTP id i5so31513506wrb.2
 for <qemu-devel@nongnu.org>; Mon, 22 Nov 2021 01:32:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MNBfWvR2Qf9eT4lPmQLVA+mbqf+kyQVhnjL6gA8Xbvo=;
 b=gcafVq+9jRQNThcqs2UiYEVWmsuEnrqXt1wd5Oai1DoXmdbkunIBfl2u1N3HAKDvi8
 qDwTzXiM1vb4XnOioAhXFjE15M1N1l2uMr7yNrrVNNRW9tdxa6GCcV9K6nIzAcphBUgB
 1iMY1i0YsZb6oXtDVizxLtSndY1Hs/Q9Na0bJrofx0xj4yNSy4o4mWs09agSdisrFVMp
 nuKAFsbVEQ9WXV/SBikfbOSLnyByAD5fgBfaumdZP0EkGRfd/MDldbt/gZKwi8EwfLe7
 +wCyYr9e4UyUR8zNxUWKRsCRKVwO1Zd1qRcKAiVYHd58fndO3ub/9AK6tvqwIhUrSGT9
 T/jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MNBfWvR2Qf9eT4lPmQLVA+mbqf+kyQVhnjL6gA8Xbvo=;
 b=xllbt7OK40aJQuWLS3E1xJVyDW4qOxIkO5ybR7cWhVITbn6xv6VOhEDB0vyQ9PBgBg
 ESKL1gkYP2c9nKm+FKq+1KxiA+F/oInNOei3xe13uyHlbFLBv896Y4kz3h1k7qWBVSfa
 axcFVjTwdng8zFbgEF9Sgj6DRn0fGeu3OUKRdNVqtXkvKnOaieOewgBdHraCQKRRCmVc
 sYfU6RDbuj+nCrBdWQF1/5WkA6YZ2ZrPbxPw6XQSCtghGhRs+OGjGkoDXM8Nv939Xchy
 B+jTK0macgjZv4DlZlGTdIva5TNdCgWFTSvzvnp0P18JQ1aC1tu8CYREsr6fAmaydZoL
 q10Q==
X-Gm-Message-State: AOAM531+mNa34ft3CEQmjNjf0rjw2CjORe8T08pVHZFrlFb51v3yOt0T
 Vbz1dxZcFqYKRaYZ6W/dWeGc1Q==
X-Google-Smtp-Source: ABdhPJxcEXDPgWRd1mRFrntq08t9aJ04wlmmw2+NBIwHaGafvgfO7C0j35y1LC+v+d0E+c7V/NI99g==
X-Received: by 2002:a5d:4575:: with SMTP id a21mr35045849wrc.193.1637573577066; 
 Mon, 22 Nov 2021 01:32:57 -0800 (PST)
Received: from [192.168.1.147] (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id g198sm8596761wme.23.2021.11.22.01.32.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Nov 2021 01:32:56 -0800 (PST)
Subject: Re: [PULL 0/2] riscv-to-apply queue
To: Alistair Francis <alistair.francis@opensource.wdc.com>,
 qemu-devel@nongnu.org
References: <20211122065206.83544-1-alistair.francis@opensource.wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8bc9cc8c-cf47-ca35-2ea8-e6c6dbd07192@linaro.org>
Date: Mon, 22 Nov 2021 10:32:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211122065206.83544-1-alistair.francis@opensource.wdc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.097,
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
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/22/21 7:52 AM, Alistair Francis wrote:
> From: Alistair Francis <alistair.francis@wdc.com>
> 
> The following changes since commit c5fbdd60cf1fb52f01bdfe342b6fa65d5343e1b1:
> 
>    Merge tag 'qemu-sparc-20211121' of git://github.com/mcayland/qemu into staging (2021-11-21 14:12:25 +0100)
> 
> are available in the Git repository at:
> 
>    git@github.com:alistair23/qemu.git tags/pull-riscv-to-apply-20211122
> 
> for you to fetch changes up to 526e7443027c71fe7b04c29df529e1f9f425f9e3:
> 
>    hw/misc/sifive_u_otp: Do not reset OTP content on hardware reset (2021-11-22 10:46:22 +1000)
> 
> ----------------------------------------------------------------
> Seventh RISC-V PR for QEMU 6.2
> 
>   - Deprecate IF_NONE for SiFive OTP
>   - Don't reset SiFive OTP content
> 
> ----------------------------------------------------------------
> Philippe Mathieu-Daudé (1):
>        hw/misc/sifive_u_otp: Do not reset OTP content on hardware reset
> 
> Thomas Huth (1):
>        hw/misc/sifive_u_otp: Use IF_PFLASH for the OTP device instead of IF_NONE
> 
>   docs/about/deprecated.rst |  6 ++++++
>   hw/misc/sifive_u_otp.c    | 22 +++++++++++++---------
>   2 files changed, 19 insertions(+), 9 deletions(-)

Applied, thanks.

r~


