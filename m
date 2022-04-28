Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0F7512F97
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 11:45:47 +0200 (CEST)
Received: from localhost ([::1]:35726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk0iY-00082i-Hl
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 05:45:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk0ex-0005pa-I3
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 05:42:03 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f]:41765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk0ev-0007RP-U8
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 05:42:03 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-2ebf4b91212so46383257b3.8
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 02:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Pg5cCx0SRvdR0JuG3PVtMZz3oUZSOSf9ETYQ/iSvKX0=;
 b=MNdMhud53niq2rqvKA3gq/dpkHM8BVNGBc3bnuiL5RPaXr/od7FuuzRtn9agDgmUe2
 50dtOBlpaLowHIbjmjyWXcSRu3s2DgqhMGhNB2NmRKXzpER5OGzvsZKjYn4GXZqIz/Ke
 UWBXIYvbCRDEKFO0KFUd0M3OR7JIXIOJOyYEs6U2h4o5JphuWVMGrWRLHusnoSbc5UjD
 UZmZ2xi/Y0ZPNcTx9I+efM1+J04iz4cmt6uDYrPSswg2Bpm1wdCEgRodgzR/2iWFGJ/z
 WybKnJk/Wgtmhw0a05ctIWayB5Th0iSvZsVR57UREpVI0qakT0KpWVyv8xG2F4VPR1AN
 mNJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Pg5cCx0SRvdR0JuG3PVtMZz3oUZSOSf9ETYQ/iSvKX0=;
 b=EUSsIbXOYEIh1zOpoOTMNqeJx7tMcLk/i/KjZrReyhqENqTdw99uxpdIXiZ5/u4QU+
 7KaZGgI5be5AjSN2kb9Ph8ZriU7OyJquCYeLNUqcmEP2/wRRDFsAdt1XYKeWypJkZYxN
 mVrQZabOnYcRnjBxOWPUPnC3TLU4a4H7MkK5ovyMxW28EhqDStj1RTrQXphLIIS9RnQm
 bmvQTF57zD726ez9UhyHieRjCfkhdfhRCE7RXma7WbtYX4MdoKa/hAvq+kiguAPFsl02
 wE9nIohMn9+5Gr6T2+B7POZ/fLoDKQKUn2PYfhNZYO6VgzToTWIVtVsnFkJt0QW4JbsX
 JGeg==
X-Gm-Message-State: AOAM5324Jb8fepDFLxiozGeGO8zgaMoMheBffE2BiP2M7Kz8smsoktBr
 CtuD0S1nVB5bW+Kq6kaFdIfLgVEsgddWR2fbK01VkQ==
X-Google-Smtp-Source: ABdhPJxBD4cIZYgStpp2dcmBsaHYtrKRK9J3AIYL/4HgxdC9j4w8zULdLNHD7tNYm2a0FUYexsNY5epc1FS3CK9vYN4=
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr32343678ywb.257.1651138921068; Thu, 28
 Apr 2022 02:42:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220426163043.100432-1-richard.henderson@linaro.org>
 <20220426163043.100432-8-richard.henderson@linaro.org>
In-Reply-To: <20220426163043.100432-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 10:41:49 +0100
Message-ID: <CAFEAcA8NfEM8DOBcgbDo6epm398K4AeXFB2xojNCSUG3N3135g@mail.gmail.com>
Subject: Re: [PATCH 07/47] target/arm: Use tcg_constant in disas_exc
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 26 Apr 2022 at 17:32, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

