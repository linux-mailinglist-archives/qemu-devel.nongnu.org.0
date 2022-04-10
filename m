Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A674FAD05
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Apr 2022 11:08:38 +0200 (CEST)
Received: from localhost ([::1]:52360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndTYj-0008AY-1i
	for lists+qemu-devel@lfdr.de; Sun, 10 Apr 2022 05:08:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndTWw-0007Qn-Dm
 for qemu-devel@nongnu.org; Sun, 10 Apr 2022 05:06:46 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f]:44216)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndTWu-0003Ua-DU
 for qemu-devel@nongnu.org; Sun, 10 Apr 2022 05:06:45 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-2eafabbc80aso135941727b3.11
 for <qemu-devel@nongnu.org>; Sun, 10 Apr 2022 02:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iBQ4wXbSKXeTJIh2WDuAbBMdwawoFtiy0l8EDVZPWAY=;
 b=ooHTQCoIy1OVF2n59pNpr9uLx0jReQcvat9B3p+phHoKLDhh17mwvZuD6D+nfmJqjB
 97jME4rqFAAcE4GhUkRhs5O9tWGlz98VQhdMydDb6jATvFiy/GQrvLmyy8s/KIfs0Hi9
 wvXSL9lJKsog5g3KRp5JVCokV7ielG4Rkukkwchkr7AbeYkdSg8s5Uh791/zeeTUC7wD
 3YhOugcSNMBYYpca3WU5BdE7cdecZ30YMQOm1e30Ajk7NqPbiylEJ/SJYyuE2axdvgRO
 EpvYP67Zh6CkWlYos/gP4ZWAToegO/ip7pilSi2DapYNCVFUm0KKtSM7VS7hzSLnVGtV
 TTVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iBQ4wXbSKXeTJIh2WDuAbBMdwawoFtiy0l8EDVZPWAY=;
 b=7gkq3tuYlayc3Gr4JMlyMjidJZ9VmJT2nbEz8NE9ddWUyJStISz8j7WV5lWSg2PYwR
 cA9wrd/Km/6Md1N0Pvppi2HmNEGY9ruhiYdW2kvnpdEqTf9S0ptUNXUL2gDoDR5ktrBE
 gdvEn4OgXF7FIoWNxrDPAwRb9KKD2JTwBpf/gX0/vEXENzGmr5CAyCE1KAroMYyCT6Bt
 HTSBc868txC2IasDPDaOi8IXZDlEHOyEidNgjjkJOJbRZdyB+dAxuGbymdGAbVRJWXmL
 7O3x6Khk8pePa6LDZfUj3C/jzDBalP3wMnmT9uc5r7Ru1tmctGuSbo2bdJiZd24QnVeG
 JdBQ==
X-Gm-Message-State: AOAM532DcnB/vidCtuph2n/w+NOAkdg2JzcsED3+m5ne0q6E9S4rc72O
 am+59DUWdVk+YBXI4AxYl8s4hrI+aPwqYh8NjF66xQ==
X-Google-Smtp-Source: ABdhPJwcuSsjqc/rYCNsJZmdblFMs802G+gK/B9eIYwi7BO+bF5DwVSBNoGCPrk2yhlPJDC/iY6mfsyN/3b5dmp2udo=
X-Received: by 2002:a81:db05:0:b0:2ea:2b92:c317 with SMTP id
 u5-20020a81db05000000b002ea2b92c317mr22470376ywm.329.1649581603055; Sun, 10
 Apr 2022 02:06:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220408164749.534758-1-thuth@redhat.com>
 <72fe734a-8bf6-adc6-474a-47f2006c2f6d@comstyle.com>
In-Reply-To: <72fe734a-8bf6-adc6-474a-47f2006c2f6d@comstyle.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 10 Apr 2022 10:06:31 +0100
Message-ID: <CAFEAcA-NdeN8S0JXqfrpTiDoUmfZHBXUtdAuRAdDRooTpnYipA@mail.gmail.com>
Subject: Re: [RFC PATCH for-7.1] Remove the slirp submodule (and only compile
 with an external libslirp)
To: Brad Smith <brad@comstyle.com>
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
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Thomas Huth <thuth@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>,
 qemu-devel@nongnu.org,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 10 Apr 2022 at 05:51, Brad Smith <brad@comstyle.com> wrote:
>
> On 4/8/2022 12:47 PM, Thomas Huth wrote:
> > QEMU 7.1 won't support Ubuntu 18.04 anymore, so the last big important
> > distro that did not have a pre-packaged libslirp has been dismissed.
> > All other major distros seem to have a libslirp package in their
> > distribution already - according to repology.org:
> >
> >            Fedora 34: 4.4.0
> >    CentOS 8 (RHEL-8): 4.4.0
> >        Debian Buster: 4.3.1 (in buster-backports)
> >   OpenSUSE Leap 15.3: 4.3.1
> >     Ubuntu LTS 20.04: 4.1.0
> >        FreeBSD Ports: 4.6.1
> >        NetBSD pkgsrc: 4.3.1
> >             Homebrew: 4.6.1
> >          MSYS2 mingw: 4.6.1
> >
> > The only one that still seems to be missing a libslirp package is
> > OpenBSD - but I assume that they can add it to their ports system
> > quickly if required.

> I wish I had seen this earlier as our 7.1 release was just tagged.
>
> I have whipped up a port of 4.6.1 for OpenBSD as it was pretty simple. I
> will
> see about submitting it in a number of days when the tree opens.

How awkward would it be for an end-user who's on OpenBSD 7.1 to
build a QEMU that doesn't have libslirp? (That is, is it easy
and common for an end user to pull in a port of libslirp that only
came along in a later OpenBSD, or would they instead have to
manually compile libslirp themselves from the upstream sources?)

(I'm asking here because if it's painful, then we should perhaps
defer dropping our submodule copy of libslirp a little longer.)

thanks
-- PMM

