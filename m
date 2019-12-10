Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0284D118577
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Dec 2019 11:44:12 +0100 (CET)
Received: from localhost ([::1]:53138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ieczy-0007kS-Ta
	for lists+qemu-devel@lfdr.de; Tue, 10 Dec 2019 05:44:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41957)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iecyu-0007Ie-Q4
 for qemu-devel@nongnu.org; Tue, 10 Dec 2019 05:43:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iecyt-0001Bk-Be
 for qemu-devel@nongnu.org; Tue, 10 Dec 2019 05:43:04 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:43555)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iecyt-0001BE-5a
 for qemu-devel@nongnu.org; Tue, 10 Dec 2019 05:43:03 -0500
Received: by mail-ot1-x341.google.com with SMTP id p8so15056900oth.10
 for <qemu-devel@nongnu.org>; Tue, 10 Dec 2019 02:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3wNv20ZI/+NlxfJ2SpgNyk5Eo8SBu+XA88taA29hMNE=;
 b=GEQyXWa4S2DA8sB+sBP44eIxcfDpqZrAZId9eBSJqrnRtnMvFlKlOM9Uzwa4a0SLrc
 sE1YY8y88WQpATtquK0AaSvU4Ni4WBEgcYbC1ISJtpTcicDxHJsvtUm7T4+OJtyqKn8v
 593wXqPem3pwvc9M4b6yZnL5/8wYevD5i8admdE0qOz1drOAsz4I8tlLaf+QRnlmI2+Q
 wGOuYE097FpsjT8K8rENBWPgYjKPDfb6X/YWIoGGOKbMJ5gdyrEI4mNc/YvJqhdO2CT8
 zZbwzm3NEWHGRu2ZPQS+WIGR0UOTnjR8i+uTeCYUFiZR14ys0XEB0kAIJzfKO/A6EbFc
 t6qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3wNv20ZI/+NlxfJ2SpgNyk5Eo8SBu+XA88taA29hMNE=;
 b=Tnup78BY7bVWCAWh4UrhgmxRPshMJLWgfRtvrcTJnyJr6nvbShWTlOOi/N8IZbMcFI
 MQ1W/Qkf1bWI9duv8uTW5jSPbxH5X5HQRtbI20M8azPFrfLdKYnpARnGLFlzm1xykWPr
 hfwTcmmcdrVioGo0rUZCidpzNLtC0ttWKafRrnhfwTGKyshhpAWDP0iwPfTSyp2GJbLB
 Cg8neU0v+YwZhDFuit0QgB7RWSyNqGTOvD8pqii9XzdF9gSFEsVyU+mSDjnZMxD7xkGe
 +6H9ClvB18dmV3PugTb7swlnFW04A9syHu35U9BoqAM3baukOozAZmE5ncfSxVxuuFzp
 A5JA==
X-Gm-Message-State: APjAAAWRRcRYwYGsK/vSF68x3H08Sly4vw/GLd2pMgZloePxMYkaNvO1
 atn6SOlJV+Bh+J0cgOrhC8ClFhhmFzqVin6DZLJAxw==
X-Google-Smtp-Source: APXvYqzydP+cszW291UucrY6ZZCMzWVWMbbV8JeRbuq96QI34gpO8nVd8b7GaXs7N4evprhCNAe9FstY+Cw5Aciym2Y=
X-Received: by 2002:a05:6830:2001:: with SMTP id
 e1mr23424297otp.97.1575974582177; 
 Tue, 10 Dec 2019 02:43:02 -0800 (PST)
MIME-Version: 1.0
References: <157591411283.46967.15944326590669093952.stgit@bahia.lan>
 <157591411864.46967.18244018296239778673.stgit@bahia.lan>
 <87pngw31ob.fsf@dusky.pond.sub.org>
In-Reply-To: <87pngw31ob.fsf@dusky.pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 Dec 2019 10:42:51 +0000
Message-ID: <CAFEAcA8rVxtHbvEenxRsSFQWY7bE47e060NdxdVPXpCTrEOYHw@mail.gmail.com>
Subject: Re: [for-5.0 PATCH v2 1/3] cpu: Introduce CPUReset callback typedef
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
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
Cc: Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 10 Dec 2019 at 10:39, Markus Armbruster <armbru@redhat.com> wrote:
>
> Greg Kurz <groug@kaod.org> writes:
> > diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> > index 77c6f0529903..047e3972ecaf 100644
> > --- a/include/hw/core/cpu.h
> > +++ b/include/hw/core/cpu.h
> > @@ -74,6 +74,8 @@ typedef struct CPUWatchpoint CPUWatchpoint;
> >
> >  struct TranslationBlock;
> >
> > +typedef void (*CPUReset)(CPUState *cpu);
> > +
> >  /**
> >   * CPUClass:
> >   * @class_by_name: Callback to map -cpu command line model name to an
> > @@ -165,7 +167,7 @@ typedef struct CPUClass {
> >      ObjectClass *(*class_by_name)(const char *cpu_model);
> >      void (*parse_features)(const char *typename, char *str, Error **errp);
> >
> > -    void (*reset)(CPUState *cpu);
> > +    CPUReset reset;
> >      int reset_dump_flags;
> >      bool (*has_work)(CPUState *cpu);
> >      void (*do_interrupt)(CPUState *cpu);
> [...]
>
> Opinion, not objection: such typedefs make the code less obvious.

It's particularly odd here where this class has several
methods but we've only chosen one to privilege with a typedef.

Personal preference: if you use a typedef, typedef the
function type, not the pointer-to-the-function-type.
But I would just leave it be.

thanks
-- PMM

