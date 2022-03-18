Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 964144DD8E9
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 12:29:15 +0100 (CET)
Received: from localhost ([::1]:45142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVAnC-0004Ok-EQ
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 07:29:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nVAkl-0001yg-S9
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 07:26:43 -0400
Received: from [2607:f8b0:4864:20::b2f] (port=45911
 helo=mail-yb1-xb2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nVAkk-0006WE-CH
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 07:26:43 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id t33so7693558ybt.12
 for <qemu-devel@nongnu.org>; Fri, 18 Mar 2022 04:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Pz8grWRtAbALcm3iW3E8p7YFkMwFifU+vVfOrPmrLOw=;
 b=YfCugYRGEMUIYM5+zcef+l5sDwJXq5BVrFTSlubH4CFA//++kSW/PLDI7t3RiFLhuo
 rFMp2H21z9hEs13QAFFMHtQt6VNmXvtFm7XVhdKGvt+NBF5JrjQuXfJuzJnYaM6Zwsbj
 Sj+HQtwl9Ykgy6Ui0HqjCh5rmYLrI0zM77fwH2AGYT3ceF6T9QugvFr8jaC0VAEG/1DR
 0nJjn5NJ6/DewuLHWQiBr0oe6074S6k7m3dfu6hIAXPiUzE5VWIL1FItkC93mkpGUfIa
 W8xpiso+lRkabA85/9cc5pTJi4TWkTYPBfu126uTM7zzILL8jsoWSm6qGHctc61w/7GX
 LB6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Pz8grWRtAbALcm3iW3E8p7YFkMwFifU+vVfOrPmrLOw=;
 b=6ZvD4kpkU0U21iprvJL7+HJQP2DlooaNivL/2yfkYZrtZ5/TRs7PwVruFqA7OWMlL2
 9KQ4NyCA7xDXPTqkWez2Ga7kHqxI/b33J0IBh+SPEJns/KiqPjQ7zUoytJYZKWpSvVjV
 Zqcso2DbCqPhZMPgfwKgpK9WSp+oWvIMcmJIdWLOVO6pa6A3muDEatyzoSgqPHLHVHAg
 BVR1aOdN3/ppLcSVpmyng1LzPlqYVRr+JE+dtwSNKqraRCOP32ank7cdqep2GGtzKUJk
 XhpUQOcwm4ulYwFjE44LqgKeMLeIQ2v0JZjsLdTCF+rd1HUdNQIKdt2gzSwiMK4FxLHQ
 pC+Q==
X-Gm-Message-State: AOAM533k0JnbPFQY0DnMwYzgjE27Y3QkiEJEMVmzqzkyUo3e6akpS/45
 +EVbEFqn1cpFMIp28bnfQ67hNBdPdiDPsExjU9N1++pCwaQm1Q==
X-Google-Smtp-Source: ABdhPJy5HIG/JxLTvhwqqGmYaR00zB/egrVpeqlUCk9tBvh6iUUThqI/gBarSrK3f/d8fpcquHYNyCz3igD8tqZsB9o=
X-Received: by 2002:a5b:6c1:0:b0:633:b5c7:b9b7 with SMTP id
 r1-20020a5b06c1000000b00633b5c7b9b7mr4679473ybq.67.1647602801444; Fri, 18 Mar
 2022 04:26:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220316035227.3702-1-adeason@sinenomine.net>
 <20220316045519-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220316045519-mutt-send-email-mst@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Mar 2022 11:26:29 +0000
Message-ID: <CAFEAcA-FuPeKQUgwNxgom+jukG8yyRQGHO5jkc5QemQcEuG+pw@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Fixes for building on Solaris 11.4.42 CBE
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2f.google.com
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Andrew Deason <adeason@sinenomine.net>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 16 Mar 2022 at 08:55, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Tue, Mar 15, 2022 at 10:52:24PM -0500, Andrew Deason wrote:
> > With these minor fixes, I can build qemu on Solaris 11.4.42 CBE
> > (Oracle's new rolling release thing), using '--disable-rdma
> > --enable-modules --disable-dbus-display --target-list=x86_64-softmmu'.
> > I'm just interested in the guest agent right now, so that's all I've
> > tested (briefly), but the rest of the build wasn't hard to get working.
> > With this, the guest agent runs fine using isa-serial.
>
> Who's merging this? Me?

I'm putting together a pullreq this morning anyway, so I can
take it through target-arm.next.

thanks
-- PMM

