Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D1B57A0CB
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 16:10:19 +0200 (CEST)
Received: from localhost ([::1]:49660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDnvW-0006nO-5i
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 10:10:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDnrk-0007J8-Gk
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 10:06:24 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b]:33528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDnri-0005LM-Of
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 10:06:24 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-31e47ac84daso41672057b3.0
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 07:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=n4sHtz2Fz9Jd3Zoa6QQEqJ8JIqOZzrNHO9nThhDdzKg=;
 b=jG3wlkIKcSm/+REjtVsd6ihsShmZXO+2xo5pLETfENoDxN9YOvmCB4HezOHk/91DXj
 /WK84QsrVuifyXd6c0+1QfqGueoVNN6eMbyk1vMlkXTJe9dr/yLwpD0UPHiA/saPoowh
 gZUh9W5EWvNolXi0ttLSBMP3zUBmRdO/x/J7ip/54AbxXyKtDYFoC+bzv78TonMyJgae
 KiXl022ZE8GWke4HuWBRDI0OufHtMT5qMuC9ZeMRq6gByIVTK2ThIcgtrPFtxBRty+/B
 a22WVZfOmu5nMlr1G6iOWk+Sjy7iGA6ADBI3ED4oRtBqG+k0YbqrO/nTvI3vioGl0ih+
 +qEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n4sHtz2Fz9Jd3Zoa6QQEqJ8JIqOZzrNHO9nThhDdzKg=;
 b=S6k258KV0gn2g7iE+kAs8rVIUlgV54kZ+YzHKoQB5Gx7XdtKs/imtUNfkHQiUNHaTB
 zfI2ku9UxcO2sus9diCICxU6umcVtbMv5mXcQRdbp7qLAV2BZGYGYLu2kQrF44t+aAPw
 mLJfUgiSCfgcOezd4AUfYFuZrAS2+0HYSWcLszgNORfab2c2TqGU/ASDMHFWYkyyB76r
 giTGTrhwkbEpzw1wivveZ9qqRqELehOeTo9aT23i2XoXes8v+vP9UjnwEHVg93SH2SQ/
 axYImlNuVPQBFFjDm9Bm+IJMAsdMYN9g7E4+j+nMhJbfXol/n/IeEkooptWZD6K4x+nH
 UbWA==
X-Gm-Message-State: AJIora+/WbtxrHwmfiokCCLm3x7okFFyrCEZOKPtM662STrKqIHjGbSI
 Td/kQttxj4BKE+sShoF5k1bHqz1VXD7OfcL3bNT1Ig==
X-Google-Smtp-Source: AGRyM1v9bgnqsXuxkL5ECkI/eNa7dk8+ODGX5J15Xyni5KKL3+v/OaEvYgl2vvxbiaeRJ3YYy+2NLaJY7OQz7svYs4Q=
X-Received: by 2002:a81:f8f:0:b0:31c:bd9f:31ce with SMTP id
 137-20020a810f8f000000b0031cbd9f31cemr35790884ywp.347.1658239580339; Tue, 19
 Jul 2022 07:06:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200228092420.103757-1-quintela@redhat.com>
 <20200228092420.103757-4-quintela@redhat.com>
 <CAFEAcA9SqOgVWQpR5Z=_wLbrxxGOCqtKn2_0owPmtu4nb96XCQ@mail.gmail.com>
 <CAFEAcA9zp1QoKObY_=L8xPmuK7xEvcM+9hohW0fV+KE3fVBAOw@mail.gmail.com>
In-Reply-To: <CAFEAcA9zp1QoKObY_=L8xPmuK7xEvcM+9hohW0fV+KE3fVBAOw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jul 2022 15:06:09 +0100
Message-ID: <CAFEAcA9C6f95fEgowODv+xQJd8pNDTb2W8LBB5+swRGO+a1hdg@mail.gmail.com>
Subject: Re: [PULL 03/15] multifd: Make no compression operations into its own
 structure
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Michael Roth <michael.roth@amd.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping^2! I remain unsure how we should resolve this Coverity complaint
and would like opinions from QAPI codegen people.

thanks
-- PMM

On Fri, 13 May 2022 at 18:56, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Ping! Any opinions, especially from qapi codegen people,
> on the right thing to do here?
>
> On Tue, 12 Apr 2022 at 20:04, Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > On Fri, 28 Feb 2020 at 09:26, Juan Quintela <quintela@redhat.com> wrote:
> > >
> > > It will be used later.
> > >
> > > Signed-off-by: Juan Quintela <quintela@redhat.com>
> > > Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > >
> >
> > Hi; Coverity thinks there might be a buffer overrun here.
> > It's probably wrong, but it's not completely obvious why
> > it can't happen, so an assert somewhere would help...
> > (This is CID 1487239.)
> >
> > > +MultiFDCompression migrate_multifd_compression(void)
> > > +{
> > > +    MigrationState *s;
> > > +
> > > +    s = migrate_get_current();
> > > +
> > > +    return s->parameters.multifd_compression;
> >
> > This function returns an enum of type MultiFDCompression,
> > whose (autogenerated from QAPI) definition is:
> >
> > typedef enum MultiFDCompression {
> >     MULTIFD_COMPRESSION_NONE,
> >     MULTIFD_COMPRESSION_ZLIB,
> > #if defined(CONFIG_ZSTD)
> >     MULTIFD_COMPRESSION_ZSTD,
> > #endif /* defined(CONFIG_ZSTD) */
> >     MULTIFD_COMPRESSION__MAX,
> > } MultiFDCompression;
> >
> > > @@ -604,6 +745,7 @@ int multifd_save_setup(Error **errp)
> > >      multifd_send_state->pages = multifd_pages_init(page_count);
> > >      qemu_sem_init(&multifd_send_state->channels_ready, 0);
> > >      atomic_set(&multifd_send_state->exiting, 0);
> > > +    multifd_send_state->ops = multifd_ops[migrate_multifd_compression()];
> >
> > Here we take the result of the function and use it as an
> > array index into multifd_ops, whose definition is
> >  static MultiFDMethods *multifd_ops[MULTIFD_COMPRESSION__MAX] = { ... }
> >
> > Coverity doesn't see any reason why the return value from
> > migrate_multifd_compression() can't be MULTIFD_COMPRESSION__MAX,
> > so it complains that if it is then we are going to index off the
> > end of the array.
> >
> > An assert in migrate_multifd_compression() that the value being
> > returned is within the expected range would probably placate it.
> >
> > Alternatively, if the qapi type codegen didn't put the __MAX
> > value as a possible value of the enum type then Coverity
> > and probably also the compiler wouldn't consider it to be
> > a possible value of this kind of variable. But that might
> > have other awkward side-effects.
> >
> > thanks
> > -- PMM

