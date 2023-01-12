Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C30667C34
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 18:08:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pG13u-0000ao-FF; Thu, 12 Jan 2023 12:08:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1pG13p-0000aF-1F; Thu, 12 Jan 2023 12:08:17 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1pG13n-0005Ew-7j; Thu, 12 Jan 2023 12:08:16 -0500
Received: by mail-ed1-x52c.google.com with SMTP id v6so27677194edd.6;
 Thu, 12 Jan 2023 09:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d+u1rJZ7MObyy7H0ga/V4+28brNUm8kkqEZwsWYlhzw=;
 b=MffLaYAYtrjOt+wFt+MBgi/8HUQubGoYbYPvccL8G15TjJknsiqvJF8Khw1WRhpwcK
 nGFUU09gA3hF14pUd6FtylSmWGnMgHBD7pw+KbfYcYJSKdhH9ArwkINM4yPt/xZNljOE
 z2Ny52kJs6Mrl6SVem6WZOWr3wsP4KVBTaZGj9nXPvEoFMWQ9OWlGu4HSCRbI7rugqXH
 mHpkMVVcILg0xDwzZ3v6Heo/EN89zwGCxjdQv5AGIvqPnPjd2LP3c96YIU8b8I+UhLXS
 rmYDTjI4NjWQQbl5OSbbkWIb3aHZMWNxU/ynOlgc1VCpCzLq16/Gm5CrAR9I3iceCGwU
 qwDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d+u1rJZ7MObyy7H0ga/V4+28brNUm8kkqEZwsWYlhzw=;
 b=fIvqqpuF2a9Hyvp4D3mFcNHqOztO039O0gZ5VBTjPyA08IaCeZBMiLEs/LoFc2uLGL
 CGHc+yAradsCCf6PK1ixU3zlZswUDvnZMzze0jCMvMam+VUNMLWTSKNTbbY0xxm00XPt
 LvahLy0joljKojAs8w/Jwv0tVpHaQMj/CZD2dggAdoCcYnEGXfTZTiAedB9JHkcL8ULT
 N54CgStRAVnQ7PdSclq3QFc9/6I2/ngjZ1DpJbJSOJUVSuEA7AuqJ+MxIe7J/M6t51az
 BxmM2CQ8DJlAxxH+s1W8ww5Yt0hv7OVU4UK+UhRkE2iRLmaV+/yWnja6RS4hQdmaOUjN
 WGWw==
X-Gm-Message-State: AFqh2kqn2kP+FZyeAGbxSc/59qtCwgmiwNZOOPUdBjJasG9Zv1lVYHG8
 U+NXwLEf0Labb+x+C0MGxMkQnZkCv7z1r1j2J2k=
X-Google-Smtp-Source: AMrXdXvEP9Io1Y15ByKD8CVRy8/brfMgB6p/ojWYAFHz46qLcYDqk9sUgeBzovVgiRWBQMxctn6zwnc82UVV0xZ2BLg=
X-Received: by 2002:aa7:cf87:0:b0:498:dfe5:49aa with SMTP id
 z7-20020aa7cf87000000b00498dfe549aamr1482893edx.398.1673543291697; Thu, 12
 Jan 2023 09:08:11 -0800 (PST)
MIME-Version: 1.0
References: <20221120102836.3174090-1-oro@il.ibm.com>
 <20221120102836.3174090-2-oro@il.ibm.com>
 <Y7/+d3Zr9ncvCZuV@redhat.com>
 <CAOi1vP8viVkV=asKs0RVq6bxc-9-sxCxF0aNjxFecEnLxuw=yg@mail.gmail.com>
 <Y8AdVTH+sYI0pNnF@redhat.com>
In-Reply-To: <Y8AdVTH+sYI0pNnF@redhat.com>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Thu, 12 Jan 2023 18:07:58 +0100
Message-ID: <CAOi1vP8rR2g8fkFhkDs_dyOzPiechsYS9Q8Xen2Z21reBUO3vw@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] block/rbd: encryption nit fixes
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Or Ozeri <oro@il.ibm.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org, 
 dannyh@il.ibm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=idryomov@gmail.com; helo=mail-ed1-x52c.google.com
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

On Thu, Jan 12, 2023 at 3:46 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> On Thu, Jan 12, 2023 at 03:26:56PM +0100, Ilya Dryomov wrote:
> > On Thu, Jan 12, 2023 at 1:35 PM Daniel P. Berrang=C3=A9 <berrange@redha=
t.com> wrote:
> > >
> > > On Sun, Nov 20, 2022 at 04:28:34AM -0600, Or Ozeri wrote:
> > > > Add const modifier to passphrases,
> > > > and remove redundant stack variable passphrase_len.
> > > >
> > > > Signed-off-by: Or Ozeri <oro@il.ibm.com>
> > > > ---
> > > >  block/rbd.c | 24 ++++++++++--------------
> > > >  1 file changed, 10 insertions(+), 14 deletions(-)
> > > >
> > > > diff --git a/block/rbd.c b/block/rbd.c
> > > > index f826410f40..e575105e6d 100644
> > > > --- a/block/rbd.c
> > > > +++ b/block/rbd.c
> > > > @@ -330,7 +330,7 @@ static int qemu_rbd_set_keypairs(rados_t cluste=
r, const char *keypairs_json,
> > > >  #ifdef LIBRBD_SUPPORTS_ENCRYPTION
> > > >  static int qemu_rbd_convert_luks_options(
> > > >          RbdEncryptionOptionsLUKSBase *luks_opts,
> > > > -        char **passphrase,
> > > > +        const char **passphrase,
> > > >          size_t *passphrase_len,
> > > >          Error **errp)
> > > >  {
> > > > @@ -341,7 +341,7 @@ static int qemu_rbd_convert_luks_options(
> > > >  static int qemu_rbd_convert_luks_create_options(
> > > >          RbdEncryptionCreateOptionsLUKSBase *luks_opts,
> > > >          rbd_encryption_algorithm_t *alg,
> > > > -        char **passphrase,
> > > > +        const char **passphrase,
> > > >          size_t *passphrase_len,
> > > >          Error **errp)
> > > >  {
> > > > @@ -384,8 +384,7 @@ static int qemu_rbd_encryption_format(rbd_image=
_t image,
> > > >                                        Error **errp)
> > > >  {
> > > >      int r =3D 0;
> > > > -    g_autofree char *passphrase =3D NULL;
> > > > -    size_t passphrase_len;
> > > > +    g_autofree const char *passphrase =3D NULL;
> > >
> > > This looks wierd.  If it is as const string, why are
> > > we free'ing it ?  Either want g_autofree, or const,
> > > but not both.
> >
> > Just curious, is it a requirement imposed by g_autofree?  Otherwise
> > pointer constness and pointee lifetime are completely orthogonal and
> > freeing (or, in this case, wanting to auto-free) an object referred to
> > by a const pointer seems perfectly fine to me.
>
> Free'ing a const point is not OK
>
> $ cat c.c
> #include <stdlib.h>
> void bar(const char *foo) {
>     free(foo);
> }
>
> $ gcc -Wall -c c.c
> c.c: In function =E2=80=98bar=E2=80=99:
> c.c:5:10: warning: passing argument 1 of =E2=80=98free=E2=80=99 discards =
=E2=80=98const=E2=80=99 qualifier from pointer target type [-Wdiscarded-qua=
lifiers]
>     5 |     free(foo);
>       |          ^~~
> In file included from c.c:2:
> /usr/include/stdlib.h:568:25: note: expected =E2=80=98void *=E2=80=99 but=
 argument is of type =E2=80=98const char *=E2=80=99
>   568 | extern void free (void *__ptr) __THROW;
>       |                   ~~~~~~^~~~~
>
> The g_autofree happens to end up hiding this warning, because the const
> annotation isn't propagated to the registere callback, but that doesn't
> mean we should do that.
>
> When a programmer sees a variable annotated const, they expect that
> either someone else is responsible for free'ing it, or that the data
> is statically initialized or stack allocated and thus doesn't need
> free'ing.  So g_autofree + const is just wrong.

FWIW many believe that this specification of free() was a mistake and
that it should have been specified to take const void *.  Some projects
actually went ahead and fixed that: kfree() and friends in the Linux
kernel take const void *, for example.  C++ delete operator works on
const pointers as well -- because object creation and destruction is
fundamentally independent of modification.

But this is more of a philosophical thing...  I asked about g_autofree
because a quick grep revealed a bunch of g_autofree const char * locals
in the tree.  Or would probably prefer to just drop const here ;)

Thanks,

                Ilya

