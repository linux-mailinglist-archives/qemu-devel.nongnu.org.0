Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C2F32758C
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 01:20:47 +0100 (CET)
Received: from localhost ([::1]:35326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGWIo-0006ta-0w
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 19:20:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGW57-00077f-Mp
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 19:06:37 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:54501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGW56-0000ZH-7b
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 19:06:37 -0500
Received: by mail-pj1-x102a.google.com with SMTP id i14so8288761pjz.4
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 16:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rtvIGqX5OZOpply6BjFC7Rtgb0HdrBzlVkNs8MgePl8=;
 b=WPi2oG+sO8NfgguAIw8C7IvYqR6Buv3tGhJP6NWbCqLIAp0Bhld78oSJ9NFeU0AqSK
 zlcrK/S6IDIZGFozUEqfzmRC9OVO+hP/IVTyG1kaOD/kcYIG24CaeYkGrq8QQdOk+v7A
 L0Ztkm6ekX1UsxgodhYEmxWemlHNO0BvbDq4IkUV0rWEtVCAuhPuKaNcwgtjqIv0zH+q
 OOu2ea9uHg433Ah7wdFaYzZWgr1CuZIJCwZfFEhxfzhZih0rmo8ofOX8yGW/e0mv3cS3
 D3HNFRk+o21L8/uEvdXELGVGjP+kqGsvHZI125J1TVSILJyVLlRRUXiOJTg+VnCnLEl3
 dcxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rtvIGqX5OZOpply6BjFC7Rtgb0HdrBzlVkNs8MgePl8=;
 b=Dc96vaW4ZrFNq3jE6y8FbNyhlEMm82wNBtfrA72y8jRJMYUnGaaAIv/9qrRmKkh9Ya
 P01gw+WIzx5k0Jo/MzhF6ZQ62kIYJVohECM2P+YbQ3JMR27wFsrQgBaRo6m4gYdrgQRp
 uRamVu1C/Cw0DkAi0zU4CoH/I8Vy5ML0NjzU1JPHFG8ejJl0Un4vXnKM4SYyXFIrQkQt
 kFhfGZkvA7H0AkAyIXOIYwtVspX34TJVrGt3ScFBQGBfJAuKzjhdRl5mlBkVX63wrIys
 m2wErIITqJ0BN6TfxdjeUXkAEkodUIEMMwb3iIiebOff0xFWKvGjKGETTH4jZgOuUh9B
 8L0g==
X-Gm-Message-State: AOAM531F8hEfm9Zbl8kQuAFnEMzjMxTBjNGGzFzqJTpOzWTLaQ5Z+k5n
 sOXJkHPE2CCJ/MMIEg/V9c4mOg==
X-Google-Smtp-Source: ABdhPJx8O41yuBuxAtGyFU2oUg3ina6pmO5xDu3MP63YXmcAyi1AMM74ep+iAwIOebF878dInfIIjA==
X-Received: by 2002:a17:90a:f2ce:: with SMTP id
 gt14mr14098553pjb.221.1614557194674; 
 Sun, 28 Feb 2021 16:06:34 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id gf20sm13820568pjb.39.2021.02.28.16.06.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Feb 2021 16:06:34 -0800 (PST)
Subject: Re: [PATCH 0/5] tcg/tci: Merge identical cases in generation
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210218232840.1760806-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ceb00322-314a-7f71-a5bd-110a32769144@linaro.org>
Date: Sun, 28 Feb 2021 16:06:32 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210218232840.1760806-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
Cc: Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/18/21 3:28 PM, Philippe Mathieu-Daudé wrote:
> Hi Richard,
> 
> This is your patch (#4/71 of v4 [*]) split in 5 parts for
> easier review. Please consider using this series instead of
> your original patch.

Done.

r~

