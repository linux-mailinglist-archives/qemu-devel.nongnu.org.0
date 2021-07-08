Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C92F3BF7D9
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 11:57:25 +0200 (CEST)
Received: from localhost ([::1]:36794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Qma-0005hu-Ae
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 05:57:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1QkN-00031x-Hu
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 05:55:07 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:33720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1QkL-0005Zp-Jx
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 05:55:07 -0400
Received: by mail-ed1-x530.google.com with SMTP id eb14so7740415edb.0
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 02:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4kL95hQeusGGcbtlWdnsw8Ntes8Hfu93UtZswW+5AOA=;
 b=yZv4HKXIsK3SwqCqqd70yocaa/sE1taVawKi55cK3zMGAOFYDH0K2NvBjNgwY4x0TR
 PzO48VoDln5WzKIL1sRk7ijCAadRz+nhEZlCfc2SpUfmfCTRUBLJIIzT5fM3d/7z/I9U
 QtOBmG3H/UScdL1/7LG2KC0W/UC5EYsHyCZXUQVWZaATwDzML/9GzDu2AFy/HcEA/tg8
 SMcfIe64NjOMVUEbaOrFRsKlO06qUHbyul7PxmztBjQ9MHhYjuUwTnSu+iDImiBc2Bl9
 ZF7vOu2PXU8ME2pIJ7dEsWaM6/XnCn2hINLQ5CrYds8E1j8s0i6CdmDSBXXKpYtEw2N0
 wIRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4kL95hQeusGGcbtlWdnsw8Ntes8Hfu93UtZswW+5AOA=;
 b=X5HkYI0J4jSQ0qghQ7O3vchFndwdLH1brJT8VLeNrZIARSnYXL+INT57aMV1lE2wpq
 Z31s4JKu6GHIKmxuhhhBkO8dZ8bG/fwq2ynv0ISB+0YVNsANFAwiLY8FMLWpTDYlxSoH
 9ODcdImxlMymEefBWb31nAqkn9mep4Hju/NyClj23rU6n1DktVhKpJgQb0o13rm3M3mm
 xBzPEzwJ0B+DK0gncLOOnHT6BPBVLMVGICLG4a6piOF83Y00VUuazmo62Ah7LRD7arak
 HweISTi6mxvQ4BQYfzmz44MfN7IMqiVctseDRypuCu5xKkWeriMTTjOQkXOd3YE4UWhH
 h5mQ==
X-Gm-Message-State: AOAM533GEeMXtn/Xn8NaW7r6Ga5rsVI14FEQK8guZJMSmLftjx+pJ+vZ
 fa2vqcy9gb1MwsRyRE6ha2F8N3LKBS0DXOmIVp5NEQ==
X-Google-Smtp-Source: ABdhPJxYi7LdkzXHKylKum3xTMy9T68Zz7/RV59B/nKmWt9sb98tfSwOF07vgWzf28N3r4bKGAZn43ArfsVqaNerawY=
X-Received: by 2002:a05:6402:697:: with SMTP id
 f23mr15554515edy.44.1625738104087; 
 Thu, 08 Jul 2021 02:55:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210706211432.31902-1-rebecca@nuviainc.com>
In-Reply-To: <20210706211432.31902-1-rebecca@nuviainc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Jul 2021 10:54:25 +0100
Message-ID: <CAFEAcA-m+A4jpaaauDvN2FQgjfL9X30hzhVmWFJ0xJ78O7a__g@mail.gmail.com>
Subject: Re: [trivial PATCH 1/1] hw/intc: Improve formatting of MEMTX_ERROR
 guest error message
To: Rebecca Cran <rebecca@nuviainc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 6 Jul 2021 at 22:14, Rebecca Cran <rebecca@nuviainc.com> wrote:
>
> Add a space in the message printed when gicr_read*/gicr_write* returns
> MEMTX_ERROR in arm_gicv3_redist.c.
>
> Signed-off-by: Rebecca Cran <rebecca@nuviainc.com>
> ---
>  hw/intc/arm_gicv3_redist.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to target-arm.next, thanks.

-- PMM

