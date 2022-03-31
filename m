Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9CE84ED5E5
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 10:39:43 +0200 (CEST)
Received: from localhost ([::1]:56722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZqLG-0007Q8-Vx
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 04:39:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nZq8E-00025U-3Y
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 04:26:15 -0400
Received: from [2607:f8b0:4864:20::b32] (port=43628
 helo=mail-yb1-xb32.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nZq8C-0004aN-EJ
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 04:26:13 -0400
Received: by mail-yb1-xb32.google.com with SMTP id v35so41029238ybi.10
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 01:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Sb5IDYbVtXFqhdEXxjvsc/0Dr+RVcGGxEXq9wIg37Y8=;
 b=cGRSZ6NjYkNFHNJHThRdnQb6p5TeUpHV1ne+lPQT8A66ER+waP2V/hjJphqu0/h1kY
 re4DeTTAg9d4jAVaDSDevjKVC7pZpCh1hEh9NfyCafGKjn+qhvIoaUUHsDSiwXujCdRG
 u1pV3/kvn9M5+e3LuwKmEWoC//giGoPuW/1RLZL7QCja8OBV8LiHtuvCMZIso455ye/C
 zcALAufCqVdu2vDDzmSwV8ysUlfOJtJ2MmC5TEztuLydoeFkrwnoACvLdGQG4jXKpyM7
 yCV4iVzPk+DxSZ2UyyJCAorEZV7JgpmonCwluBMlWNJxl3zWfJax+phmN5vKkqutYZT/
 zroA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Sb5IDYbVtXFqhdEXxjvsc/0Dr+RVcGGxEXq9wIg37Y8=;
 b=jmjyo2q2IWkdIvsKr2SMnn2eGWwDSN1cMZ+B4flh4Lc/3mdmUl7Vai00AWmD9EWgrs
 4f5J1jAi0FFATaKh+cK32mnNZakWHAu5wq3M6oGKfl0OzfQJA7avlypkUvE2nc3jQ0YD
 S5lMZcnKwFXM/QbGYivo19Wt2iHLykvEPOSYW2b1dZqRN4HImS9YJ/Iahq4/vjMEb+kk
 KQiWF3wKuEQ4BeHVwNqksbZX5vnT1wkF3d+ZEWFIZHIq9dq1VV7w/IcdFsADLBWFym8T
 /wqNwTF7ralm7TpsiIe1wHCqnJmi4DPTm6Lnptidl0KkLd6mvq3tpZjXOmRLZwRx0RiU
 M5uA==
X-Gm-Message-State: AOAM5334jZuu07y64n7xG1AbmtYGLWcXOS/Qyba9PW7atg0EoCsgpas1
 GkBUJy5GbwQJef7zIWjB6VUvARMIVvgoCAxtFUH38w==
X-Google-Smtp-Source: ABdhPJxlibKNsL5q1R4lFJqzhlg9plYIXRop39B86l4OKFipw5u03zjqlKH4GWVUIE4UFf/Ba/NOWctTQqVoEtKM8A0=
X-Received: by 2002:a25:cdc8:0:b0:633:8aa6:6a3 with SMTP id
 d191-20020a25cdc8000000b006338aa606a3mr3289894ybf.288.1648715171339; Thu, 31
 Mar 2022 01:26:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220328173107.311267-1-idan.horowitz@gmail.com>
 <a2e29af5-705a-19b0-b7ad-0126f8d441b0@linaro.org>
In-Reply-To: <a2e29af5-705a-19b0-b7ad-0126f8d441b0@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 31 Mar 2022 09:26:00 +0100
Message-ID: <CAFEAcA9kTNFeAOUz3BFp+ti=AtZRAk2jQTOjDzLnLANPtM4MdA@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Fix MTE access checks for disabled SEL2
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b32
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
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
Cc: qemu-arm@nongnu.org, Idan Horowitz <idan.horowitz@gmail.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 28 Mar 2022 at 19:04, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 3/28/22 11:31, Idan Horowitz wrote:
> > While not mentioned anywhere in the actual specification text, the
> > HCR_EL2.ATA bit is treated as '1' when EL2 is disabled at the current
> > security state. This can be observed in the psuedo-code implementation
> > of AArch64.AllocationTagAccessIsEnabled().
> >
> > Signed-off-by: Idan Horowitz <idan.horowitz@gmail.com>
> > ---
> >   target/arm/helper.c    | 2 +-
> >   target/arm/internals.h | 2 +-
> >   2 files changed, 2 insertions(+), 2 deletions(-)
>
> I was immediately thinking, didn't I just fix this?
> But I was patching pauth.  Anyway, good catch.
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>



Applied to target-arm.next, thanks.

-- PMM

