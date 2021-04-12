Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0AE35C7DA
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 15:42:55 +0200 (CEST)
Received: from localhost ([::1]:37646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVwq6-0003aF-3N
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 09:42:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <li.zhang@ionos.com>)
 id 1lVwpK-00030j-Jt
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 09:42:06 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:45779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <li.zhang@ionos.com>)
 id 1lVwpI-0002bn-HZ
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 09:42:06 -0400
Received: by mail-ej1-x633.google.com with SMTP id sd23so11690754ejb.12
 for <qemu-devel@nongnu.org>; Mon, 12 Apr 2021 06:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ionos.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1rR5vrkkT6oBSlYp2FTz7RVix+3FrZUpGB9zV+UmPdk=;
 b=C5J5UdmcD/ALZWQZPATjoMBxfawXtgXoi2P8DZlLjuaCIVBiVrXphG8tB2OKkQCQRn
 aOUeZGNG7fKvqZR+mOs7tR1D8VO4d1pEpyc7mWlNnqWyi7V6or+xB1l4KSK6nbU3FN2F
 DTo/111/+eb7f0cgGKo8aT3ORJm1Rrck7JPFMU9TMMRrFXia1xPT7liiuAXk/C6t/3rZ
 I+BYumTH2/n5UcEGCPaOW09VKHrzXo/OjoS9y+gZyVxZMZFkvOrPpMjQgAuwY8utpLTB
 ChpXKuieC+2bqCgal1Zaz4xD7VxoyEdgYVZXjqyXkUw3towYQZN2NLD699DQRMoa7Fc7
 Gldw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1rR5vrkkT6oBSlYp2FTz7RVix+3FrZUpGB9zV+UmPdk=;
 b=bNHNulJd21df2p6P+tEQxU4mGL6iLmhC7HNvRBzYLhkaZk4t/oQ+dJ1D4h1IiOSwPI
 fTM4K80dVjXRCwtv3YVyGHTBFPfkf2kUfaeyGbhjOcWhkhTctzEG/2UZB5nPb+65u3RV
 39bkcYYuJW5590tFF/IOng1WzLVuKl0mxK5mnxc4B+vTX9b360bRLQ0m65RDWEnDzJ1t
 dA2QBtvXyglf9wX16CtY9VkXHbCeig189APu342987p8ehFClc+YAHZmbghFxOV7R6BM
 OeicY5gkyfRMjppS2Hylv9XIX6pEW6Ng3iFWmthDsRhp0XIbTUfvM3nkoP/NYa57P6vJ
 f61g==
X-Gm-Message-State: AOAM530gSVC94qoKiT2PZwUqd0lrHbNC2i4PADqIGTFACe0etmY7KSQ5
 W9FL5wivudX1/nQ8tAmh5sHElhArR09JmdfU9XFOqg==
X-Google-Smtp-Source: ABdhPJxjjl8muIyztXQt8VsMWQuJvVenCjSAV8s1xES7YRCFjCLFRcg6V7DM/vchfJEmrfFFdy7oBIQw2/yEM7w3WiM=
X-Received: by 2002:a17:907:3e8c:: with SMTP id
 hs12mr27439137ejc.105.1618234922573; 
 Mon, 12 Apr 2021 06:42:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210315170636.704201-1-zhlcindy@gmail.com>
 <20210315170636.704201-2-zhlcindy@gmail.com>
 <CAEM4iGG67hQDPVrKbSsSpsrpbc12+ky=ROh26QUqO5C0+q0jXg@mail.gmail.com>
 <874kgykmgv.fsf@dusky.pond.sub.org>
 <CAEM4iGG4F7eBNXDhjtnFGiy2paJxVuZOm7xYWTMrm9MKEgU8JA@mail.gmail.com>
 <871rbf7inr.fsf@dusky.pond.sub.org>
In-Reply-To: <871rbf7inr.fsf@dusky.pond.sub.org>
From: Li Zhang <li.zhang@ionos.com>
Date: Mon, 12 Apr 2021 15:41:51 +0200
Message-ID: <CAEM4iGEs5edKzih6Rq66etDNWoEbxmDdvRuuQLN1mgYEMJ0jgg@mail.gmail.com>
Subject: Re: [PATCH 2/2] Support monitor chardev hotswap with QMP
To: Markus Armbruster <armbru@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000b9356605bfc6ad98"
Received-SPF: permerror client-ip=2a00:1450:4864:20::633;
 envelope-from=li.zhang@ionos.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_PERMERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Lukas Straub <lukasstraub2@web.de>, alexandr.iarygin@profitbricks.com,
 QEMU <qemu-devel@nongnu.org>, Li Zhang <li.zhang@cloud.ionos.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>, Li Zhang <zhlcindy@gmail.com>,
 marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000b9356605bfc6ad98
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Markus,

[PATCH 1/2] Fix the segment fault when calling yank_register_instance is
reworked by Lukas.
And his patches have been merged to master branch of qemu.
[PATCH 2/2]  Support monitor chardev hotswap with QMP is to change monitor
backend with chardev-change. It is not implemented yet.


On Mon, Apr 12, 2021 at 3:10 PM Markus Armbruster <armbru@redhat.com> wrote=
:

> Li Zhang <li.zhang@ionos.com> writes:
>
> > Hi Markus,
> >
> > Any suggestions on this patch?
>
> I understand PATCH 1/2 got superseded by Lukas's "[PATCH v8 0/4] yank:
> Add chardev tests and fixes".  I trust Marc-Andr=C3=A9 will take care of =
it
> in due time.
>
> Before I look at the actual patch: does this patch depend on Lukas's fix
> or your "[PATCH 1/2] Fix the segment fault when calling
> yank_register_instance"?
>
>

--000000000000b9356605bfc6ad98
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div>Hi Markus,=C2=A0</div><div><br></div><div>[PATCH =
1/2] Fix the segment fault when calling yank_register_instance is reworked =
by Lukas.=C2=A0</div><div>And his patches have been merged to master branch=
 of qemu.=C2=A0</div><div>[PATCH 2/2]=C2=A0=C2=A0Support monitor chardev ho=
tswap with QMP is to=C2=A0change monitor backend with chardev-change. It is=
 not implemented yet.=C2=A0=C2=A0</div><div><span style=3D"color:rgb(32,33,=
36);font-family:&quot;Google Sans&quot;,Roboto,RobotoDraft,Helvetica,Arial,=
sans-serif;font-size:1.375rem;font-variant-ligatures:no-contextual"></span>=
</div><div><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Mon, Apr 12, 2021 at 3:10 PM Markus Armbruster &lt;=
<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">Li Zhang &lt;<a href=
=3D"mailto:li.zhang@ionos.com" target=3D"_blank">li.zhang@ionos.com</a>&gt;=
 writes:<br>
<br>
&gt; Hi Markus,<br>
&gt;<br>
&gt; Any suggestions on this patch?<br>
<br>
I understand PATCH 1/2 got superseded by Lukas&#39;s &quot;[PATCH v8 0/4] y=
ank:<br>
Add chardev tests and fixes&quot;.=C2=A0 I trust Marc-Andr=C3=A9 will take =
care of it<br>
in due time.<br>
<br>
Before I look at the actual patch: does this patch depend on Lukas&#39;s fi=
x<br>
or your &quot;[PATCH 1/2] Fix the segment fault when calling<br>
yank_register_instance&quot;?<br>
<br>
</blockquote></div>

--000000000000b9356605bfc6ad98--

