Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2486ADF3D
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 13:56:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZWqs-0005L0-LC; Tue, 07 Mar 2023 07:55:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pZWqq-0005Ke-CA
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 07:55:33 -0500
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pZWqk-000520-OA
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 07:55:29 -0500
Received: by mail-lj1-x22f.google.com with SMTP id h9so13047216ljq.2
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 04:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678193722;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9aQleQiWe19ZAkZ92GkIy9Burn40uenJ82Qm+wR2lqU=;
 b=B9A85niaAbC+rVBeyI1VxyRdT+BOTe7u8JHzPvJeCc35sLI/GDRil+cRk944Qu259/
 hLhC3mkoWU0HH4m4/c5DjVWZ1MA5coXL5jq7Gc5fgCjVaRs87qOIpL2iAMATo6ctpwB9
 UHZt8xOAcITBB1xSQTlDpaTMavyj4l9uDYQV9zD8QU0B2dKw/AkO5OxmdsMY7oNW1q48
 sctR+qgotEpHMlNiZSXsvQ8mQjUMQZRVqjv8U19xxELKAmSAYM/kR7nqt+sS3XEC6Zw2
 eEd4r1ksv8k6nPZqXNKAt+v0jtq4+GixDnZ25mI5qpV4k86cWawayVlRsVFvGjKlprHH
 A88g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678193722;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9aQleQiWe19ZAkZ92GkIy9Burn40uenJ82Qm+wR2lqU=;
 b=FVFLbCmOoZKckKlZfPa5sXM9WncyeLQgbJeyN/htt39FVNQvNgfoiV5Y5f9tffUxYs
 7QCSgbw7nQfpxYlyU39j5N8qzswg5sHzRUBQnmAvitYt1/SwAZxmjEVevHBIqx6Me8Ro
 RIsWZjDXEQkM8qT5w3VeTDIyyHafBErMnQ6A/Nx7O7Ke+1lEs/96BuWtQqGdRfKsm3kt
 NPcc9T9bd2yfdeWYC5vzbHNpPQHUL6gGiQA1mCr4Qb5WEnLQ93vo72kCBbi6oqgC0aUd
 SMU3w4yHnf0Q9xhe1VY5bLPGExW2TkYV6e3SGO02uH0QYOTDwzPs2Zrxbs03EQAddljr
 Vk4g==
X-Gm-Message-State: AO0yUKWMD1aEuZ4B2JQwdUmtJJFcwTArqYzjJJwhb8VvgqE1TTMocMKc
 309/YwocoZG5CCX1cjf6s9aV7a2UslfObXsUDT0=
X-Google-Smtp-Source: AK7set8HDu4QdNWGiE7fdh0THcAyJqW+r1MReuhlfu+m8OaTb2Fb9dCVorY6hUqx+z1ITEeWvkt/3Tg7V7ctqb/5c4U=
X-Received: by 2002:a2e:a4b7:0:b0:295:a8c7:4b3b with SMTP id
 g23-20020a2ea4b7000000b00295a8c74b3bmr4377325ljm.4.1678193722456; Tue, 07 Mar
 2023 04:55:22 -0800 (PST)
MIME-Version: 1.0
References: <20230307123027.2485499-1-marcandre.lureau@redhat.com>
 <ZAcwtl8N+ruzH4qj@redhat.com>
In-Reply-To: <ZAcwtl8N+ruzH4qj@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 7 Mar 2023 16:55:11 +0400
Message-ID: <CAJ+F1CLhu5aJ-eh+gB54AuKjNF=BWtWebgzKFDEBaDJsE5gVvA@mail.gmail.com>
Subject: Re: [PATCH] .editorconfig: set max line at 70 chars for QAPI files
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, armbru@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::22f;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x22f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi

On Tue, Mar 7, 2023 at 4:41 PM Daniel P. Berrang=C3=A9 <berrange@redhat.com=
> wrote:
>
> On Tue, Mar 07, 2023 at 04:30:27PM +0400, marcandre.lureau@redhat.com wro=
te:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > This seems to be the preferred style.
> >
> > The EditorConfig property is not supported by all editors:
> > https://github.com/editorconfig/editorconfig/wiki/EditorConfig-Properti=
es#max_line_length
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  .editorconfig | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/.editorconfig b/.editorconfig
> > index 7303759ed7..8c5ebc6a1b 100644
> > --- a/.editorconfig
> > +++ b/.editorconfig
> > @@ -47,3 +47,4 @@ emacs_mode =3D glsl
> >  [*.json]
> >  indent_style =3D space
> >  emacs_mode =3D python
> > +max_line_length =3D 70
>
> Why 70 as a hard limit ?  I thought QEMU policy was that 80 was a soft
> limit and we were happy with 90 if it avoided wrapping that would hurt
> readability.

Markus regularly point out lines over 70 characters:
https://patchew.org/QEMU/20230306122751.2355515-1-marcandre.lureau@redhat.c=
om/20230306122751.2355515-9-marcandre.lureau@redhat.com/#871qm1j2zc.fsf@pon=
d.sub.org

(my default emacs config has fill-column 80, and I use fill-paragraph
- although sometime I may forget it)

