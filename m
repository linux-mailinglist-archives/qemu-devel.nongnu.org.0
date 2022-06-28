Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D40A455C032
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 12:31:54 +0200 (CEST)
Received: from localhost ([::1]:46614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o68Vc-0006mW-9J
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 06:31:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1o68SS-0004Qv-4p
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 06:28:36 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:41578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1o68SQ-0001dM-Bs
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 06:28:35 -0400
Received: by mail-ej1-x62c.google.com with SMTP id u12so24755761eja.8
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 03:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=qmayKHSKODDp41JQbkXBxX3IxzEacFxNqWNsvyDmGn0=;
 b=3mmeU5YvB6o3AjxDXq5x/LGehBzlWKLZAL/vaE0P8FKcywbUcqQmpBMIyhBwPVpPfK
 BHwsT7RzIxXq8w2dFxSE6q54+NavD/cNULP86UIwr3F8T5SSCNGOD0v/Q0xdykc8u4+Y
 cvYE2mwbwqeDDaEpYKybAPua+pv+bxGkoEHPDiutGL4HUpbmwlhefdP1eo+mlPJ49A+9
 Re42FlwaC0wsNiJlOyyfx+4CrYUUlggVdUEuqK9V7JHJZ2+808TLD629XmF2Vc3Ykfy5
 AvyU5ls/ehUhoygemBfJBnEb6Lu6x3BF5ywbnJX4egsbiR/kEA2HmRjd/ymqvnPjOZTQ
 L3iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qmayKHSKODDp41JQbkXBxX3IxzEacFxNqWNsvyDmGn0=;
 b=8Bmp0NRJFvssiJIekztX9yccu8jFzQTDKaEu3LFodLusnaFiGZNCTySbCNf0qda6GJ
 +4hNCS1p8xVARUVrnteT6Iu78eUXYovKlFivfX1YvJuOcij9apReT+mwyZHsjf6cTlag
 FpFcaGH1csrWKHPtPqMKI8RbYbxOVk6kv+RfHUUau9umX/fcaRVO7WzjPXVd44odG8ul
 7JxzV+kNtGVZ4n3xAyPFiaRQ18QQGCevpU9lEQN23Zyuv2q4i6b+MPiuq52OeFIDUcCg
 Qb56wWk/P6QEdGGgDRSA2JDPBxZzLYeBEO/LuLV93M32ucr02mmT1b6CPr5hX9XZeOMe
 w25w==
X-Gm-Message-State: AJIora9qD1a21vAuKQnHX5MmVEhmDKa3BTYHhprWgVeVQBU2NuH6vaJ6
 nKNY0Y3k2skm5VP0j8NOtanxme0D2mrLIQhCiOVyyw==
X-Google-Smtp-Source: AGRyM1s8uxBnEoq5x08oKA1ZHUw9S+kMyfD+RhjTabFO+AApMkQQlJgBiRK9TCc84xXNg7KzKgcRGj54vvai83EeyxU=
X-Received: by 2002:a17:906:53c7:b0:711:d2e9:99d4 with SMTP id
 p7-20020a17090653c700b00711d2e999d4mr17256848ejo.716.1656412112666; Tue, 28
 Jun 2022 03:28:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAARzgww9KKx7fTw7WMMTb3PCQgdwJwS34X0jHhQ+41OrMWZazg@mail.gmail.com>
 <4e1c2a45-eb53-e210-1ce1-05837bf1e7c3@redhat.com>
 <20220628030749-mutt-send-email-mst@kernel.org>
 <7bf5976e-8277-7c78-f412-44f7be8754f4@redhat.com>
 <YrqyWhu8ThAcUGI4@redhat.com>
 <CAARzgwyZNAYK3p16wjeykoCB9C+tmznY+OZAM-vw+Pn_4CdMqQ@mail.gmail.com>
 <Yrq6anPW60FkjmK6@redhat.com>
 <59150265-44ed-0b14-df1c-42e3f2e97b7e@redhat.com>
 <CAARzgwzST+3PjEomfbweeB0KYnmO0yoxVJWiV9+9A_h32swnyw@mail.gmail.com>
 <YrrSFig7Qo/PKqNx@redhat.com> <20220628060510-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220628060510-mutt-send-email-mst@kernel.org>
From: Ani Sinha <ani@anisinha.ca>
Date: Tue, 28 Jun 2022 15:58:21 +0530
Message-ID: <CAARzgwwdWkqXnP=QHqme-GACa5LvfN5cO1PZpFhZ-G6NR73sEw@mail.gmail.com>
Subject: Re: venv for python qtest bits? (was: Re: [PATCH 11/12]
 acpi/tests/bits: add README file for bits qtests)
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 imammedo@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2a00:1450:4864:20::62c;
 envelope-from=ani@anisinha.ca; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, Jun 28, 2022 at 3:37 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Tue, Jun 28, 2022 at 11:04:30AM +0100, Daniel P. Berrang=C3=A9 wrote:
> > If it is actually booting a real guest image (from biosbits) and intera=
cting
> > with it, then it does feel like the scope of this testing is more appro=
priate
> > to QEMU's avocado framework than qtest, especially given the desire to =
use
> > python for it all.
> >
> > With regards,
> > Daniel
>
> I feel avocado is directed towards booting full fledged guest OS.
> It makes it much easier to figure out guest issues but it also
> prone to false positives and is harder to debug as a result.
> Booting a minimal image like this shouldn't require that.

Yes 100% agree with Michael on this. Biobits is *not* booting any OS
image. It runs off grub, that is, directly from bootloader stage. The
interraction with the VM is minimal.

>
> --
> MST
>

