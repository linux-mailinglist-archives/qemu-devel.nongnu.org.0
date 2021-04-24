Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5C436A27E
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 20:03:32 +0200 (CEST)
Received: from localhost ([::1]:53568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laMcu-0005RL-2t
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 14:03:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1laMbA-0004Xn-UX
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 14:01:44 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:54092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1laMb1-0005zN-20
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 14:01:44 -0400
Received: by mail-pj1-x1030.google.com with SMTP id nk8so11546354pjb.3
 for <qemu-devel@nongnu.org>; Sat, 24 Apr 2021 11:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/9vCa9c/Guu6Ff3M89jW87KGs1dXf8hSSUdmgD/0gss=;
 b=Vel2bHB3qyfaSYU8nzsA/bc1UqxzaUTG3p2vvZXos9/ksf4TJVQnX2mZno30P1atec
 DKMILgX8HNrWK6Z8GPq17iKNELp+qaylZCJsyBQG/SZZxAGAAQ+GeymFaLHmyDtbm1xL
 bVrjUgS2CVZzA0VNbIm4Bzyn2DBJzVNPBrIYFLOCt4JZcc5BD+qNJpipATiv7SOnrqZP
 zU5Uu62iUYysRIF+Xr4we96HIcYQ1PdCo2os+cKJVRepagMaHpEVtK2XJE6lB6oUmL1f
 SI87q2HLz1f68gM8k3/d+JAXpR+hbnWu6ywgHKbmc/nHl/pTQfuJu3bMzP7QGdPSFQwJ
 CzrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/9vCa9c/Guu6Ff3M89jW87KGs1dXf8hSSUdmgD/0gss=;
 b=O4ooCIsoOUgAjxRGH9z0a2eZe4V4tLWWeK/NfY57Pu76/g543gViQY+CmYov4v5uGX
 1fD1MWilF/Kz2xmYVIt1B7/x28cssB0XoA8X+CbRcTVtGKByfW48aor55aWvERN5VFdz
 kum0HwcF00//QsIEeKFQby1l3etN5GPvxjGGpDbv2krzZrjk5bLQtKwbhynD/40ScGJv
 L3oJcsRvByiVi9+Wq43LGEsw3uUCzSFElA65pwgyweOamh9xWX1RfotVxZPNKgS4Znvp
 sJXpGq61IvveIcBriPDV0+flsL2c2fROLka0c4FAyoy9g6DDUEFc1l6Q1Gd+juVNQbSy
 5hWg==
X-Gm-Message-State: AOAM533cn9r6sLVYPJJCooXV/HenbNHwwJknE3eVNl0hPQxy9XdjMGag
 OdfsK0RCkmGrfH2m2AZLsgZQMQ==
X-Google-Smtp-Source: ABdhPJyCrwsQ/ZdqO6ITswFEc5uRZluYXGcuV7llAYzZ5nT5m8+fHNlfFGanFvxivU+VH9irRm8pGA==
X-Received: by 2002:a17:902:ab86:b029:e9:47c1:93de with SMTP id
 f6-20020a170902ab86b02900e947c193demr9994892plr.69.1619287293417; 
 Sat, 24 Apr 2021 11:01:33 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id i123sm7991712pfc.53.2021.04.24.11.01.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Apr 2021 11:01:33 -0700 (PDT)
Subject: Re: [PATCH v2 31/48] bsd-user: style tweak: use {} for all if
 statements, format else correctly
To: imp@bsdimp.com, qemu-devel@nongnu.org
References: <20210424160016.15200-1-imp@bsdimp.com>
 <20210424160016.15200-32-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6dc5c68a-a5a4-b750-1d97-2b21e0aab027@linaro.org>
Date: Sat, 24 Apr 2021 11:01:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210424160016.15200-32-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
Cc: kevans@freebsd.org, arichardson@freebsd.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/24/21 8:59 AM, imp@bsdimp.com wrote:
> From: Warner Losh<imp@bsdimp.com>
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/mmap.c | 112 ++++++++++++++++++++++++++++++++----------------
>   1 file changed, 74 insertions(+), 38 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


