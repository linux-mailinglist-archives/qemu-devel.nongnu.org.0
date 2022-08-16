Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC0D594983
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 02:14:32 +0200 (CEST)
Received: from localhost ([::1]:44166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNkE3-0005ST-Fn
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 20:14:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oNkD2-0003wd-Bl
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 20:13:28 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:36430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oNkD0-0001Kd-V3
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 20:13:28 -0400
Received: by mail-pf1-x42d.google.com with SMTP id a22so7385341pfg.3
 for <qemu-devel@nongnu.org>; Mon, 15 Aug 2022 17:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc;
 bh=Vp96v3OY3Eaqb2DxEwx2g+7w8KrVxmJLcR5I/ZuxJpA=;
 b=pHS4uD8l+tLbhOs4jV7K2dtMMCSmcEvzHQNcpgsNg2/Tir6jdIjTch16TyQBjE4IAS
 2a/dlOCGe/nJTMafMzonyk6DzDDuYy35Cw+RaLXSvsiyXIY92bloU7YB7O40sF7+hXgu
 VP+RZhDVaz9QRlEJWbD3cppQOGBpi/K473xuZG0eEdPF9fCYUXf8OxUWHIgQsVmsewVc
 4LSWsSz1p2Ky49KO27TN8CAfWzRao0blkx6kB2xrl8uWjg6wW/b6kgmQYIOBYgBUi2Gw
 5wT9LKfDSaQ2DXjg56taV3Lz8mt1cvcdNgiim4u3SMb/EyJvOAgelLWfxELGjFd4NSqt
 oJNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc;
 bh=Vp96v3OY3Eaqb2DxEwx2g+7w8KrVxmJLcR5I/ZuxJpA=;
 b=KWG2Dl0uhDq46JS3M3AgTdu02ckFV/t8UE9kbieHgpzwKgsdo2ANzr+xaUu0YMzC7q
 54hVkaAK9Wg7TBuo2AoW3D2r4F+luxCbNYuiGY9U2nGQ+n11XfUeqlkf+n7okVaWfI4i
 sWF5LuMEUk9gWXEx2wepfm6NTzeEL1RryUoyyBWcgJ4iNXnvMrRnjfWV1L/RjSoaAx7Z
 EzxRCCabhsxLQdhFIxNaXKkrrXwtXi2MWev0iwjUvnAAIlXdVuSznnC7C04Gq3XHX/Z6
 BvtwSZSf1eD+mUondtNr0dqEYU1Oqf85LGZuI1DFFq9f5M9JOzOIqB5bqWZzD5JakZFh
 WOoQ==
X-Gm-Message-State: ACgBeo1dWBNZz3cmE0fxMgwJ4ippb+H7P76oCWIMrjf5SYd6R6msppRp
 or0nyGQG3h5EYLAYofrcQ/A=
X-Google-Smtp-Source: AA6agR4fcwhbM+VlD5+7+G/cPODVwBnd7ZmTJwqsjTiBcqYzwWYdXVDTh8qEStCCLp7h28UX3h20wg==
X-Received: by 2002:a63:90ca:0:b0:41b:d0ed:d121 with SMTP id
 a193-20020a6390ca000000b0041bd0edd121mr15630048pge.287.1660608805406; 
 Mon, 15 Aug 2022 17:13:25 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 o13-20020a170902d4cd00b0016bd8fb1fafsm7552410plg.307.2022.08.15.17.13.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Aug 2022 17:13:24 -0700 (PDT)
Message-ID: <c5af0082-67e5-d8ed-feeb-2538caa58c12@amsat.org>
Date: Tue, 16 Aug 2022 02:13:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH 09/20] disas/nanomips: Move typedefs etc to nanomips.cpp
Content-Language: en-US
To: Milica Lazarevic <milica.lazarevic@syrmia.com>, thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com
References: <20220815072629.12865-1-milica.lazarevic@syrmia.com>
 <20220815072629.12865-10-milica.lazarevic@syrmia.com>
In-Reply-To: <20220815072629.12865-10-milica.lazarevic@syrmia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 15/8/22 09:26, Milica Lazarevic wrote:
> The following is moved from the nanomips.h to nanomips.cpp file:
> - #include line
> - typedefs
> - enums
> - definition of the Pool struct.
> Header file nanomips.h will be deleted to be consistent with the rest of
> the disas/ code.
> 
> Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
> ---
>   disas/nanomips.cpp | 53 +++++++++++++++++++++++++++++++++++++++++++++-
>   disas/nanomips.h   | 51 --------------------------------------------
>   2 files changed, 52 insertions(+), 52 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

