Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C87D49DC91
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 09:29:53 +0100 (CET)
Received: from localhost ([::1]:40134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD0AC-0001vM-4Z
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 03:29:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCza8-0001Am-6h
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 02:52:36 -0500
Received: from [2607:f8b0:4864:20::102a] (port=38548
 helo=mail-pj1-x102a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCza6-0000LJ-1F
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 02:52:35 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 d12-20020a17090a628c00b001b4f47e2f51so6758268pjj.3
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 23:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=CF+ULzFrP9GTeJjJ5sN/088xcvKdAnlEZ2/+t4MRgJw=;
 b=Ku9Ctnc3Aup8g7LMr2le8d2+3x0hkSM/NWV2xHCxfPJdxkGfZKadxeg+2WyAfg1d96
 s8+zamFffj4p24cMs8aqfr0iwDcvl0ejDTqC4GggBLoScekX/ZW/CU5zOXtc44mENTVT
 NHy1D+OYeH8oOHHVB8ZWX0mORGDBFuQrFVe0ZLXFumbJk2bI9Hoy35KSOoYTxm5JK1a0
 2dD7LywJJyDlO3WAeTiAamQ+YYwOlpCz5Jfe74xwaxnZeeC0O/GL6m58BiQi4mSt/Zbf
 yTUM97COMUEkziJ65Y3bwU81nggfRwePiw0QK3UhPwmNJlt0w1yYMT5Jopr5WK5XTNOz
 8L/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=CF+ULzFrP9GTeJjJ5sN/088xcvKdAnlEZ2/+t4MRgJw=;
 b=SXpXQTd629VjHW99k+9puAznx1yJ/U9TBqUMzRXvwYmyJq7Br4/u47UAluJz2leheg
 jzX0s9dcPrHO790SrgV4TCUNxcdR/EO2ltFTuy6TDhhYbW+/MRD6nn/5QNAYl2g87g5b
 KP9+jVKT/YP7WdoXT1G6U3k8bDrc9ik8Eff4OFRyPeRgryOPvzgLhnP5fdRaSoFAy/lP
 fkwDHZjR+PITpFgrRx5dy5mP8A7ywui9xZWtDDP7JtaemAr1Vi6VlSxidKXykijPGLR2
 G4u1pYerJSQ4QLsRTk2QI/6pc/1kGACSOzTXWk3ti0BALSomzY4p1yQcRxUksX10+k/T
 pTtw==
X-Gm-Message-State: AOAM533uBOS8eEhpSwxyJ1a3jWph+4GD0HSzqq29XpsFcF9KSuTMesai
 ACVKHYJKVTvym22+83uPUfGfDw==
X-Google-Smtp-Source: ABdhPJwW2+jDDdIGACf82fWxIp2aSlHkKuzmy7Wjbb98tELpewTJMb60rnGyYVtsko6C9SYizBbxHA==
X-Received: by 2002:a17:902:a9c2:: with SMTP id
 b2mr1376296plr.135.1643269952699; 
 Wed, 26 Jan 2022 23:52:32 -0800 (PST)
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id f8sm1874568pfv.24.2022.01.26.23.52.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jan 2022 23:52:32 -0800 (PST)
Message-ID: <fba4e0b8-9da8-81b0-14b6-e633cd03ce3d@linaro.org>
Date: Thu, 27 Jan 2022 18:52:25 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 33/40] bsd-user/signal.c: tswap_siginfo
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20220125012947.14974-1-imp@bsdimp.com>
 <20220125012947.14974-34-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220125012947.14974-34-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, def@FreeBSD.org,
 Stacey Son <sson@FreeBSD.org>, jrtc27@FreeBSD.org,
 Kyle Evans <kevans@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/25/22 12:29, Warner Losh wrote:
> Convert siginfo from targer to host.
> 
> Signed-off-by: Stacey Son<sson@FreeBSD.org>
> Signed-off-by: Kyle Evans<kevans@freebsd.org>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/signal.c | 53 +++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 53 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

