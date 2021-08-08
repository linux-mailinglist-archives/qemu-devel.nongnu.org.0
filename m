Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 758E33E38F7
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Aug 2021 07:17:22 +0200 (CEST)
Received: from localhost ([::1]:43198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCbBZ-0005MU-Hm
	for lists+qemu-devel@lfdr.de; Sun, 08 Aug 2021 01:17:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mCb9r-00035D-Np
 for qemu-devel@nongnu.org; Sun, 08 Aug 2021 01:15:37 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:41943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mCb9o-0000rp-VY
 for qemu-devel@nongnu.org; Sun, 08 Aug 2021 01:15:35 -0400
Received: by mail-pl1-x62d.google.com with SMTP id z3so12852489plg.8
 for <qemu-devel@nongnu.org>; Sat, 07 Aug 2021 22:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YPASe4+3WR81LHT5+GzVApJBCiVrYWdFu4LrEBcu+T0=;
 b=wkpoa5tbXas2KPxD43TAve8RCQ0DhspsiPjIEHPp1zKfdx/zRvf2kgvsGatfJakwyu
 96tdUJoKTCri2HScvgy9/lomkzKgilW/DUDpCKRCmRR67CyhRRJiN83slR2WBRoLJ3M6
 jMy9/fbskGF3aYoMSjVdi5eFvXCYQ6J+1qhW/d5hI7OkYkvzzcmPEtQbd+r2SJsMnxdG
 nrg0Ou9zFdswPFbGa34j1Rtq5x5CtNQ56gwJVBwmPDIPBox5v2fhqimn5SWpbuPxFxRX
 C/A5VRQSgz5/GzF3BAlLy0mVeAYBfffkzEI4B+YqGpiwNc7OaKYlgh3NoVXIk/5Bk+lT
 qCjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YPASe4+3WR81LHT5+GzVApJBCiVrYWdFu4LrEBcu+T0=;
 b=W4hlVSJmXVViGWhC/kElEtJgGmpM9UecGT/jvvg3+gF9H+z7c68fgSfi9sj8uad2d+
 /+z5myDlK1YDtAGwAgzqGpn1l62OwXWTJzIVgfBdQctJ8fnOiBGG56RIQWkB7/xwlJDj
 0twCiy4K7yJAVqjYWxOqZ081tBo2qVMTKKhzuC7IDeynOEH4/aOaO4H2wZJHYnANIdsl
 lXeKO8JlhXA8kp/IxYT0J9GM5Qx8hV5ilwfNiogeBml+QtozZYEbdESPakOO0soqjrv6
 bWHqc6Ro8wOXWUB5TwKBNN9/llgG4vLhehKXOjTWOBXWXEjoDcI6f0WPRFjyDP86dAuu
 1G4Q==
X-Gm-Message-State: AOAM531rLViAmpGeBzs/nHoMGswF1IC75iBmFI9pIvXFmcN5zIS1QTGo
 5F790k/K4qoai84WaJxjrPSISA==
X-Google-Smtp-Source: ABdhPJzfxijL8brIL6RHlXHOdMMUX3lC9pKj4MbS+4mjh8DzUIznELHgXrgULXgNMlr/TtTxyyuwKQ==
X-Received: by 2002:a63:788e:: with SMTP id t136mr72833pgc.374.1628399731309; 
 Sat, 07 Aug 2021 22:15:31 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id a22sm15820860pfa.137.2021.08.07.22.15.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Aug 2021 22:15:31 -0700 (PDT)
Subject: Re: [PATCH for 6.2 15/49] bsd-user: TARGET_NGROUPS unused in this
 file, remove
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210807214242.82385-1-imp@bsdimp.com>
 <20210807214242.82385-16-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <75853176-889b-502d-91ba-5d4d83cfb3e3@linaro.org>
Date: Sat, 7 Aug 2021 19:15:28 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210807214242.82385-16-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
Cc: kevans@freebsd.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/7/21 11:42 AM, Warner Losh wrote:
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/bsdload.c | 2 --
>   1 file changed, 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

