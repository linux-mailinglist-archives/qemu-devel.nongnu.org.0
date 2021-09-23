Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0304163BB
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 18:58:44 +0200 (CEST)
Received: from localhost ([::1]:42178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTS3X-0004P1-1I
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 12:58:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mTS0S-0001ub-Lp
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 12:55:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mTS0O-0001A7-6b
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 12:55:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632416126;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/SzwoMV+1h1Fhfw2tCKBLkNnB+qaG2+ft85NWt8sF9A=;
 b=CAsbINZ0s3rvc5DDTuthhNQPXYWyh2l2xHbAs5pfcVO4azdZGwAjFDt+/j4+JEd5drMF21
 EZfeCZYuBx/T/c1iBVvIcJA3siglo8foQIstlR11VUOtfmpAJRTcFRdODMMHgnc2lIqkb2
 yQtgug/GCjPtj4cRQ2dye3ufxc0kOCI=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-11-mVEsbyUQNA-XkUGcGdq1tg-1; Thu, 23 Sep 2021 12:55:24 -0400
X-MC-Unique: mVEsbyUQNA-XkUGcGdq1tg-1
Received: by mail-oo1-f72.google.com with SMTP id
 d18-20020a4a9cd2000000b0029afc2f9586so4188277ook.19
 for <qemu-devel@nongnu.org>; Thu, 23 Sep 2021 09:55:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/SzwoMV+1h1Fhfw2tCKBLkNnB+qaG2+ft85NWt8sF9A=;
 b=Fxvaz52c1trBxsLv9yqZO4yZv5gc4j7Nzj8x/601gXpFTu0c+PWYi3FDlOKczecJzk
 jFvJDHdF/sIuqFUS5sfPbYpQAPFf73zY/WAqEZMd1fS/WW6pC2tC3gq/7p4PTliiXk65
 FBu6V+5Ln6QQ5tuwbTznQx35DuRvjrg5cksmOsrKP81tCWe4W8MmWKKITezcllGwQw/A
 z7ZAAuKOl5TGHaii9psnea2MJbEN1zxLhHmNXUQoh/hzK+8ounOpaSQvitk8yo9ui55D
 HYrC1uofOxirNHuOgC/8hV30Evo9BsIuEScuKZdrLBJbaeez9vRU/L7GjSfSHP3vO1D9
 icwg==
X-Gm-Message-State: AOAM533prmhRmFnGCtNZ7iE9ZPIhb5iUfMD0G5Vkvdud1UBmiR0g9nIM
 JNxrEL4GNsbSO7OcHmFPzDX/WkjxBttHOnO7YtT+W92YecoiGX9PRQBi/BuAuwz89GUgf/PUkMQ
 ja4vKtksmIm7RQaUP4tA4rTiUTIz0Z9c=
X-Received: by 2002:a9d:7281:: with SMTP id t1mr5366871otj.129.1632416123204; 
 Thu, 23 Sep 2021 09:55:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz1KRT3nNbOyu7TdUf/9UOmbTR0Kv2uwgN96UK4Wv/yf2+Fih/mjGwG6o8MzRpx+mejCmng5KsIulZBy8MfA90=
X-Received: by 2002:a9d:7281:: with SMTP id t1mr5366856otj.129.1632416123010; 
 Thu, 23 Sep 2021 09:55:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210922125619.670673-1-armbru@redhat.com>
 <20210922125619.670673-2-armbru@redhat.com>
 <CAFn=p-YasVLZbFWqx=rxFNLcwyHhBKxcJgeKpQLjDZC2bj-_nQ@mail.gmail.com>
 <87o88jfxfw.fsf@dusky.pond.sub.org>
In-Reply-To: <87o88jfxfw.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Date: Thu, 23 Sep 2021 12:55:12 -0400
Message-ID: <CAFn=p-ZYxJsR8EUQOm447y6K1CAt1+hcqZf=qGckRtMJ4SGybg@mail.gmail.com>
Subject: Re: [PATCH 1/2] tests/qapi-schema: Use Python OSError instead of
 outmoded IOError
To: Markus Armbruster <armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000002354f305ccac7f7e"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.473,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: marcandre.lureau@gmail.com, qemu-devel <qemu-devel@nongnu.org>,
 mdroth@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000002354f305ccac7f7e
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 23, 2021 at 5:33 AM Markus Armbruster <armbru@redhat.com> wrote:

> John Snow <jsnow@redhat.com> writes:
>
> > On Wed, Sep 22, 2021 at 8:56 AM Markus Armbruster <armbru@redhat.com>
> wrote:
> >
> >> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> >> ---
> >>  tests/qapi-schema/test-qapi.py | 4 ++--
> >>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/tests/qapi-schema/test-qapi.py
> >> b/tests/qapi-schema/test-qapi.py
> >> index 73cffae2b6..2e384f5efd 100755
> >> --- a/tests/qapi-schema/test-qapi.py
> >> +++ b/tests/qapi-schema/test-qapi.py
> >> @@ -154,7 +154,7 @@ def test_and_diff(test_name, dir_name, update):
> >>          errfp = open(os.path.join(dir_name, test_name + '.err'), mode)
> >>          expected_out = outfp.readlines()
> >>          expected_err = errfp.readlines()
> >> -    except IOError as err:
> >> +    except OSError as err:
> >>          print("%s: can't open '%s': %s"
> >>                % (sys.argv[0], err.filename, err.strerror),
> >>                file=sys.stderr)
> >> @@ -180,7 +180,7 @@ def test_and_diff(test_name, dir_name, update):
> >>          errfp.truncate(0)
> >>          errfp.seek(0)
> >>          errfp.writelines(actual_err)
> >> -    except IOError as err:
> >> +    except OSError as err:
> >>          print("%s: can't write '%s': %s"
> >>                % (sys.argv[0], err.filename, err.strerror),
> >>                file=sys.stderr)
> >> --
> >> 2.31.1
> >>
> >>
> > If you're happy with the expanded scope of the exception-catcher, I am
> too.
>
> https://docs.python.org/3.6/library/exceptions.html has
>
>     Changed in version 3.3: EnvironmentError, IOError, WindowsError,
>     socket.error, select.error and mmap.error have been merged into
>     OSError, and the constructor may return a subclass.
>
> and
>
>     The following exceptions are kept for compatibility with previous
>     versions; starting from Python 3.3, they are aliases of OSError.
>
>     exception EnvironmentError
>
>     exception IOError
>
>     exception WindowsError
>
>         Only available on Windows.
>
> So unless I'm misunderstanding something (which is quite possible),
> we're catching exactly the same exceptions as before, we just switch to
> their preferred name.
>
> > Reviewed-by: John Snow <jsnow@redhat.com>
>
> Thanks!
>
>
Yeah, I suppose the 3.3 upgrade already "expanded" the coverage here, so
you aren't expanding anything. It's just an expansion of intent in the
source code, if that distinction makes sense. The code is obviously fine so
far as I can tell. My RB stands!

--js

--0000000000002354f305ccac7f7e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 23, 2021 at 5:33 AM Marku=
s Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">John=
 Snow &lt;<a href=3D"mailto:jsnow@redhat.com" target=3D"_blank">jsnow@redha=
t.com</a>&gt; writes:<br>
<br>
&gt; On Wed, Sep 22, 2021 at 8:56 AM Markus Armbruster &lt;<a href=3D"mailt=
o:armbru@redhat.com" target=3D"_blank">armbru@redhat.com</a>&gt; wrote:<br>
&gt;<br>
&gt;&gt; Signed-off-by: Markus Armbruster &lt;<a href=3D"mailto:armbru@redh=
at.com" target=3D"_blank">armbru@redhat.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 tests/qapi-schema/test-qapi.py | 4 ++--<br>
&gt;&gt;=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/tests/qapi-schema/test-qapi.py<br>
&gt;&gt; b/tests/qapi-schema/test-qapi.py<br>
&gt;&gt; index 73cffae2b6..2e384f5efd 100755<br>
&gt;&gt; --- a/tests/qapi-schema/test-qapi.py<br>
&gt;&gt; +++ b/tests/qapi-schema/test-qapi.py<br>
&gt;&gt; @@ -154,7 +154,7 @@ def test_and_diff(test_name, dir_name, update)=
:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 errfp =3D open(os.path.join(dir_=
name, test_name + &#39;.err&#39;), mode)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 expected_out =3D outfp.readlines=
()<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 expected_err =3D errfp.readlines=
()<br>
&gt;&gt; -=C2=A0 =C2=A0 except IOError as err:<br>
&gt;&gt; +=C2=A0 =C2=A0 except OSError as err:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print(&quot;%s: can&#39;t open &=
#39;%s&#39;: %s&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 % (sys.argv=
[0], err.filename, err.strerror),<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=3Dsys.=
stderr)<br>
&gt;&gt; @@ -180,7 +180,7 @@ def test_and_diff(test_name, dir_name, update)=
:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 errfp.truncate(0)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 errfp.seek(0)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 errfp.writelines(actual_err)<br>
&gt;&gt; -=C2=A0 =C2=A0 except IOError as err:<br>
&gt;&gt; +=C2=A0 =C2=A0 except OSError as err:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print(&quot;%s: can&#39;t write =
&#39;%s&#39;: %s&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 % (sys.argv=
[0], err.filename, err.strerror),<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=3Dsys.=
stderr)<br>
&gt;&gt; --<br>
&gt;&gt; 2.31.1<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt; If you&#39;re happy with the expanded scope of the exception-catcher, =
I am too.<br>
<br>
<a href=3D"https://docs.python.org/3.6/library/exceptions.html" rel=3D"nore=
ferrer" target=3D"_blank">https://docs.python.org/3.6/library/exceptions.ht=
ml</a> has<br>
<br>
=C2=A0 =C2=A0 Changed in version 3.3: EnvironmentError, IOError, WindowsErr=
or,<br>
=C2=A0 =C2=A0 socket.error, select.error and mmap.error have been merged in=
to<br>
=C2=A0 =C2=A0 OSError, and the constructor may return a subclass.<br>
<br>
and<br>
<br>
=C2=A0 =C2=A0 The following exceptions are kept for compatibility with prev=
ious<br>
=C2=A0 =C2=A0 versions; starting from Python 3.3, they are aliases of OSErr=
or.<br>
<br>
=C2=A0 =C2=A0 exception EnvironmentError<br>
<br>
=C2=A0 =C2=A0 exception IOError<br>
<br>
=C2=A0 =C2=A0 exception WindowsError<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Only available on Windows.<br>
<br>
So unless I&#39;m misunderstanding something (which is quite possible),<br>
we&#39;re catching exactly the same exceptions as before, we just switch to=
<br>
their preferred name.<br>
<br>
&gt; Reviewed-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" target=
=3D"_blank">jsnow@redhat.com</a>&gt;<br>
<br>
Thanks!<br>
<br></blockquote><div><br></div><div>Yeah, I suppose the 3.3 upgrade alread=
y &quot;expanded&quot; the coverage here, so you aren&#39;t expanding anyth=
ing. It&#39;s just an expansion of intent in the source code, if that disti=
nction makes sense. The code is obviously fine so far as I can tell. My RB =
stands!<br></div><div><br></div><div>--js<br></div></div></div>

--0000000000002354f305ccac7f7e--


