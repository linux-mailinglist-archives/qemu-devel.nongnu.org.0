Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B0F4A4D0D
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 18:24:30 +0100 (CET)
Received: from localhost ([::1]:59098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEaPl-0002zH-Dh
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 12:24:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nEa7A-0001lc-F7
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 12:05:17 -0500
Received: from [2a00:1450:4864:20::431] (port=39473
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nEa6z-0007TJ-RX
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 12:05:12 -0500
Received: by mail-wr1-x431.google.com with SMTP id s9so26678577wrb.6
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 09:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Bnju4prFv/Zq73UeRoNOpnuaNdrOg4ThcXyK8vKzzwU=;
 b=Z8QKFeF+b4m9LNU0chs3m0sLxdbXgm080P29YA79kJ/yOFX2Ccov7i5BvnzdnD6Pwe
 HFD/EZKzAhqpi7t5c0e757r+FLbbivzs7oA651o4+oU9ZtIkc6lgDrC4LiLrXFBKxBzA
 rQWCmE+kq6xHU+umoPzmL6qRubA5J05E0kVz3HAd+j2pdm165WwxZnVD2pjQspa5o/0E
 ocGMH5T0/z3pISdSTlhLvewgSkHIs+gmwCdIWTgkPFkOGhL5bzkpmFN/tIw5B0mRLfGp
 xz8giM1WZvsHl3dMrkzwkWffBcXpdqs9Wrbu3V3O7iWDkatf0SqMcBWY9O7D9It1R+n6
 NO2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Bnju4prFv/Zq73UeRoNOpnuaNdrOg4ThcXyK8vKzzwU=;
 b=iZZzqEzLQHJ4Lvg6emmT42NqIx+N8cjSv+wLvgb+99TE/RrJF6UjBEmMGFJt7RRwcn
 mTasICFiJ5qO5bO58fMwTB0ychRWvgIbLcV7KrmswCx8HPVJ2OQkg0goc+Uk6bTijp9t
 ddhWV8gVhJJBA44waTCmctXUfdOydwbI1FoRkAR6M2epAVMlbQd6aJ2Pi57qI3Hf7i4N
 BOopc7ZWzBF1gf7Hj80h2DPeZk4MbyX0361/pbaJVYt80gS8JCjCPIk/IqScd9jz5pyW
 iCCI7CoBhieNN8h41rKB9B9VfOAGFH1iCMYiCEinLY67OYgCoPrDrWN1szBn9LE8JfF4
 73/A==
X-Gm-Message-State: AOAM532D5TKiENBZKcaeLCechq+QgkmKn0XC9sr7kbIo82u/lQNu95jH
 8/F+9bf/1bZurQVpM175W4BH2KEwGL4NJgtauQc8TA==
X-Google-Smtp-Source: ABdhPJz+yD5dxaOPP+6jsrAnXSk1uyr4Z6T016X7hrVV1tWJHnjLF1X8igP2WGkFL36slig0eGaO6eMLgWeOCH2Bx1c=
X-Received: by 2002:a05:6000:1acb:: with SMTP id
 i11mr18663672wry.172.1643648697650; 
 Mon, 31 Jan 2022 09:04:57 -0800 (PST)
MIME-Version: 1.0
References: <20220131110811.619053-1-clg@kaod.org>
 <20220131110811.619053-3-clg@kaod.org>
 <b878009a-cf35-1465-9bae-11d50ac84241@ilande.co.uk>
 <560147a3-7583-b62f-a194-6af1066ccbef@kaod.org>
 <6902a813-16cd-86e5-b851-d244d42e0be2@ilande.co.uk>
In-Reply-To: <6902a813-16cd-86e5-b851-d244d42e0be2@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 31 Jan 2022 17:04:46 +0000
Message-ID: <CAFEAcA96kQXXDZye-XgUm4otfdFO_Mgi=t9RmJdpV56-08WLBA@mail.gmail.com>
Subject: Re: [PULL 02/41] target/ppc: 603: fix restore of GPRs 0-3 on rfi
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Fabiano Rosas <farosas@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 31 Jan 2022 at 17:00, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
> Here we see checkpatch.pl has no issues with the output of git diff, but =
when you run
> it on the whole file:
> ... it shows up. How is it possible for checkpatch.pl to miss things when=
 processing
> diffs instead of whole files?

Probably because checkpatch is a pretty hairy perl script and sometimes
it mis-parses stuff, especially when it's working with a diff hunk
and it has a limited view of the context around the statement.
It's always been best-effort rather than guaranteed to catch all
formatting issues.

For this particular error, it doesn't seem to me worth making C=C3=A9dric
reroll the pullreq to fix it unless there's some other issue with
it; we can fix it with a followup patch.

thanks
-- PMM

