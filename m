Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF65415150
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 22:21:44 +0200 (CEST)
Received: from localhost ([::1]:56514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT8kR-0003tr-Cb
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 16:21:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mT8hj-0001aR-Vo
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 16:18:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mT8hh-0006vj-Fm
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 16:18:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632341932;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9GLEpbVOjptJC5jzyjxFgFN65nRd5K+wSaERSbDlELw=;
 b=VFBNj1v2YePkx05c/wQLfzWW7MHDaPRHQcCfjjub9WVmEbgLuk5BXsRycLaXSpWxHLqAlK
 n0mvB5ud9VC/T1znVN2GRRyUTWt8zp+y7NCEBMdLpv15xspOBcOZITZwoT/58esvCyrl3J
 TfoR2ePEDnjqJYYVYi4Sv/Fxajg1t74=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-504-DhkAx3FmO7OPXdqkWE0hvg-1; Wed, 22 Sep 2021 16:18:43 -0400
X-MC-Unique: DhkAx3FmO7OPXdqkWE0hvg-1
Received: by mail-oi1-f199.google.com with SMTP id
 j200-20020acaebd1000000b0027357b3466aso2494587oih.1
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 13:18:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9GLEpbVOjptJC5jzyjxFgFN65nRd5K+wSaERSbDlELw=;
 b=j7UbQKlr/BKEwqDA/4HyxBTGX1lZL3UyhyTTgsiyceMeARR1jODGTkLcUiTN0YNZwk
 O6Y6B2smvz0s4dzwAovE5/ejnGMsqGYPC9u+wS2yXDebldzb64MMlpJvufdceQy6oaZu
 7SW3BH55QZFeVc1Q3fWsPQIe/30F4wGoi2Jg3whNJpOfVb1V6CTb3KLiSGdRqGX8Klo1
 Kge+W+II3lJJhE1NQOxUpbhC5yYS/PshN+CTNo1CC5WZyHEKWUtKDL6wP7q6YUGZxRZU
 V16GveEoKJ9O6DBENzJHx5CRhxzSfsnE4Hg2nrBgapnoX8svj+XUxS1hnaOzXm+ErWc3
 7C1A==
X-Gm-Message-State: AOAM531ix3Lyoyvfp2nbvYYKdd3G3n2oEACpk8782QBX06hK/dZU15Cg
 vk781UZcWLeEa7jZAY1/OStomVFsAGsCyrlGZcMUtuVBiB0G9gyTRVRzffr7LoswJuiAO71aLKZ
 7eUj25B4xriYR/RFKP/mcuXCmHoH57YI=
X-Received: by 2002:a05:6830:13c5:: with SMTP id
 e5mr905978otq.374.1632341922486; 
 Wed, 22 Sep 2021 13:18:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLCmkrypGEM43cBggi8KYMfXSnEkiVc8HvZ4vwl97J1aL11olyMyqakVL3P+iyYjtHSUIEMaJ+FZrVz0DEZ38=
X-Received: by 2002:a05:6830:13c5:: with SMTP id
 e5mr905961otq.374.1632341922238; 
 Wed, 22 Sep 2021 13:18:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210916040955.628560-1-jsnow@redhat.com>
 <20210916040955.628560-12-jsnow@redhat.com>
 <f3d43e69-4719-d0b9-79c1-03a7732839ed@redhat.com>
In-Reply-To: <f3d43e69-4719-d0b9-79c1-03a7732839ed@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Wed, 22 Sep 2021 16:18:31 -0400
Message-ID: <CAFn=p-ZXxKDQUxUtupC+arC7_faMFvoJm9XxwxSPDxGRC2Ku=Q@mail.gmail.com>
Subject: Re: [PATCH v3 11/16] iotests/297: return error code from run_linters()
To: Hanna Reitz <hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000006d68f605cc9b38f8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000006d68f605cc9b38f8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 17, 2021 at 7:00 AM Hanna Reitz <hreitz@redhat.com> wrote:

> On 16.09.21 06:09, John Snow wrote:
> > This turns run_linters() into a bit of a hybrid test; returning non-zer=
o
> > on failed execution while also printing diffable information. This is
> > done for the benefit of the avocado simple test runner, which will soon
> > be attempting to execute this test from a different environment.
> >
> > (Note: universal_newlines is added to the pylint invocation for type
> > consistency with the mypy run -- it's not strictly necessary, but it
> > avoids some typing errors caused by our re-use of the 'p' variable.)
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> > ---
> >   tests/qemu-iotests/297 | 10 ++++++++--
> >   1 file changed, 8 insertions(+), 2 deletions(-)
>
> I don=E2=80=99t think I like this very much.  Returning an integer error =
code
> seems archaic.
>
> (You can perhaps already see that this is going to be one of these
> reviews of mine where I won=E2=80=99t say anything is really wrong, but w=
here I
> will just lament subjectively missing beauty.)
>
>
Haha. It's fine, Vladimir didn't like the smell of this one either. I just
didn't want to prematurely optimize or overcomplicate.


> As you say, run_linters() to me seems very iotests-specific still: It
> emits a specific output that is compared against a reference output.
> Fine for 297, but not fine for a function provided by a linters.py, I=E2=
=80=99d
> say.
>
> I=E2=80=99d prefer run_linters() to return something like a Map[str,
> Optional[str]], that would map a tool to its output in case of error,
> i.e. ideally:
>
> `{'pylint': None, 'mypy': None}`
>
>
Splitting the test apart into two sub-tests is completely reasonable.
Python CI right now has individual tests for pylint, mypy, etc.


> 297 could format it something like
>
> ```
> for tool, output in run_linters().items():
>      print(f'=3D=3D=3D {tool} =3D=3D=3D')
>      if output is not None:
>          print(output)
> ```
>
> Or something.
>
> To check for error, you could put a Python script in python/tests that
> checks `any(output is not None for output in run_linters().values())` or
> something (and on error print the output).
>
>
> Pulling out run_linters() into an external file and having it print
> something to stdout just seems too iotests-centric to me.  I suppose as
> long as the return code is right (which this patch is for) it should
> work for Avocado=E2=80=99s simple tests, too (which I don=E2=80=99t like =
very much
> either, by the way, because they too seem archaic to me), but, well.  It
> almost seems like the Avocado test should just run ./check then.
>
>
Yeh. Ideally, we'd just have a mypy.ini and a pylintrc that configures the
tests adequately, and then 297 (or whomever else) would just call the
linters which would in turn read the same configuration. This series is
somewhat of a stop-gap to measure the temperature of the room to see how
important it was to leave 297 inside of iotests. So, I did the conservative
thing that's faster to review even if it now looks *slightly* fishy.

As for things being archaic or not ... possibly, but why involve extra
complexity if it isn't warranted? a simple pass/fail works perfectly well.
(And the human can read the output to understand WHY it failed.) If you
want more rigorous analytics for some reason, we can discuss the use cases
and figure out how to represent that information, but that's definitely a
bit beyond scope here.

>
> Come to think of it, to be absolutely blasphemous, why not.  I could say
> all of this seems like quite some work that could be done by a
> python/tests script that does this:
>
> ```
> #!/bin/sh
> set -e
>
> cat >/tmp/qemu-parrot.sh <<EOF
> #!/bin/sh
> echo ': qcow2'
> echo ': qcow2'
> echo 'virtio-blk'
> EOF
>
> cd $QEMU_DIR/tests/qemu-iotests
>
> QEMU_PROG=3D"/tmp/qemu-parrot.sh" \
> QEMU_IMG_PROG=3D$(which false) \
> QEMU_IO_PROG=3D$(which false) \
> QEMU_NBD_PROG=3D$(which false) \
> QSD_PROG=3D$(which false) \
> ./check 297
> ```
>
> And, no, I don=E2=80=99t want that!  But the point of this series seems t=
o just
> be to rip the core of 297 out so it can run without ./check, because
> ./check requires some environment variables to be set. Doing that seems
> just seems wrong to me.
>
>
Right, the point of this series is effectively to split out the linting
configuration and separate it from the "test" which executes the linters
with that configuration. Simplest possible thing was to just take the
configuration as it exists in its current form -- hardcoded in a python
script -- and isolate it. To my delight, it worked quite well!


> Like, can=E2=80=99t we have a Python script in python/tests that imports
> linters.py, invokes run_linters() and sensibly checks the output? Or,
> you know, at the very least not have run_linters() print anything to
> stdout and not have it return an integer code. linters.py:main() can do
> that conversion.
>
>
Well, I certainly don't want to bother parsing output from python tools and
trying to make sure that it works sensibly cross-version and cross-distro.
The return code being 0/non-zero is vastly simpler. Let the human read the
output log on failure cases to get a sense of what exactly went wrong. Is
there some reason why parsing the output would be beneficial to anyone?

(The Python GitLab CI hooks don't even bother printing output to the
console unless it returns non-zero, and then it will just print whatever it
saw. Seems to work well in practice.)


>
> Or, something completely different, perhaps my problem is that you put
> linters.py as a fully standalone test into the iotests directory,
> without it being an iotest.  So, I think I could also agree on putting
> linters.py into python/tests, and then having 297 execute that.  Or you
> know, we just drop 297 altogether, as you suggest in patch 13 =E2=80=93 i=
f
> that=E2=80=99s what it takes, then so be it.
>
>
I can definitely drop 297 if you'd like, and work on making the linter
configuration more declarative. I erred on the side of less movement
instead of more so that disruption would be minimal. It might take me some
extra time to work out how to un-scriptify the test, though. I'd like to
get a quick temperature check from kwolf on this before I put the work in.


> Hanna
>
>
> PS: Also, summing up processes=E2=80=99 return codes makes me feel not go=
od.
>
>
That's the part Vladimir didn't like. There was no real reason for it,
other than it was "easy". I can make it a binary 0/1 return instead, if
that'd grease the wheels.

(I'll sit on respinning the series for now until we've had some time to
discuss it. I would rather like a chance to involve kwolf as the other
major user of this subsystem.)


> > diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
> > index e05c99972e..f9ddfb53a0 100755
> > --- a/tests/qemu-iotests/297
> > +++ b/tests/qemu-iotests/297
> > @@ -68,19 +68,22 @@ def run_linters(
> >       files: List[str],
> >       directory: str =3D '.',
> >       env: Optional[Mapping[str, str]] =3D None,
> > -) -> None:
> > +) -> int:
> > +    ret =3D 0
> >
> >       print('=3D=3D=3D pylint =3D=3D=3D')
> >       sys.stdout.flush()
> >
> >       # Todo notes are fine, but fixme's or xxx's should probably just =
be
> >       # fixed (in tests, at least)
> > -    subprocess.run(
> > +    p =3D subprocess.run(
> >           ('python3', '-m', 'pylint', '--score=3Dn', '--notes=3DFIXME,X=
XX',
> *files),
> >           cwd=3Ddirectory,
> >           env=3Denv,
> >           check=3DFalse,
> > +        universal_newlines=3DTrue,
> >       )
> > +    ret +=3D p.returncode
> >
> >       print('=3D=3D=3D mypy =3D=3D=3D')
> >       sys.stdout.flush()
> > @@ -113,9 +116,12 @@ def run_linters(
> >               universal_newlines=3DTrue
> >           )
> >
> > +        ret +=3D p.returncode
> >           if p.returncode !=3D 0:
> >               print(p.stdout)
> >
> > +    return ret
> > +
> >
> >   def main() -> None:
> >       for linter in ('pylint-3', 'mypy'):
>
>

--0000000000006d68f605cc9b38f8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 17, 2021 at 7:00 AM Hanna=
 Reitz &lt;<a href=3D"mailto:hreitz@redhat.com">hreitz@redhat.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 16.09.2=
1 06:09, John Snow wrote:<br>
&gt; This turns run_linters() into a bit of a hybrid test; returning non-ze=
ro<br>
&gt; on failed execution while also printing diffable information. This is<=
br>
&gt; done for the benefit of the avocado simple test runner, which will soo=
n<br>
&gt; be attempting to execute this test from a different environment.<br>
&gt;<br>
&gt; (Note: universal_newlines is added to the pylint invocation for type<b=
r>
&gt; consistency with the mypy run -- it&#39;s not strictly necessary, but =
it<br>
&gt; avoids some typing errors caused by our re-use of the &#39;p&#39; vari=
able.)<br>
&gt;<br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank">jsnow@redhat.com</a>&gt;<br>
&gt; Reviewed-by: Vladimir Sementsov-Ogievskiy &lt;<a href=3D"mailto:vsemen=
tsov@virtuozzo.com" target=3D"_blank">vsementsov@virtuozzo.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0tests/qemu-iotests/297 | 10 ++++++++--<br>
&gt;=C2=A0 =C2=A01 file changed, 8 insertions(+), 2 deletions(-)<br>
<br>
I don=E2=80=99t think I like this very much.=C2=A0 Returning an integer err=
or code <br>
seems archaic.<br>
<br>
(You can perhaps already see that this is going to be one of these <br>
reviews of mine where I won=E2=80=99t say anything is really wrong, but whe=
re I <br>
will just lament subjectively missing beauty.)<br>
<br></blockquote><div><br></div><div>Haha. It&#39;s fine, Vladimir didn&#39=
;t like the smell of this one either. I just didn&#39;t want to prematurely=
 optimize or overcomplicate.<br></div><div>=C2=A0<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
As you say, run_linters() to me seems very iotests-specific still: It <br>
emits a specific output that is compared against a reference output.=C2=A0 =
<br>
Fine for 297, but not fine for a function provided by a linters.py, I=E2=80=
=99d say.<br>
<br>
I=E2=80=99d prefer run_linters() to return something like a Map[str, <br>
Optional[str]], that would map a tool to its output in case of error, <br>
i.e. ideally:<br>
<br>
`{&#39;pylint&#39;: None, &#39;mypy&#39;: None}`<br>
<br></blockquote><div><br></div><div>Splitting the test apart into two sub-=
tests is completely reasonable. Python CI right now has individual tests fo=
r pylint, mypy, etc.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">
297 could format it something like<br>
<br>
```<br>
for tool, output in run_linters().items():<br>
=C2=A0=C2=A0=C2=A0=C2=A0 print(f&#39;=3D=3D=3D {tool} =3D=3D=3D&#39;)<br>
=C2=A0=C2=A0=C2=A0=C2=A0 if output is not None:<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 print(output)<br>
```<br>
<br>
Or something.<br>
<br>
To check for error, you could put a Python script in python/tests that <br>
checks `any(output is not None for output in run_linters().values())` or <b=
r>
something (and on error print the output).<br>
<br>
<br>
Pulling out run_linters() into an external file and having it print <br>
something to stdout just seems too iotests-centric to me.=C2=A0 I suppose a=
s <br>
long as the return code is right (which this patch is for) it should <br>
work for Avocado=E2=80=99s simple tests, too (which I don=E2=80=99t like ve=
ry much <br>
either, by the way, because they too seem archaic to me), but, well.=C2=A0 =
It <br>
almost seems like the Avocado test should just run ./check then.<br>
<br></blockquote><div><br></div><div>Yeh. Ideally, we&#39;d just have a myp=
y.ini and a pylintrc that configures the tests adequately, and then 297 (or=
 whomever else) would just call the linters which would in turn read the sa=
me configuration. This series is somewhat of a stop-gap to measure the temp=
erature of the room to see how important it was to leave 297 inside of iote=
sts. So, I did the conservative thing that&#39;s faster to review even if i=
t now looks *slightly* fishy.</div><div><br></div><div>As for things being =
archaic or not ... possibly, but why involve extra complexity if it isn&#39=
;t warranted? a simple pass/fail works perfectly well. (And the human can r=
ead the output to understand WHY it failed.) If you want more rigorous anal=
ytics for some reason, we can discuss the use cases and figure out how to r=
epresent that information, but that&#39;s definitely a bit beyond scope her=
e.<br></div>=C2=A0<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Come to think of it, to be absolutely blasphemous, why not.=C2=A0 I could s=
ay <br>
all of this seems like quite some work that could be done by a <br>
python/tests script that does this:<br>
<br>
```<br>
#!/bin/sh<br>
set -e<br>
<br>
cat &gt;/tmp/qemu-parrot.sh &lt;&lt;EOF<br>
#!/bin/sh<br>
echo &#39;: qcow2&#39;<br>
echo &#39;: qcow2&#39;<br>
echo &#39;virtio-blk&#39;<br>
EOF<br>
<br>
cd $QEMU_DIR/tests/qemu-iotests<br>
<br>
QEMU_PROG=3D&quot;/tmp/qemu-parrot.sh&quot; \<br>
QEMU_IMG_PROG=3D$(which false) \<br>
QEMU_IO_PROG=3D$(which false) \<br>
QEMU_NBD_PROG=3D$(which false) \<br>
QSD_PROG=3D$(which false) \<br>
./check 297<br>
```<br>
<br>
And, no, I don=E2=80=99t want that!=C2=A0 But the point of this series seem=
s to just <br>
be to rip the core of 297 out so it can run without ./check, because <br>
./check requires some environment variables to be set. Doing that seems <br=
>
just seems wrong to me.<br>
<br></blockquote><div><br></div><div>Right, the point of this series is eff=
ectively to split out the linting configuration and separate it from the &q=
uot;test&quot; which executes the linters with that configuration. Simplest=
 possible thing was to just take the configuration as it exists in its curr=
ent form -- hardcoded in a python script -- and isolate it. To my delight, =
it worked quite well!<br></div><div>=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
Like, can=E2=80=99t we have a Python script in python/tests that imports <b=
r>
linters.py, invokes run_linters() and sensibly checks the output? Or, <br>
you know, at the very least not have run_linters() print anything to <br>
stdout and not have it return an integer code. linters.py:main() can do <br=
>
that conversion.<br>
<br></blockquote><div><br></div><div>Well, I certainly don&#39;t want to bo=
ther parsing output from python tools and trying to make sure that it works=
 sensibly cross-version and cross-distro. The return code being 0/non-zero =
is vastly simpler. Let the human read the output log on failure cases to ge=
t a sense of what exactly went wrong. Is there some reason why parsing the =
output would be beneficial to anyone?<br></div><div><br></div><div>(The Pyt=
hon GitLab CI hooks don&#39;t even bother printing output to the console un=
less it returns non-zero, and then it will just print whatever it saw. Seem=
s to work well in practice.)<br></div><div>=C2=A0</div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
<br>
Or, something completely different, perhaps my problem is that you put <br>
linters.py as a fully standalone test into the iotests directory, <br>
without it being an iotest.=C2=A0 So, I think I could also agree on putting=
 <br>
linters.py into python/tests, and then having 297 execute that.=C2=A0 Or yo=
u <br>
know, we just drop 297 altogether, as you suggest in patch 13 =E2=80=93 if =
<br>
that=E2=80=99s what it takes, then so be it.<br>
<br></blockquote><div><br></div><div>I can definitely drop 297 if you&#39;d=
 like, and work on making the linter configuration more declarative. I erre=
d on the side of less movement instead of more so that disruption would be =
minimal. It might take me some extra time to work out how to un-scriptify t=
he test, though. I&#39;d like to get a quick temperature check from kwolf o=
n this before I put the work in.<br></div><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
Hanna<br>
<br>
<br>
PS: Also, summing up processes=E2=80=99 return codes makes me feel not good=
.<br>
<br></blockquote><div><br></div><div>That&#39;s the part Vladimir didn&#39;=
t like. There was no real reason for it, other than it was &quot;easy&quot;=
. I can make it a binary 0/1 return instead, if that&#39;d grease the wheel=
s.</div><div><br></div><div>(I&#39;ll sit on respinning the series for now =
until we&#39;ve had some time to discuss it. I would rather like a chance t=
o involve kwolf as the other major user of this subsystem.)<br></div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297<br>
&gt; index e05c99972e..f9ddfb53a0 100755<br>
&gt; --- a/tests/qemu-iotests/297<br>
&gt; +++ b/tests/qemu-iotests/297<br>
&gt; @@ -68,19 +68,22 @@ def run_linters(<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0files: List[str],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0directory: str =3D &#39;.&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0env: Optional[Mapping[str, str]] =3D None,<b=
r>
&gt; -) -&gt; None:<br>
&gt; +) -&gt; int:<br>
&gt; +=C2=A0 =C2=A0 ret =3D 0<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0print(&#39;=3D=3D=3D pylint =3D=3D=3D&#39;)<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0sys.stdout.flush()<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# Todo notes are fine, but fixme&#39;s or xx=
x&#39;s should probably just be<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# fixed (in tests, at least)<br>
&gt; -=C2=A0 =C2=A0 subprocess.run(<br>
&gt; +=C2=A0 =C2=A0 p =3D subprocess.run(<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(&#39;python3&#39;, &#39;-m&#3=
9;, &#39;pylint&#39;, &#39;--score=3Dn&#39;, &#39;--notes=3DFIXME,XXX&#39;,=
 *files),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cwd=3Ddirectory,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env=3Denv,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0check=3DFalse,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 universal_newlines=3DTrue,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0)<br>
&gt; +=C2=A0 =C2=A0 ret +=3D p.returncode<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0print(&#39;=3D=3D=3D mypy =3D=3D=3D&#39;)<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0sys.stdout.flush()<br>
&gt; @@ -113,9 +116,12 @@ def run_linters(<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0universal_newlin=
es=3DTrue<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D p.returncode<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if p.returncode !=3D 0:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0print(p.stdout)<=
br>
&gt;=C2=A0 =C2=A0<br>
&gt; +=C2=A0 =C2=A0 return ret<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0def main() -&gt; None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0for linter in (&#39;pylint-3&#39;, &#39;mypy=
&#39;):<br>
<br>
</blockquote></div></div>

--0000000000006d68f605cc9b38f8--


