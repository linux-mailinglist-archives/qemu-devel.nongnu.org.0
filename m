Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F28A1AC127
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Apr 2020 14:24:57 +0200 (CEST)
Received: from localhost ([::1]:33582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jP3Zg-0000bk-JZ
	for lists+qemu-devel@lfdr.de; Thu, 16 Apr 2020 08:24:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53395)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jP3YW-0008Nt-6G
 for qemu-devel@nongnu.org; Thu, 16 Apr 2020 08:23:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jP3YV-0005BL-AM
 for qemu-devel@nongnu.org; Thu, 16 Apr 2020 08:23:44 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:40036)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jP3YU-0005Ax-VC
 for qemu-devel@nongnu.org; Thu, 16 Apr 2020 08:23:43 -0400
Received: by mail-ot1-x344.google.com with SMTP id i27so2865127ota.7
 for <qemu-devel@nongnu.org>; Thu, 16 Apr 2020 05:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yLfuVwRrMu/a6rdozyYUe0pegeZw2lWd9zI9S2tbKfg=;
 b=KKlbo9nelFtrOgPHst8n/QYWspeynB/5W8NE3+XBdgl0bdC7Wo4AwNnQBgfUE7LPja
 xACHE6IG6u5qiUtGFYHdIHnPVBgmv5JgAc2ldec+dFQrLlUXPczaBWyxfs2PRYZObJ4n
 dmaWqECMaZHB+365mc1UJ12Zx2l6t5rtewg8BcQjj3RzzahcqsdgdxRl3dZJPQLUNVfB
 95+Rd1vHPFExO35TEHq4c0A6mAey9YO8F7o/LXUNnJMG4oKdCjXn9z/xOWi4SIZSBf0+
 0jghseNPKG1Uv3QIq7dZcARoN/4tF8X85b+nAxaUx9u4MHbb2BGOmEsZo8O6SZf9tIdT
 n54w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yLfuVwRrMu/a6rdozyYUe0pegeZw2lWd9zI9S2tbKfg=;
 b=oHM2g/52BBl8p72L9rNDGFziZGVGd08gvZpdR2dPtasuxAzfsluXyHe5g/H2JfEpZt
 /Rkwd4bSKzUVNrY2zLB2dWJJO0ifd+Vx23saZVIGD+cWpl0IomRE3pjgQqD1mpAcQDUJ
 6lQB6S8wSfWBVKol2I4YiKt1KipwAouXRLhWnsCsh8UTNaWwU5hRcf4Fo1H11iIC2d1Q
 mN+cqAl/IG7Ec1YQrnSTG+0wxeHvOa6waSQOL/9B8i89xm3zxPrCVwnugdjXtHcBd04j
 RMlUjSu3CrFwsz0RBW/aelxveGK7D6tifeWVgmbXNYkkbg4YoLgDn5wCqsG1ngzAVYp4
 P5kg==
X-Gm-Message-State: AGi0PubVMdo1AL2AxBbKxYXDuetWL+cRxVUcdS/zAisfo6xpOmNd+PWB
 C9tKSvmDd/mHjWAYDAwv6G0W6ANYvSMPRk2XpuNY3w==
X-Google-Smtp-Source: APiQypKfwv2GE9zv6KlezWIEPYpaIcv722YncDXntyoVzXItfn2iekgixXWgZufEAAVUb3nCxWG2KBdKhBCdmxFmeHg=
X-Received: by 2002:a05:6830:1f39:: with SMTP id
 e25mr26839885oth.135.1587039821971; 
 Thu, 16 Apr 2020 05:23:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200311064420.30606-1-richard.henderson@linaro.org>
 <20200311064420.30606-6-richard.henderson@linaro.org>
In-Reply-To: <20200311064420.30606-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Apr 2020 13:23:30 +0100
Message-ID: <CAFEAcA8sBjb=05cDzYRvc9oBzJFGrTVokBbx6gqUNzPvskXoyA@mail.gmail.com>
Subject: Re: [PATCH 05/16] target/arm: Drop manual handling of
 set/clear_helper_retaddr
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
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

On Wed, 11 Mar 2020 at 06:44, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Since we converted back to cpu_*_data_ra, we do not need to
> do this ourselves.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

