Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91EB13D91C9
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 17:24:00 +0200 (CEST)
Received: from localhost ([::1]:48106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8lPb-0005dd-MM
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 11:23:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8lON-0004tK-7t
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 11:22:43 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:46048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8lOK-0003qr-0B
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 11:22:42 -0400
Received: by mail-ej1-x62b.google.com with SMTP id qk33so5156669ejc.12
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 08:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8c2Uykm90nmQEB/Po7x/hziHg1keKoxiywTcH+1DwM4=;
 b=coLK03D04oDX6RyH4WRBz1qurp6m7RVkNBtnwQWDWXpHB/ZoysaN4oykx3L1xt1XLG
 MVzLmS0Md27ymDQNKlJeSBo39f7rn4dSIUtd7ieSgF/6QcbETeLQbEFLspPYWyzYYOMl
 PZY83vDjAjIgT5PEjcVwpqvmWgw1GN7hU2PWs2pnrfQa1H58QJpbXYE3+K1BlrKzmbZG
 DnQm0OmmFa9uIwdobqIBl9zd1MKX+sqplmO5udZOYY4aIL5hIfgkaqt1e4c4/C22zqR7
 mrV5FTNEOpzsDbjt5BguMuU2wyVqofhnH5CnncbbMvIa+2rSH3b8lFHF5M1aIwaR3Xue
 78wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8c2Uykm90nmQEB/Po7x/hziHg1keKoxiywTcH+1DwM4=;
 b=rWF2GAD2Xk74zeLH2CXw1Rz31BTnysk6FH5QQ6lUffuuUNeMXEyYwmK/2CWkx+394U
 X8d7aSP2GMPO51j2lknBZrHABlFYWJLQkeIkwr3wykvBATT7eaqGPtcQEaS/loONzedk
 w6m1uhzTqtpuKchW3f7s9C2nCTxtgNa3QWKB+vf5rTORnk/pvvZk9/7NlFXLikRFGCVm
 UJBAzgH6INQV5c+nFbfbOmSr//v18ktmY3v7TQWxcMYB8eyaL84+LmB9hrrQpk/G6xaM
 iTSjvb8cU8uTjr7xssX1OYHM2cJb9mwQ3Q3NxXAMwV4PWa4h6pKleMoaqamQPHjJVZu2
 U1SA==
X-Gm-Message-State: AOAM530ekOSbeubNun+Ow/5wTpKRNAJnQ640WRncth+HATw7aDBUt5Kp
 dpso1Ghq4HLKTUZOano+S/WN+CgdMNcMMViiMCEBuA==
X-Google-Smtp-Source: ABdhPJxJascbtdXLA7zh6pSATKJElOtAhF5O30GyrEFDFx2/vrNB3yI8wQ9djsJV+O9G+ezNFOgjl5nhVMURrQfxgJY=
X-Received: by 2002:a17:907:364:: with SMTP id rs4mr62064ejb.56.1627485757736; 
 Wed, 28 Jul 2021 08:22:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210728105133.2557239-1-marcandre.lureau@redhat.com>
In-Reply-To: <20210728105133.2557239-1-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 28 Jul 2021 16:21:55 +0100
Message-ID: <CAFEAcA_L==a3+sp3smMCD1SBPkXQFavvJRzeK7Bd05Tf_DEZzw@mail.gmail.com>
Subject: Re: [PULL 0/1] Libslirp update
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
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
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 28 Jul 2021 at 11:51, <marcandre.lureau@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> The following changes since commit a2376507f615495b1d16685449ce0ea78c2caf=
9d:
>
>   Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream'=
 into staging (2021-07-24 11:04:57 +0100)
>
> are available in the Git repository at:
>
>   git@github.com:elmarco/qemu.git tags/libslirp-pull-request
>
> for you to fetch changes up to 565301284e83fd5f12024a4e7959895380491668:
>
>   Update libslirp to v4.6.1 (2021-07-28 13:11:11 +0400)
>
> ----------------------------------------------------------------
> Update libslirp
>
> Hi,
>
> Let's update libslirp to 4.6.1, with its various fixes.
>

Fails to build, OSX, when linking the qemu-system-* executables:

Undefined symbols for architecture x86_64:
  "_res_9_getservers", referenced from:
      _get_dns_addr_libresolv in libslirp.a(slirp_src_slirp.c.o)
  "_res_9_nclose", referenced from:
      _get_dns_addr_libresolv in libslirp.a(slirp_src_slirp.c.o)
  "_res_9_ninit", referenced from:
      _get_dns_addr_libresolv in libslirp.a(slirp_src_slirp.c.o)
ld: symbol(s) not found for architecture x86_64
clang: error: linker command failed with exit code 1 (use -v to see invocat=
ion)

-- PMM

