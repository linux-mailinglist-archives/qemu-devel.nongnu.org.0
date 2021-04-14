Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3BA735F421
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 14:44:42 +0200 (CEST)
Received: from localhost ([::1]:46254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWesr-00010F-V2
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 08:44:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWeMv-0000F5-4j
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 08:11:42 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:33640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWeMs-0002qe-Pz
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 08:11:40 -0400
Received: by mail-ed1-x536.google.com with SMTP id w18so23477385edc.0
 for <qemu-devel@nongnu.org>; Wed, 14 Apr 2021 05:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VebgMUWXBrjOWGctzO2hUTq6pSdafZ5TPyjgIR2dIBY=;
 b=bXsDGRcMYR8v9CiYg5jhn8l6qnZLeBpyj0PCgqb5w6dcyENoAkWmozMKg6L9gXDgjy
 w1RyviLAa9D4f+gikpSRx+Arr6PyzUA+Ha0lCFsvOwL1nr9h5fREVEGXKU2dEyIU3SkL
 IpVPFSNSP2i++xRIREb9Hx88IVwHRJdM5T9NweC6teim/FWMu+4wTd8Wbhr4nd4sBnbl
 wyWkV31B5Ha0RNioipVEpiSFaCiIs+M7hyGLz58pQ+5iAfe0pI1O7dH4IO/lOMSpT7Ef
 xXGdizFpFhAqT3wc7hOWWNxrYpH20/IQlFo9GxJ4C0w47H7Zfjz/SOAHoUbic7r34pas
 oJ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VebgMUWXBrjOWGctzO2hUTq6pSdafZ5TPyjgIR2dIBY=;
 b=RHLEprYJS+YsqfSB+I8U+IANCN8NGAT1tacsqgjaT5QtYM5A62FTg3jdxz2utl3o6B
 DbKHkIqh40EQzOjnEcqK/pOoSj/iQV0qvPOKedaI9As/5dzoD6qWr0QClRSRDektOM0O
 DOpCB7GW5Y0wylSndyD1oSeLyzt0dTFwtGZS8mVvxYd05Y0CpdI2JdXuH291u46DbAKl
 KbGS/ZPtqhHy0ci+UGWO1g5QqirKL0zECybc26MF4f2DkxQzM/Pz8smCrn6csSNyqLig
 o2wLJgEKYDBWFVsT1UZuWmbeF43u7TxeRaipUSbRZqoS4CiQMXryAF42VWqssGq12pKL
 Mj9Q==
X-Gm-Message-State: AOAM5326tu+2WjUxOUKvebSzLmCSBbBMbCbrErEyJJC40XbtIrnUhoAT
 DXPqUsojbEzYW0qs3DjzIBCF1OBDOjZq572V/GHeqQ==
X-Google-Smtp-Source: ABdhPJwZHUfDoZxTt4x9/TfRwVP1kgq3Se9zMW6JVchPywMK185Pa30sGVV1b60vh8cLjstTsAD+4IhYooJ7BZqzVDg=
X-Received: by 2002:a05:6402:c:: with SMTP id
 d12mr40196160edu.100.1618402296610; 
 Wed, 14 Apr 2021 05:11:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210413160850.240064-1-pbonzini@redhat.com>
 <CAFEAcA8V05A1CPzxQ-3H02MSXP-NP3L8eqXQxW0z5wJaOBQfiQ@mail.gmail.com>
In-Reply-To: <CAFEAcA8V05A1CPzxQ-3H02MSXP-NP3L8eqXQxW0z5wJaOBQfiQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 14 Apr 2021 13:10:50 +0100
Message-ID: <CAFEAcA9Zk6T2xjqem9pg_SikZHXzR7fsEp0m6rPpEa_kBtATQg@mail.gmail.com>
Subject: Re: [PULL v2 0/3] osdep.h + QOM changes for QEMU 6.0-rc3
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 13 Apr 2021 at 21:15, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Tue, 13 Apr 2021 at 17:18, Paolo Bonzini <pbonzini@redhat.com> wrote:
> >
> > The following changes since commit c1e90def01bdb8fcbdbebd9d1eaa8e4827ece620:
> >
> >   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20210412' into staging (2021-04-12 12:12:09 +0100)
> >
> > are available in the Git repository at:
> >
> >   https://gitlab.com/bonzini/qemu.git tags/for-upstream
> >
> > for you to fetch changes up to 1a0b186eaf3d1ce63dc7bf608d618b9ca62b6241:
> >
> >   qapi/qom.json: Do not use CONFIG_VIRTIO_CRYPTO in common code (2021-04-13 18:04:23 +0200)
> >
> > ----------------------------------------------------------------
> > * Fix C++ compilation of qemu/osdep.h.
> > * Fix -object cryptodev-vhost-user
> >
> > ----------------------------------------------------------------
> > Paolo Bonzini (2):
> >       osdep: include glib-compat.h before other QEMU headers
> >       osdep: protect qemu/osdep.h with extern "C"
> >
> > Thomas Huth (1):
> >       qapi/qom.json: Do not use CONFIG_VIRTIO_CRYPTO in common code
>
> This still seems to have the same version of patch 2 that I gave
> review comments on, and which you haven't replied to ?

Ping? I'd like to tag rc3 today... I guess we could just leave out
the extern C related changes, as they're not a regression since 5.2.

thanks
-- PMM

