Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B25E570C43
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 22:59:00 +0200 (CEST)
Received: from localhost ([::1]:60616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oB0Uc-0001Wa-UZ
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 16:58:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1oB0Sa-0007vv-Ql
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 16:56:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40100)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1oB0SY-0006om-33
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 16:56:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657573007;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XHqh2chV48wlRVfHOCERf7s323TtsFlfs5Qk86gHnY4=;
 b=LQxWuZWnI8YqwkkX+wN7R5LcJ/GklLDqsYsqt/5KsN6CX39aV0PE7ksU5GH6TIDhkETcua
 Uz50oE97fIOfMzojn5SvRJGYdiXwXRLHdLvRa2SuVbf/clcn7/qVcO+zaPWFvzX4LoOYFV
 cLlDUoMxGTgmDcaCLWxriDMULeKFBS0=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-518-gl4lXaQSNvS3RIDlFBXzpQ-1; Mon, 11 Jul 2022 16:56:40 -0400
X-MC-Unique: gl4lXaQSNvS3RIDlFBXzpQ-1
Received: by mail-ua1-f71.google.com with SMTP id
 b2-20020ab05f82000000b003826734f585so1244654uaj.2
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 13:56:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XHqh2chV48wlRVfHOCERf7s323TtsFlfs5Qk86gHnY4=;
 b=AMtzJMn+xqTXPh0NobbvTVLyC0hmJ8EeNCjBvWsTcXlAiUGSDf9zudkPhd4EiIG05X
 4/zZZ3WTGaOU2/36HsGiu8iR8CI0BSuNVbWsKFgb1qqRcGLdX2NwqkHMfVXnmBmEcXVt
 ESUwD/dXzEjr3zF0yBsqtXcjnRxP+OPjnX7XWzVnvPJmu1B90JWb+xeZIkZEqu9RDfBZ
 9xoNa84dcEgQ5jxVf70l0hvE8TdNpMKRSkj0MMc0xCNyXqABALFWGVjtaGousqtx/Fme
 NjgUz8fQjToiIr49EL316bArHkaXmYKxkQp/pVmTR0BWhoDfgQRJueR+rgvbEAFAK0+q
 3oqg==
X-Gm-Message-State: AJIora+Uxl8WvUvWtAF4yNdL2cTvB3ci9jc0CG8fij6xC9PkD21cqmOr
 6nzvjrFj5zzoAHi3tNvh5WD6X7LS2mqJmAy912J54KTyfZ3p8lrZy4tuo6JTSZHBDB20EhRpJKk
 i3EZOUYKAdtYYcjB46jPmtSr2FCBO7Jk=
X-Received: by 2002:a05:6102:1586:b0:357:5677:75ef with SMTP id
 g6-20020a056102158600b00357567775efmr3046965vsv.61.1657572999719; 
 Mon, 11 Jul 2022 13:56:39 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uTZJENSpE3M5VWKK9qWJYQ4N+7+OTkS+3l+8zkKXnhLfVtqpKsZTOsnAeuFMkgnGN3Ob+ZHGS+i1N8N7UlEv8=
X-Received: by 2002:a05:6102:1586:b0:357:5677:75ef with SMTP id
 g6-20020a056102158600b00357567775efmr3046952vsv.61.1657572999472; Mon, 11 Jul
 2022 13:56:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220705214659.73369-1-peter@pjd.dev>
 <YsVBhmvAm2ANDUEt@redhat.com>
 <YsW8eO5eeRKfpxJp@r37> <YsYuYAJE2Hx64aIY@pdel-mbp.dhcp.thefacebook.com>
 <YscqCErtNGOG9GVx@pdel-mbp.dhcp.thefacebook.com>
In-Reply-To: <YscqCErtNGOG9GVx@pdel-mbp.dhcp.thefacebook.com>
From: John Snow <jsnow@redhat.com>
Date: Mon, 11 Jul 2022 16:56:28 -0400
Message-ID: <CAFn=p-bhhu+G-p=w_K2OSOe0WkDHbBaO0ZS53F+jTDuo074VFw@mail.gmail.com>
Subject: Re: [PATCH RESEND] python/machine: Fix AF_UNIX path too long on macOS
To: peter@pjd.dev
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Cleber Rosa <crosa@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 7, 2022 at 2:46 PM Peter Delevoryas <peter@pjd.dev> wrote:
>
> On Wed, Jul 06, 2022 at 05:52:48PM -0700, Peter Delevoryas wrote:
> > On Wed, Jul 06, 2022 at 09:46:48AM -0700, Peter Delevoryas wrote:
> > > On Wed, Jul 06, 2022 at 09:02:14AM +0100, Daniel P. Berrang=C3=A9 wro=
te:
> > > > On Tue, Jul 05, 2022 at 02:46:59PM -0700, Peter Delevoryas wrote:
> > > > > I noticed that I can't run any avocado tests on macOS because the=
 QMP
> > > > > unix socket path is too long:
> > > >
> > > >
> > > > > I think the path limit for unix sockets on macOS might be 104 [1]
> > > >
> > > > All platforms have a very limited path limit, so it isn't really
> > > > a macOS specific problem, rather....
> > > >
> > > > >
> > > > > /*
> > > > >  * [XSI] Definitions for UNIX IPC domain.
> > > > >  */
> > > > > struct  sockaddr_un {
> > > > >     unsigned char   sun_len;        /* sockaddr len including nul=
l */
> > > > >     sa_family_t     sun_family;     /* [XSI] AF_UNIX */
> > > > >     char            sun_path[104];  /* [XSI] path name (gag) */
> > > > > };
> > > > >
> > > > > The path we're using is exactly 105 characters:
> > > > >
> > > > > $ python
> > > > > Python 2.7.10 (default, Jan 19 2016, 22:24:01)
> > > > > [GCC 4.2.1 Compatible Apple LLVM 7.0.2 (clang-700.1.81)] on darwi=
n
> > > > > Type "help", "copyright", "credits" or "license" for more informa=
tion.
> > > > > >>> len('/var/folders/d7/rz20f6hd709c1ty8f6_6y_z40000gn/T/avo_qem=
u_sock_uh3w_dgc/qemu-37331-10bacf110-monitor.sock')
> > > >
> > > > It is a problem related to where the test suite is creating the
> > > > paths.
> > > >
> > > > /var/folders/d7/rz20f6hd709c1ty8f6_6y_z40000gn/T/avo_qemu_sock_uh3w=
_dgc/
> > > >
> > > > is way too deep a directory location.
> > >
> > > That's a good point.
> > >
> > > >
> > > > It seems we just create this location using 'tempfile.TemporyDirect=
ory'
> > > > to get a standard tmp dir.
> > > >
> > > > Do you know why python is choosing
> > > >
> > > >   /var/folders/d7/rz20f6hd709c1ty8f6_6y_z40000gn/T/
> > > >
> > > > as the temp dir ? Is that a standard location on macOS or is it
> > > > from some env variable you have set ?
> > >
> > > Hmmm yeah it is odd, I'm not really sure why it's created there or if
> > > standard glibc tmpfile creation goes there too, I'll go experiment an=
d
> > > report back. And yeah, maybe I'll double check any environment variab=
les or
> > > other things.
> > >
> > > The macOS system I use happens to be a Facebook work laptop, which co=
uld
> > > also be related now that I think about it.
> >
> > Hmmm yeah looks like this is because my TMPDIR is weird.
> >
> > $ echo $TMPDIR
> > /var/folders/d7/rz20f6hd709c1ty8f6_6y_z40000gn/T/
> >
> > I didn't think to check this cause I wasn't familiar with TMPDIR. =F0=
=9F=A4=B7
> >
> > Thanks for responding, I'll just use TMPDIR=3D/tmp for now. It's probab=
ly
> > something wrong with the Facebook development environment.
> >
> > Peter
>
> Update: Actually, this might not be a Facebook-work-laptop specific
> thing.  I asked my non-engineer friend to print out $TMPDIR on his
> macbook and he got the same thing.
>
> https://apple.stackexchange.com/questions/353832/why-is-mac-osx-temp-dire=
ctory-in-weird-path
>
> I guess this person suggests it's just to separate the permissions for
> each user's /tmp directory, for better isolation.
>
> I'll resubmit this patch with the suggestions you had, because perhaps
> this is actually affecting other macOS users too.
>
> >
> > >
> > > >
> > > > > diff --git a/python/qemu/machine/machine.py b/python/qemu/machine=
/machine.py
> > > > > index 37191f433b..93451774e3 100644
> > > > > --- a/python/qemu/machine/machine.py
> > > > > +++ b/python/qemu/machine/machine.py
> > > > > @@ -157,7 +157,7 @@ def __init__(self,
> > > > >          self._wrapper =3D wrapper
> > > > >          self._qmp_timer =3D qmp_timer
> > > > >
> > > > > -        self._name =3D name or f"qemu-{os.getpid()}-{id(self):02=
x}"
> > > > > +        self._name =3D name or f"{os.getpid()}{id(self):02x}"
> > > >
> > > > I don't think this is the right fix really, because IMHO the proble=
m
> > > > is the hugely long path, rather than the final socket name.
> > >
> > > True, yeah let me try to investigate the directory placement.
> > >
> > > >
> > > > That said, there is redundancy in the path - avocado is passing in
> > > > a dierctory created using 'tempfile.TemporyDirectory' so there is n=
o
> > > > reason why we need to add more entropy via the POD and the 'id(self=
)'
> > > > hex string.
> > >
> > > Oh good point, I hadn't thought about that.
> > >
> > > >
> > > > IMHO avocado should pass in the 'name' parameter explicitly, using =
a
> > > > plain name and thus get a shorter string.
> > >
> > > I see, yeah that makes sense. Maybe I can include a couple patches fo=
r this,
> > > one fixing the directory location, and one refactoring the temporary =
file
> > > name template (If I'm understanding your suggestion correctly).
> > >
> > > Thanks for the review! I really appreciate it.
> > > Peter

I agree with Dan: I believe the correct solution here is for Avocado
to provide its own less redundant name; but the default name that
machine.py provides is not *that* long and provides adequate
protection against collisions with multiple instances of the VM
utility within a single python process. If Avocado is creating its own
directories that guard against that redundancy, Avocado should provide
a shortened name for the VM.

Note that the QEMUMachine process also provides a sock_dir parameter
that was introduced for precisely this reason; it should be possible
to instruct the avocado tests to use a shorter path for sock_dir.

I'm not clear on what the best "just works" solution will be when
certain operating environments choose a tmp dir that's quite long to
begin with; maybe we need a different default sockfile naming strategy
that avoids the instance collision problem in machine.py, too. Ideas?

--js

> > >
> > > >
> > > > >          self._temp_dir: Optional[str] =3D None
> > > > >          self._base_temp_dir =3D base_temp_dir
> > > > >          self._sock_dir =3D sock_dir
> > > > > @@ -167,7 +167,7 @@ def __init__(self,
> > > > >              self._monitor_address =3D monitor_address
> > > > >          else:
> > > > >              self._monitor_address =3D os.path.join(
> > > > > -                self.sock_dir, f"{self._name}-monitor.sock"
> > > > > +                self.sock_dir, f"{self._name}.sock"
> > > > >              )
> > > > >
> > > > >          self._console_log_path =3D console_log
> > > > > --
> > > > > 2.37.0
> > > > >
> > > > >
> > > >
> > > > With regards,
> > > > Daniel
> > > > --
> > > > |: https://berrange.com      -o-    https://www.flickr.com/photos/d=
berrange :|
> > > > |: https://libvirt.org         -o-            https://fstop138.berr=
ange.com :|
> > > > |: https://entangle-photo.org    -o-    https://www.instagram.com/d=
berrange :|
> > > >
> > >
> >
>


