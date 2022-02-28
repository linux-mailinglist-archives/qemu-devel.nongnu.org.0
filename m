Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F4B4C6E7F
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 14:46:34 +0100 (CET)
Received: from localhost ([::1]:41568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOgMD-0003wC-8G
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 08:46:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nOg5E-0005rY-F3
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 08:29:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nOg5B-0002sb-9g
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 08:28:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646054933;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p/PO4hQOh+TWPphCLDYy7Lky7roLFEBr2DOelpp7vms=;
 b=AsaBtHNyQ4EnG3qNZRsj1WMtx+jTiZixdRumXJzwkR0jiGRIgv6Qr6m0YTTJ8SnvgJECGg
 fFE3QH1f320jziRr29ASwep3LGIrOS5hX2L4H0PQrgIZeZRxTaAvqF/SYzh9I/xDI4kV8S
 AQtKdx3R/De29zkTz1UmaYFGkNRqwnE=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-61-2_wx5p94OoOgmYU2hs_1oA-1; Mon, 28 Feb 2022 08:28:52 -0500
X-MC-Unique: 2_wx5p94OoOgmYU2hs_1oA-1
Received: by mail-yb1-f200.google.com with SMTP id
 b18-20020a25fa12000000b0062412a8200eso9916221ybe.22
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 05:28:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=p/PO4hQOh+TWPphCLDYy7Lky7roLFEBr2DOelpp7vms=;
 b=fwiA2u1nJXv55aNwy78RyWTLvIwu1Z5BAxm62g7Sv3IQPCqwAZ/JEJWZAsPknk2U1J
 nCONqBS6g/QLGoz9EsOFb/B+FX4HrEjBA3PDTplpc8PGG5l2JX4Ec3nZgZ1BYfkWf4Qy
 3vv41h1qxtsmc7//AvimvlssHK92HzITVlpRgPi5c7D10eOzAfTGZ9K46FablUfViMfl
 3fd0AsSmgyP7KOeJnsBeo8beZFF/Fx673TlidSJ/xAnz+jIVrc76NR55h+5nFPQcbf9j
 gmAM5SjjI1xma138wZ5/xwtPgpHEImRmvh1FVK4Zxq2XgV9EXbB7UPtujoihmY/lWAr8
 zGkw==
X-Gm-Message-State: AOAM530tSMfr9AmSlYmBOe3hUQmSxHe6phAGK2EphaZS00dzIl1Go0yC
 NkBqolnT+klWh85iMpDc2VlE/0EYgLyucLcXp81VJ0ChHt9jeAGGcXlaSyw/C2Pb9xlEZXQM7y2
 TNji0bN4DT0Kn5WovyV8W1E0zLf1u8Ow=
X-Received: by 2002:a81:91d4:0:b0:2d6:b671:e71c with SMTP id
 i203-20020a8191d4000000b002d6b671e71cmr19581911ywg.312.1646054931739; 
 Mon, 28 Feb 2022 05:28:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz6Wk6frM5bLgTp592AaLuu27PApyeW99A3sRqsdp0Q12b2fTkptofUvZFgD6y7OTjybWr+gQCvI+V8FPZzyQ0=
X-Received: by 2002:a81:91d4:0:b0:2d6:b671:e71c with SMTP id
 i203-20020a8191d4000000b002d6b671e71cmr19581900ywg.312.1646054931573; Mon, 28
 Feb 2022 05:28:51 -0800 (PST)
MIME-Version: 1.0
References: <20220228120720.722632-1-marcandre.lureau@redhat.com>
 <20220228120720.722632-2-marcandre.lureau@redhat.com>
 <CAFEAcA_a+0Nz5b3uU052FquVLOLRTvejPD13NSxvHTu_yZTBiQ@mail.gmail.com>
In-Reply-To: <CAFEAcA_a+0Nz5b3uU052FquVLOLRTvejPD13NSxvHTu_yZTBiQ@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Mon, 28 Feb 2022 17:28:40 +0400
Message-ID: <CAMxuvaw-q06u7TfjzueZWwiiXCjwFh+QfQaM+cTKHQcmYBW-iQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] meson: fix CONFIG_ATOMIC128 check
To: Peter Maydell <peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: "Bonzini, Paolo" <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Mon, Feb 28, 2022 at 5:24 PM Peter Maydell <peter.maydell@linaro.org> wr=
ote:
>
> On Mon, 28 Feb 2022 at 12:19, <marcandre.lureau@redhat.com> wrote:
> >
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > testfile.c: In function 'main':
> > testfile.c:5:11: error: incorrect number of arguments to function '__at=
omic_load'
> >     5 |       y =3D __atomic_load(&x, 0);
> >       |           ^~~~~~~~~~~~~
> > testfile.c:6:7: error: argument 2 of '__atomic_store' must be a pointer=
 type
> >     6 |       __atomic_store(&x, y, 0);
> >       |       ^~~~~~~~~~~~~~
> > testfile.c:7:7: error: argument 3 of '__atomic_compare_exchange' must b=
e a pointer type
> >     7 |       __atomic_compare_exchange(&x, &y, x, 0, 0, 0);
> >       |       ^~~~~~~~~~~~~~~~~~~~~~~~~
> >
> > And it must be linked with -latomic.
>
> As Philippe says, this isn't right. What the configure test
> is checking for is "do we have 128-bit atomics which are
> handled inline and specifically not via libatomic". The
> reason we can't use libatomic is documented in the comment
> starting "GCC is a house divided" in include/qemu/atomic128.h.

The arguments fix is still valid, no?


