Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81763177E87
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Mar 2020 19:38:49 +0100 (CET)
Received: from localhost ([::1]:51808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j9CRM-0001GT-HP
	for lists+qemu-devel@lfdr.de; Tue, 03 Mar 2020 13:38:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49789)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j9CPQ-0007Uc-Rx
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 13:36:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j9CPP-0002EA-UE
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 13:36:48 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:36477)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j9CPP-0002DU-Ni
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 13:36:47 -0500
Received: by mail-ot1-x341.google.com with SMTP id j14so4048756otq.3
 for <qemu-devel@nongnu.org>; Tue, 03 Mar 2020 10:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=LR37zhoqYD5cdd2uefRK2acO4Z+Y6+upiLQRwqRbut0=;
 b=N8PQCp9CHXAkdLPwMSgWG4Q2eV7pm7qXVEsIebX4l0gtsm9YydBUj9KAmIdnYy6bSy
 hPk06zlu1kVm0vIwLBELYt2Y/PrfrgZDiBgHftBs/RP7LhcAVYoXcy6oiXIAlKgH+3iV
 /Ma8Dq2USaGf6oi02pCD6j1OgRWFphWINb9GVIOt+twrIBAxC/1y3j/o1Uzi2PlTs7a9
 NauFZEAPcfhNa4QB+sJm8xbcNzrQIK8v0uCwhXDZJFhdopq06gk6aODoZTvDH5iTSjvB
 NP7U6ONstMs/Hbqb3tpeX84VswLh3fN6ts0IaHbPTej+NIZpRltDVtSFAHYwCRiVtJ3V
 qxcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LR37zhoqYD5cdd2uefRK2acO4Z+Y6+upiLQRwqRbut0=;
 b=hY8WBFTDWFh7nQH6ti7fX3pIHSZBWy17+hfNP+y9EG+Ayl2GqxS0QivpOaRRGRmqkA
 kHvPjiXe+6sWRFvZxjIIfRVyxAGbmua8cUzz8r8zBytzqpgNnQ8cPrsVpcv6Pi5hMjuG
 BKrbnw+y80hsRXVVSxkI1G5w0rpU6heKOS2y9YABHFZseQueNSUiMRLG8ptKDhckGKGx
 /i7EUELVBNLiJ4ZfMqHOlcV+zYzcfRNbhCjrE1Px9zNAPufWwMmHKZbCTX3IYvItygi7
 4JPRaRKFkY6OA2XhvOLYVUUTPZz5Xkgb+qZGKB5A7IZP0W4jjGq071sCUInnuP5yGrp0
 i1Eg==
X-Gm-Message-State: ANhLgQ2YPTApWFn5fTW79NKmMWImHBNmQdtCfJgrtlW8J3SWb8b9oKwC
 NWiKbwJ8de+AqWRSHA9RtB1Y2OVEJ5QLjraEYkMS/Q==
X-Google-Smtp-Source: ADFU+vuOuUxYkdjrkVyH7kp/w9lz6OqYgdVvDbJh7Js0g+xWoUXEToWhy2h6ta87GoOZ0bkePUaC1jkIPjTWPh/grAI=
X-Received: by 2002:a9d:6f88:: with SMTP id h8mr4413898otq.91.1583260606806;
 Tue, 03 Mar 2020 10:36:46 -0800 (PST)
MIME-Version: 1.0
References: <20200303100511.5498-1-peter.maydell@linaro.org>
 <226c0d6b-feb5-d202-2fdf-ba4ae910e463@redhat.com>
 <4f960fe0-e5f5-1f8c-76a1-b1df2bef4bd9@redhat.com>
In-Reply-To: <4f960fe0-e5f5-1f8c-76a1-b1df2bef4bd9@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Mar 2020 18:36:35 +0000
Message-ID: <CAFEAcA-H9nOzSon9eqiL5w1Rq9qVWu=B1q29D4pLTd=u2cWSwQ@mail.gmail.com>
Subject: Re: [PATCH] cpu: Use DeviceClass reset instead of a special CPUClass
 reset
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
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
Cc: Chris Wulff <crwulff@gmail.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>, Anthony Green <green@moxielogic.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Marek Vasut <marex@denx.de>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-s390x <qemu-s390x@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Michael Walle <michael@walle.cc>, qemu-ppc <qemu-ppc@nongnu.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 3 Mar 2020 at 18:33, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com=
> wrote:
> Nitpick: you don't need to include the bracket symbol in the diff:
>
>    @@
>    -resetfn(CPUState *cpu)
>    +resetfn(DeviceState *dev)
>     {
>
> (simply indent it with a space).

I think this was probably leftover from trying to get Coccinelle
to not rewrap the '{' onto the previous line, before I found
--smpl-spacing.

In general I don't find it terribly useful to spend a great
deal of time streamlining Coccinelle scripts -- I think they
are basically one-shot uses almost all of the time, so once
they're producing the right changes I prefer to move on.

thanks
-- PMM

