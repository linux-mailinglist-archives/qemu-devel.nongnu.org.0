Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06131571EBF
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 17:17:43 +0200 (CEST)
Received: from localhost ([::1]:52670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBHdt-0004yd-GY
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 11:17:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1oBHap-0002p2-U3
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 11:14:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1oBHal-0002Yc-Fx
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 11:14:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657638865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=N5AZ/VGfdcHwbGDwKvDWvV7uLaLsYb0yzDkzGNNtNhg=;
 b=PvpF5WE0l2sXgg2fmV+tKswgjNmiu+jrpEVzP4pcPx57XTPXk/6iewbrNIPGnx5XsFCASu
 +OTP+bJj9tluvpaILKbcwQpLAAi+8AxRmreUp8E0QPDWQW6Q82K84M0qJxBdkNy8Vy7nqP
 F3e4wn1/NICFvYU8Ta/eRsIx/o5e+8Y=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-189--UgSU0JHNGaz4Omihgx9jQ-1; Tue, 12 Jul 2022 11:14:24 -0400
X-MC-Unique: -UgSU0JHNGaz4Omihgx9jQ-1
Received: by mail-ua1-f70.google.com with SMTP id
 c45-20020ab01470000000b0038361e2d746so1542106uae.15
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 08:14:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N5AZ/VGfdcHwbGDwKvDWvV7uLaLsYb0yzDkzGNNtNhg=;
 b=b5e2JfFmw77IQEqRYhH/WyG6MZLsyybd+9rDxb+oYt5Gl8OmQTsu/CE/3c++EcwR9t
 2pm/vF7eZXaFS5pWRoJ6gAq4Q9F4jSU69aF6hqxifwICUZ1pJCCyyCTSfB3Dnhxh9pRl
 vSXbUbloiQPo/HFST8qJzLFp5XooXtFuns3tTy8HnywYxuuxqHj/KGsgRk99gDum4B1D
 xIbtS+iVKDM+fuUC8Y8r7HQIe8mClLKYhDTRXuv3GVVORLOd78muVKQBLT4XxUs5qwLs
 MRfFikDTcyuuXCwfdzQQQZxVpBH0eDFYYEp6COOEYYlL22HF+6asmYK8T+7OoTSIYz14
 Nf6Q==
X-Gm-Message-State: AJIora9izfV201k7Oq0a9PViqykvBddfIL42UNifRSudtLporlN+c8tP
 RZZ5Ws4PaqJb038gLCVaLeDImOZgMxWFYfn5gehjTwSNOBoAQGdn48eFyIqrhPqwt7B7qzqg7FZ
 J19OdwRG8VWMLLe0MiJjCllM898sTuHs=
X-Received: by 2002:a1f:27d6:0:b0:374:3614:d037 with SMTP id
 n205-20020a1f27d6000000b003743614d037mr8851552vkn.1.1657638862979; 
 Tue, 12 Jul 2022 08:14:22 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vWcAlzlr5hSZYfpx7g6Hl15F5EfLoeMJ0qwP6oM8zmrqyBpHD06uiju3vqSqNOPNkVTStOOkl22h8t3Ssymyo=
X-Received: by 2002:a1f:27d6:0:b0:374:3614:d037 with SMTP id
 n205-20020a1f27d6000000b003743614d037mr8851487vkn.1.1657638862443; Tue, 12
 Jul 2022 08:14:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220705214659.73369-1-peter@pjd.dev>
 <YsVBhmvAm2ANDUEt@redhat.com>
 <YsW8eO5eeRKfpxJp@r37> <YsYuYAJE2Hx64aIY@pdel-mbp.dhcp.thefacebook.com>
 <YscqCErtNGOG9GVx@pdel-mbp.dhcp.thefacebook.com>
 <CAFn=p-bhhu+G-p=w_K2OSOe0WkDHbBaO0ZS53F+jTDuo074VFw@mail.gmail.com>
 <YszSe2qCVcqd0CVI@pdel-mbp.dhcp.thefacebook.com>
In-Reply-To: <YszSe2qCVcqd0CVI@pdel-mbp.dhcp.thefacebook.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 12 Jul 2022 11:14:11 -0400
Message-ID: <CAFn=p-ZnxcEj6=-HNV1BeePTtXHGmvp+AwtMeUFTTqYh0a8YTA@mail.gmail.com>
Subject: Re: [PATCH RESEND] python/machine: Fix AF_UNIX path too long on macOS
To: Peter Delevoryas <peter@pjd.dev>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Cleber Rosa <crosa@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000008feac905e39d1fcd"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--0000000000008feac905e39d1fcd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 11, 2022, 9:46 PM Peter Delevoryas <peter@pjd.dev> wrote:

> On Mon, Jul 11, 2022 at 04:56:28PM -0400, John Snow wrote:
> > On Thu, Jul 7, 2022 at 2:46 PM Peter Delevoryas <peter@pjd.dev> wrote:
> > >
> > > On Wed, Jul 06, 2022 at 05:52:48PM -0700, Peter Delevoryas wrote:
> > > > On Wed, Jul 06, 2022 at 09:46:48AM -0700, Peter Delevoryas wrote:
> > > > > On Wed, Jul 06, 2022 at 09:02:14AM +0100, Daniel P. Berrang=C3=A9=
 wrote:
> > > > > > On Tue, Jul 05, 2022 at 02:46:59PM -0700, Peter Delevoryas wrot=
e:
> > > > > > > I noticed that I can't run any avocado tests on macOS because
> the QMP
> > > > > > > unix socket path is too long:
> > > > > >
> > > > > >
> > > > > > > I think the path limit for unix sockets on macOS might be 104
> [1]
> > > > > >
> > > > > > All platforms have a very limited path limit, so it isn't reall=
y
> > > > > > a macOS specific problem, rather....
> > > > > >
> > > > > > >
> > > > > > > /*
> > > > > > >  * [XSI] Definitions for UNIX IPC domain.
> > > > > > >  */
> > > > > > > struct  sockaddr_un {
> > > > > > >     unsigned char   sun_len;        /* sockaddr len including
> null */
> > > > > > >     sa_family_t     sun_family;     /* [XSI] AF_UNIX */
> > > > > > >     char            sun_path[104];  /* [XSI] path name (gag) =
*/
> > > > > > > };
> > > > > > >
> > > > > > > The path we're using is exactly 105 characters:
> > > > > > >
> > > > > > > $ python
> > > > > > > Python 2.7.10 (default, Jan 19 2016, 22:24:01)
> > > > > > > [GCC 4.2.1 Compatible Apple LLVM 7.0.2 (clang-700.1.81)] on
> darwin
> > > > > > > Type "help", "copyright", "credits" or "license" for more
> information.
> > > > > > > >>>
> len('/var/folders/d7/rz20f6hd709c1ty8f6_6y_z40000gn/T/avo_qemu_sock_uh3w_=
dgc/qemu-37331-10bacf110-monitor.sock')
> > > > > >
> > > > > > It is a problem related to where the test suite is creating the
> > > > > > paths.
> > > > > >
> > > > > >
> /var/folders/d7/rz20f6hd709c1ty8f6_6y_z40000gn/T/avo_qemu_sock_uh3w_dgc/
> > > > > >
> > > > > > is way too deep a directory location.
> > > > >
> > > > > That's a good point.
> > > > >
> > > > > >
> > > > > > It seems we just create this location using
> 'tempfile.TemporyDirectory'
> > > > > > to get a standard tmp dir.
> > > > > >
> > > > > > Do you know why python is choosing
> > > > > >
> > > > > >   /var/folders/d7/rz20f6hd709c1ty8f6_6y_z40000gn/T/
> > > > > >
> > > > > > as the temp dir ? Is that a standard location on macOS or is it
> > > > > > from some env variable you have set ?
> > > > >
> > > > > Hmmm yeah it is odd, I'm not really sure why it's created there o=
r
> if
> > > > > standard glibc tmpfile creation goes there too, I'll go experimen=
t
> and
> > > > > report back. And yeah, maybe I'll double check any environment
> variables or
> > > > > other things.
> > > > >
> > > > > The macOS system I use happens to be a Facebook work laptop, whic=
h
> could
> > > > > also be related now that I think about it.
> > > >
> > > > Hmmm yeah looks like this is because my TMPDIR is weird.
> > > >
> > > > $ echo $TMPDIR
> > > > /var/folders/d7/rz20f6hd709c1ty8f6_6y_z40000gn/T/
> > > >
> > > > I didn't think to check this cause I wasn't familiar with TMPDIR. =
=F0=9F=A4=B7
> > > >
> > > > Thanks for responding, I'll just use TMPDIR=3D/tmp for now. It's
> probably
> > > > something wrong with the Facebook development environment.
> > > >
> > > > Peter
> > >
> > > Update: Actually, this might not be a Facebook-work-laptop specific
> > > thing.  I asked my non-engineer friend to print out $TMPDIR on his
> > > macbook and he got the same thing.
> > >
> > >
> https://apple.stackexchange.com/questions/353832/why-is-mac-osx-temp-dire=
ctory-in-weird-path
> > >
> > > I guess this person suggests it's just to separate the permissions fo=
r
> > > each user's /tmp directory, for better isolation.
> > >
> > > I'll resubmit this patch with the suggestions you had, because perhap=
s
> > > this is actually affecting other macOS users too.
> > >
> > > >
> > > > >
> > > > > >
> > > > > > > diff --git a/python/qemu/machine/machine.py
> b/python/qemu/machine/machine.py
> > > > > > > index 37191f433b..93451774e3 100644
> > > > > > > --- a/python/qemu/machine/machine.py
> > > > > > > +++ b/python/qemu/machine/machine.py
> > > > > > > @@ -157,7 +157,7 @@ def __init__(self,
> > > > > > >          self._wrapper =3D wrapper
> > > > > > >          self._qmp_timer =3D qmp_timer
> > > > > > >
> > > > > > > -        self._name =3D name or
> f"qemu-{os.getpid()}-{id(self):02x}"
> > > > > > > +        self._name =3D name or f"{os.getpid()}{id(self):02x}=
"
> > > > > >
> > > > > > I don't think this is the right fix really, because IMHO the
> problem
> > > > > > is the hugely long path, rather than the final socket name.
> > > > >
> > > > > True, yeah let me try to investigate the directory placement.
> > > > >
> > > > > >
> > > > > > That said, there is redundancy in the path - avocado is passing
> in
> > > > > > a dierctory created using 'tempfile.TemporyDirectory' so there
> is no
> > > > > > reason why we need to add more entropy via the POD and the
> 'id(self)'
> > > > > > hex string.
> > > > >
> > > > > Oh good point, I hadn't thought about that.
> > > > >
> > > > > >
> > > > > > IMHO avocado should pass in the 'name' parameter explicitly,
> using a
> > > > > > plain name and thus get a shorter string.
> > > > >
> > > > > I see, yeah that makes sense. Maybe I can include a couple patche=
s
> for this,
> > > > > one fixing the directory location, and one refactoring the
> temporary file
> > > > > name template (If I'm understanding your suggestion correctly).
> > > > >
> > > > > Thanks for the review! I really appreciate it.
> > > > > Peter
> >
> > I agree with Dan: I believe the correct solution here is for Avocado
> > to provide its own less redundant name; but the default name that
> > machine.py provides is not *that* long and provides adequate
> > protection against collisions with multiple instances of the VM
> > utility within a single python process. If Avocado is creating its own
> > directories that guard against that redundancy, Avocado should provide
> > a shortened name for the VM.
>
> Hmmm, I see.
>
> >
> > Note that the QEMUMachine process also provides a sock_dir parameter
> > that was introduced for precisely this reason; it should be possible
> > to instruct the avocado tests to use a shorter path for sock_dir.
> >
> > I'm not clear on what the best "just works" solution will be when
> > certain operating environments choose a tmp dir that's quite long to
> > begin with; maybe we need a different default sockfile naming strategy
> > that avoids the instance collision problem in machine.py, too. Ideas?
>
> I guess I don't really understand why QEMU is attempting to create a
> unique path instead of just using mktemp(), right? This seems like
> something that the OS can provide. If we want some semblance of meaning
> to the filename, we can provide a short template, right?
>

Yeah, should be good. The "name" of the VM should be left unique for
logging purposes, so the name should remain as-is, IMO.

However, if you want to change how we create the sockfile by using a new,
temporary name (and not the vm name), that works for me as far as I can
remember.

I think there was some desire to have the temp file obviously correlate to
the instance, but that's not a hard requirement, so feel free to change
that part.

Just make sure that come hell or high water the sockfile is cleaned up on
exit.



> -- Peter
>
>
> >
> > --js
> >
> > > > >
> > > > > >
> > > > > > >          self._temp_dir: Optional[str] =3D None
> > > > > > >          self._base_temp_dir =3D base_temp_dir
> > > > > > >          self._sock_dir =3D sock_dir
> > > > > > > @@ -167,7 +167,7 @@ def __init__(self,
> > > > > > >              self._monitor_address =3D monitor_address
> > > > > > >          else:
> > > > > > >              self._monitor_address =3D os.path.join(
> > > > > > > -                self.sock_dir, f"{self._name}-monitor.sock"
> > > > > > > +                self.sock_dir, f"{self._name}.sock"
> > > > > > >              )
> > > > > > >
> > > > > > >          self._console_log_path =3D console_log
> > > > > > > --
> > > > > > > 2.37.0
> > > > > > >
> > > > > > >
> > > > > >
> > > > > > With regards,
> > > > > > Daniel
> > > > > > --
> > > > > > |: https://berrange.com      -o-
> https://www.flickr.com/photos/dberrange :|
> > > > > > |: https://libvirt.org         -o-
> https://fstop138.berrange.com :|
> > > > > > |: https://entangle-photo.org    -o-
> https://www.instagram.com/dberrange :|
> > > > > >
> > > > >
> > > >
> > >
> >
>
>

--0000000000008feac905e39d1fcd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Mon, Jul 11, 2022, 9:46 PM Peter Delevoryas &lt;<a =
href=3D"mailto:peter@pjd.dev">peter@pjd.dev</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">On Mon, Jul 11, 2022 at 04:56:28PM -0400, John Snow=
 wrote:<br>
&gt; On Thu, Jul 7, 2022 at 2:46 PM Peter Delevoryas &lt;<a href=3D"mailto:=
peter@pjd.dev" target=3D"_blank" rel=3D"noreferrer">peter@pjd.dev</a>&gt; w=
rote:<br>
&gt; &gt;<br>
&gt; &gt; On Wed, Jul 06, 2022 at 05:52:48PM -0700, Peter Delevoryas wrote:=
<br>
&gt; &gt; &gt; On Wed, Jul 06, 2022 at 09:46:48AM -0700, Peter Delevoryas w=
rote:<br>
&gt; &gt; &gt; &gt; On Wed, Jul 06, 2022 at 09:02:14AM +0100, Daniel P. Ber=
rang=C3=A9 wrote:<br>
&gt; &gt; &gt; &gt; &gt; On Tue, Jul 05, 2022 at 02:46:59PM -0700, Peter De=
levoryas wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; I noticed that I can&#39;t run any avocado te=
sts on macOS because the QMP<br>
&gt; &gt; &gt; &gt; &gt; &gt; unix socket path is too long:<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; I think the path limit for unix sockets on ma=
cOS might be 104 [1]<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; All platforms have a very limited path limit, so i=
t isn&#39;t really<br>
&gt; &gt; &gt; &gt; &gt; a macOS specific problem, rather....<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; /*<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 * [XSI] Definitions for UNIX IPC domain=
.<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 */<br>
&gt; &gt; &gt; &gt; &gt; &gt; struct=C2=A0 sockaddr_un {<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0unsigned char=C2=A0 =C2=A0=
sun_len;=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* sockaddr len including null */<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0sa_family_t=C2=A0 =C2=A0 =
=C2=A0sun_family;=C2=A0 =C2=A0 =C2=A0/* [XSI] AF_UNIX */<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0char=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 sun_path[104];=C2=A0 /* [XSI] path name (gag) */<br>
&gt; &gt; &gt; &gt; &gt; &gt; };<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; The path we&#39;re using is exactly 105 chara=
cters:<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; $ python<br>
&gt; &gt; &gt; &gt; &gt; &gt; Python 2.7.10 (default, Jan 19 2016, 22:24:01=
)<br>
&gt; &gt; &gt; &gt; &gt; &gt; [GCC 4.2.1 Compatible Apple LLVM 7.0.2 (clang=
-700.1.81)] on darwin<br>
&gt; &gt; &gt; &gt; &gt; &gt; Type &quot;help&quot;, &quot;copyright&quot;,=
 &quot;credits&quot; or &quot;license&quot; for more information.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt;&gt; len(&#39;/var/folders/d7/rz20f6h=
d709c1ty8f6_6y_z40000gn/T/avo_qemu_sock_uh3w_dgc/qemu-37331-10bacf110-monit=
or.sock&#39;)<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; It is a problem related to where the test suite is=
 creating the<br>
&gt; &gt; &gt; &gt; &gt; paths.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; /var/folders/d7/rz20f6hd709c1ty8f6_6y_z40000gn/T/a=
vo_qemu_sock_uh3w_dgc/<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; is way too deep a directory location.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; That&#39;s a good point.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; It seems we just create this location using &#39;t=
empfile.TemporyDirectory&#39;<br>
&gt; &gt; &gt; &gt; &gt; to get a standard tmp dir.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Do you know why python is choosing<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0/var/folders/d7/rz20f6hd709c1ty8f6_6y_=
z40000gn/T/<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; as the temp dir ? Is that a standard location on m=
acOS or is it<br>
&gt; &gt; &gt; &gt; &gt; from some env variable you have set ?<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Hmmm yeah it is odd, I&#39;m not really sure why it&#39=
;s created there or if<br>
&gt; &gt; &gt; &gt; standard glibc tmpfile creation goes there too, I&#39;l=
l go experiment and<br>
&gt; &gt; &gt; &gt; report back. And yeah, maybe I&#39;ll double check any =
environment variables or<br>
&gt; &gt; &gt; &gt; other things.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; The macOS system I use happens to be a Facebook work la=
ptop, which could<br>
&gt; &gt; &gt; &gt; also be related now that I think about it.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Hmmm yeah looks like this is because my TMPDIR is weird.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; $ echo $TMPDIR<br>
&gt; &gt; &gt; /var/folders/d7/rz20f6hd709c1ty8f6_6y_z40000gn/T/<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I didn&#39;t think to check this cause I wasn&#39;t familiar=
 with TMPDIR. =F0=9F=A4=B7<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Thanks for responding, I&#39;ll just use TMPDIR=3D/tmp for n=
ow. It&#39;s probably<br>
&gt; &gt; &gt; something wrong with the Facebook development environment.<b=
r>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Peter<br>
&gt; &gt;<br>
&gt; &gt; Update: Actually, this might not be a Facebook-work-laptop specif=
ic<br>
&gt; &gt; thing.=C2=A0 I asked my non-engineer friend to print out $TMPDIR =
on his<br>
&gt; &gt; macbook and he got the same thing.<br>
&gt; &gt;<br>
&gt; &gt; <a href=3D"https://apple.stackexchange.com/questions/353832/why-i=
s-mac-osx-temp-directory-in-weird-path" rel=3D"noreferrer noreferrer" targe=
t=3D"_blank">https://apple.stackexchange.com/questions/353832/why-is-mac-os=
x-temp-directory-in-weird-path</a><br>
&gt; &gt;<br>
&gt; &gt; I guess this person suggests it&#39;s just to separate the permis=
sions for<br>
&gt; &gt; each user&#39;s /tmp directory, for better isolation.<br>
&gt; &gt;<br>
&gt; &gt; I&#39;ll resubmit this patch with the suggestions you had, becaus=
e perhaps<br>
&gt; &gt; this is actually affecting other macOS users too.<br>
&gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; diff --git a/python/qemu/machine/machine.py b=
/python/qemu/machine/machine.py<br>
&gt; &gt; &gt; &gt; &gt; &gt; index 37191f433b..93451774e3 100644<br>
&gt; &gt; &gt; &gt; &gt; &gt; --- a/python/qemu/machine/machine.py<br>
&gt; &gt; &gt; &gt; &gt; &gt; +++ b/python/qemu/machine/machine.py<br>
&gt; &gt; &gt; &gt; &gt; &gt; @@ -157,7 +157,7 @@ def __init__(self,<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._wrapp=
er =3D wrapper<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._qmp_t=
imer =3D qmp_timer<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._name =3D n=
ame or f&quot;qemu-{os.getpid()}-{id(self):02x}&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._name =3D n=
ame or f&quot;{os.getpid()}{id(self):02x}&quot;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; I don&#39;t think this is the right fix really, be=
cause IMHO the problem<br>
&gt; &gt; &gt; &gt; &gt; is the hugely long path, rather than the final soc=
ket name.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; True, yeah let me try to investigate the directory plac=
ement.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; That said, there is redundancy in the path - avoca=
do is passing in<br>
&gt; &gt; &gt; &gt; &gt; a dierctory created using &#39;tempfile.TemporyDir=
ectory&#39; so there is no<br>
&gt; &gt; &gt; &gt; &gt; reason why we need to add more entropy via the POD=
 and the &#39;id(self)&#39;<br>
&gt; &gt; &gt; &gt; &gt; hex string.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Oh good point, I hadn&#39;t thought about that.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; IMHO avocado should pass in the &#39;name&#39; par=
ameter explicitly, using a<br>
&gt; &gt; &gt; &gt; &gt; plain name and thus get a shorter string.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; I see, yeah that makes sense. Maybe I can include a cou=
ple patches for this,<br>
&gt; &gt; &gt; &gt; one fixing the directory location, and one refactoring =
the temporary file<br>
&gt; &gt; &gt; &gt; name template (If I&#39;m understanding your suggestion=
 correctly).<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Thanks for the review! I really appreciate it.<br>
&gt; &gt; &gt; &gt; Peter<br>
&gt; <br>
&gt; I agree with Dan: I believe the correct solution here is for Avocado<b=
r>
&gt; to provide its own less redundant name; but the default name that<br>
&gt; machine.py provides is not *that* long and provides adequate<br>
&gt; protection against collisions with multiple instances of the VM<br>
&gt; utility within a single python process. If Avocado is creating its own=
<br>
&gt; directories that guard against that redundancy, Avocado should provide=
<br>
&gt; a shortened name for the VM.<br>
<br>
Hmmm, I see.<br>
<br>
&gt; <br>
&gt; Note that the QEMUMachine process also provides a sock_dir parameter<b=
r>
&gt; that was introduced for precisely this reason; it should be possible<b=
r>
&gt; to instruct the avocado tests to use a shorter path for sock_dir.<br>
&gt; <br>
&gt; I&#39;m not clear on what the best &quot;just works&quot; solution wil=
l be when<br>
&gt; certain operating environments choose a tmp dir that&#39;s quite long =
to<br>
&gt; begin with; maybe we need a different default sockfile naming strategy=
<br>
&gt; that avoids the instance collision problem in machine.py, too. Ideas?<=
br>
<br>
I guess I don&#39;t really understand why QEMU is attempting to create a<br=
>
unique path instead of just using mktemp(), right? This seems like<br>
something that the OS can provide. If we want some semblance of meaning<br>
to the filename, we can provide a short template, right?<br></blockquote></=
div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Yeah, should be goo=
d. The &quot;name&quot; of the VM should be left unique for logging purpose=
s, so the name should remain as-is, IMO.</div><div dir=3D"auto"><br></div><=
div dir=3D"auto">However, if you want to change how we create the sockfile =
by using a new, temporary name (and not the vm name), that works for me as =
far as I can remember.</div><div dir=3D"auto"><br></div><div dir=3D"auto">I=
 think there was some desire to have the temp file obviously correlate to t=
he instance, but that&#39;s not a hard requirement, so feel free to change =
that part.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Just make sur=
e that come hell or high water the sockfile is cleaned up on exit.</div><di=
v dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto"><div=
 class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
-- Peter<br>
<br><br>
&gt; <br>
&gt; --js<br>
&gt; <br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._temp_=
dir: Optional[str] =3D None<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._base_=
temp_dir =3D base_temp_dir<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._sock_=
dir =3D sock_dir<br>
&gt; &gt; &gt; &gt; &gt; &gt; @@ -167,7 +167,7 @@ def __init__(self,<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 self._monitor_address =3D monitor_address<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 self._monitor_address =3D os.path.join(<br>
&gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 self.sock_dir, f&quot;{self._name}-monitor.sock&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 self.sock_dir, f&quot;{self._name}.sock&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 )<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._conso=
le_log_path =3D console_log<br>
&gt; &gt; &gt; &gt; &gt; &gt; --<br>
&gt; &gt; &gt; &gt; &gt; &gt; 2.37.0<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; With regards,<br>
&gt; &gt; &gt; &gt; &gt; Daniel<br>
&gt; &gt; &gt; &gt; &gt; --<br>
&gt; &gt; &gt; &gt; &gt; |: <a href=3D"https://berrange.com" rel=3D"norefer=
rer noreferrer" target=3D"_blank">https://berrange.com</a>=C2=A0 =C2=A0 =C2=
=A0 -o-=C2=A0 =C2=A0 <a href=3D"https://www.flickr.com/photos/dberrange" re=
l=3D"noreferrer noreferrer" target=3D"_blank">https://www.flickr.com/photos=
/dberrange</a> :|<br>
&gt; &gt; &gt; &gt; &gt; |: <a href=3D"https://libvirt.org" rel=3D"noreferr=
er noreferrer" target=3D"_blank">https://libvirt.org</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0-o-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"ht=
tps://fstop138.berrange.com" rel=3D"noreferrer noreferrer" target=3D"_blank=
">https://fstop138.berrange.com</a> :|<br>
&gt; &gt; &gt; &gt; &gt; |: <a href=3D"https://entangle-photo.org" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">https://entangle-photo.org</a>=C2=
=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a href=3D"https://www.instagram.com/dberrange"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">https://www.instagram.com/=
dberrange</a> :|<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt;<br>
&gt; <br>
<br>
</blockquote></div></div></div>

--0000000000008feac905e39d1fcd--


