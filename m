Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE159D62F
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Aug 2019 21:02:38 +0200 (CEST)
Received: from localhost ([::1]:56654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2KGD-00018m-9n
	for lists+qemu-devel@lfdr.de; Mon, 26 Aug 2019 15:02:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35121)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i2KEY-0000WF-OS
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 15:00:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i2KEW-0008Gv-MJ
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 15:00:54 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:41432)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i2KEV-0008Fr-2O
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 15:00:51 -0400
Received: by mail-oi1-x241.google.com with SMTP id p127so4350063oic.8
 for <qemu-devel@nongnu.org>; Mon, 26 Aug 2019 12:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3WaPNPiU02r3t7FgLNLHpREayidlTfYT242Ian0tIQ0=;
 b=lf8P31pGOfvXnyk6lOVkAO64EB9cJFwXWl1dKGC7nnyAuYyISSMX7c7fdvQoliVJcF
 ZBCm5Di95kmkGnHiVD1oy7uB7KGr+Ps2F4Z2qwrELk/BfT9X6g2zRESGsChXXCaLsw2w
 3nBPapAxZmglh6V5Dz2lfjxmoDv0KONlGAJnZBqi18ZTlEseJXlkx7bDPgGj9o3mLQSa
 lIpvveRZsLxK1LxwShbRZf8AeFvoRSJM9inyQP93ivg+21d/W1+QlVHsw9CmAeuPEDOn
 SdbpTAXppMjPd51URF/vQBnji1iZdVHj/JDCzz/uU8XhRcBeJO4zv/hRuTt19Ud44oRf
 S8IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3WaPNPiU02r3t7FgLNLHpREayidlTfYT242Ian0tIQ0=;
 b=neowTDkT+hyB3rQ71bL23Sn/WcjJU+8dclVsPSA7qsqfS2x4UuWF6OS2/zXjM68P95
 sMPOkR+52tCqtjUwWE3dQMNnDMqkHWNDR4m8OCCXbsyalm2MKNMXiNYRbyjWhOj8LnWK
 cwPCQo6PU5lvAr1EssIrahKYxhwMmWfEajDSuaa3H+MgThAnBycjgZf64CD6HGPE2tod
 eYa6fTbQd4QYCzSx94nFaVqJ4woQsoSAVd3L+NAksKeULVW68IjRNcOTlqCoVJxQ1s2l
 QbMvvaH9gMF2Pkve6ArCQ4iOlhuBPcvbeEJ0uo+UnhZpLLNAsl39J2fYTbvhjHv1cgJs
 /8YQ==
X-Gm-Message-State: APjAAAW1GafHDnIurxEAxxMFwmjUaxa/SPn5PNmUMbDGxhvOvDEN8kk6
 yetItPsnFOJReMmFkKKhbFhPHAy9Ggl4hYGqHIb8fQ==
X-Google-Smtp-Source: APXvYqxSi20L/573K4Ew8N6ZjL+O9gK6mA22ENXHq8LJR93XqELdrvMtB4Vw/UGkiz6sAk3cEY7pzrSbtt9OhaV5abQ=
X-Received: by 2002:aca:4814:: with SMTP id v20mr13656387oia.98.1566846048363; 
 Mon, 26 Aug 2019 12:00:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-55-richard.henderson@linaro.org>
In-Reply-To: <20190819213755.26175-55-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Aug 2019 20:00:37 +0100
Message-ID: <CAFEAcA_03nRLRhNY867PLBCkTphPL=6tUCKRNEaPhQd7-6mo-A@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-devel] [PATCH v2 54/68] target/arm: Convert T16 adjust sp
 (immediate)
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 19 Aug 2019 at 22:39, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 15 ++-------------
>  target/arm/t16.decode  |  9 +++++++++
>  2 files changed, 11 insertions(+), 13 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

