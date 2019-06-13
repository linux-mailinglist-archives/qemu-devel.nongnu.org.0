Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD17744483
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jun 2019 18:38:30 +0200 (CEST)
Received: from localhost ([::1]:41580 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbSk9-0001ib-SX
	for lists+qemu-devel@lfdr.de; Thu, 13 Jun 2019 12:38:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54762)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hbRUO-0001q9-IT
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 11:18:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hbRUM-0002cf-Ic
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 11:18:08 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:38512)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hbRUM-0002VN-Df
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 11:18:06 -0400
Received: by mail-ot1-x343.google.com with SMTP id d17so19327074oth.5
 for <qemu-devel@nongnu.org>; Thu, 13 Jun 2019 08:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=V7w64XM/BEYAFL0wXyQNKxfl3dGfHZAdo/1xVpepP6Q=;
 b=Sffk12ykJhDp+PRZHpKz9qkSSoAplpn3PrFba0IzN+ayfDEZUJyeOU296iXP/cRi6a
 5QR2Zj2SJFbyTnsPqRMUO980ciA7UgUOy3KUc72vZ0HQs2Nb7enS8ylisS5vluph+tnx
 Qr9elVobHEFn1ag8LDOKaRLh0ODa6RLAmuXKu0N9aKrTX6uBpFFrsXsxqOer8lFgBWcs
 Yc2CoRfhHCh0ePoiZv+q3I7VRp7hf3/ebKU5zlZL/quWlzyt1+4yG6rluWMGrAZ/w1tN
 YO5yB6xkabo+LmAV1Sr/nGxAmLsVuyPuwR3ZEyfMtOd6KsuXCG1zgEEjnJp8pXFtEkdp
 izLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=V7w64XM/BEYAFL0wXyQNKxfl3dGfHZAdo/1xVpepP6Q=;
 b=reMRrlgwwD0vZvinqtsm4+qkFCSImKuytyw3Qhvsny8keGGO7Gb/kForI5fVNzIrJs
 MQQ38qiWxuomhdjo3f8Cl0vaGR1vGlzsLABWb2W0Xm0CeyYEUyKbUtQ6ohBWPP4BmjDz
 hKeXjTdIYmvlEqW+2Zx3ICuu0iNFOJ3AQRVIWrcBwzXoe43ywMNX/TXpeXhIsn2KpUUB
 CDXLcA5q7kS4T4QKTjsU9+B9rok5eBhe335RhI11MfVaL1/sg67ik0RxL4XTQWu1qAjk
 /za4fWVr14wu+5tNdM1vQWe1vEuzY1aSG7WP7OionQrM2bxSLa93aTvrTDcW7w/T8Yh2
 pCeg==
X-Gm-Message-State: APjAAAWlRKgDlsDf3hFfhpp3qHn/xRkPubWPlMrMnGEHccob36PQ2iQy
 uwyPCGT6oGrBjNxS7db+us3uuTK/zP9OTO6BXwAu3hNWu6Q=
X-Google-Smtp-Source: APXvYqyfMqAl0/ojMkuVCmQQHKYjKRX/z6EI0IPWaO49Dm1RAkJDMXMoUvOlW7p3Gz0/G8BGeVQ4Wvx/JPTCyjmFn94=
X-Received: by 2002:a9d:630a:: with SMTP id q10mr8757585otk.91.1560439082756; 
 Thu, 13 Jun 2019 08:18:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190517174046.11146-1-peter.maydell@linaro.org>
 <20190517174046.11146-5-peter.maydell@linaro.org>
 <875zp9ehah.fsf@zen.linaroharston>
In-Reply-To: <875zp9ehah.fsf@zen.linaroharston>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Jun 2019 16:17:50 +0100
Message-ID: <CAFEAcA8aWdAyWpaP2RiuBJds45HqWph8Dkn3Q7HPgrpokEtxYw@mail.gmail.com>
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH 4/4] hw/arm: Correctly disable
 FPU/DSP for some ARMSSE-based boards
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 13 Jun 2019 at 16:13, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
> Given the ever growing configurable nature of the v7m platform what do we=
 do
> to ensure the various combinations are tested on instantiating qemu? Or i=
s
> this a case of relying on the wider community to shout if users actually
> find a combination that breaks? I guess fuzz testing would be a bit of a
> sledgehammer approach.

It's not really all that much more configurable than the A-profile
cores; I've just been a bit more careful to actually make our
emulation reflect what the hardware actually does... a really
careful testing of the A profile cores would want to test
the various different cortex-* CPUs individually to make
sure they UNDEFfed on the features they didn't have, and so on.

thanks
-- PMM

