Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA983B0114
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 12:14:44 +0200 (CEST)
Received: from localhost ([::1]:40536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvdQZ-0005bK-7g
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 06:14:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1lvdPA-0004gr-Rf
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 06:13:16 -0400
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230]:34363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1lvdP9-0002gR-75
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 06:13:16 -0400
Received: by mail-oi1-x230.google.com with SMTP id u11so23173674oiv.1
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 03:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=P64+geUMGfk3le5A5pM7VLB51PLh+COvg88V4YdeehQ=;
 b=C9sETX/xzFyCsZVHkz5rOEi6rAEuzQmdZX6VYKCEkxmpO+F1CNPbTQQghbsYkdB3ID
 DMRKYWcRInv+KoUh/pYK7dE8CyCWRsKGKdrIebhS/RK94RFWaxuuyHquPs2wk7upEgvZ
 0D5j5m1Zj7bSwe9LAApF2gV0mWuegqP7wOtzWxRiDZLl/EX8hUKW6VzE41DtJ1M/IqiF
 bBDu77BvqLbqFCqXUgZQdrePZ6/NjajGwP+wLeG5id8D6NAMGt1vTMSv9x3WLeBcXItv
 A9Wa+KVccJgsScUJ8eDE/Dm8Pm3ZfxdhlmbdowF6mwdnGq3vyu0P8xVzRDqOhw4bVh/+
 ytUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=P64+geUMGfk3le5A5pM7VLB51PLh+COvg88V4YdeehQ=;
 b=eVgQAvOaO0oroPXWde27wfhSLrLDKI10H4JO08sPU5Yrq7jNkrsLy2MDnPADAdNvIK
 aBB+DtfXGnaz8ugiZ3Xzwc6+3SC/mZ19GhJCYtaU6HYmJDCe1z387eYuNLA75K6YOlJu
 uu9NazzvZHe0NmqfLokPr1EOZNgwjkrU/NI49mBRGtuXlSfWWfaOEiMHGV+80rppL6LC
 KccpSRNQMSM+N1pOV0VXO47QeGEIayuajbPfJQ51yR4rdypKeJceY4RSFRCChxFCM75n
 CDaIX3lQ8Ma2XZBDALP4qTgtWUKBtMs99IcFX2X6qKGxnIz0v74pz9d2RA7mFubsf77o
 FTXg==
X-Gm-Message-State: AOAM533K84T84gzJrwOE37cf1s3quimq80BXw0+JOprgqJ8DOg/Phc0t
 oE2MoDSAVXiWyx75ViZyMryc6Q9ohdKLxrzceSo=
X-Google-Smtp-Source: ABdhPJze1lZgdzwnvxSejViPIz5ug9Cob0UM2Jr9pFNcwQDmZ4S3RByOJM/E+c6NuKyu+K11PorW3wF5XCxeppmIu5M=
X-Received: by 2002:aca:b5c3:: with SMTP id e186mr2508579oif.43.1624356793834; 
 Tue, 22 Jun 2021 03:13:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210616104349.2398060-1-f4bug@amsat.org>
 <20210617095614.jh5vkrzc65d5xrui@sirius.home.kraxel.org>
 <CAAKa2jk6gfWbMsfB3uZ4HqgS5Z_BqxhUN-dYK51OC2NwYad49Q@mail.gmail.com>
 <a9bf226f-5a42-8cc7-3f45-33b5aea046d3@amsat.org>
In-Reply-To: <a9bf226f-5a42-8cc7-3f45-33b5aea046d3@amsat.org>
From: Qiang Liu <cyruscyliu@gmail.com>
Date: Tue, 22 Jun 2021 18:13:02 +0800
Message-ID: <CAAKa2j=sKU=ZrDhmVVoPyr3G5sz-hw7oqMmXdfoVvLB4zY5AzQ@mail.gmail.com>
Subject: Re: [PATCH v2] hw/audio/sb16: Avoid assertion by restricting I/O
 sampling rate range
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=cyruscyliu@gmail.com; helo=mail-oi1-x230.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 22, 2021 at 5:16 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> On 6/22/21 10:54 AM, Qiang Liu wrote:
> > Hi folks,
> >
> > With this patch, having tested more, I find another way to trigger the
> > assertion.
> > I found it just now such that I did a quick investigation and reported
> > it to you. I
> > hope this would prevent merging this patch.
>
> No need to prevent merging this patch as it already fixes problems.
OK. I see.

> > Brief analysis:
> > This existing patch limits s->freq in dma_cmd8 before continue_dma8 fol=
lowed
> > by AUD_open_out. It's good to prevent the flow by this path. However, w=
e can
> > directly call continue_dma8 via command 0xd4 but there is no limit chec=
k there.
> >
> > To trigger this assertion, we can manipulate s->freq in the following w=
ay.
> > 1. dsp_write, offset=3D0xc, val=3D0x41
> > Because s->needed_bytes =3D 0, command() is called.
> > ```
> > case 0x41:
> >     s->freq =3D -1;
> >     s->time_const =3D -1;
> >     s->needed_bytes =3D 2; // look at here
> > ...
> > s->cmd =3D cmd; // 0x41, and here
> > ```
> >
> > 2. dsp_write, offset=3D0xc, val=3D0x14
> > Because s->needed_bytes =3D 2, complete() is called.
> > ```
> > s->in2_data[s->in_index++] =3D 0x14; // remembere this
> > s->needed_bytes =3D 0
> > ```
> > Because s->cmd =3D 0x41, s->freq will be reset.
> > ```
> > case 0x41:
> > case 0x42:
> >     s->freq =3D dsp_get_hilo (s);
> >                     // return s->in2_data[--s->in_index]
> >                     // s->freq will be 0x14, there is no check ...
> > ```
> >
> > 3. dsp_write, offset=3D0xc, val=3D0xd4
> > Call continue_dma8 directly then we can trigger this assertion because
> > s->freq is too small.
> >
> > Maybe we can fix this flaw by adding s->freq check after s->freq =3D
> > dsp_get_hilo (s) in the second step?
>
> Do you mind sending a new patch with reproducer and your fix?
Sure, no problem.

> > Best,
> > Qiang

