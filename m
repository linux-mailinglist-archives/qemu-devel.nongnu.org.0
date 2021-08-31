Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 871B43FCB1D
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 18:01:24 +0200 (CEST)
Received: from localhost ([::1]:32880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL6CG-0005Hz-Ld
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 12:01:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mL69u-0003js-Qm
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 11:58:46 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:43635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mL69q-0000jr-9K
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 11:58:46 -0400
Received: by mail-ed1-x533.google.com with SMTP id dm15so27552671edb.10
 for <qemu-devel@nongnu.org>; Tue, 31 Aug 2021 08:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5m3kgR2b3FR7C8wZt8LEALHTefBzjPFWCCRQjYhS27E=;
 b=enHpxMUkF6/0t3u7OsZ4hIBNj8hhyRr25gE01bCJ7OibOPI3VIjyc3Ns4WW6Sn9+nB
 3CDm+WOMp6mk3HN5lUSiwfbmuPPnGy4c05bn8MuE3fU0Jei9OdKPGGOUnMp+c1wXaCA/
 KrCspP9HoEnBthDNfTXNY5NKc2O3MD0RNXeg+CXsvCui7b3GqZCDs8g5W0idkJQ1cLCU
 FbHzJN/NH+iraMthk+jEoIGexSXYkG/D5JjnTCQ4BGrpBwZDRvj7HHLcGBDYZdt/bmXl
 RQve1unFXOBZT6wLmWE+1heGrodHKg0HHpNUbBoxGv5QC1nZAfpsOYvL1cEDONERpCRd
 6ezA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5m3kgR2b3FR7C8wZt8LEALHTefBzjPFWCCRQjYhS27E=;
 b=C3h70pJDisvy41pBgzBO1H57/4Ymt1kTu7kGDu8IoprvOM8Y/J0yEBTsshDSP6TxNh
 G5h/HYOig2EV4gEuXqW0p2ak1fwJ0z3vy93H+BodIdFF4PHlwXOoNpl6xhnjlZSqXvEh
 v9jdCDohWNiR1tQDrmDnKwJh7PtR0V5fiD6gIx21kK4G3jYcpRASQtLAP9vvpUSbix6d
 DSCTSKoRBHRlC/cAfWEc6IG/gBQhdgdhYZZIqZTQOP6ndB1ouu3PeHLM2vLoi1hYvA5a
 IOL2V+EpLfLPtF9xJJ5ZZNiwa6bISDDmAt9/oBIOns74zE5mKovr9FGSgDn0W1i6HPeE
 2h9w==
X-Gm-Message-State: AOAM532g9rBoLgnxjqK6DrrG28MQNAfzR6gKCi3TxUeb6+XOxxrpux8X
 SBuHeGAwE/qloE4m8UCz+eo8NOPLjnsnaERI0f+zgA==
X-Google-Smtp-Source: ABdhPJx6vshGASSTS32UnGlwoDOqZzzH1tDMse8oM6P1uq9zelX6McAwQyJdIVU8K52O8CTxXgBfp8e+MPnwKkqUkYE=
X-Received: by 2002:a50:ff03:: with SMTP id a3mr29897058edu.100.1630425519732; 
 Tue, 31 Aug 2021 08:58:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210827181429.23609-1-programmingkidx@gmail.com>
 <2d87adfb-c612-8d36-4c97-50f07a82beeb@ilande.co.uk>
 <CAFEAcA_mb5zAaBiVjzo1QGGo-4Yt+j89iD9AUVKJP-pP1XCJmQ@mail.gmail.com>
 <8ED650E0-5874-4AE6-85E3-631E7B76D37A@gmail.com>
 <CAFEAcA96V6d-aAR65xiZQrB65aTfQEJfHq5x_ZSa3mpAoSUMQw@mail.gmail.com>
 <8C4A73A1-22A7-4EC9-B561-F8487D56E8A9@gmail.com>
In-Reply-To: <8C4A73A1-22A7-4EC9-B561-F8487D56E8A9@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 31 Aug 2021 16:57:50 +0100
Message-ID: <CAFEAcA8nYJLUANnuWhefPxRjc1Fw34mi-+ovOYVQ-kiWTAAYXw@mail.gmail.com>
Subject: Re: [PATCH] Report any problems with loading the VGA driver for PPC
 Macintosh targets
To: Programmingkid <programmingkidx@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, Howard Spoelstra <hsp.cat7@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 31 Aug 2021 at 16:50, Programmingkid <programmingkidx@gmail.com> wrote:
> Then I ran './configure --target-list=ppc-softmmu && make -j 9'.
> The pc-bios folder in the build directory was still populated with
> all the files (except for qemu_vga.ndrv). Anyone knows what exactly
> populates the pc-bios folder in the build folder?

As I said above, it is the configure script, which needs a fix
to add qemu_vga.ndrv to the list of symlinks it creates.

-- PMM

