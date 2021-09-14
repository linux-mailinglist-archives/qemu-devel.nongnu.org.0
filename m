Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6E340AC74
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 13:35:40 +0200 (CEST)
Received: from localhost ([::1]:53530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ6iw-0001jk-T4
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 07:35:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mQ6hi-00014f-31
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 07:34:23 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:33358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mQ6hf-0002Jl-ED
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 07:34:21 -0400
Received: by mail-wr1-x435.google.com with SMTP id t18so19696507wrb.0
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 04:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H4GPX1iBOmWdxzU5LD1yxEAm65GacjBeoCzREMjKXlQ=;
 b=EGxxKoKEOHl/GCO6vq/QZM2O2mngkqDtpFJUS2ynJMiQ33tQiVInBz3P9c/JzZLAY9
 lZkEs87aKbkuka84XrSLNVLT9/15OKaB0d1tFUBJBbH5UFAD6lxIQX9TMg8cjOLswiZw
 erLlytj+NTyxP+VLhI/EZ9gY3kbki0jP6yuABIWQQ30NtkAiJ1JsxgeKJ7rTWAmf5G/A
 xk3CJ1KvfC2gPhq9oqrBT0gEy1u7zGMMhlXLlZXsOU40p164cVCGBw7hOobQo1uprDIN
 oZuslinG4heCTMs3EKgBKrX6ryz+yVYHTen/UYk3lSUZ+4sn2YgcmTC1tJainvD+YyEW
 Z42g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H4GPX1iBOmWdxzU5LD1yxEAm65GacjBeoCzREMjKXlQ=;
 b=Bku5LjUfPhqk3i857iPe+9qNTPVYVtTECeW8O4OFJGrNkPJsQgXVfWj8X7IyDe6U4G
 PosFBvb1Hecpd7He6RFklbJmkzOUUaXumkt+sdDimfYwOtSQCIXwijIZY8vzZMMaZ5Zj
 02aTVhjOd91ljZthGVdfvUWMR/w3+5jjq+wT+Z7iKyNFnDr3OlFMrDePmcyv4CJRwf7g
 y1IUDGZgLUcy8wMqqEFN4ycpzl9g1DpDXIbmrYwHrL1muCxFvCXQs3VdMQgp2KhEdJb3
 22XB/Buw5AygzdWxCuO+1IGu1YfKksByEFHxItEl+W1PqMjaCCCZErKNGvKoK98zXvQS
 HWxg==
X-Gm-Message-State: AOAM531A6F11ZW0oWKBbHLmtBDSEj1dqWw/5z8UIM6i8h/KCq1zI4G+i
 EfKDTUC+8uEkPE2snyxic9hbWiFV74JdBMN/MVE=
X-Google-Smtp-Source: ABdhPJwvTal53sonks3Fl6eR22uKi6jMchEA95IiBEBxhcXIk/o2RVgiI8YisaaAEUNJCxyplojBQqyohtNopRl14EQ=
X-Received: by 2002:adf:e806:: with SMTP id o6mr17813645wrm.239.1631619258013; 
 Tue, 14 Sep 2021 04:34:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210907121943.3498701-1-marcandre.lureau@redhat.com>
 <20210907121943.3498701-13-marcandre.lureau@redhat.com>
 <d84f2827-3dbf-abc1-0ce3-596f0c568cf3@redhat.com>
In-Reply-To: <d84f2827-3dbf-abc1-0ce3-596f0c568cf3@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 14 Sep 2021 15:34:06 +0400
Message-ID: <CAJ+F1CK4s-D+Rwz6EG9+mUxb8EUJJuphF5Ox+gtsEq+CNL7zAQ@mail.gmail.com>
Subject: Re: [RFC v3 12/32] rust: provide a common crate for QEMU
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000485b2505cbf2f6fb"
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wr1-x435.google.com
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000485b2505cbf2f6fb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Paolo

On Mon, Sep 13, 2021 at 9:18 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> On 07/09/21 14:19, marcandre.lureau@redhat.com wrote:
> > From: Marc-Andr=C3=A9 Lureau<marcandre.lureau@redhat.com>
> >
> > This crates provides common bindings and facilities for QEMU C API
> > shared by various projects.
> >
> > Most importantly, it defines the conversion traits used to convert from
> > C to Rust types. Those traits are largely adapted from glib-rs, since
> > those have proved to be very flexible, and should guide us to bind
> > further QEMU types such as QOM. If glib-rs becomes a dependency, we
> > should consider adopting glib translate traits. For QAPI, we need a
> > smaller subset.
> >
> > Cargo.lock is checked-in, as QEMU produces end-of-chain binaries, and i=
t
> > is desirable to track the exact set of packages that are involved in
> > managed builds.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau<marcandre.lureau@redhat.com>
>
> As in my previous review, the main issue I have here is with the
> complexity of this code.
>
> I understand that this has to be manually written, but right now I find
> it really hard to understand what is going on here.  The patch needs to
> be expanded in several parts:
>
> 1) generic traits (including implementations for Option/Box)
>
> 2) implementation of the generic traits
>
> 3) io/nix errors
>
> and these parts should be moved around to the place where they become
> necessary.
>
>
The common crate can be split in many pieces. It is easier to have it as a
single commit during PoC/RFC (the series is already large enough).

Is it really valuable to introduce a new crate/library piece by piece?
Instead, better documentation and tests are more valuable imho. But I will
certainly split it and clean it more as we iterate.


> Also regarding the code itself:
>
> 1) Stash should not be a tuple.  Accesses to it should use standard Rust
> methods, such as borrow()/borrow_mut(), and it should also support
> standard Rust idioms such as map():
>
>

I thought we already discussed that. The stash is an implementation detail
to handle FFI resource release. The only thing the user should care about
the stash is the pointer, which is shortly retrieved with ".0" (cannot be
more succinct).

Ideally, we would like to provide "foo.to_qemu_none()", but to keep the
associated resource allocated, the shortest we can offer is
"foo.to_qemu_none().0". Using "as_ptr()" instead would not only be longer
to type but possibly misleading: there is nothing else you should do with
the stash, no other method should exist.

I don't understand what "map()" would provide here either. The storage part
of the stash is an internal detail (the FFI data), not meant to be
manipulated at all (it would invalidate the stash pointer).



> pub struct BorrowedMutPointer<'a, P, T: 'a> {
>      native: *mut P,
>      storage: T,
>      _marker: PhantomData<&'a P>,
> }
>
> #[allow(dead_code)]
> impl<'a, P: Copy, T: 'a> BorrowedMutPointer<'a, P, T> {
>      fn as_ptr(&self) -> *const P {
>          self.native
>      }
>
>      fn as_mut_ptr(&mut self) -> *mut P {
>          self.native
>      }
>
>      fn map<U: 'a, F: FnOnce(T) -> U>(self, f: F) ->
> BorrowedMutPointer<'a, P, U> {
>          BorrowedMutPointer {
>              native: self.native,
>              storage: f(self.storage),
>              _marker: PhantomData,
>          }
>      }
> }
>
> impl<'a, P, T> Borrow<T> for BorrowedMutPointer<'a, P, T> {
>      fn borrow(&self) -> &T {
>          &self.storage
>      }
> }
>
> impl<'a, P, T> BorrowMut<T> for BorrowedMutPointer<'a, P, T> {
>      fn borrow_mut(&mut self) -> &mut T {
>          &mut self.storage
>      }
> }
>
> 2) Does ToQemuPtr need to allow multiple implementations?  Can the type
> parameter in ToQemuPtr<'a, P> be an associated type (for example
> "Native")?  Type parameters really add a lot of complexity.
>
>

ToQemuPtr is a trait, implemented for the various Rust types that we can
translate to FFI pointers.

For example:

impl<'a> ToQemuPtr<'a, *mut c_char> for String {
    type Storage =3D CString;
...
}

The pointer type parameter is to return the correct pointer. It is not
necessary to specify it as a user, since Rust infers it from the expected
type.


> 3) I would rather not have "qemu" in the names.  The Rust parts *are*
> QEMU.  So "foreign" or "c" would be better.
>


That's kind of cosmetic.

The main reason for "qemu" in the name is to avoid potential clashes with
other methods and traits.

Also "to_none" could associate in the reader's mind (wrongly) with the
ubiquitous Option::None.

But yes, we could drop "qemu" here.


>
> 4) full/none is still really confusing to me.  I have finally understood
> that it's because the pair that borrows is from_qemu_full/to_qemu_none,
> and the pair that copies is from_qemu_none/to_qemu_full.  I'd really
> like to use names following the Rust naming conventions.  A possible
> improvement of my proposal from the previous review:
>
>

"full" and "none" are inherited from the glib-introspection ownership
transfer annotations.

We discussed and weighed pros and cons last year. I haven't yet found or
agreed on better options. And you can be certain that the glib-rs folks
have already pondered a lot about the naming and design. And, I don't like
to reinvent what others have done (creating various limitations and
incompatibilities). Following the glib traits brings a lot of experience
and could help us reuse glib-rs crates more easily (because they would use
the same design), but also to port and interoperate. Imagine we need to
bind GHashTable<char *, QapiFoo> someday, we will be in a better position
if we have translation traits that follow glib-rs already.

The Rust conventions can be inferred from CString/CStr design and methods,
but they have to be adjusted, because they don't solve the same constraints
(no ownership transfer, and CString/CStr intermediary representations).

They are "CStr::from_ptr(*const)" and "CString::as_ptr(&self) -> *const".


- from_qemu_full -> from_foreign (or from_c, same below)
>                      + possibly a dual method into_native or into_rust
>
>
There is no standard naming for such FFI pointer ownership transfer. Rust
doesn't know how to release FFI resources, in general.

from_raw(*mut) is the closest, but "raw" is reserved for Rust data pointer
types, not FFI (except for slices, probably because the linear layout is
the same as FFI)

We can consider "from_mut_ptr(*mut)", but this doesn't convey the ownership
transfer as explicitly.


> - from_qemu_none -> cloned_from_foreign
>

You are being creative! This is like "CStr::from_ptr", except we go
directly to higher Rust types.


> - to_qemu_none -> as_foreign or as_foreign_mut
>
>
Similarity with "CString::as_ptr", except that it handles the temporary
stash (CString is the internal storage for String), so we use the
"to_qemu_none().0" described earler.

If we follow your considerations it could be "to_stash().as_ptr()", which
is less user friendly, exposes more internal details, etc.


> - to_qemu_full -> clone_to_foreign
>


There is no equivalent in Rust standard. An implementation may want to
store in an existing location, or allocated in different ways etc.

Closest would be to_ptr()

In summary:

from_qemu_full()  vs  from_mut_ptr()
from_qemu_none()      from_ptr()
to_qemu_full()        to_ptr()
to_qemu_none()        to_stash().as_ptr()

I argue there is more consistency and readability by following the glib-rs
traits and method names (among other advantages by staying close to glib-rs
design for the future).


>
> I will see if I have some time to do some of this work.
>
>
thanks


--=20
Marc-Andr=C3=A9 Lureau

--000000000000485b2505cbf2f6fb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Paolo<br></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Sep 13, 2021 at 9:18 =
PM Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">On 07/09/21 14:19, <a href=3D"mailto:marcandre.lureau@redhat.com" targe=
t=3D"_blank">marcandre.lureau@redhat.com</a> wrote:<br>
&gt; From: Marc-Andr=C3=A9 Lureau&lt;<a href=3D"mailto:marcandre.lureau@red=
hat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt; <br>
&gt; This crates provides common bindings and facilities for QEMU C API<br>
&gt; shared by various projects.<br>
&gt; <br>
&gt; Most importantly, it defines the conversion traits used to convert fro=
m<br>
&gt; C to Rust types. Those traits are largely adapted from glib-rs, since<=
br>
&gt; those have proved to be very flexible, and should guide us to bind<br>
&gt; further QEMU types such as QOM. If glib-rs becomes a dependency, we<br=
>
&gt; should consider adopting glib translate traits. For QAPI, we need a<br=
>
&gt; smaller subset.<br>
&gt; <br>
&gt; Cargo.lock is checked-in, as QEMU produces end-of-chain binaries, and =
it<br>
&gt; is desirable to track the exact set of packages that are involved in<b=
r>
&gt; managed builds.<br>
&gt; <br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau&lt;<a href=3D"mailto:marcandre.l=
ureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
<br>
As in my previous review, the main issue I have here is with the <br>
complexity of this code.<br>
<br>
I understand that this has to be manually written, but right now I find <br=
>
it really hard to understand what is going on here.=C2=A0 The patch needs t=
o <br>
be expanded in several parts:<br>
<br>
1) generic traits (including implementations for Option/Box)<br>
<br>
2) implementation of the generic traits<br>
<br>
3) io/nix errors<br>
<br>
and these parts should be moved around to the place where they become <br>
necessary.<br>
<br></blockquote><div><br></div><div>The common crate can be split in many =
pieces. It is easier to have it as a single commit during PoC/RFC (the seri=
es is already large enough). <br></div><div><br></div><div>Is it really val=
uable to introduce a new crate/library piece by piece? Instead, better docu=
mentation and tests are more valuable imho. But I will certainly split it a=
nd clean it more as we iterate.<br></div><div><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
Also regarding the code itself:<br>
<br>
1) Stash should not be a tuple.=C2=A0 Accesses to it should use standard Ru=
st <br>
methods, such as borrow()/borrow_mut(), and it should also support <br>
standard Rust idioms such as map():<br>
<br></blockquote><div><br></div><div><br>I thought we already discussed tha=
t. The stash is an implementation detail to handle FFI resource release. Th=
e only thing the user should care about the stash is the pointer, which is =
shortly retrieved with &quot;.0&quot; (cannot be more succinct).<br><br>Ide=
ally, we would like to provide &quot;foo.to_qemu_none()&quot;, but to keep =
the associated resource allocated, the shortest we can offer is &quot;foo.t=
o_qemu_none().0&quot;. Using &quot;as_ptr()&quot; instead would not only be=
 longer to type but possibly misleading: there is nothing else you should d=
o with the stash, no other method should exist.<br><br>I don&#39;t understa=
nd what &quot;map()&quot; would provide here either. The storage part of th=
e stash is an internal detail (the FFI data), not meant to be manipulated a=
t all (it would invalidate the stash pointer).<br></div><div><br></div><div=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
pub struct BorrowedMutPointer&lt;&#39;a, P, T: &#39;a&gt; {<br>
=C2=A0 =C2=A0 =C2=A0native: *mut P,<br>
=C2=A0 =C2=A0 =C2=A0storage: T,<br>
=C2=A0 =C2=A0 =C2=A0_marker: PhantomData&lt;&amp;&#39;a P&gt;,<br>
}<br>
<br>
#[allow(dead_code)]<br>
impl&lt;&#39;a, P: Copy, T: &#39;a&gt; BorrowedMutPointer&lt;&#39;a, P, T&g=
t; {<br>
=C2=A0 =C2=A0 =C2=A0fn as_ptr(&amp;self) -&gt; *const P {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.native<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0fn as_mut_ptr(&amp;mut self) -&gt; *mut P {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.native<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0fn map&lt;U: &#39;a, F: FnOnce(T) -&gt; U&gt;(self, f: =
F) -&gt; <br>
BorrowedMutPointer&lt;&#39;a, P, U&gt; {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BorrowedMutPointer {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0native: self.native,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0storage: f(self.storage),<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_marker: PhantomData,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
}<br>
<br>
impl&lt;&#39;a, P, T&gt; Borrow&lt;T&gt; for BorrowedMutPointer&lt;&#39;a, =
P, T&gt; {<br>
=C2=A0 =C2=A0 =C2=A0fn borrow(&amp;self) -&gt; &amp;T {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;self.storage<br>
=C2=A0 =C2=A0 =C2=A0}<br>
}<br>
<br>
impl&lt;&#39;a, P, T&gt; BorrowMut&lt;T&gt; for BorrowedMutPointer&lt;&#39;=
a, P, T&gt; {<br>
=C2=A0 =C2=A0 =C2=A0fn borrow_mut(&amp;mut self) -&gt; &amp;mut T {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;mut self.storage<br>
=C2=A0 =C2=A0 =C2=A0}<br>
}<br>
<br>
2) Does ToQemuPtr need to allow multiple implementations?=C2=A0 Can the typ=
e <br>
parameter in ToQemuPtr&lt;&#39;a, P&gt; be an associated type (for example =
<br>
&quot;Native&quot;)?=C2=A0 Type parameters really add a lot of complexity.<=
br>
<br></blockquote><div><br></div><div><br>ToQemuPtr is a trait, implemented =
for the various Rust types that we can translate to FFI pointers.<br><br>Fo=
r example:<br><br>impl&lt;&#39;a&gt; ToQemuPtr&lt;&#39;a, *mut c_char&gt; f=
or String {<br>=C2=A0 =C2=A0 type Storage =3D CString;<br>...<br>}<br><br>T=
he pointer type parameter is to return the correct pointer. It is not neces=
sary to specify it as a user, since Rust infers it from the expected type.<=
br>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
3) I would rather not have &quot;qemu&quot; in the names.=C2=A0 The Rust pa=
rts *are* <br>
QEMU.=C2=A0 So &quot;foreign&quot; or &quot;c&quot; would be better.<br></b=
lockquote><div><br></div><div><br>That&#39;s kind of cosmetic. <br><br>The =
main reason for &quot;qemu&quot; in the name is to avoid potential clashes =
with other methods and traits. <br><br>Also &quot;to_none&quot; could assoc=
iate in the reader&#39;s mind (wrongly) with the ubiquitous Option::None.<b=
r><br>But yes, we could drop &quot;qemu&quot; here.<br>=C2=A0</div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">
<br>
4) full/none is still really confusing to me.=C2=A0 I have finally understo=
od <br>
that it&#39;s because the pair that borrows is from_qemu_full/to_qemu_none,=
 <br>
and the pair that copies is from_qemu_none/to_qemu_full.=C2=A0 I&#39;d real=
ly <br>
like to use names following the Rust naming conventions.=C2=A0 A possible <=
br>
improvement of my proposal from the previous review:<br>
<br></blockquote><div><br></div><div><br>&quot;full&quot; and &quot;none&qu=
ot; are inherited from the glib-introspection ownership transfer annotation=
s.<br><br>We discussed and weighed pros and cons last year. I haven&#39;t y=
et found or agreed on better options. And you can be certain that the glib-=
rs folks have already pondered a lot about the naming and design. And, I do=
n&#39;t like to reinvent what others have done (creating various limitation=
s and incompatibilities). Following the glib traits brings a lot of experie=
nce and could help us reuse glib-rs crates more easily (because they would =
use the same design), but also to port and interoperate. Imagine we need to=
 bind GHashTable&lt;char *, QapiFoo&gt; someday, we will be in a better pos=
ition if we have translation traits that follow glib-rs already.<br><br>The=
 Rust conventions can be inferred from CString/CStr design and methods, but=
 they have to be adjusted, because they don&#39;t solve the same constraint=
s (no ownership transfer, and CString/CStr intermediary representations).<b=
r><br>They are &quot;CStr::from_ptr(*const)&quot; and &quot;CString::as_ptr=
(&amp;self) -&gt; *const&quot;.</div><div><br></div><div> <br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
- from_qemu_full -&gt; from_foreign (or from_c, same below)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0+ possibly a dual method into_native or into_rust<br>
<br></blockquote><div><br>There is no standard naming for such FFI pointer =
ownership transfer. Rust doesn&#39;t know how to release FFI resources, in =
general.<br><br>from_raw(*mut) is the closest, but &quot;raw&quot; is reser=
ved for Rust data pointer types, not FFI (except for slices, probably becau=
se the linear layout is the same as FFI)<br><br>We can consider &quot;from_=
mut_ptr(*mut)&quot;, but this doesn&#39;t convey the ownership transfer as =
explicitly.<br>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
- from_qemu_none -&gt; cloned_from_foreign<br></blockquote><div><br></div><=
div>You are being creative! This is like &quot;CStr::from_ptr&quot;, except=
 we go directly to higher Rust types.</div><div> <br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
<br>
- to_qemu_none -&gt; as_foreign or as_foreign_mut<br>
<br></blockquote><div><br></div><div>Similarity with &quot;CString::as_ptr&=
quot;, except that it handles the temporary stash (CString is the internal =
storage for String), so we use the &quot;to_qemu_none().0&quot; described e=
arler.<br><br>If we follow your considerations it could be &quot;to_stash()=
.as_ptr()&quot;, which is less user friendly, exposes more internal details=
, etc.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
- to_qemu_full -&gt; clone_to_foreign<br></blockquote><div><br></div><div><=
br>There is no equivalent in Rust standard. An implementation may want to s=
tore in an existing location, or allocated in different ways etc.<br><br>Cl=
osest would be to_ptr()<br><br>In summary:<br><br>from_qemu_full() =C2=A0vs=
 =C2=A0from_mut_ptr()<br>from_qemu_none() =C2=A0 =C2=A0 =C2=A0from_ptr()<br=
>to_qemu_full() =C2=A0 =C2=A0 =C2=A0 =C2=A0to_ptr()<br>to_qemu_none() =C2=
=A0 =C2=A0 =C2=A0 =C2=A0to_stash().as_ptr()<br><br>I argue there is more co=
nsistency and readability by following the glib-rs traits and method names =
(among other advantages by staying close to glib-rs design for the future).=
<br>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
I will see if I have some time to do some of this work.<br><br></blockquote=
><div>=C2=A0</div><div>thanks <br></div></div><br clear=3D"all"><br>-- <br>=
<div dir=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div>=
</div>

--000000000000485b2505cbf2f6fb--

