Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 221BC2B9B15
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 20:05:15 +0100 (CET)
Received: from localhost ([::1]:51172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfpF3-00016m-O0
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 14:05:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kfpDm-0000Zq-6V
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 14:03:54 -0500
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:34555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kfpDk-0008Fm-1A
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 14:03:53 -0500
Received: by mail-pg1-x535.google.com with SMTP id q28so5088848pgk.1
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 11:03:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cHe1QsYXTPzUAnKoByANSg/4AbkSooIq8bZgA3/5xhs=;
 b=v8SdT88eoKozonH7BynRIJ5CwcCryYY+b+qFrmdoYeR1Zlo/ir5REwRf2wZMiXm98X
 2e2fsxVYCHtl+nIMngQM5Rv64MbEjQvjc8Y/2ELcDu7B1t1NQMA2zBArEKcElrnTvHiQ
 QDOSY0boXGi+zg2DBuR08mKgJOXArJy2iHfAmpoQbLE0k91Hk3IBVAuriM9po/gKZz2n
 jcZeJT1ZWlzPzcUv5oC/aOzS1bRn37Dd14DIYHXYEhbIfGnnBKitStmFvQ4wpBcB09lI
 +UhURsMd2WBFjOP39xEV/Q3mf01hv13/OaZE3gKVKGZhXnPz+1E4sxsI/AhFvkA7Osjs
 OLng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cHe1QsYXTPzUAnKoByANSg/4AbkSooIq8bZgA3/5xhs=;
 b=tLMpi72m0E5TtfF2NieXO7+WCg52Fg7gh0NTxTAcnh/FaQcwimatQIZZsYkAri4F9v
 Y0C9nYHUCiuPAo11SZdquZvQg4rBpHNpirh4Pd9AM+ntEv7FXLg4O49SZITK6vO/vh1g
 ttnbjvHJ5ZkKYog86OT46RxYd0nsedwb6/7748rhelImAptnBI4KXvcmgzdzBjT3bEpY
 5b/3D9wH84Dd+dOixK3yta5se7RjQ8kk396NJjenXYEMkTNvFJy6eUTiWFBZRpelsZJE
 2trV3+wejnNReV2nepoMrgtYzyT53m45y1oic9tplvqBsbOIgCvkCIc4lJ3MvURu8Urn
 hz/g==
X-Gm-Message-State: AOAM531GogWwkhRP3kgToRwDMFFOdSekiN0LbiC3OnZxWIexvSnmydQx
 nLbYQYcKpkblNx6yRtJGr8VaCg==
X-Google-Smtp-Source: ABdhPJyZiEnLSpw+68GrnIiEUNwgInScnNAfo1FiSIf3fzm3x9cM2JoUWzpQbKyl3bTnRt8GW4cNJg==
X-Received: by 2002:a63:f24f:: with SMTP id d15mr13727569pgk.276.1605812630281; 
 Thu, 19 Nov 2020 11:03:50 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id y5sm394023pja.52.2020.11.19.11.03.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Nov 2020 11:03:49 -0800 (PST)
Subject: Re: [RFC 01/15] target/riscv: reformat @sh format encoding for
 B-extension
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20201118083044.13992-1-frank.chang@sifive.com>
 <20201118083044.13992-2-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5aeb4fd2-ecfe-8ddc-457d-d6feb9e533b4@linaro.org>
Date: Thu, 19 Nov 2020 11:03:46 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201118083044.13992-2-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/18/20 12:29 AM, frank.chang@sifive.com wrote:
> -slli     00.... ......    ..... 001 ..... 0010011 @sh
> -srli     00.... ......    ..... 101 ..... 0010011 @sh
> -srai     01.... ......    ..... 101 ..... 0010011 @sh
> +slli     000000 ......    ..... 001 ..... 0010011 @sh
> +srli     000000 ......    ..... 101 ..... 0010011 @sh
> +srai     010000 ......    ..... 101 ..... 0010011 @sh

We need at least 7 bits here for rv128, if we ever get around to it.  The code
in trans_slli et al already eliminates numbers that are two large.

In the rvb draft, only 5 bits are used in the uppermost field.  Let's leave it
at that.


r~

