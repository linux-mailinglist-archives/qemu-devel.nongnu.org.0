Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5773C40EAA8
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 21:08:15 +0200 (CEST)
Received: from localhost ([::1]:37454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQwk1-0002bP-Sp
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 15:08:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mQwio-0001ZC-0Q
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 15:06:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43129)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mQwij-0000aW-Ty
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 15:06:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631819212;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=omF1Fk7KJoOCRtxMOvNEn0dwaf234UZ163YAl6k/Q/k=;
 b=ZozZdG1xyMRGeUGACGWXlDP45CGgC55HG2dQzF/h7p7F2H4dXJrGf96NR/nl+P68d/5KbC
 d7toWZ9Rl1QiF12evx0xP4VZ3q1dmUiExkP+0RMZ3G/q4OrnJ24IlrOL3I+g0snFeY9+LW
 4CVXJtdKz1QWGt2wXHGGxj479kPgu84=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-104-SvJJlWWtMI2VBFczJMnZFA-1; Thu, 16 Sep 2021 15:06:50 -0400
X-MC-Unique: SvJJlWWtMI2VBFczJMnZFA-1
Received: by mail-ot1-f71.google.com with SMTP id
 76-20020a9d0152000000b0053b372910bbso36062432otu.14
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 12:06:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=omF1Fk7KJoOCRtxMOvNEn0dwaf234UZ163YAl6k/Q/k=;
 b=fLU8AvPuoZJHoDsISX9xPtzgecmtyOPisw7HOpbaaLBDuKKPsOSwiR6BBsXXcujtQx
 87cvK8sJjQQyNeSeJcMnXI/gDp5aIzZppbHQkay+3YPYfxkT3u01oNi7FvAtj9SFdg9o
 92M7p9r+PFENii/4CurJR9yzYDao4gHCq8W62TCPuZHJYbuPstsRjiId7RVne+mj3CN+
 dTBf+l2gwT3cTwjmBYlab+c+wp+IJHEC+JTIPCKqBdFkBKSQ6IiCqoieEAGO7XMKOI2Q
 cJKWsRVbCy1IqETLwOaTkpsere2dS/Qdy+NwgO1RXSvi9ZnJD2Q3bB/ks5oKOdfxCo2Q
 GZpg==
X-Gm-Message-State: AOAM533s9BCOzEtPQ4lYOP7wqJrYcbodLHLSjiaOupH/8NouU10JLM39
 zgAXJBYqXZOY5Ushbjyi+GnIR/M7cmLJnQCZtZhKCM/jUHOq4tbdJQE2mjBSJ/zqKpLnlFhdgyA
 FSp3EiOygpOvwqLX3ns/OIG7R5VwbcLc=
X-Received: by 2002:a05:6830:310c:: with SMTP id
 b12mr2658378ots.252.1631819209558; 
 Thu, 16 Sep 2021 12:06:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwxNN6dO35kh43hQXUrtVl332LMaHEH5PCjngLlMWr+OLuQRwPzjrtit1x4eos4Ysj9W6N/TX1bGsGYeZKTeWA=
X-Received: by 2002:a05:6830:310c:: with SMTP id
 b12mr2658362ots.252.1631819209370; 
 Thu, 16 Sep 2021 12:06:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210916182248.721529-1-jsnow@redhat.com>
In-Reply-To: <20210916182248.721529-1-jsnow@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 16 Sep 2021 15:06:38 -0400
Message-ID: <CAFn=p-Yvx-Mxi0aNpEBZOiKgiafrzPcbAVPt8ezaf4wKZ928bw@mail.gmail.com>
Subject: Re: [PATCH 0/2] Python: update CI tests for pylint 2.10 and 2.11
To: qemu-devel <qemu-devel@nongnu.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000050008505cc21849f"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000050008505cc21849f
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 16, 2021 at 2:22 PM John Snow <jsnow@redhat.com> wrote:

> GitLab: https://gitlab.com/jsnow/qemu/-/commits/python-package-pylint-211
> CI: https://gitlab.com/jsnow/qemu/-/pipelines/372122981
>
> While debating the fix for 2.10, 2.11 released and added new warnings to
> suppress.
>
> This version includes everything needed to get the Gitlab CI green again.
>
> John Snow (2):
>   python: Update for pylint 2.10
>   python: pylint 2.11 support
>
>  python/qemu/machine/machine.py | 7 ++++++-
>  python/setup.cfg               | 3 ++-
>  2 files changed, 8 insertions(+), 2 deletions(-)
>
>
Eduardo, Willian: Thank you very much!

I have staged this on my python branch:
https://gitlab.com/jsnow/qemu/-/commits/python

PR to follow as soon as the lights turn green.

--js

--00000000000050008505cc21849f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 16, 2021 at 2:22 PM John =
Snow &lt;<a href=3D"mailto:jsnow@redhat.com">jsnow@redhat.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">GitLab: <a hre=
f=3D"https://gitlab.com/jsnow/qemu/-/commits/python-package-pylint-211" rel=
=3D"noreferrer" target=3D"_blank">https://gitlab.com/jsnow/qemu/-/commits/p=
ython-package-pylint-211</a><br>
CI: <a href=3D"https://gitlab.com/jsnow/qemu/-/pipelines/372122981" rel=3D"=
noreferrer" target=3D"_blank">https://gitlab.com/jsnow/qemu/-/pipelines/372=
122981</a><br>
<br>
While debating the fix for 2.10, 2.11 released and added new warnings to<br=
>
suppress.<br>
<br>
This version includes everything needed to get the Gitlab CI green again.<b=
r>
<br>
John Snow (2):<br>
=C2=A0 python: Update for pylint 2.10<br>
=C2=A0 python: pylint 2.11 support<br>
<br>
=C2=A0python/qemu/machine/machine.py | 7 ++++++-<br>
=C2=A0python/setup.cfg=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 3 ++-<br>
=C2=A02 files changed, 8 insertions(+), 2 deletions(-)<br>
<br></blockquote><div><br></div><div>Eduardo, Willian: Thank you very much!=
</div><div><br></div><div>I have staged this on my python branch:</div><div=
><a href=3D"https://gitlab.com/jsnow/qemu/-/commits/python">https://gitlab.=
com/jsnow/qemu/-/commits/python</a></div><div><br></div><div>PR to follow a=
s soon as the lights turn green.</div><div><br></div><div>--js<br></div></d=
iv></div>

--00000000000050008505cc21849f--


