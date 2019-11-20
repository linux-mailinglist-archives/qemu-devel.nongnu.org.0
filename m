Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DAD21035AB
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Nov 2019 08:56:19 +0100 (CET)
Received: from localhost ([::1]:54410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iXKqY-0007Mo-Hj
	for lists+qemu-devel@lfdr.de; Wed, 20 Nov 2019 02:56:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60656)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mlureau@redhat.com>) id 1iXKoc-0006Za-52
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 02:54:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlureau@redhat.com>) id 1iXKoa-00035x-2T
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 02:54:18 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:30480
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlureau@redhat.com>) id 1iXKoZ-00034c-Ud
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 02:54:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574236455;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PMnp8xixLPxtFJR0dofL8FX4sA0PXxq+DoOImcWkX7E=;
 b=gmKDTMAaMQ30ogJ6TBCqI2tl1DXwpagpfw1fgtKZTp4sv98QS1vIyl3S5Qak/p8ClHRsYS
 r/wfrWQhMEj5ORCu+3Y53YXjZqZsBpTuKt62yyAV2JooDi7reJddE3abPCE7vs4z0KnWag
 BB4TTJRd0pt06AASgdPN2/Q4He4D9fk=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-UHHNQUu2NQSPD368q3K5zA-1; Wed, 20 Nov 2019 02:54:11 -0500
Received: by mail-oi1-f198.google.com with SMTP id j23so12093013oii.21
 for <qemu-devel@nongnu.org>; Tue, 19 Nov 2019 23:54:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PMnp8xixLPxtFJR0dofL8FX4sA0PXxq+DoOImcWkX7E=;
 b=GjyW+MgllW/+97wARqpUSvP+gn6YkCHHgkZiDRjhpzPQeRxiHd/dETBlzWMNam+YDt
 4YlIvpkYYuRW2JmMIYnHeVj/1X8eqTl/cAlYOzN4fm5/KzB/c/SucaQQiJ5i36FlGtDU
 s9iFBLUbpYPgeifzm2kijpQL8i/cyXp/fmXs0tDivDRBuDMrQq8XOP4o1KqR3lT+f5hy
 Fm9TiDCqWbFvmnHeInfLE3RDlUyBK8nMonDIHAxEzVTAd5Iqmr1i37ORnniJvKXJjJRp
 xGTFrohX49iqTiuGmayY47uzM3PSa99it0JkrESt1k3/cQ+xvQMA/SezWK5f3R2eex/8
 +NvQ==
X-Gm-Message-State: APjAAAVyEWKjjHhNJq/6tuTDyW0HIR4nffhHwA6d22eTwsdHJZcJpQ8Y
 cRPD1+Fp04CCH6FKhBAqAOPooFUInOtSXfkO8gyEHF+vD3zR5L8I0KyMmdSsXb5C24e3VxmFywL
 441tB5WaPsr28ATvKTWwmznfAzDCKaMo=
X-Received: by 2002:aca:4c14:: with SMTP id z20mr1631754oia.76.1574236450657; 
 Tue, 19 Nov 2019 23:54:10 -0800 (PST)
X-Google-Smtp-Source: APXvYqwvI8CUli6G3tVYZQwOK+pbN3Q2BHZ4wZfarWshaQIE8L8NSZFnFbdSkTP7T9DnxGKn9onwrPhvv1gHdrMZOco=
X-Received: by 2002:aca:4c14:: with SMTP id z20mr1631730oia.76.1574236450422; 
 Tue, 19 Nov 2019 23:54:10 -0800 (PST)
MIME-Version: 1.0
References: <20191023173154.30051-1-marcandre.lureau@redhat.com>
 <20191023173154.30051-15-marcandre.lureau@redhat.com>
 <CAFEAcA_2ct-fOfBGgNExjCrjg7WKb-Xp44GghHWXiW2+3HjWbg@mail.gmail.com>
In-Reply-To: <CAFEAcA_2ct-fOfBGgNExjCrjg7WKb-Xp44GghHWXiW2+3HjWbg@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 20 Nov 2019 11:53:59 +0400
Message-ID: <CAMxuvayTGh6d5H_JXnKRoG7E1MeY-dsw5XqSeR59fdM7njPVeQ@mail.gmail.com>
Subject: Re: [PATCH v3 14/33] serial-mm: add "regshift" property
To: Peter Maydell <peter.maydell@linaro.org>
X-MC-Unique: UHHNQUu2NQSPD368q3K5zA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: Corey Minyard <cminyard@mvista.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paul Burton <pburton@wavecomp.com>, Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Fabien Chouteau <chouteau@adacore.com>, qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-ppc <qemu-ppc@nongnu.org>, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Mon, Nov 18, 2019 at 6:54 PM Peter Maydell <peter.maydell@linaro.org> wr=
ote:
>
> On Wed, 23 Oct 2019 at 18:34, Marc-Andr=C3=A9 Lureau
> <marcandre.lureau@redhat.com> wrote:
> >
> > And a property and rename "it_shift" field to "regshift", as it seems
> > to be more popular (and I don't know what "it" stands for).
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> I have no idea what it_shift means either (I had a look in the
> git history but it seems to have been added with that name
> very early on when the commit logs were generally not very
> informative); 'regshift' sounds good to me too.
>
> > +static Property serial_mm_properties[] =3D {
> > +    DEFINE_PROP_UINT8("regshift", SerialMM, regshift, 0),
>
> This could use a comment describing what the property does.

"Set the register shift value"? Half-kidding, do you have better
comment to make? Otherwise, it's probably not worth.

From what I understand, it's just applying a shift on the IO addr,
probably for alignment/access arch-specific reasons. You probably know
better than me ;)

>
> > +    DEFINE_PROP_END_OF_LIST(),
>
> Otherwise
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>

thanks


