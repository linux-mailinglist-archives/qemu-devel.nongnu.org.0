Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 345ED22EA66
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jul 2020 12:51:16 +0200 (CEST)
Received: from localhost ([::1]:44622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k00ix-0001YT-0v
	for lists+qemu-devel@lfdr.de; Mon, 27 Jul 2020 06:51:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k00i3-0000x0-79
 for qemu-devel@nongnu.org; Mon, 27 Jul 2020 06:50:19 -0400
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f]:38900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k00i1-00032I-9N
 for qemu-devel@nongnu.org; Mon, 27 Jul 2020 06:50:18 -0400
Received: by mail-ot1-x32f.google.com with SMTP id t18so11973092otq.5
 for <qemu-devel@nongnu.org>; Mon, 27 Jul 2020 03:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YBv29hQizCj49AMKcG4msyZ+fD8W8QhbKxl91NPOMuM=;
 b=DxsLzX2iLbSUSfjFN7V8fDLMyB/AgvjtPGzsKF203oHRQBYL1jYDaORM1uZB6M4huF
 F/Fo0z6dmyKA/2mT4YrbdgXSqE//eLcu+k9KmDkFOhqTA6w+yGEA09JBIPMsx5yr4/Le
 TN1bWFaBlgjPfqzWdH5NZtDl7S1avjjaNij729nIvEFxkel2FWpYEw4alM1qBVTpPton
 CprErcnpI3nUlaU1SClxDjqvyMiPOC36b2aKewLJ+ZaS1mZG5oWP2JKbqH/9dIrp91B/
 AuIIn9fg1g3U4une/or2Jj90ux0PlmL3QjJtXjoNZxPP9hUs2c28t3EqncLTirw77pNF
 c4VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YBv29hQizCj49AMKcG4msyZ+fD8W8QhbKxl91NPOMuM=;
 b=rO+LdduFLVbtXPZl6RGmCbr7PJOjIeeoUM7X/dfaARGgaKDADaZ+GAR/j+Hhp3noUR
 UpunRIj4/s5CIX6vRjhbl7h35TeKGvrz0NTgyfUUgjDA8hkXKLC+kElaSkcWMj+XfDKy
 rMvMhwp5l9CFBo2LOZBJNrlRHE5zRFIx31yeZ0LIoe1gmn1gLUTT4Xwvy2Aa9moTGBgJ
 Iq/5VlQSUH5RJWeGAI3pE3VVi2CHBxG4Kbsrw1bO5jMBNOxfPS2gpqjni8v6d6XabK5y
 m6r4cygdkss9bddsqUsh2QmXR8XBUteUlibFdXcRCU6EUPKtYqe7iW6RizQqRmcG72lx
 /R5g==
X-Gm-Message-State: AOAM530EWXwlx5XJ2ido1RtiIU73ekIkJ+uVrlJYWO/HoGxoV1xe7t/a
 pKDuvDr2iB+h8+E6s7I5Nc6nNtCGlsdWFCZfg1EHPg==
X-Google-Smtp-Source: ABdhPJylYsJrWX8jB73ygQVRTAt+oOLapN8ZSekDXJLgSnQrF+QD/Xyn0HBMGa56y/gxrOGb0LRGxMcOdMTkEm84C8Y=
X-Received: by 2002:a05:6830:10ce:: with SMTP id
 z14mr20353946oto.135.1595847015818; 
 Mon, 27 Jul 2020 03:50:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200727062814.179163-1-david@gibson.dropbear.id.au>
In-Reply-To: <20200727062814.179163-1-david@gibson.dropbear.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Jul 2020 11:50:04 +0100
Message-ID: <CAFEAcA9ZbGAn+5VP++9w04M3VopVEMuq8t6x9+-tH40-ocUJwA@mail.gmail.com>
Subject: Re: [PULL 0/1] ppc-for-5.1 queue 20200727
To: David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x32f.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Laurent Vivier <lvivier@redhat.com>, qemu-ppc <qemu-ppc@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 27 Jul 2020 at 07:28, David Gibson <david@gibson.dropbear.id.au> wrote:
>
> The following changes since commit 194f8ca825854abef3aceca1ed7eb5a53b08751f:
>
>   Merge remote-tracking branch 'remotes/rth/tags/pull-tcg-20200725' into staging (2020-07-26 17:17:58 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/dgibson/qemu.git tags/ppc-for-5.1-20200727
>
> for you to fetch changes up to aef92d87c59d257c0ff24ba1dc82506a03f1f522:
>
>   pseries: fix kvmppc_set_fwnmi() (2020-07-27 11:09:25 +1000)
>
> ----------------------------------------------------------------
> ppc patch queue 2020-07-27
>
> Only one patch in this batch, but it fixes a fairly important
> regression, so we want it in qemu-5.1
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.1
for any user-visible changes.

-- PMM

