Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D4B41EA3E
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 11:59:17 +0200 (CEST)
Received: from localhost ([::1]:35282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWFJz-0005s5-LF
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 05:59:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mWFJ2-000513-81
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 05:58:16 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:42608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mWFJ0-0002Pb-Jz
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 05:58:15 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 q127-20020a1ca785000000b0030cb71ea4d1so6350883wme.1
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 02:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=sn4ccP7c1OAUgmea4jj/eh56sTMB6VgDhnFzyd7NVeU=;
 b=QYDrvDRYhekIZI9plwQBegxuQK4KJkgaIfxhJbQC98PCv4/6JiqtTD9eMkLqdLtvKO
 EeIyaFVNVzBH4DFXvjL1201gHCwSoCYEd6PuFYASmVEOXp6+HNqpYufGfTHa4exCVNWW
 Jvtmln5TO7YjWsla4+uGOYNU7FhuovBPkEbUIsPvZ8xG9FBAkK5PTBZahKuBrzPi1Hgz
 km9SpWkoZgEjX8KHMD///268o36fTpqBzHoVGDueIB9K0qjH3q8fxCfCxGxqMBjAimeB
 U4HtHDyk4hWAbiHn9oMSHyJRxvA1I+uK6VZ89jGoptT/h3xu3J9vlCqOYhRPTtTL5oPx
 OskQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=sn4ccP7c1OAUgmea4jj/eh56sTMB6VgDhnFzyd7NVeU=;
 b=FDXuMqyTiLWfoi7d8magXm3ruabYQYIInbLMXbdPgX1HjccsdG+KFsocHhgmjxZMMs
 RwOVPKWhXoyAnPOxLOrrsrgxS4ztt5Xk+lgXYufj2zTC1vpst431L4opBOHmUvMlt3bR
 kuJ6jMMOslo9KBGFRXYCbfIg5SCGHOQn8/Sd0Lsfya7p4m5vxM1H8KL8QJiq2Jx1rbnQ
 pdF5kye8Scq9ZSUy2jh9qJYZ1ncD3Q/WH3en3Uwp2fsaMtxmowG/8jpfP8EceMFKwXS/
 sGwdLo2nrBnl4EHpRPDILi1LasnjonKEsP4nWIXwEMgBAzMsh1bwpRHvLM6kAllf67Np
 mFhQ==
X-Gm-Message-State: AOAM533WD1An4iXkO07/tepUi9efwKPZ0ErPSqKOX7zGntbaXd6nMy52
 LL5KepdBY010tUz+RUMaF9IP4/pngNiEJQiqtjSpuA==
X-Google-Smtp-Source: ABdhPJwbNWWqxNwaUAjhAIgnj76jfsZ3+Cmj3xKqXzvSKwX/LYbyyKU8GipFmp3Ib/Yi0eQoDg0XJhPlr3/u7s1aBvA=
X-Received: by 2002:a05:600c:d6:: with SMTP id
 u22mr3464955wmm.133.1633082292406; 
 Fri, 01 Oct 2021 02:58:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210827120901.150276-1-thuth@redhat.com>
 <20210827120901.150276-4-thuth@redhat.com>
 <7004c933-5262-3119-80f5-722a8e858046@redhat.com>
 <YVbQERWD9fY0kxxW@redhat.com>
 <CAFEAcA8PdNEHU2YMGT56bCwezf9i+BGxijwevLJakrR_N1Yjhw@mail.gmail.com>
 <YVbYavVeV/OmYON6@redhat.com>
 <CAFEAcA-_6BYX-MZ6LL0c4xJcqyz_EbOWeBGbteMByvERFq4_Xg@mail.gmail.com>
In-Reply-To: <CAFEAcA-_6BYX-MZ6LL0c4xJcqyz_EbOWeBGbteMByvERFq4_Xg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Oct 2021 10:57:18 +0100
Message-ID: <CAFEAcA_efGE90RywrBjJXi+B=x7wHBCh_RtGaTxdVyWm=rYT6w@mail.gmail.com>
Subject: Re: [PATCH 3/3] dtc: Update to version 1.6.1
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Greg Kurz <groug@kaod.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 qemu-ppc <qemu-ppc@nongnu.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 1 Oct 2021 at 10:51, Peter Maydell <peter.maydell@linaro.org> wrote=
:
>
> On Fri, 1 Oct 2021 at 10:44, Daniel P. Berrang=C3=A9 <berrange@redhat.com=
> wrote:
> > On Fri, Oct 01, 2021 at 10:37:51AM +0100, Peter Maydell wrote:
> > > I agree in general, but (per the commit message here) our dtc
> > > submodule is currently pointing at some random not-a-release
> > > commit in upstream dtc. We should at least move forward to
> > > whatever the next released dtc after that is, before we say
> > > "no more dtc updates".
> >
> > Yep, if we want to fix it onto an official version tag, that's
> > OK, just not jumping right to very latest version. We might want
> > to move it backwards to better align with what we're targetting
> > in the support
>
> The reason for the last update to the dtc submodule was not
> for any specific external API requirement, but in order to
> get a change we needed to get it to build more cleanly when
> building it as a submodule (QEMU commit 67953a379e). To
> not regress that, we need upstream dtc commit 85e5d839847a.

...having said that, looking at meson.build it looks like it
now ignores dtc's own Makefile and hardcodes how to build
libfdt, including a list of the source files. This seems
pretty fragile to me, but perhaps it means we don't care
any more about whether dtc's Makefile has the commit
85e5d839847a fix...

-- PMM

