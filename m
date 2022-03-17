Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD65C4DCAEB
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 17:12:54 +0100 (CET)
Received: from localhost ([::1]:48766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUsk9-0002VI-Sx
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 12:12:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUseF-0004IZ-V3
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 12:06:48 -0400
Received: from [2607:f8b0:4864:20::112b] (port=42898
 helo=mail-yw1-x112b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUseE-0000mv-CC
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 12:06:47 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-2dbd97f9bfcso63312027b3.9
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 09:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=L6BTwTKCDC1d8syBy6JWe1ah7pqJr/DCUk97D8ZHfLA=;
 b=Id6+dwSAi4e8hLagW35MiWQ2MIGvXSQdMubLNDP/10HQq+/SCKiNMTsHnGYuL3C1Tk
 Z9DAIImITSxvQ/IqCXwGymUCFpgHns3mAgXIigXbZv/HFjsSdQHG6RoyoTj9m1RUQ4A6
 d6HlkVvp5GnLkMNRGoUhaQmD7ESRvteE+i4gEMyC8DJ7X0IzTROooO0jpt4ACIA/r0A2
 JG/d/5COQ+IsTKVSBnowIullNA7RSQ8O6zsqRYy7O5eY7f7faIEVGnWXuwuZNJPpz4OT
 dKiW1+O7SX/KbBJCGoor/mi2H6WpG/4AUt6ZrVMOt8PebQ1USH505TK1PkTP6sRsMmhO
 Oplg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L6BTwTKCDC1d8syBy6JWe1ah7pqJr/DCUk97D8ZHfLA=;
 b=NZh2AH4M5WQIw0ZNDRCB6BV+fE/WUzM1ZrtTNrYPI3MHDmMytjosqr4Hv0DnRkKJ7G
 mCISU9cBoIJBG8tnRCGsuq2FTyrb5SMSDvtE3HS9bT1vMUHsYkgx9EsmphFpZiiP63zG
 J1Kl9lDEQwcP1yV5S/6HkESIzqoEd9uDUB4zfd3HGBw66D+je5lDgyTjw2Lz1cboQ81x
 l6n1kqb219z47AyzMEutEpbYOF4LuobBZmC7aQxNs7jdkmihLAVCsDfFnNUl3i4GINJV
 cjWqYMQ9r9o8RD/rvTeC4CBECnQymaw1M2x2Cl3ePEUU/UqhUbudB2uzr0ujXrhtRCC3
 6A3g==
X-Gm-Message-State: AOAM533k637k07pDyZcKasEPDjJ/JSGfWCgq1a+gLT/0x78zwHRHnNhb
 B/bghy5XhbqEpytlJMvkFzmBB1AppulAy5DMePKOUA==
X-Google-Smtp-Source: ABdhPJzKWtSi+NKxlom0L+uFOUhi2Ypp24zhHw90qZkGE1OSHLeVd2bAvcxemYa9tuGeA4O5w+ugnrLvGuZBjIP+KlQ=
X-Received: by 2002:a0d:f603:0:b0:2d1:57e5:234 with SMTP id
 g3-20020a0df603000000b002d157e50234mr6574739ywf.469.1647533204018; Thu, 17
 Mar 2022 09:06:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220317050538.924111-1-richard.henderson@linaro.org>
 <20220317050538.924111-35-richard.henderson@linaro.org>
In-Reply-To: <20220317050538.924111-35-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Mar 2022 16:06:32 +0000
Message-ID: <CAFEAcA-ZZV99tEiybaJM0MNcogwn1FoxdqCUMmg2DtYn-euD4w@mail.gmail.com>
Subject: Re: [PATCH for-7.1 v6 34/51] target/nios2: Enable unaligned traps for
 system mode
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::112b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: marex@denx.de, amir.gonnen@neuroblade.ai, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 17 Mar 2022 at 05:35, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Unaligned traps are optional, but required with an mmu.
> Turn them on always, because the fallback behaviour is not
> documented (though presumably it discards low bits).

Mmm; the instruction descriptions just say "the operation
is undefined", so I guess we can do whatever we like :-)

> Enable alignment checks in the config file.
> Unwind the guest pc properly from do_unaligned_access.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/nios2/helper.c             | 4 ++--
>  configs/targets/nios2-softmmu.mak | 1 +
>  2 files changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

