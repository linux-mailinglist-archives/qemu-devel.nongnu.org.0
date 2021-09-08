Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82301403FD5
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 21:34:18 +0200 (CEST)
Received: from localhost ([::1]:46358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mO3Kr-00036E-3T
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 15:34:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mO3Ju-0002OF-Vl
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 15:33:19 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:46034)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mO3Js-0002L6-O9
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 15:33:18 -0400
Received: by mail-wr1-x430.google.com with SMTP id n5so4848388wro.12
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 12:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uY57r806Y2Wgmp/gkdWFvIqr6CrKILggoVGfZYYyHjs=;
 b=X9g7tt4JciBtM1INVlqWQOLEkuyAGwsoRH+iM98ll4pzV32pSwbWeWCCppqHn3DndK
 Vkl2VbIraJlqhmj+RsanZH2pcOBcT6UmTdj+TgmhSrIyMQFW5CaXynTcwRMVUyvBbFdM
 ZNcRxHOf9GfHTmaWw7wU88bdnIKo0c6aGGZ8EJkKztvISB5nFXEQy375KabTKWOw1HvR
 HNm/cl8S1UqVPW0ejghOntJY9en+g2uEebobi+2dzQq8EzctcUSWxIo2n/rY9U1XjufO
 yO51maP0N09APx2ZzmunkdMc/BMkjiZFoH+NuEeQQsP2wSiaCVaBN+xW5GzhtUEabS0d
 46RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uY57r806Y2Wgmp/gkdWFvIqr6CrKILggoVGfZYYyHjs=;
 b=UCqR09BL9SW5euhECmj/SqZJEGMHfYQi2s8g+x9F2ogJXO1IPnqNCaejuzk/JHqrnk
 0EbltuzMKmy+xX4GDeXnvjeOxGMNfCDfhl9u/K0jlNLefeu0RxZmuQYZTnMMUnrUDyAT
 KJZ88Mv0/O3NXCuU0mWJ2c7yxQKeI1yZyisYFe0/QqD9bGs/foSp2Qi5N1EhUYsbo+Cl
 fYpTzm24bODw2WRb8sz2KVq1YWmvde+A1R+gHPYu+D6zEYZxJsKzXgHDVCKAmWUtlLAS
 6lBHIvovvYZtVGjy6FKtk7SOHdKrUgAzvQDeoYkV2zHvhqR5dcnstJN5mQmarFerv9KL
 J5sg==
X-Gm-Message-State: AOAM533lw4f19VrkGjvUq347tKTAHIHhbqRWBu7xrmNNb6v2jqOYVjCp
 FD5MldPVyKVWw3kgft8P0oLGn7gz4EmY9Qk8AcQ=
X-Google-Smtp-Source: ABdhPJxwvD8+jU3Y2oDwIExYAbQr/IxhMW6YB+Z4iQHuwxP5ZZcg/DUOD3Hi3MA3S16nS36anaWUlMuvlecMsZIY6x4=
X-Received: by 2002:adf:e404:: with SMTP id g4mr5794004wrm.143.1631129594213; 
 Wed, 08 Sep 2021 12:33:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210907121943.3498701-1-marcandre.lureau@redhat.com>
 <20210907121943.3498701-14-marcandre.lureau@redhat.com>
 <24888.55565.53378.616422@mariner.uk.xensource.com>
 <CAJ+F1CJR9hAd+2MJZ1X9s2vBW=fG++mgk75M+Ww166orq3KdNg@mail.gmail.com>
 <24888.58624.549030.64132@mariner.uk.xensource.com>
 <CAJ+F1CJFdrU38BwK=V-89fYYu3ySywREAF-WuBNJLftsMP52rg@mail.gmail.com>
 <24888.59891.24033.552735@mariner.uk.xensource.com>
In-Reply-To: <24888.59891.24033.552735@mariner.uk.xensource.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 8 Sep 2021 23:33:02 +0400
Message-ID: <CAJ+F1C+WpJd5bg0oH=2Tt_B973QDqtSan0zM0pT00xxSBj7m8w@mail.gmail.com>
Subject: Re: [RFC v3 13/32] rust: use vendored-sources
To: Ian Jackson <iwj@xenproject.org>
Content-Type: multipart/alternative; boundary="0000000000000bb99405cb80f490"
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wr1-x430.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000000bb99405cb80f490
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Sep 8, 2021 at 8:51 PM Ian Jackson <iwj@xenproject.org> wrote:

> Marc-Andr=C3=A9 Lureau writes ("Re: [RFC v3 13/32] rust: use vendored-sou=
rces"):
> > Yes, this is the shim to provide a C ABI QMP handler from Rust. This is
> where
> > all the FFI<->Rust conversion takes place.
> >
> > The "safe" code is qga/qmp/vcpus.rs. However, there is no
> > documentation there, since it's not meant to be the public
> > interface. It's documented with the QAPI schema.
>
> Right, thanks.  That does look like a PoC of a Rust API.  I wanted the
> rustdoc output because I find it provides a very uniform and readable
> presentation even of an API with no doc comments.
>
> I think maybe a thing I am missing is how you expect this to be used.
> Which parts of the system are going to be in Rust.  etc.
> And that would help explain what "public" means.
>
> I think the answer is probably in this example:
>
>
> https://patchew.org/QEMU/20210907121943.3498701-1-marcandre.lureau@redhat=
.com/20210907121943.3498701-30-marcandre.lureau@redhat.com/
>
> but although my C and Rust are both fine, I don't understand qemu well
> enough to make sense of it.
>
> ... wait, qga is "qemu guest agent" ?
>
> I think I am sort of seeing this use case now.  But presuambly there
> are other use cases for this QMP/QAPI type bridge stuff.
>
> Sorry to be asking such stupid questions.
>

There is no magic wand to introduce Rust code in an existing C code base.
You need to glue some C ABI to/from Rust. It's a lot of manual work to
properly bind a C API to Rust (it's a project on its own I would say).
Typically, FFI bindings can be automated from headers, and high-level Rust
bindings are done by hand. Then you want high-level bindings to take
advantage of Rust, for idiomatic and safe code. Various internal QEMU API
will have to be bound by hand to start using them from Rust. An isolated
unit (say a parser, a function) could be rewritten in Rust and a C ABI be
provided without much hassle. But in general, code is quickly
interdependent, or the amount of stuff to rewrite in one go is large and
risky to do it that way.

In the glib/gobject world, the ABI are annotated, and you can automate much
of the high-level binding process (which is amazing, given the complexity
of the APIs, with objects, async methods, signals, properties, .. various
concepts that don't match easily in Rust). To help with this process, they
introduced conversion traits (the ToQemu/FromQemu adapted here), common
interfaces, to help automate and compose complex types (and their own
binding generator).

(Unfortunately) QEMU doesn't use gobject, but it relies heavily on two type
systems of its own: QAPI and QOM. QAPI is actually more of an IDL, which
translates C from/to JSON/QMP and has commands and signals (and is the
protocol used to communicate with qemu or qemu-ga etc). A large part of
QEMU are direct users of the QAPI generated types and functions. It is thus
a good target to generate bindings automatically. As demonstrated at the
end, it allows writing QMP handlers in idiomatic Rust. Since
qemu-guest-agent doesn't have a complex internal state (most commands are
really independent, they could be different programs..!), I started
rewriting some handlers there. It feels relatively straightforward to
rewrite in Rust, and we could imagine a complete rewrite of qemu-ga...
However, it is less of a waste to focus on critical parts or newly added
code instead, imho! Furthermore, the Rust doesn't cover all targets C can
currently target, so we must have some care when deciding a language. (you
can imagine I would encourage anyone to do it in Rust!)

QOM is the QEMU object system and is spread throughout the code. If there
is enough interest for this Rust effort, I plan to look at binding it next
(based on my experience working on GObject bindings). I am afraid we are
not going to have as friendly bindings as what the GNOME team achieved, but
since QOM is a bit simpler, we may find acceptable compromises.

With QOM & QAPI, and manual bindings of internal APIs, I think we could
start writing interesting code in Rust, simple devices, external interfaces
etc.


 Hope that helps clarify a bit the current goals



--=20
Marc-Andr=C3=A9 Lureau

--0000000000000bb99405cb80f490
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 8, 2021 at 8:51 PM Ian =
Jackson &lt;<a href=3D"mailto:iwj@xenproject.org">iwj@xenproject.org</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Marc-An=
dr=C3=A9 Lureau writes (&quot;Re: [RFC v3 13/32] rust: use vendored-sources=
&quot;):<br>
&gt; Yes, this is the shim to provide a C ABI QMP handler from Rust. This i=
s where<br>
&gt; all the FFI&lt;-&gt;Rust conversion takes place.<br>
&gt; <br>
&gt; The &quot;safe&quot; code is qga/qmp/<a href=3D"http://vcpus.rs" rel=
=3D"noreferrer" target=3D"_blank">vcpus.rs</a>. However, there is no<br>
&gt; documentation there, since it&#39;s not meant to be the public<br>
&gt; interface. It&#39;s documented with the QAPI schema.<br>
<br>
Right, thanks.=C2=A0 That does look like a PoC of a Rust API.=C2=A0 I wante=
d the<br>
rustdoc output because I find it provides a very uniform and readable<br>
presentation even of an API with no doc comments.<br>
<br>
I think maybe a thing I am missing is how you expect this to be used.<br>
Which parts of the system are going to be in Rust.=C2=A0 etc.<br>
And that would help explain what &quot;public&quot; means.<br>
<br>
I think the answer is probably in this example:<br>
<br>
<a href=3D"https://patchew.org/QEMU/20210907121943.3498701-1-marcandre.lure=
au@redhat.com/20210907121943.3498701-30-marcandre.lureau@redhat.com/" rel=
=3D"noreferrer" target=3D"_blank">https://patchew.org/QEMU/20210907121943.3=
498701-1-marcandre.lureau@redhat.com/20210907121943.3498701-30-marcandre.lu=
reau@redhat.com/</a><br>
<br>
but although my C and Rust are both fine, I don&#39;t understand qemu well<=
br>
enough to make sense of it.<br>
<br>
... wait, qga is &quot;qemu guest agent&quot; ?<br>
<br>
I think I am sort of seeing this use case now.=C2=A0 But presuambly there<b=
r>
are other use cases for this QMP/QAPI type bridge stuff.<br>
<br>
Sorry to be asking such stupid questions.<br></blockquote><div><br></div><d=
iv>There is no magic wand to introduce Rust code in an existing C code base=
. You need to glue some C ABI to/from Rust. It&#39;s a lot of manual work t=
o properly bind a C API to Rust (it&#39;s a project on its own I would say)=
. Typically, FFI bindings can be automated from headers, and high-level Rus=
t bindings are done by hand. Then you want high-level bindings to take adva=
ntage of Rust, for idiomatic and safe code. Various internal QEMU API will =
have to be bound by hand to start using them from Rust. An isolated unit (s=
ay a parser, a function) could be rewritten in Rust and a C ABI be provided=
 without much hassle. But in general, code is quickly interdependent, or th=
e amount of stuff to rewrite in one go is large and risky to do it that way=
.<br></div><div><br></div><div>In the glib/gobject world, the ABI are annot=
ated, and you can automate much of the high-level binding process (which is=
 amazing, given the complexity of the APIs, with objects, async methods, si=
gnals, properties, .. various concepts that don&#39;t match easily in Rust)=
. To help with this process, they introduced conversion traits (the ToQemu/=
FromQemu adapted here), common interfaces, to help automate and compose com=
plex types (and their own binding generator).<br></div><div><br></div><div>=
</div><div>(Unfortunately) QEMU doesn&#39;t use gobject, but it relies heav=
ily on two type systems of its own: QAPI and QOM. QAPI is actually more of =
an IDL, which translates C from/to JSON/QMP and has commands and signals (a=
nd is the protocol used to communicate with qemu or qemu-ga etc). A large p=
art of QEMU are direct users of the QAPI generated types and functions. It =
is thus a good target to generate bindings automatically. As demonstrated a=
t the end, it allows writing QMP handlers in idiomatic Rust. Since qemu-gue=
st-agent doesn&#39;t have a complex internal state (most commands are reall=
y independent, they could be different programs..!), I started rewriting so=
me handlers there. It feels relatively straightforward to rewrite in Rust, =
and we could imagine a complete rewrite of qemu-ga... However, it is less o=
f a waste to focus on critical parts or newly added code instead, imho! Fur=
thermore, the Rust doesn&#39;t cover all targets C can currently target, so=
 we must have some care when deciding a language. (you can imagine I would =
encourage anyone to do it in Rust!)<br></div><div><br></div><div>QOM is the=
 QEMU object system and is spread throughout the code. If there is enough i=
nterest for this Rust effort, I plan to look at binding it next (based on m=
y experience working on GObject bindings). I am afraid we are not going to =
have as friendly bindings as what the GNOME team achieved, but since QOM is=
 a bit simpler, we may find acceptable compromises.</div><div><br></div><di=
v>With QOM &amp; QAPI, and manual bindings of internal APIs, I think we cou=
ld start writing interesting code in Rust, simple devices, external interfa=
ces etc.<br></div><div><br></div><div><br></div><div>=C2=A0Hope that helps =
clarify a bit the current goals<br></div><div>=C2=A0</div></div><br clear=
=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=
=A9 Lureau<br></div></div>

--0000000000000bb99405cb80f490--

