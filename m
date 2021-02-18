Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A522C31EC56
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 17:39:29 +0100 (CET)
Received: from localhost ([::1]:52716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCmKu-0001Em-Mq
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 11:39:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCmHJ-0006Cl-7E
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 11:35:45 -0500
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:34527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCmHF-0002It-AM
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 11:35:44 -0500
Received: by mail-pg1-x535.google.com with SMTP id o7so1472692pgl.1
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 08:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TxyKH5hbUARD4emUfCr56K0CUBV3WzktIWI2DymvoCo=;
 b=tB8W+8Aj0WSG/2xQqpkE0FFL0XDN8N3/i924U3r5IZeNmATe3DMWdgn4GY6INuKlLS
 Ndm6XFStjkcgxonAtfTCo5xbGBq6B4iLnIOuIB6cD+QqMI9SI0TvQB+nbjaFgvSS++lL
 JzQEhxjOlMGSah5TPfxZvXQB1ETv0S9DpdfEcKmch7Q4lf+U6Uu5TRq0XVjOD8O2nnIN
 swkv9WQFxC3XPcT8MhFMDhlGKHzJ1nKOKuxAmj8Bm36VvX2cr0yHUOGmS5Sxu5U5X9Wz
 sfjY0enhmhG9XUcMHin/68VCJsjR8pcNviM/YTWaOoqclyeRX60IhbZkivZ5sMFS8ht8
 g1UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TxyKH5hbUARD4emUfCr56K0CUBV3WzktIWI2DymvoCo=;
 b=cVKF6D+5AErgMt+5fTvtbne2t8XvMOR6Bj+4V+mYFEOit6WWbFQ7l+hVieeVOzgwUw
 +daR9aF2Dhlgna0RP+h7bvniuVqgD+J+60TPv9kdvdAxM1ZszIOy+j63Z2j1BM6Wkf/T
 PKk9I26sEtgykc+4RgaMVa1XdzLwEfz4D4jSb5P09YVhl5rv3bI1wIZavZIV2wcpniod
 acwo0LFxrsPzLF4VtTx2kGgTHwRQgDBZLz30UUvOHf3ZrP4Hya8yxaKhhUFPuTrib+Ar
 I7UFSqQZ9JUWjZDiUC2G85TSwQ7SZaPR4q7ZfP6fG0olKBcF0U3lFmbmSJFpjMdS7mML
 G5Fw==
X-Gm-Message-State: AOAM531ENDd1qAa5o2NqkpRxqYXWsglc1oCXwFrRkmKesBC8Pwu458A+
 ey9yXusptVjPY8eejZM13Hy5Hw==
X-Google-Smtp-Source: ABdhPJy/TcHSQRx54WWmNW1wqRx+wlZzHdDgDqf9N0Dl+pjhhsS7dZvCpadVv35IXOTORbcvjA73OA==
X-Received: by 2002:a63:db03:: with SMTP id e3mr4643831pgg.225.1613666137432; 
 Thu, 18 Feb 2021 08:35:37 -0800 (PST)
Received: from [192.168.3.43] (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id e17sm5826736pjh.39.2021.02.18.08.35.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Feb 2021 08:35:36 -0800 (PST)
Subject: Re: [PATCH v2 3/5] target/sh4: Remove unused 'int access_type'
 argument
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210218145111.1591763-1-f4bug@amsat.org>
 <20210218145111.1591763-4-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ce13e16b-d7fd-a56a-ec93-cdec77454c7e@linaro.org>
Date: Thu, 18 Feb 2021 08:35:30 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210218145111.1591763-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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
Cc: Joe Komlodi <komlodi@xilinx.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/18/21 6:51 AM, Philippe Mathieu-Daudé wrote:
> get_mmu_address() and get_physical_address() don't use their
> 'int access_type' argument: remove it along with ACCESS_INT
> in superh_cpu_tlb_fill().
> 
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/sh4/helper.c | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

