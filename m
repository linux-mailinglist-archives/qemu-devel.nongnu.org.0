Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A70531B92E
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 13:27:39 +0100 (CET)
Received: from localhost ([::1]:40524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBcyY-0005cL-Li
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 07:27:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBcaU-0005LF-Nc; Mon, 15 Feb 2021 07:02:46 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:35262)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBcaS-0008Jx-45; Mon, 15 Feb 2021 07:02:45 -0500
Received: by mail-wm1-x330.google.com with SMTP id n10so9100607wmq.0;
 Mon, 15 Feb 2021 04:02:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ghtaIAvtp2Oo4vocU7M7G+cvwcCD+/RtJ4FVGifnX8Q=;
 b=R/CqzAXngxDDujSJLzXrMTPQIO8mn1nYB54K6I5k2SKYEK+IluyC/F/VWDqpVR2Yjg
 vITHguwiku1Rp4x+7vD7Fo/AvN+Ejhd7W2FYGsduhPcnvqRSgLuo3LvoFyi0G7SG7dPb
 g3DtybFBzFH6/kvgEj9TjYyyAsYReXUR8/1NQVzLLCKjeg6ObZtQ6yry/SOjGFkVF1ra
 lgaw5ml74IOxw3DthgGjEwkSgk1tdC0WqFVuEccw1dq5sie6n1wqPvpc83aWv637AeYl
 ED0chdNwoNRjyOAi2NgSYmGbNeFDHHwJ00yvj/pWJ0fLSDW/VcxobvvTo2o1bzNuafU1
 oAzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ghtaIAvtp2Oo4vocU7M7G+cvwcCD+/RtJ4FVGifnX8Q=;
 b=uZr2tJ1Xd3ecjiDrOSOXwgaNgv2/dk17ZG4MFP1BaVdVKKPCVgx8wKLfE5nwY7uoP6
 nradiHKDrPLQnJp2ESBIFJ3UrWaaZKZXd1XPrLvZKmMar/Tts0Sz4q6FlzpKUDfJEEWi
 UcUAZZDrprNKEt2ohw2JgcXvT2jPX38OuyCac8WWVz0uVLGfzIN5jsAPddCBg9MyStOq
 bJi3lzNXNgFgjdhwA+C+NEY4Dah9GRjZAXvH/qQ7cOvSGWbtCer8ZydvimwNnnZmQ291
 7rvRvaY7+tMXqbP2pnGddBSSTf+CJIlKDnuZhX3OdFoU4q+Vd1b1tqgOPSE8PkYIBIis
 af3Q==
X-Gm-Message-State: AOAM532IlB61Uj7l8wia1pzDgX26KdEOLVQoeoU5WpsJBWMA+kTFzLqH
 JhsqiW8o0mtMchqXFmByolLQHdSAY30=
X-Google-Smtp-Source: ABdhPJw9OHSie1rOp+7GIF4b9zF1Npy3pMGpuJe720LVALjDbq6IYo57nIHJydYtgVngzeSQCfhxUg==
X-Received: by 2002:a05:600c:4305:: with SMTP id
 p5mr13904575wme.8.1613390560559; 
 Mon, 15 Feb 2021 04:02:40 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id g62sm24985373wmf.46.2021.02.15.04.02.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Feb 2021 04:02:39 -0800 (PST)
Subject: Re: [PATCH v2 02/24] hw/misc/mps2-scc: Support configurable number of
 OSCCLK values
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210215115138.20465-1-peter.maydell@linaro.org>
 <20210215115138.20465-3-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f8a4c9ac-5114-6f9a-8cad-4fc49b036d21@amsat.org>
Date: Mon, 15 Feb 2021 13:02:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210215115138.20465-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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

On 2/15/21 12:51 PM, Peter Maydell wrote:
> Currently the MPS2 SCC device implements a fixed number of OSCCLK
> values (3).  The variant of this device in the MPS3 AN524 board has 6
> OSCCLK values.  Switch to using a PROP_ARRAY, which allows board code
> to specify how large the OSCCLK array should be as well as its
> values.
> 
> With a variable-length property array, the SCC no longer specifies
> default values for the OSCCLKs, so we must set them explicitly in the
> board code.  This defaults are actually incorrect for the an521 and
> an505; we will correct this bug in a following patch.
> 
> This is a migration compatibility break for all the mps boards.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

R-b stands :)
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
> It would be possible to avoid the compat break, but we've already
> broken compat for the mps boards this release cycle (eg in commit
> eeae0b2bf4e69de2) when we added Clock support to the armsse code, so
> there's no point in trying to keep compat for this change.
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  include/hw/misc/mps2-scc.h |  7 +++----
>  hw/arm/mps2-tz.c           |  5 +++++
>  hw/arm/mps2.c              |  5 +++++
>  hw/misc/mps2-scc.c         | 24 +++++++++++++-----------
>  4 files changed, 26 insertions(+), 15 deletions(-)

