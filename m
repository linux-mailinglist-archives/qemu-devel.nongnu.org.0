Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20BB34A9050
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 22:58:16 +0100 (CET)
Received: from localhost ([::1]:43512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFk7K-0006kl-NT
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 16:58:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nFjRa-0000dJ-MY
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 16:15:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nFjRS-0007G7-LC
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 16:15:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643922894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=z7MIcySQozl1AhEPSIcnoM2vv078hygVfv5gD7r0hbM=;
 b=gF6iDV+lSvWKSBg8ry9m/QEiSJzzQlRvFG+vuaMUGdawB/D3NX+ds3Rstd9h7N2vbk/4L3
 r2fS8CPUzNbZoB0ZpCaO2EAZ5LwkNw4rnHKnR1et8z/030j+8n8DS6CtV+u0uKwUQcM7/t
 vvW6hpkU2fOpkRkWS2khS7Sm/Ro/73s=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-651-Kbp2rWnxNaWhI41HAcyICQ-1; Thu, 03 Feb 2022 16:14:53 -0500
X-MC-Unique: Kbp2rWnxNaWhI41HAcyICQ-1
Received: by mail-ua1-f70.google.com with SMTP id
 y7-20020ab05607000000b003065444c62dso2306495uaa.13
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 13:14:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z7MIcySQozl1AhEPSIcnoM2vv078hygVfv5gD7r0hbM=;
 b=Og78UHuaWc7zvko0S3GZXp5lWLk9iqUSrvOjS6ie5+tuL+egH+NqGHA43/Wj7GqbXp
 /z3hSxeT9VRImmezyKqzXZmTMYhqW+U1zSZUxtCd8Gx0Y5Dx54nw/5XT+iaTkDHHAW/v
 FfTVcDVryCRuKiy5INNQO9E+ToneH8973O6Sw3bzkt7b5JX8eUCTz8vLH8+zokztlO08
 0aXZsRi1Xj3hldSs3+VTCvdq/qb6AXnBX0CvpK5657+hR5ep96s128MuI6inC9meE/vU
 zTGggWynJpb2U+SVor+FIe8vdNkw8TWWzG5nmWLPAmaqpf0Veu31m373+4+qou4QYM++
 zrZw==
X-Gm-Message-State: AOAM530yYBMuwuBze1YQsErEnuqrBzAlc2r3nX0/Jf3xHEswMr42rOnc
 933+p02IkpZYNd1Tl8Zu+uE5J9QzQxtPOjMMwWjalkJd+N1JlhxU/9muo2SY3BRnQfCGGNxGWl6
 OglxHpJEuSoH56hAb/ZZ6G/33e1n0neg=
X-Received: by 2002:a05:6102:348:: with SMTP id e8mr9368vsa.11.1643922879248; 
 Thu, 03 Feb 2022 13:14:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx/mdLvLdy6zYpMVa/2z+Z09Kow2otXx6S2LJEjLTFVcc7mGYuKywJrGag6Rd0JR/JlX/KE6TgsVpodd+5t3lI=
X-Received: by 2002:a05:6102:348:: with SMTP id e8mr9359vsa.11.1643922878964; 
 Thu, 03 Feb 2022 13:14:38 -0800 (PST)
MIME-Version: 1.0
References: <CAFn=p-aminDYVjPgnR+4x9U3L=Loi55vsHbPq+EOK4AUE_fLeg@mail.gmail.com>
 <871r0tp96s.fsf@dusky.pond.sub.org>
 <CAFn=p-YEVpqMFUNt8-svhEMCvu4HEUvO06DUmJn3GZC0pTnf7Q@mail.gmail.com>
 <874k5g4687.fsf@pond.sub.org>
In-Reply-To: <874k5g4687.fsf@pond.sub.org>
From: John Snow <jsnow@redhat.com>
Date: Thu, 3 Feb 2022 16:14:28 -0500
Message-ID: <CAFn=p-YiXcYkdHwqRCvQDKP3vYwv5u4CFnxMCcBGnzSyNF9zVw@mail.gmail.com>
Subject: Re: Notes on Generating Python signatures for QMP RPCs
To: Markus Armbruster <armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.086,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Victor Toso de Carvalho <victortoso@redhat.com>,
 Andrea Bolognani <abologna@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 3, 2022 at 5:04 AM Markus Armbruster <armbru@redhat.com> wrote:
> John Snow <jsnow@redhat.com> writes:
> > On Thu, Jan 27, 2022 at 9:03 AM Markus Armbruster <armbru@redhat.com> wrote:
> >> John Snow <jsnow@redhat.com> writes:

> >> > (7) I have no idea what to do about functions that "may not return".
> >> > The QGA stuff in particular, I believe, is prone to some weirdness
> >> > that violates the core principles of the QMP spec.
> >>
> >> Yes.
> >>
> >> docs/interop/qmp-spec.txt dictates a command sends either a success or
> >> an error response.  Makes sense.
> >>
> >> QGA has a few commands that shut down the guest.  How could such a
> >> command send a success response?  If it sends it before it initiates
> >> shutdown, response transmission races with shutdown.  The easy way out
> >> is violating qmp-spec.txt.  Thus, 'success-response': false.  Just for
> >> QGA.
> >>
> >
> > Oh, whoops, I already have the information we need. O:-)
> > (Assuming that 'success-response' is visible in the introspection data, anyway.
>
> qapi/introspect.json:
>
>     ##
>     # @SchemaInfoCommand:
>     [...]
>     # TODO: @success-response (currently irrelevant, because it's QGA, not QMP)
>     #
>     # Since: 2.5
>     ##
>     { 'struct': 'SchemaInfoCommand',
>       'data': { 'arg-type': 'str', 'ret-type': 'str',
>                 '*allow-oob': 'bool' } }
>
> The TODO neglects to spell out "and QGA doesn't support introspection so
> far".
>

Oof, ouch, my bones.

What will it take to add introspection to QGA? (Is this GSoC/Outreachy
appropriate?)
(This is not critically important to me, just a backburner thought.)

--js


