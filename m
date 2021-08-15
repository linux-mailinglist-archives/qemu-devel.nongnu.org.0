Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C02A3ECA0B
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Aug 2021 17:46:42 +0200 (CEST)
Received: from localhost ([::1]:35150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFILQ-0006aI-LQ
	for lists+qemu-devel@lfdr.de; Sun, 15 Aug 2021 11:46:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mFIKG-0005pU-8R
 for qemu-devel@nongnu.org; Sun, 15 Aug 2021 11:45:28 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:41943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mFIKE-00008k-Mn
 for qemu-devel@nongnu.org; Sun, 15 Aug 2021 11:45:28 -0400
Received: by mail-ed1-x52e.google.com with SMTP id n12so22714989edx.8
 for <qemu-devel@nongnu.org>; Sun, 15 Aug 2021 08:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=VtgatS/4t6SwLMTmFRgyIUcrlaG59GJU1O831e6MlAI=;
 b=vDSRsZRPhLT9rfontu0et0JN+Br5cRnREqmLzO/irabae1zUzrEUQYpJE8vm12+Ze2
 70LomUl5Z0hoOiUVNXE9jEMiG7N0fTr3tjaT8ocj4STjCmz9kAFzUtIC8WyZGCWOrLqS
 eRIWnIhtkYrcwSF/ITQM8WqWmNUxGsgNtO5nE/Lo3FZGLj3Swgc9IRpjVPV7UMonu+SH
 dsVtVWf/PELmLldIScxF+d+zAwGwgMk1lZRp8j5JQRvgAKhKj3xCO144plX0BUFJzBBP
 iBMUfKb2MD3sfpiYbcmcHf6ZGjqDGIuaNBcaQ6eBCqxKBmwPp6NptuHcLdXobKmKriee
 DaEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VtgatS/4t6SwLMTmFRgyIUcrlaG59GJU1O831e6MlAI=;
 b=COJp2rv42/7TuTQulpnT9f3npl3ZLM1cexciYbidLrj3xXaJnhxio1GqfDhm00t79u
 2LfY1TGN+zQevA5Qo3YbWTrcoQ3nPqFHHYEFnVyoMFFSUr/yjp2ATsP/V/Cf9wwouinr
 Me1Z4fjl9W0xHPiMkXsB/R/kQqyBld5CnvoUNp7NfiOI1QEKCQdhuvgGezZYCd94eXzB
 q46sneIrCznT6Zre9+RW7a2qy6Nfq24PHihLDm6fX00tWnqXrWMfUiY+BaTc2XEL39if
 JEuGPwmmR9JsHSyFlg4mX/pY8As9Y1Ktx5iYz/Qo2s5JMw1l7SlEFvIEIxQbgXm6pMCM
 JUTA==
X-Gm-Message-State: AOAM532XfHtRsOmImzOBMBlRINeEPS9zyDm6qg+UcX+NrVFXSThzwR9R
 z0XGFAmM/+lvlF4DxQwRNIFaPnNDp2BQf8vi/j1qRg==
X-Google-Smtp-Source: ABdhPJySwtycZ0Op4TlNeEDyLytqu6fl/N/HRGnA7nhU+YBXw/dq7EMeLeaRA44iW/GVKtlAaHQrQFCi/j1gJioqO4Y=
X-Received: by 2002:a50:f615:: with SMTP id c21mr15247042edn.146.1629042324822; 
 Sun, 15 Aug 2021 08:45:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210813150506.7768-1-peter.maydell@linaro.org>
 <20210813183015.qlfqrshmplxseued@redhat.com>
 <613eaeab-337f-a5aa-91cb-029d38d694f3@redhat.com>
In-Reply-To: <613eaeab-337f-a5aa-91cb-029d38d694f3@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 15 Aug 2021 16:44:39 +0100
Message-ID: <CAFEAcA-NP6ksSbd4sjREJh9sd0z-uP5rUJOcVNOYL=+VwE49cw@mail.gmail.com>
Subject: Re: [PATCH for-6.2 0/4] Zero sockaddr_in when initializing it
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Jason Wang <jasowang@redhat.com>, Eric Blake <eblake@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Corey Minyard <minyard@acm.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 15 Aug 2021 at 15:34, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> On 8/13/21 8:30 PM, Eric Blake wrote:
> > FWIW, the POSIX wording is interesting - it requires portable
> > applications to zero out sockaddr_in6 (and even states that memset()
> > is not yet a portable way to do that on exotic hardware, although a
> > future version of POSIX may add a zero-bit constraint on
> > implementations; in practice we only use qemu on hardware where
> > memset() to zero properly sets pointers to NULL and floating points to
> > 0.0).
>
> So this checkpatch.pl error (inherited from Linux) is against POSIX?
>
> 2028 # check for static initialisers.
> 2029         if ($line =3D~ /\bstatic\s.*=3D\s*(0|NULL|false)\s*;/) {
> 2030             ERROR("do not initialise statics to 0 or NULL\n" .
> 2031                 $herecurr);
> 2032         }

That one is for statics, where the C spec says you get 0-init by
default and so there's no need to explicitly 0-init.

-- PMM

