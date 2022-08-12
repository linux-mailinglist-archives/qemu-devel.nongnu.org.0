Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 122B1590D34
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 10:10:31 +0200 (CEST)
Received: from localhost ([::1]:58758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMPkS-00038X-49
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 04:10:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMPiN-0001hF-R4
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 04:08:20 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:38742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMPiM-0001ZS-2w
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 04:08:19 -0400
Received: by mail-yb1-xb30.google.com with SMTP id i62so374694yba.5
 for <qemu-devel@nongnu.org>; Fri, 12 Aug 2022 01:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=hrmnSb9E6gDKLwn3HHU8d1H2Em9x1rqieGnJ7ajmTDw=;
 b=fB2Jwgnr+jK/VtvOWXTmgqGpcgjfa620Bz8RaAWNFaY2r18586WPIQUZg8eqQAntyL
 TWMovcEHjtzk8ATHKqVk0F3SyvgdL5bRwkBPi8d2Jok32IpzGBNtegKLDWQ4JCmjqKUi
 9XWbBW0UqwQZKD4z2jALPFOq7iKBUfWrw8uYa7JsWESJVhXqajgZ/h33XUIB0ER0tMPH
 lm5eB3KtIcE07g6pEOWysPTpp8G4LBqYvcLsc2U5ufkawmr+7daiEHFW5+Oe7Qk199I1
 EsMnh0MGl14vqZmRoi2GSPtohcKk+scYnpO05JRcUi4J4sWd6L9u5b08QmQs+5usQFag
 oEaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=hrmnSb9E6gDKLwn3HHU8d1H2Em9x1rqieGnJ7ajmTDw=;
 b=IMNdiPwgz+hszZJzu5/RC6vIfugWNH5Abdh7p4f2wY7rAjwf5ERGqZS4T47d0ONJ8N
 CtfO2131xUvTE8dZ1ctTKlU97JZKk5W56+iyEZP4m1dlHlLRAj4MX57iL37NRkbSwtwo
 Hj9qDpiu7hjsWQXKG3FUhyhyevCv8ctV867yP4zFKnHQSOfmS2ix6awMLwHE/WRSoeYf
 Qo+62T1VNAYpXHyrpuQUdD1bLJ6noAWrCxWCHgL7ezz1yGO5TQXOfJ1eWur4QiN6G2iF
 s+soFd67VWgZ9K/yPSwLDKfRYObKPPIAKOxUUAcn7+Jdvx/OyySujkK4GUGpOLzK4/NP
 O5ug==
X-Gm-Message-State: ACgBeo0aPRgUBcH0j7f8Yrm0FBbjC6ftp1TDeVVT17yWd38nv/n49LBY
 lgcB455aHCvID4K6mvGmDXRb5vvha+s0wDZ61WOg+w==
X-Google-Smtp-Source: AA6agR6HBFAY0NLJEWnVECe6Tzbj3r5Y5HTLx6T8+oBuEzYCyGBvtRApjE4h0g9nVRkMRfhaes7x3ueXkvchqABiOFU=
X-Received: by 2002:a25:9a06:0:b0:676:4585:3df7 with SMTP id
 x6-20020a259a06000000b0067645853df7mr2692984ybn.193.1660291695842; Fri, 12
 Aug 2022 01:08:15 -0700 (PDT)
MIME-Version: 1.0
References: <56c2f192-c897-85bf-9f1a-377eff8d575e@freepascal.org>
 <CAFEAcA-0wkYiDgs7DOpnMuwVw=z=H_440Yyrfaa9_V-YRyoU-w@mail.gmail.com>
 <dea1c082-54e7-de1a-0f0c-a7b8a1060a1b@freepascal.org>
In-Reply-To: <dea1c082-54e7-de1a-0f0c-a7b8a1060a1b@freepascal.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Aug 2022 09:07:34 +0100
Message-ID: <CAFEAcA_Kws=ZTyd=Yp7KV_HLowbojaWNmDihgnYx0Qhvo3Ga0Q@mail.gmail.com>
Subject: Re: [RFC] Testing 7.1.0-rc2, qemu-ppc does not give valid disassembly
To: Pierre Muller <pierre@freepascal.org>
Cc: qemu-devel@nongnu.org, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb30.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 11 Aug 2022 at 22:26, Pierre Muller <pierre@freepascal.org> wrote:
>    But as I use machines on which I am not admin,
> I needed to compile capstone locally, install it inside my home dir,
> and export PKG_CONFIG_PATH to allow the meson configuration
> to correctly detect this local installation...

Yes, like all of QEMU's many library dependencies, if you
aren't in a position to get them installed as system libraries
you'll need to sort them out locally as an individual user.
This, to the extent it's a pain, is a Linux distro problem,
not a QEMU problem.

>    However, this is not optimal, especially if I want to be able to
> copy over the resulting binaries to other test machines,
> on which the configuration completely fails,
> like gcc188 for which the current clib is too old according to
> the configure requirements.
>>    Is it really required to have glibc 2.56?

Do you mean glib or glibc ? The two are different...

> On several of these test machines, the version is much older...
> I tried to force acceptance by reducing the requirement,
> and it did compile successfully after that.
>
>    Is there a solid reason to be so restrictive?

We try not to arbitrarily bump the version requirements,
so usually when we do there is a reason. More generally,
you should check out the "supported build platforms"
information at
https://www.qemu.org/docs/master/about/build-platforms.html
For Linux distros, we support the most recent major version,
and we support the major version prior to that for 2 years
after it's been superseded. We don't bump things like
glib version requirements if this would break one of
our supported build platforms.

So if you're running into a version problem with the
system version of a library, this means that you're
trying to build on a host platform which is not in our
supported set, probably because it is simply too old.
You can always expect that that is going to be potentially
awkward and that you're going to have to carry local
workarounds or build newer versions of dependent libraries
locally. The fix is to upgrade the machine to a newer
version of the distro.

thanks
-- PMM

