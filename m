Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD6743DA76
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 06:39:25 +0200 (CEST)
Received: from localhost ([::1]:42482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfxCG-0004ro-Ko
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 00:39:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1mfxAw-0003SD-Id
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 00:38:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1mfxAu-0001dk-Gn
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 00:38:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635395879;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IwmvqbizbpFr8/0Zj7R41yyWHItp+jC5sgd9OHzAMvc=;
 b=bC+N0dsKLljL+4vzVGFacFn0K3DmOJdoFRyaTWuPp21ez2D7pc2vPsqY/la55Q+uEv1Qny
 dj696HwtXD6LqbVzisBDSwlF2yRUM9JO3Zt8gEKtBuY3mgRsLPbpe1Wj9JIeHue5FsuxfT
 wRoplfpWy2z4I6fe5VydyJyeZwdRle8=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-479-C0dRunJCMl6FBJnyAczWeA-1; Thu, 28 Oct 2021 00:37:57 -0400
X-MC-Unique: C0dRunJCMl6FBJnyAczWeA-1
Received: by mail-lf1-f71.google.com with SMTP id
 h21-20020a0565123c9500b003ffa23a0577so2291821lfv.18
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 21:37:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IwmvqbizbpFr8/0Zj7R41yyWHItp+jC5sgd9OHzAMvc=;
 b=T8VYzekrfhI7a2EXBnY4ta7pOsAIxQ1SNgbKeJF5ZeMfQ2duaIIbnylA1bCvuXBXug
 8mKcnHjkcldJPrFn8Rhe7oPuZAtdFSmIxLi9nTkpgCHSbbz6NNO6TFHbpv+rrLyiKF2a
 Mj+Q+LEsvlPm63ZGra4I87Nf6CrBN4PNcSJ2zNNu3xeK++HJH74fS4JwRXaHXgFaC5Dk
 OQe+IFaRzmNz3qe47F2Fh6qEtnoiCQaN/AXVsM7xYRFs9vw441umz9YJ3ZVisMy/Ezsv
 o0bLtu4WJTKNYr6BCMG+UZvW6yPWNOMQH51lArb5h/+pTX+0mduOT5OuXbF4MwOrerVn
 bCLQ==
X-Gm-Message-State: AOAM531TUoMXOLmWBJscYkdEZPVwGoV8xrL+R2IwWGhsdffGHQu6Cz6F
 FNC1ZDZL/ghWNGi+KnNINL2W3ZsZIHnwzqvbnlykjZdVo1SRGPRIPXHBluk4fhv/E57duy/IQst
 /Cx68+/4vmqbCOI5cX4oYKGsP5oe4vTg=
X-Received: by 2002:a2e:a883:: with SMTP id m3mr2163108ljq.472.1635395876281; 
 Wed, 27 Oct 2021 21:37:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyF7yGRIw8BUbNLka+mKaKwBZ5zYPdbzLg/nhQLFjTq/TLFkgvOeCFSZ3pFlRxiI1Un4dCtKZk42pbXSikBVsw=
X-Received: by 2002:a2e:a883:: with SMTP id m3mr2163088ljq.472.1635395876037; 
 Wed, 27 Oct 2021 21:37:56 -0700 (PDT)
MIME-Version: 1.0
References: <20211009075612.230283-1-leobras@redhat.com>
 <20211009075612.230283-4-leobras@redhat.com>
 <20211011193156.biedorxjetduaf7y@redhat.com>
 <CAJ6HWG5neqLVdO_o+uzykOj3S-N5T0XUHv1_7Qo37_pw0eP_ZQ@mail.gmail.com>
 <87sfx6g55m.fsf@dusky.pond.sub.org>
 <CAJ6HWG6a5zDR49LQa3iRKLPVWo7toEOgJugsx3oV1c++pT4rhw@mail.gmail.com>
 <87sfwl3h5i.fsf@dusky.pond.sub.org>
In-Reply-To: <87sfwl3h5i.fsf@dusky.pond.sub.org>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Thu, 28 Oct 2021 01:37:58 -0300
Message-ID: <CAJ6HWG5qg9B-yx=YGvXW3RB+is1A+Ech66o=0=ihCiyUtpmjhQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] multifd: Implement zerocopy write in multifd
 migration (multifd-zerocopy)
To: Markus Armbruster <armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lsoaresp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lsoaresp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 28, 2021 at 1:30 AM Markus Armbruster <armbru@redhat.com> wrote:
>
> Leonardo Bras Soares Passos <leobras@redhat.com> writes:
>
> [...]
>
> >> The general argument for having QAPI schema 'if' mirror the C
> >> implementation's #if is introspection.  Let me explain why that matters.
> >>
> >> Consider a management application that supports a range of QEMU
> >> versions, say 5.0 to 6.2.  Say it wants to use an QMP command that is
> >> new in QEMU 6.2.  The sane way to do that is to probe for the command
> >> with query-qmp-schema.  Same for command arguments, and anything else
> >> QMP.
> >>
> >> If you doubt "sane", check out Part II of "QEMU interface introspection:
> >> From hacks to solutions"[*].
> >>
> >> The same technique works when a QMP command / argument / whatever is
> >> compile-time conditional ('if' in the schema).  The code the management
> >> application needs anyway to deal with older QEMU now also deals with
> >> "compiled out".  Nice.
> >>
> >> Of course, a command or argument present in QEMU can still fail, and the
> >> management application still needs to handle failure.  Distinguishing
> >> different failure modes can be bothersome and/or fragile.
> >>
> >> By making the QAPI schema conditional mirror the C conditional, you
> >> squash the failure mode "this version of QEMU supports it, but this
> >> build of QEMU does not" into "this version of QEMU does not support
> >> it".  Makes sense, doesn't it?
> >>
> >> A minor additional advantage is less generated code.
> >>
> >>
> >>
> >> [*] http://events17.linuxfoundation.org/sites/events/files/slides/armbru-qemu-introspection.pdf
> >>
> >
> > This was very informative, thanks!
> > I now understand the rationale about this choice.
> >
> > TBH I am not very used to this syntax.
> > I did a take a peek at some other json files, and ended adding this
> > lines in code, which compiled just fine:
> >
> > for : enum MigrationParameter
> > {'name': 'multifd-zerocopy', 'if' : 'CONFIG_LINUX'},
> >
> > for : struct MigrateSetParameters and struct MigrationParameters:
> > '*multifd-zerocopy': { 'type': 'bool', 'if': 'CONFIG_LINUX' },
> >
> > Is that enough? Is there any other necessary change?
>
> Looks good to me.
>
> The QAPI schema language is documented in docs/devel/qapi-code-gen.rst.

Thanks for reviewing and for pointing this docs!

>
> If you're curious, you can diff code generated into qapi/ before and
> after adding the 'if'.

Good idea!

>
> > Thanks for reviewing and for helping out with this!
>
> My pleasure!
>

:)

Best regards,
Leo


