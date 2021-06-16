Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6283AA06A
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 17:51:11 +0200 (CEST)
Received: from localhost ([::1]:50582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltXos-0007d6-0s
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 11:51:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1ltXmh-0005nY-Lo
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 11:48:55 -0400
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d]:41680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1ltXmf-0006H4-Oj
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 11:48:55 -0400
Received: by mail-io1-xd2d.google.com with SMTP id p66so3514600iod.8
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 08:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=MKecy4krVgYPtiKN//SwtR6H/Y3bYdimls2q+4h80Yc=;
 b=m48WDNkYZnC0RZrxXYZjSfNcaejkeXSsyIDjIVoYpJk8ahPlMpMNty0j9/SPvYkCEh
 40dhXZE2JsRmMZYQM1d0iwsr5lNfWUMYAa+gsZdPjKSEkzdgyOXrExj5z7BeCvAbGBIa
 fvC/VRuv+yYA9gUJd/1rEF9bPqLqytz80UKL+Hcha2NmL5YirClcPoRYZ7PDnIYOjuqn
 qSUxnumd/gilQg84KUnwzZPkqno+b/I/zaeqd0Zi2osMODaHTjau0TnfxV2PpywlMal8
 0KXg72gXlVQlJGJ1m6XGXpcEzMNW01O/hJPgKZ6Rlo6hmbdgFGQsVCBgHLPhAlV4Mt5M
 CWFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=MKecy4krVgYPtiKN//SwtR6H/Y3bYdimls2q+4h80Yc=;
 b=QvIRP5fzMhgD4aBpdcVFTPNuAWF/sgpXENfNeJHpbQswf+7HTfwPv99KyKJq1laRmF
 697nlyrzJ0esjaGxW1cQucSCUbn14QVyatxEkl6TLGfz1NkQmNMBGa41G7QcDhwAFSEl
 tX27MhpjuKSoNxjH3hB7kQ3+HRjG8sREJWDrzf4d+PSSyhgLL/Zlu5yA23mC/gyDcBsD
 TRPXIdGb1dKcKQVHovTN1+JrpxygBGMD5twfJ9QZTX/JuH6DFLMYr7upIKXv/lfaRSlj
 jd87jaDRxVVXBj2xEHUH3Mhsw9zbpMUmQH6i+Cj9Ps6IaQinIJHQDP8quRxgJ9V+xaHW
 z3Dg==
X-Gm-Message-State: AOAM532abw67UpJJzedLwwJLQmHH3rfSdimRIXkOT7rkt1V3FsLKeTQ8
 jbwHNJemoFETKnbF6AteBJd5btcZ+le1K5EQ2Io=
X-Google-Smtp-Source: ABdhPJzvw0wF+d9zNcSdDLdujwrb8gKqD4T9mKn2QDEIjqhIyNohcpbHIqZt4kTCmKYSCEjzRQCGmptvh8s2bKJjlwU=
X-Received: by 2002:a05:6602:807:: with SMTP id z7mr84803iow.128.1623858531955; 
 Wed, 16 Jun 2021 08:48:51 -0700 (PDT)
MIME-Version: 1.0
From: "Niteesh G. S." <niteesh.gs@gmail.com>
Date: Wed, 16 Jun 2021 21:18:26 +0530
Message-ID: <CAN6ztm8D4VMf7p-trHNHoOA+1kAXXufTTaHpbyNXZ5qO2_uuPg@mail.gmail.com>
Subject: RFC: Implementation of QMP documentation retrieval command
To: John Snow <jsnow@redhat.com>, armbru@redhat.com, 
 Stefan Hajnoczi <stefanha@redhat.com>, kwolf@redhat.com, ehabkost@redhat.com, 
 wainersm@redhat.com, qemu-devel@nongnu.org, vsementsov@virtuozzo.com
Content-Type: multipart/alternative; boundary="000000000000f6791a05c4e406ac"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2d;
 envelope-from=niteesh.gs@gmail.com; helo=mail-io1-xd2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f6791a05c4e406ac
Content-Type: text/plain; charset="UTF-8"

Hello,

We now have a reasonably working prototype that is capable of
sending/receiving
commands/responses, syntax highlighting, and a simple notification system.
The
prototype can be found here
https://gitlab.com/niteesh.gs/qemu/-/tree/aqmp-tui-prototype
Working on this prototype gives us a lot of hints on things to worry about
and other
ideas that were worth implementing. Our next goal is to start working on
the real TUI
based on this prototype.

One requested feature of the TUI was to show documentation for the commands
typed.
To achieve this, a QMP command that lets us query the documentation from
QEMU has
to be implemented and some discussion has already been done on it in a
previous thread.
I request all continue that discussion here and suggest ideas regarding
implementation.
The goal is to come up with something small and simple which can also be
improved upon
after the summer.

I have a simple implementation of the command that returns dummy
documentation here
https://gitlab.com/niteesh.gs/qemu/-/commit/796a41fb2840b9f3484c6fd5672e6fceb73acaef

Thanks,
Niteesh.

--000000000000f6791a05c4e406ac
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">Hel=
lo,</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><=
div class=3D"gmail_default" style=3D"font-size:small">We now have a reasona=
bly working prototype that is capable of sending/receiving</div><div class=
=3D"gmail_default" style=3D"font-size:small">commands/responses, syntax hig=
hlighting, and a simple notification system. The</div><div class=3D"gmail_d=
efault" style=3D"font-size:small">prototype can be found here <a href=3D"ht=
tps://gitlab.com/niteesh.gs/qemu/-/tree/aqmp-tui-prototype">https://gitlab.=
com/niteesh.gs/qemu/-/tree/aqmp-tui-prototype</a></div><div class=3D"gmail_=
default" style=3D"font-size:small">Working on this prototype gives us a lot=
 of hints on things to worry about and other</div><div class=3D"gmail_defau=
lt" style=3D"font-size:small">ideas that were worth implementing. Our next =
goal is to start working on the real TUI</div><div class=3D"gmail_default" =
style=3D"font-size:small">based on this prototype.</div><div class=3D"gmail=
_default" style=3D"font-size:small"><br></div><div class=3D"gmail_default" =
style=3D"font-size:small">One requested feature of the TUI was to show docu=
mentation for the commands typed.</div><div class=3D"gmail_default" style=
=3D"font-size:small">To achieve this, a QMP command that lets us query the =
documentation from QEMU has</div><div class=3D"gmail_default" style=3D"font=
-size:small">to be implemented and some discussion has already been done on=
 it in a previous thread.</div><div class=3D"gmail_default" style=3D"font-s=
ize:small">I request=C2=A0all continue that discussion here and suggest ide=
as regarding implementation.</div><div class=3D"gmail_default" style=3D"fon=
t-size:small">The goal is to come up with something small and simple which =
can also be improved upon</div><div class=3D"gmail_default" style=3D"font-s=
ize:small">after the summer.</div><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:sma=
ll">I have a simple implementation of the command that returns dummy docume=
ntation here</div><div class=3D"gmail_default" style=3D"font-size:small"><a=
 href=3D"https://gitlab.com/niteesh.gs/qemu/-/commit/796a41fb2840b9f3484c6f=
d5672e6fceb73acaef">https://gitlab.com/niteesh.gs/qemu/-/commit/796a41fb284=
0b9f3484c6fd5672e6fceb73acaef</a></div><div class=3D"gmail_default" style=
=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-s=
ize:small">Thanks,</div><div class=3D"gmail_default" style=3D"font-size:sma=
ll">Niteesh.</div></div>

--000000000000f6791a05c4e406ac--

