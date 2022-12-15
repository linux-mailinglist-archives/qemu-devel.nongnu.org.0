Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B9E64D98A
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 11:28:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5lS7-0001r5-9j; Thu, 15 Dec 2022 05:26:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p5lS5-0001qq-BP
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 05:26:57 -0500
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p5lS3-0004fD-KM
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 05:26:56 -0500
Received: by mail-pg1-x535.google.com with SMTP id w37so3869904pga.5
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 02:26:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BfooZezVi8B/JDuI4fYjXYAmrirKC5x6+V8pQbbFvFU=;
 b=j6bx+YXDDDhPJi7WwGGx9P+W9ad+mL/vSYqoMFpMJJo0rJf9ji2wlL4nCEwhisVnMp
 L09Us9phe1LGEQqswkfCDHqX6sOYshlyKkf7Bi8TFxIqWEJ2gd2scOX3bWEBr7+KP+Vf
 dTje4lgre0Zrf6ay/WA+4lxvZIbQvUZ9z2fJCpsogWuq+Y3I5F9Fxxi0IjnKzqMZEabA
 Ra6oxEaQMnkSilG8YojAse92MT7do9PaWLR2P2I4QO0xvj9jx0ofuVKxxwd9DXP3EF3H
 KXbG62VX1/IknB6kxZPU0D7I6QFEANDVuxt28yq5gNI2DP6GRuZmnOeez5aPJpPR+nak
 o8eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BfooZezVi8B/JDuI4fYjXYAmrirKC5x6+V8pQbbFvFU=;
 b=RCn5w+FLQ8w9hf+Sv7tk8V3g57DpxcHIm7nQfdm6yvgYGcayqudbFFZjYkWmR5mp+0
 hQo3hjXEpoA8psiiMqaDY4HQGgbzujerIcwJHS6YLjwYF1tw6rHt1g5pND0pHpzDqI1m
 xpSaPf4yZUyrxe6Yv1/0hXV19BrMXg1/yWEliPJfGxuOSjoRoFUsvpvxqGff1+t2Kjht
 /Tm7pPr3KO5X/bjY0r3N2F5LeckVK8VFEGp0BdUQitZw0Jg84a9DIbKICUUZecnCRihE
 y2DFW2kyPe1x9LQUaokAr66o/rG09zrka21kFC2JAkn9liP66V8v8XVUQVWzgJPaRsPM
 bfrw==
X-Gm-Message-State: ANoB5pmg0Lft42Ah9n5aDfg2KydlvfgSnk1NB9XTnMCNWcV2fCKL3MGt
 SCZxi1T1Yl1a/Gr77LtzYR9h2kNMdHwTkS8dMnCP6g==
X-Google-Smtp-Source: AA0mqf6s6A3d808jomnu5XzYWd2mXu3wVblN8v39ScYtG/v6VFdmRC0eqOlkCjeyshbTg2+2yzamCGBWTmn+mM4LHO4=
X-Received: by 2002:a62:b501:0:b0:573:1959:c356 with SMTP id
 y1-20020a62b501000000b005731959c356mr79944408pfe.51.1671100013828; Thu, 15
 Dec 2022 02:26:53 -0800 (PST)
MIME-Version: 1.0
References: <DM6PR11MB4090F9D06DC171C4B9C7D97587E09@DM6PR11MB4090.namprd11.prod.outlook.com>
 <073f7d3e-c7cc-084d-2848-c8a9490e6c69@redhat.com>
 <DM6PR11MB40908AA444148E892A0F8B0D87E19@DM6PR11MB4090.namprd11.prod.outlook.com>
In-Reply-To: <DM6PR11MB40908AA444148E892A0F8B0D87E19@DM6PR11MB4090.namprd11.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Dec 2022 10:26:42 +0000
Message-ID: <CAFEAcA-kdF64fzX8Qx4NHstqaTVpqufmiRmCio5V33Lv_xWBBA@mail.gmail.com>
Subject: Re: [PATCH] target/i386/hax: Add XCR0 support
To: "Wang, Wenchao" <wenchao.wang@intel.com>
Cc: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x535.google.com
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

On Thu, 15 Dec 2022 at 09:45, Wang, Wenchao <wenchao.wang@intel.com> wrote:
>
> Hi, Thomas,
>
> Thanks for your reply. I have attempted to follow you suggestions but it =
always failed on tagging a GPG-signed tag before submitting the pull reques=
t. I have used GPG 2.2.4 to generate a RSA4096 GPG secret key and pasted th=
e public key on GitHub successfully.
>
> $ git tag -s pull-request-hax -m 'target/i386/hax: Add XCR0 support'
> error: gpg failed to sign the data
> error: unable to sign the tag
>
> Meanwhile, could @Paolo Bonzini or @Stefan Hajnoczi help to pick the patc=
h up as there is only one-line change for HAX and we have verified it for a=
ll guest launching? Thanks a lot.

Yes, please. For a single trivial patch I strongly prefer
that some existing (in this case x86) maintainer takes it in
their pullreq, rather than my having to deal with a
pullreq submission from a new-to-the-process person.
(It's extra work to check submissions from new people,
which is fine if they're going to be doing them a lot
in future, but for a one-off it's a waste of their time
and mine.)

thanks
-- PMM

