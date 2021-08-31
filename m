Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC333FCC43
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 19:23:52 +0200 (CEST)
Received: from localhost ([::1]:57996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL7U7-0008Q4-RV
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 13:23:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1mL6zL-0001cX-So; Tue, 31 Aug 2021 12:51:55 -0400
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30]:46692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1mL6zJ-0006T9-Uw; Tue, 31 Aug 2021 12:51:55 -0400
Received: by mail-qv1-xf30.google.com with SMTP id s16so8913026qvt.13;
 Tue, 31 Aug 2021 09:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=Gud03fxViqIZDkPvyjcAyx7KO9qpixAnmxMKpEVRBtI=;
 b=JF8fcNYCIO5sVXFcBqFu2p5JTGiN2nFGd6aVIqFVurpEf5j4MsKycZI4EOcfczwbzy
 O6A5Gq0NU0sfSFPejhvORPGWBBXQm0iUswMZ+wvZspTv7klF/+jZxPuUjH1HlBu82F8A
 SKqcUsvedjK23XouotPL/LoUI1SZlAxis5ITdlIBmccpSolqtuHlvdXoBuJKbWIdykiN
 v2ajVtjD65gKdrZNO43zCqlYzJuSge6rDuwvG8AMPlkqm9AtTQn/bv4xitLhOyUuS0DZ
 pVZUdtyfEsCEeqvoohSbCEouH7tsmLOv4uGo4Mitu5CED1HZsF6Z3d4+i1iy3WMlRGqE
 bBmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=Gud03fxViqIZDkPvyjcAyx7KO9qpixAnmxMKpEVRBtI=;
 b=AfU064SjKnATKQyfWU8moXB4iUeNCbvLmdNKjQVgmbZtvS2sMvYH7hfRzYYs9ePrkQ
 vn2xvJlKsOeBphq9VN6/c61K/bnOjtJrlQ2G7z+XnAjMHLWU2fire+BZ7fwAUhTQ1/u+
 qAc9Y05+PV1C/pisFbkEQomMeFRUYORX8xPQc0VzOAi/7+NY/LWp3qPN3uku42IFL4bG
 Bkr8aE+7EYeQQrS50RUJrZSQuRW7FNsixyly1CGcJMBtWHuVfEONcox94LyStVZ/oSP3
 +lq/MnAT1x+NnAz8kCJZuROUrMORoVCGsaaVmLgpIa+ZLKB2k845hjSGQW5WU7KKOwu/
 0/Uw==
X-Gm-Message-State: AOAM531KMW6opQ2Kd4PUqnpyxXUJCdMxD1sqpjPIsJhkRBKHWR/KKF0z
 IF1V/gY5IdRTHxlvH3e5Grk=
X-Google-Smtp-Source: ABdhPJzwzmzMS3PDtZSJalFFDGqtIjl6CcK6iLztUY7XcMFhlg/+kbGuqmE3dnnGvO8W5jnJyOZOIA==
X-Received: by 2002:a0c:8441:: with SMTP id l59mr3083051qva.32.1630428711694; 
 Tue, 31 Aug 2021 09:51:51 -0700 (PDT)
Received: from [192.168.0.5] (d149-67-175-105.try.wideopenwest.com.
 [67.149.105.175])
 by smtp.gmail.com with ESMTPSA id w6sm14212402qkf.95.2021.08.31.09.51.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 31 Aug 2021 09:51:51 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: [PATCH] Report any problems with loading the VGA driver for PPC
 Macintosh targets
From: Programmingkid <programmingkidx@gmail.com>
In-Reply-To: <CAFEAcA8nYJLUANnuWhefPxRjc1Fw34mi-+ovOYVQ-kiWTAAYXw@mail.gmail.com>
Date: Tue, 31 Aug 2021 12:51:50 -0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <46EF1D80-68C8-4AF1-9850-23855C35FDA7@gmail.com>
References: <20210827181429.23609-1-programmingkidx@gmail.com>
 <2d87adfb-c612-8d36-4c97-50f07a82beeb@ilande.co.uk>
 <CAFEAcA_mb5zAaBiVjzo1QGGo-4Yt+j89iD9AUVKJP-pP1XCJmQ@mail.gmail.com>
 <8ED650E0-5874-4AE6-85E3-631E7B76D37A@gmail.com>
 <CAFEAcA96V6d-aAR65xiZQrB65aTfQEJfHq5x_ZSa3mpAoSUMQw@mail.gmail.com>
 <8C4A73A1-22A7-4EC9-B561-F8487D56E8A9@gmail.com>
 <CAFEAcA8nYJLUANnuWhefPxRjc1Fw34mi-+ovOYVQ-kiWTAAYXw@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f30;
 envelope-from=programmingkidx@gmail.com; helo=mail-qv1-xf30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, Howard Spoelstra <hsp.cat7@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Aug 31, 2021, at 11:57 AM, Peter Maydell <peter.maydell@linaro.org> =
wrote:
>=20
> On Tue, 31 Aug 2021 at 16:50, Programmingkid =
<programmingkidx@gmail.com> wrote:
>> Then I ran './configure --target-list=3Dppc-softmmu && make -j 9'.
>> The pc-bios folder in the build directory was still populated with
>> all the files (except for qemu_vga.ndrv). Anyone knows what exactly
>> populates the pc-bios folder in the build folder?
>=20
> As I said above, it is the configure script, which needs a fix
> to add qemu_vga.ndrv to the list of symlinks it creates.
>=20
> -- PMM

Thank you for the information. I created a new patch that should solve =
this problem.=

