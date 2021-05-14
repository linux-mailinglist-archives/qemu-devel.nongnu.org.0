Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B0F38022F
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 04:51:25 +0200 (CEST)
Received: from localhost ([::1]:33160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhNvA-0005jd-55
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 22:51:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lhNuC-0004Lg-Kn; Thu, 13 May 2021 22:50:24 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:37586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lhNuB-0002DJ-5b; Thu, 13 May 2021 22:50:24 -0400
Received: by mail-yb1-xb33.google.com with SMTP id i204so5098624yba.4;
 Thu, 13 May 2021 19:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=L/XgicGbTWEY83ohFTyY93J7o3pS1NFEGoYp0HhF5Zs=;
 b=HRAnPQxMMAkudu9BkQ6j6yY4fdNsPe2vhRUg9geo2TY5bCCMj8ugFgnZhNy2Qug4uB
 zCoufZIL/WOix+y5saq1dsQ13SvRVi1IV4Z6VD55YP4Nz74fOLZXzvlIAR2hSpO7p5zA
 CJd78G/lPOqwFinry0RP7nfRqC74POj/SRfv1xFgVb3xF0zg2oHbPVe3cON77A+L+y8m
 G1Sv1h/MtDa0C9kNvYczB0weqIY2SskPcTArf3IXyAd29vP7RMcZmukhmSFZFBd8RhSS
 81TEjThdUvT6wk23Ef+RV+ZVEkIH4fWD2e3bsMU3lzd2kzDOA8TkQ4Y6liLfSBb/hUxC
 xxCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=L/XgicGbTWEY83ohFTyY93J7o3pS1NFEGoYp0HhF5Zs=;
 b=U7mDIHFrjtvXne5AEtoZbXXJ9o+jIlFdI91smfrS7sA2PswYKLJn021R6mrHNlm7YZ
 UmZw2yegXldiD2oGeJCK1MndowbXBSg443cHnbuacjsatzZ+upBZ/ByeTtY4rf6tJ2bR
 w6T5EocUOS85bSzOLJ2muxBs5Plpo1LeFpMlg2cK+UYk2oSxNDXPa9T1+gOpuHVHsRtL
 UuIiZi9oURB9X1M4nSz0BVue0nEwRj20qaZo2XbsZlt56CtcT6NodVrex/BaSEVSoGhJ
 Bad45nbMrjIyJlXe8+QcZjDxpsScQqBNUIToeWRid2RUAY1FKxkLcYMomDXSPTvfgBHg
 5Hmg==
X-Gm-Message-State: AOAM533yQdr7icqvXbJQ9e5PnBybi2HisEHwDqR/3H/0y8q/21p6tZxy
 hwNhLkMltJEW937DlCC4e3ouY5FNobn8op0wnNk=
X-Google-Smtp-Source: ABdhPJxG0Wh90Chf+NHL0T7XHoaMknBi15QyGMG9boFgqguJf5czdXqfgbjEMLDptk2FP5+Znnag4tKJUoN7Lw7nwrs=
X-Received: by 2002:a25:bd4e:: with SMTP id p14mr9630560ybm.306.1620960622097; 
 Thu, 13 May 2021 19:50:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210513163858.3928976-1-philmd@redhat.com>
 <20210513163858.3928976-9-philmd@redhat.com>
In-Reply-To: <20210513163858.3928976-9-philmd@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 14 May 2021 10:50:10 +0800
Message-ID: <CAEUhbmUsLALB8FJy+pyMU=7Fx4ZR5+63_oJEYzVmt3e4jqqpmA@mail.gmail.com>
Subject: Re: [PATCH 08/10] hw/ppc/Kconfig: Add missing dependency E500 ->
 DS1338 RTC
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Greg Kurz <groug@kaod.org>, Amit Singh Tomar <amit.tomar@freescale.com>,
 "open list:PowerPC TCG CPUs" <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Randrianasulu <randrianasulu@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, May 14, 2021 at 1:02 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Commit 7abb479c7ab ("PPC: E500: Add FSL I2C controller and integrate
> RTC with it") added a global dependency on the DS1338 model, instead
> of a machine one (via Kconfig). This gives trouble when building
> standalone machines not exposing I2C bus:
>
>   The following clauses were found for DS1338
>
>       CONFIG_DS1338=3Dy
>       config DS1338 depends on I2C
>
> Fix by selecting the DS1338 symbol in the single machine requiring
> it, the E500.
>
> Fixes: 7abb479c7ab ("PPC: E500: Add FSL I2C controller and integrate RTC =
with it")
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> Cc: Amit Singh Tomar <amit.tomar@freescale.com>
> Cc: Andrew Randrianasulu <randrianasulu@gmail.com>
> ---
>  default-configs/devices/ppc-softmmu.mak | 1 -
>  hw/ppc/Kconfig                          | 1 +
>  2 files changed, 1 insertion(+), 1 deletion(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

