Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF09849D1
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Aug 2019 12:39:34 +0200 (CEST)
Received: from localhost ([::1]:39608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hvJLy-0005xv-2l
	for lists+qemu-devel@lfdr.de; Wed, 07 Aug 2019 06:39:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45676)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hvJKW-00045f-6n
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 06:38:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hvJKU-0001dl-Rh
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 06:38:04 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:36680)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hvJKU-0001cg-Mm
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 06:38:02 -0400
Received: by mail-ot1-x343.google.com with SMTP id r6so102297181oti.3
 for <qemu-devel@nongnu.org>; Wed, 07 Aug 2019 03:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cCgd+I9d8IpQehwZ7OvjxnxlzdVf6lG4aTOJWZX8fHI=;
 b=ek65IJ6nU8lmHoMFxQsyW/BlyBr01XeDIqg0JJKXhdFXiplOR898QgCC88xPCZtFoR
 BEr6MrUyEzJ1Ha8M3cyi7lCsKnJAjrIQ9I/5GIgOStuQF+aCVlVSY43CBNwzz5kXxv7R
 LGQ/1UHuidItRoquEdm5lNYFy8My3R36Ugn5QR/N3fyjj8DAWl96veRg5icCHBR0RpNX
 +3d+ijoUnt8Zfdp99crqRgoMkDOverDCTHuxKYTUPPwQDJCrbFh2koZI7BoR1L1r7KF9
 wn5xu7Vkrrg8dZ3DDjbTIwNleXBS9YLm8OdG5mxH355bvWOsh5uOkYhT3fj9rTHTgzlq
 NDvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cCgd+I9d8IpQehwZ7OvjxnxlzdVf6lG4aTOJWZX8fHI=;
 b=tC5DRNpUOVXHFGoGAtnnAQhhS10EDPGOMRm/sADUnj1bgPu5q2XXaScwcO0tC9cYss
 d7UPu5AyJxo97E8neXn170i3Tkuv8cgyI82Fm2ggHb5yZMPFwmyZj5K5KM8czqUJK7TO
 S1azKhPbY54zydf6ctJeu8kR4A92B3ZqtukkKspfJNWK9doXHXhUNLloj8++f0srhr2V
 S/HOrkhMdYSwOVbyMrDhCg5XuMQsCgxKWbxQK0vuUSRvnUydP1n1G3nCa7bPwmKTqqA1
 lC47Fr8A45ItZR8v7nD3NKMHXPJV8wOy2hlHYwXZDlFYCtrPL0ScocQAqoJafhRWnpBS
 xtew==
X-Gm-Message-State: APjAAAU+SBtxhCnzIrwbGGDiMGqMtcUDKcAdmroykcNeX+Kcfi796bvA
 A0xEhB+NiZ3/kyWCm1M7njQhVq8KMaZjp+WmbnJhUg==
X-Google-Smtp-Source: APXvYqxXDY1z84LcAzQQ9VeceLdQPEMWB0NR8McbRZUDMVokivQeCA48zGrslwEvFmuXbmA63GrKgQcFlcBhips7RP4=
X-Received: by 2002:a9d:711e:: with SMTP id n30mr6619569otj.97.1565174281829; 
 Wed, 07 Aug 2019 03:38:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190729145654.14644-1-damien.hedde@greensocs.com>
 <20190729145654.14644-9-damien.hedde@greensocs.com>
 <20190731061108.GF2032@umbus.fritz.box>
In-Reply-To: <20190731061108.GF2032@umbus.fritz.box>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 7 Aug 2019 11:37:51 +0100
Message-ID: <CAFEAcA-dSBpAVfjn7VnCRgnZabBP226ZVuSJYW1bwzEr5mNktw@mail.gmail.com>
To: David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-devel] [PATCH v3 08/33] Add function to control reset
 with gpio inputs
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
Cc: Fam Zheng <fam@euphon.net>, Collin Walling <walling@linux.ibm.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Edgar Iglesias <edgar.iglesias@xilinx.com>, Hannes Reinecke <hare@suse.com>,
 Qemu-block <qemu-block@nongnu.org>, David Hildenbrand <david@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-s390x <qemu-s390x@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Damien Hedde <damien.hedde@greensocs.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Mark Burton <mark.burton@greensocs.com>, qemu-ppc <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 31 Jul 2019 at 07:33, David Gibson <david@gibson.dropbear.id.au> wrote:
>
> On Mon, Jul 29, 2019 at 04:56:29PM +0200, Damien Hedde wrote:
> > It adds the possibility to add 2 gpios to control the warm and cold reset.
> > With theses ios, the reset can be maintained during some time.
> > Each io is associated with a state to detect level changes.
> >
> > Vmstate subsections are also added to the existsing device_reset
> > subsection.
>
> This doesn't seem like a thing that should be present on every single
> DeviceState.

It's a facility that's going to be useful to multiple different
subclasses of DeviceState, so it seems to me cleaner to
have base class support for the common feature rather than
to reimplement it entirely from scratch in every subclass
that wants it.

(The patch as written breaks migration compatibility -- the
new fields need to go in their own vmstate subsection
with a suitable 'needed' function -- but that can be fixed.)

thanks
-- PMM

