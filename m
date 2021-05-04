Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A33A7372D86
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 18:03:51 +0200 (CEST)
Received: from localhost ([::1]:55552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldxWY-000353-3o
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 12:03:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldxSA-0000Z0-M8
 for qemu-devel@nongnu.org; Tue, 04 May 2021 11:59:18 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:35661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldxS8-0007Jb-UQ
 for qemu-devel@nongnu.org; Tue, 04 May 2021 11:59:18 -0400
Received: by mail-pf1-x431.google.com with SMTP id i13so8075397pfu.2
 for <qemu-devel@nongnu.org>; Tue, 04 May 2021 08:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WwrblL20GnlO3IElT0tLk6OQijSo/rQRwnLUBLPmUEw=;
 b=pPx8RGBLCksjCJvbw4/dbrDcCtvuiYbBL9OUHx8MIS9UxabyM+32itAEwuy+wV12xN
 PPrmewQZ8Lxskh9P4uvDRpqVKlQkE7FS5pTEtjMDsjmXdarEiWat/gb67w2zYMUT+X/k
 ATdLR2Ft4PSQiUuWr0jBfYHP3j6YE2bUK9V+A/fGwpEvLAtSe2rg/KM6syZmOwDChigY
 qpRS/ROXCNYKNhNC6Hga/bLRxN7FGN2mBtRjp6bUl3vyi4rR+12DWskd4sRuTMZCnrah
 HtLqjJOG3RYkTQd7EGz0REEG0ocXYuPBhq1hYhPbTJkbfNZ3h65IM6ntALiWcZw5JTOH
 0XaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WwrblL20GnlO3IElT0tLk6OQijSo/rQRwnLUBLPmUEw=;
 b=iKrE+Bt4wm+NdrvhBPP+zfwi23PxWpWzM2ooINPLrnPpEUg4Z2GnaMpUcccDlZHIPm
 +VSqvm3HDsMR0N57pIazyILZtDZ6Dxq0QIBkFjHxYTX3iSn80WtZtV6oGUcm9lrLhdMv
 WpXz8O5yw7GkRbo3BaQNypXT7LAD5de/y+DVN18Rfadf7PRllea8gdPglBg8iCWpioxc
 HNAE+opAgjVEvxiLvTZVKlgGUcUsNiBSqlseSMY2okl9YhHqg8cOmJogZIOnERDEzV2e
 kvk5MA445/Tof2GTi5AV3W9xCzkOw+QL9M2S/CalNH8uklzDZfiKflPcXriPoIVWXoYh
 53Ww==
X-Gm-Message-State: AOAM532vuwCMrG4Vis+SeAfNbJeG8eE2Va4oQcVFeX8aQZheoysVjyFi
 rigTAL51TjyiUbGKviDixkT16g==
X-Google-Smtp-Source: ABdhPJzLRXgROf/0CR3dGomm3JR0Uq8W6QMRR5DpOyMPTGgHQ75D8loSk1m5e7ldvPsQR/yrPGMbQQ==
X-Received: by 2002:a17:90a:d0c5:: with SMTP id
 y5mr24977987pjw.109.1620143954726; 
 Tue, 04 May 2021 08:59:14 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id c130sm5152896pfc.51.2021.05.04.08.59.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 May 2021 08:59:14 -0700 (PDT)
Subject: Re: [PATCH v4 2/5] target/ppc: renamed SPR registration functions
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>,
 qemu-devel@nongnu.org
References: <20210504140157.76066-1-bruno.larsen@eldorado.org.br>
 <20210504140157.76066-3-bruno.larsen@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5c8c67b5-dddf-b17c-5991-1e201bf5b291@linaro.org>
Date: Tue, 4 May 2021 08:59:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210504140157.76066-3-bruno.larsen@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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
Cc: farosas@linux.ibm.com, luis.pires@eldorado.org.br,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/4/21 7:01 AM, Bruno Larsen (billionai) wrote:
> Renamed all gen_spr_* and gen_* functions specifically related to
> registering SPRs to register_*_sprs and register_*, to avoid future
> confusion with other TCG related code.
> 
> Signed-off-by: Bruno Larsen (billionai)<bruno.larsen@eldorado.org.br>
> ---
>   target/ppc/translate_init.c.inc | 860 ++++++++++++++++----------------
>   1 file changed, 430 insertions(+), 430 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

