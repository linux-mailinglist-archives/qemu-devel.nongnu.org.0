Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E60CEF7622
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Nov 2019 15:14:27 +0100 (CET)
Received: from localhost ([::1]:53478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iUASY-0004Qv-Uv
	for lists+qemu-devel@lfdr.de; Mon, 11 Nov 2019 09:14:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52756)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iUARH-0003gf-48
 for qemu-devel@nongnu.org; Mon, 11 Nov 2019 09:13:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iUARE-0005NK-KS
 for qemu-devel@nongnu.org; Mon, 11 Nov 2019 09:13:07 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:53678)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iUARE-0005N7-EF
 for qemu-devel@nongnu.org; Mon, 11 Nov 2019 09:13:04 -0500
Received: by mail-wm1-x342.google.com with SMTP id u18so5854510wmc.3
 for <qemu-devel@nongnu.org>; Mon, 11 Nov 2019 06:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=w7rsXRYYjLafHi1jkrIAu6AcQ6FCgRIXOOq6UkJtVFI=;
 b=r5kI1rWY3eIu9lVWFbWmBIZcWR2scVfb3chuXrCkILjZUadRW4bAESgwwAJLISCHDB
 VpIbDNlM79NycLG4B16kOAGaXRYVUmue7awbvDZR19i+vwbrhnzh99EjaLSXgLyx0Ecv
 T487vztljz5oG56gyzeOSQOgupXO5B09NTwn9cLNXb3WUkjNkCSgMoHa1O6seyKGuZI0
 UbaVWAVaSNLcVwJbb48OrJ0OrvPC3BAJHCdSQBWtKtBWpIVLl9SYayJ1EPZ/7shVLsFw
 jBS5GeF6ej25USPCyI2z7xKM7fNBBTqrApZd2K5jYIlhqQoFBAADfP+c8cIGECatfLtn
 H83w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=w7rsXRYYjLafHi1jkrIAu6AcQ6FCgRIXOOq6UkJtVFI=;
 b=qAxYTAPPH+1vXzPryAjzU7XKmf8t1RArXipEysB45iZ9xesNQVX5n6sIzGMMybFMpS
 hNUXls+6i32ckuETTbFbAQ6w+ZBCBg2IruHPzIkNL2wnUsI9vT6G0+vDx5C2PKRiBP0o
 l7eBykc2GYPBkvALm1Oem4UjEZQjTsNPd+V1Wy9y5OyvLnjfBFvs9FgcksAbJBNNWVX1
 2fu6nE8rEcjQKL9y8Bc9giO4dmV1tQCnB00BRdbp0oplXl2z8eTz4sMuTzgEDGhvDudO
 69MJ5xikhD4kXgxFDZ6t+TVTiBNxm8L8OCgfI9HZx9SSy3BIhzcoUkCSLtTE2ODo0HQx
 YnPg==
X-Gm-Message-State: APjAAAXc0hf2dnOARM95z2G6gWZ+7gvNd2Qux0OgQT0PjXsGa8DFXcSM
 l1hPqRHg19xzBNGPRl0K3z9aiKnMArZdDg==
X-Google-Smtp-Source: APXvYqyEVyIiRNUbr+u+iSMCvSsV9+mgvhsIJy0Q8yHgLowp9Hkwxmd8dLfHJb0exj00Fin0VyHDiA==
X-Received: by 2002:a7b:cb4a:: with SMTP id v10mr19431391wmj.106.1573481583108; 
 Mon, 11 Nov 2019 06:13:03 -0800 (PST)
Received: from [192.168.8.102] (199.red-79-149-206.dynamicip.rima-tde.net.
 [79.149.206.199])
 by smtp.gmail.com with ESMTPSA id d11sm17802336wrn.28.2019.11.11.06.13.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 11 Nov 2019 06:13:02 -0800 (PST)
Subject: Re: [PATCH v2 0/4] tcg/LICENSE: Remove no-longer-true statement that
 TCG is BSD-licensed
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20191025155848.17362-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <743005ac-037c-099b-5591-65518c4565f0@linaro.org>
Date: Mon, 11 Nov 2019 15:12:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191025155848.17362-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
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
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Claudio Fontana <claudio.fontana@gmail.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>, Laszlo Ersek <lersek@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/25/19 5:58 PM, Peter Maydell wrote:
> Since 2008 the tcg/LICENSE file has not changed: it claims that
> everything under tcg/ is BSD-licensed.
> 
> This is not true and hasn't been true for years: in 2013 we
> accepted the tcg/aarch64 target code under a GPLv2-or-later
> license statement. We also have generic vector optimisation
> code under the LGPL2.1-or-later, and the TCI backend is
> GPLv2-or-later. Further, many of the files are not BSD
> licensed but MIT licensed.
> 
> We don't really consider the tcg subdirectory to be a distinct
> part of QEMU anyway.
> 
> This patchset adds explicit licensing/copyright comments to
> the three files which were missing them, removes the
> inaccurate tcg/LICENSE file, and updates the top-level
> LICENSE file to be more accurate about the current state
> of the licenses used in the code in tcg/.
> 
> If we want a policy that tcg/ code has a restricted
> permitted set of licenses, then we really need to have
> this enforced by checkpatch -- history demonstrates that
> just writing it in tcg/LICENSE does not prevent code under
> other licenses getting in. In the v1 email thread nobody
> seemed to be very strongly arguing for this, though, and
> at this point we would need to make an active effort to
> track down contributors and get relicensing statements.
> If anybody wants to push that effort now would be a good
> time to volunteer :-)
> 
> Note on the licensing for the tcg-target.opc.h files:
>  * I've used the same license as the rest of the relevant
>    backend, which is to say GPL2-or-later for tcg/aarch64
>    and MIT for tcg/i386 and tcg/ppc.
>  * In all 3 cases, the only people who've made contributions
>    to the files are Richard Henderson and (for aarch64) Alex Bennée
> 
> Richard, Alex -- an acked-by for the relevant patches would
> be nice (or if you intended a different license for the
> contributions than I have assumed please say so!)
> 
> v1->v2 changes:
>  * note the presence of MIT licensed code as well
>  * 3 new patches adding copyright/licensing to files
>    that were missing it
> 
> thanks
> -- PMM
> 
> Peter Maydell (4):
>   tcg/aarch64/tcg-target.opc.h: Add copyright/license
>   tcg/i386/tcg-target.opc.h: Add copyright/license
>   tcg/ppc/tcg-target.opc.h: Add copyright/license
>   tcg/LICENSE: Remove out of date claim about TCG subdirectory licensing

Queued.


r~

