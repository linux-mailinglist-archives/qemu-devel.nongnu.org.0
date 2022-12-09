Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B996481F3
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 12:48:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3bnc-0006NB-Vg; Fri, 09 Dec 2022 06:44:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p3bnb-0006LU-D8
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 06:44:15 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p3bnZ-0002pR-Px
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 06:44:15 -0500
Received: by mail-pj1-x1031.google.com with SMTP id u5so4564277pjy.5
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 03:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MmbO6L2nrozePvsgih2HqlgWScp2P1rfqPD2ntkf9bs=;
 b=tlnYJ6dW/Vt2y8fdolLej8NOsKl7+Me4QFzGRFwpax3yADxCBLfQ+nquAGeE/ld4zN
 858ue2K6uV3xCI8cf/E7GPNJbQuhvNq00RBBFhnYSFmIrJx40qacT4tYc0MAkWkq0DdH
 qxTDieFgsS130k6KNvwCVtHG+eOy9NyKg7nV7baUYO7xrJ2iM3AG5PCOWWQoCLT4950D
 iy4RLY3gWdWsC1/gnVwGOKAa1anMqVfZIfsE9fDKGPMYg11aXKln+Z5ZyRIl4/z+VaHN
 qXl8smqxCaN1BlGqejXC0riLjr3/dTfdq1ejWbc9q5Ra6NelWN0Rn++kjrSuZ1DDeUWO
 9vIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MmbO6L2nrozePvsgih2HqlgWScp2P1rfqPD2ntkf9bs=;
 b=JjECEuFzAq1UydiptLa6Bma29VlM3CfnT2FeOoWiibATv/9YukEwEpiT0Y6cxV8LRy
 zpSz2jxrL/RGuhtzCI3rCLlw+Ncw4OOn1SrSZ/5BeT3poMfWUMNz0G/eR2EBYni7QA84
 4w03xTNCjwNI6TRqwV4HTNiEJxaOqP2nyHpij+lGS3hIfNOwYpjKU9W+702xoa390btD
 8DE09ZmwqCpvyGOFWy6t7CjeUbcZW6oj2LhZKwbMJzvhaL/+aQ+maluVeDIcKE06PEBw
 QqYCtnZ/t2uSYRvDn0aSkJwsdJq2DvdOpPPeA+KotpVBjoT6j1cYjRA19iriQa47qXKt
 U0xQ==
X-Gm-Message-State: ANoB5pmgGd6A5PYS8+vjxiuw6Qz5Ew5SNxwviPxaV1m43Aff1X8GRoyB
 W13pjPpyO0xM2MH6Gz8cm0yhb7csWlsGRYsgPTiDMA==
X-Google-Smtp-Source: AA0mqf6TQmO9XMCPMNxZSF4eu9QTAnYSCFOdDM6Ux4Aui3Av9uRuS9Onqu9i36YN5Di2PQfBsyNI0Ax+yuBI+BmiBxo=
X-Received: by 2002:a17:902:f292:b0:189:91b8:bf92 with SMTP id
 k18-20020a170902f29200b0018991b8bf92mr47954994plc.19.1670586251180; Fri, 09
 Dec 2022 03:44:11 -0800 (PST)
MIME-Version: 1.0
References: <20221209110631.59031-1-philmd@linaro.org>
 <20221209110631.59031-2-philmd@linaro.org>
In-Reply-To: <20221209110631.59031-2-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 9 Dec 2022 11:43:59 +0000
Message-ID: <CAFEAcA-ScTH2=2ayQTKy6+_fgj-3kAmQ2Oqxr4bPieimLBKCXw@mail.gmail.com>
Subject: Re: [PATCH-for-8.0 v3 1/2] physmem: Remove unused
 "exec/translate-all.h"
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>, 
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 9 Dec 2022 at 11:07, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  softmmu/physmem.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> index 1b606a3002..d562c0bb93 100644
> --- a/softmmu/physmem.c
> +++ b/softmmu/physmem.c
> @@ -58,7 +58,6 @@
>
>  #include "qemu/rcu_queue.h"
>  #include "qemu/main-loop.h"
> -#include "exec/translate-all.h"
>  #include "sysemu/replay.h"
>
>  #include "exec/memory-internal.h"
> --

physmem.c has a call to tb_check_watchpoint(), which is declared
in translate-all.h -- where does it get the prototype from if
the header isn't included any more ?

thanks
-- PMM

