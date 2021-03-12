Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 676DE338B79
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 12:29:41 +0100 (CET)
Received: from localhost ([::1]:38072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKfzA-0006AC-DY
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 06:29:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1lKfxN-0004rE-RY
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 06:27:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1lKfxL-0006UQ-Dl
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 06:27:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615548464;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lRgV0XlI0V6k56DAeKe8jp8okBxaYV/FXvzC7qBzCaM=;
 b=JN3aAFV5RCEVTwauInT3H1sVpYxMq31fG7ogb+2VpPgpkHO6xnxYATFiA372BUwoVzEBbr
 oXy9oJAd6CDIMhzj375w5anxdeN/JpKlCPnIN4VcoWkab3izzYGX4+WgLwIw9D14MK7i+P
 Qa0z/vUJ6bgZZJeLvZVG38qGzh7JgOo=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-253-YVV60SK-MO-nn-a2H6FdRQ-1; Fri, 12 Mar 2021 06:27:42 -0500
X-MC-Unique: YVV60SK-MO-nn-a2H6FdRQ-1
Received: by mail-io1-f69.google.com with SMTP id y2so17498192ioa.23
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 03:27:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lRgV0XlI0V6k56DAeKe8jp8okBxaYV/FXvzC7qBzCaM=;
 b=hYvAXdrDFAq4iRbLbq394m+0JyRKMJdYO4cr1EXsKRQIqS0kgNrrVL1EBMhdhTh5L7
 CwV/VNPsL5rqw6x1UfEFyPwKIMX1WvAKO/w+jOqehVgRKVsn+hPI0LTqiASJvAvzcAml
 8ef0vC80PmqJdxFUdKx/1BMwT4h95VXtfqmBXjJukA5DQXMh+AxO9KtPxQi7cbiO01BO
 1BvXf2rKM9Rol8l4Ds2UqFSJMbnnQsLMjzdrQkC+aogIwvKr+lcse8Mc4qN4vhDWNIvk
 97upr4RXSkWunqrz0yflKNsF3tzg0vXWWFaisNR0sNfXK+a14nB4Ug4Sowcxw2WfZSbF
 SO6A==
X-Gm-Message-State: AOAM5318vHyEw9gIHD+JPp8YFTHFso1cKXGZHdTXtDyPcfcCZPYYI5vz
 e3KwtjN16gureksL9N5kKeFjXZ1kXIi7BT7ckh9uwLus/4CGPsbQns3x6fA6Z2xTJ+LUVdbbUfB
 PH+RFKNyOSQUqiR9d/RA77p7U9XwuuAE=
X-Received: by 2002:a05:6e02:1845:: with SMTP id
 b5mr2432927ilv.11.1615548462172; 
 Fri, 12 Mar 2021 03:27:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzQO3ORKTFmC1aGh0onnpJTgxA1NACWE3tRkasIWDkcy0n+5ZkYGK+o3ZhXxDHKix1PG0n000tz8d3hIT9F2qQ=
X-Received: by 2002:a05:6e02:1845:: with SMTP id
 b5mr2432917ilv.11.1615548462033; 
 Fri, 12 Mar 2021 03:27:42 -0800 (PST)
MIME-Version: 1.0
References: <20210312100108.2706195-1-marcandre.lureau@redhat.com>
 <20210312100108.2706195-15-marcandre.lureau@redhat.com>
 <20210312110344.7ssrivw5i72ac6xg@sirius.home.kraxel.org>
In-Reply-To: <20210312110344.7ssrivw5i72ac6xg@sirius.home.kraxel.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Fri, 12 Mar 2021 15:27:31 +0400
Message-ID: <CAMxuvaw9bDo2jJJ2qhCiHy7NVyxbXU60p6zuZe1ouFJAwiz6xw@mail.gmail.com>
Subject: Re: [PATCH 14/27] ui: add a D-Bus display backend
To: Gerd Hoffmann <kraxel@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000003288b605bd5530d7"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000003288b605bd5530d7
Content-Type: text/plain; charset="UTF-8"

Hi

On Fri, Mar 12, 2021 at 3:03 PM Gerd Hoffmann <kraxel@redhat.com> wrote:

>   Hi,
>
> > The "dbus" ui/display backend exports the QEMU consoles over a currently
> > unstable D-Bus protocol defined in ui/dbus-display1.xml (it is subject
> > to changes at each releases, so only client shipped with the same QEMU
> > release will be fully compatible).
>
> Hmm, so we get a new protocol here.
>
> A different idea which crossed my mind after reading the pipewire
> article of last weeks lwn.net edition:  pipewire has video support.
> It also has audio support.  gnome uses it for remote desktop support,
> so support for cursors and mouse/keyboard backchannel should be there
> too.
>
> In other words: pipewire should have all the pieces needed to build a
> qemu UI with it.
>
> I haven't found the time yet to investigate more, but integrating qemu
> with pipewire looks much more attractive to me than inventing a new
> protocol ...
>
>
Perhaps that could work for audio & video (where is the protocol defined?).
But what about the rest? input events, consoles, usb redirection, etc.
Remember the goal is to be able to implement any display backend in a
standalone project. Eventually, the RegisterListener & Listener interface
could become RegisterPipewireListener for example.

--0000000000003288b605bd5530d7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar 12, 2021 at 3:03 PM Ger=
d Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com">kraxel@redhat.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=C2=A0=
 Hi,<br>
<br>
&gt; The &quot;dbus&quot; ui/display backend exports the QEMU consoles over=
 a currently<br>
&gt; unstable D-Bus protocol defined in ui/dbus-display1.xml (it is subject=
<br>
&gt; to changes at each releases, so only client shipped with the same QEMU=
<br>
&gt; release will be fully compatible).<br>
<br>
Hmm, so we get a new protocol here.<br>
<br>
A different idea which crossed my mind after reading the pipewire<br>
article of last weeks <a href=3D"http://lwn.net" rel=3D"noreferrer" target=
=3D"_blank">lwn.net</a> edition:=C2=A0 pipewire has video support.<br>
It also has audio support.=C2=A0 gnome uses it for remote desktop support,<=
br>
so support for cursors and mouse/keyboard backchannel should be there<br>
too.<br>
<br>
In other words: pipewire should have all the pieces needed to build a<br>
qemu UI with it.<br>
<br>
I haven&#39;t found the time yet to investigate more, but integrating qemu<=
br>
with pipewire looks much more attractive to me than inventing a new<br>
protocol ...<br>
<br></blockquote><div><br></div><div>Perhaps that could work for audio &amp=
; video (where is the protocol defined?). But what about the rest? input ev=
ents, consoles, usb redirection, etc. Remember the goal is to be able to im=
plement any display backend in a standalone project. Eventually, the Regist=
erListener &amp; Listener interface could become RegisterPipewireListener f=
or example.<br></div></div></div>

--0000000000003288b605bd5530d7--


