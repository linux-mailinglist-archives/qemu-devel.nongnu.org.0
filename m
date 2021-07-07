Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECA53BE40F
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 09:59:04 +0200 (CEST)
Received: from localhost ([::1]:34986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m12SV-0004qs-7h
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 03:59:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m12RU-0003yT-Ky
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 03:58:00 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:46657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m12RT-0002PX-7p
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 03:58:00 -0400
Received: by mail-wr1-x434.google.com with SMTP id d12so1328558wre.13
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 00:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NAwUZdlcMO2Cf5aGHsl6hStxcEi0hNM19iaV95DkoJA=;
 b=WsZwsN5HfEOjFDCZGO19vCoF5Xmo/2Jb92I72KSNj0vfyDr0NN3cMF4WadX/g5ZdOj
 BIWvc5Qu/muQOC6YMYWpeFhBIpGf72lTPitq+1QJIvQv2FPpmuOh3x6gNHCBh3v5Vfas
 tfr30wTwpKtvDl1IkNkICw+viB3soIyCO1Rqa0y/t3byvnJsegeAleH9r9TrDbqmYdOP
 Uneogn1r3jX0hgWmgIhsX/sb01cdj50JEW9urKTqdoIA8PsSSx+rXrVYSbM2c/hquUN4
 HRoNrz4utwEWb6pP4gd9rzpaazv282/e6sJiqysxCR/Q6hwgUStrm3MATEb+AIqZyuUM
 g2Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NAwUZdlcMO2Cf5aGHsl6hStxcEi0hNM19iaV95DkoJA=;
 b=ftJO+tFdkXHdpa5sEj0SfCy5m90V0EnmW8u7jZkDJq45lvoqrgnmnZpBLDKwK79trl
 EI9q0Ywv/gG8FxWl4OdEt4EIlMONCIiZSjQfqxP6Zhe6bs/gmOIvYUimS4VUjh2KyUfo
 2+90DIDOAoNCUcSo356f2GWat3yFDEB4qEvAy0Ij+5vBXGUotjvAAQK2Wx1jq3TS85sY
 WbTCy0DuXURhQJNJb50Uv8dZLww3Iok+Ykf+QucXCtCj72BEw3SgqN/LguzkSjCzUyEV
 3ndrpWsyCbiNBsY8ySssrH+H4JPM5By72hwDZ99iEiUUYZIw/eeKEqTT3fXGfOYd0plv
 rMig==
X-Gm-Message-State: AOAM530nsuouB6YHcHrVtaZHyJ0c2rROaOb8Xt3O4uuZvBaoljmyxWqJ
 hu13+9HUWrSniICzSdXTfAs7ow+3XJY=
X-Google-Smtp-Source: ABdhPJy6DNg64M0T7LdePY7LxKc1TUYGUofRknYEXLZj1eKHAmXAEcQ121XUrp7SisEsMn/XCvaO5Q==
X-Received: by 2002:a5d:6d0b:: with SMTP id e11mr13658400wrq.50.1625644677228; 
 Wed, 07 Jul 2021 00:57:57 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id f22sm18247771wmb.46.2021.07.07.00.57.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jul 2021 00:57:56 -0700 (PDT)
Subject: Re: [PATCH] tcg: Add separator in INDEX_op_call dump
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210707000414.358112-1-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <97e70ae1-ed95-495e-1f80-ed2399f1daf0@amsat.org>
Date: Wed, 7 Jul 2021 09:57:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210707000414.358112-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/7/21 2:04 AM, Richard Henderson wrote:
> We lost the ',' following the called function name.
> 
> Fixes: 3e92aa34434
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tcg.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

