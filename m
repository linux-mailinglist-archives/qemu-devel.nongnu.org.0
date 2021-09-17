Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 158874101E5
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Sep 2021 01:49:44 +0200 (CEST)
Received: from localhost ([::1]:39760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRNby-0005Pg-Ty
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 19:49:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mRNas-0004bi-Fc
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 19:48:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mRNao-0004Xn-CT
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 19:48:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631922508;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cEztp6RrTSc65rZa2zGNmNaIEVpvuMvu9MtYTEGX5EE=;
 b=IqFjLc0O9cBq4O6fvfy9dpsk9yzy0LKhajPsbRmO0D4ZMDak6E1uZBzwlfa3o/gToyBv4j
 cSv586vENo9hqbxakRRwQdG2D9Vtvuc/uTFgSw758gdIihAQkl1ppeyASaT7ZV9a7gPV+p
 77a5dFmwSg3wII3LSH5Nvfl/qHEJmvw=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-443-tC9pdroCPhe18cCjgU2dug-1; Fri, 17 Sep 2021 19:48:27 -0400
X-MC-Unique: tC9pdroCPhe18cCjgU2dug-1
Received: by mail-ot1-f71.google.com with SMTP id
 q12-20020a05683033cc00b00521230773b1so40273580ott.4
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 16:48:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cEztp6RrTSc65rZa2zGNmNaIEVpvuMvu9MtYTEGX5EE=;
 b=IYqsMveIIQyn3H+2sCVg0+FmOT15IG4LKS+IaLblHTk3uBdTD+N6cjb6yaZcUGxPci
 Y7ZSlWs6+uAmgfMLi0uQHUUxkvKrcVY+5CW3zkhuxDs2/ldn5uygpc/kSqm9Nuf1UPyc
 6+aPwWWr2ynJxWYrzS4+tBE1zElVpOLojhmB2AEIiucCOVBtvJyX2wfxS+7Kv+5M55al
 Y78re6xL1n4LETMbV+Y/B1dslYh7whXtw2k4ketrLQqeZJGRkcWmoLk27WfTm+8dPiE/
 JLBzeJse5XTSS97Ixj/PIF2FtR2wjZ5ZvD1fNP0XL6BBZQ2VczSI0iUDRxArZXeMyRMP
 klaA==
X-Gm-Message-State: AOAM5338z4zMZqZkQvzGyutyXinAktcwQFnGlfxHzCaRjieVkwCd3TGE
 S2KOQcwuHAbx7zGVi5c0s1orAGFhwCRP/x9fGW+M3K6m2JpGadXraAkCIytNC/stvhK7Z4SXvOc
 j8NeuyqBzzQYDloIvTS43/MQbW/o3zZ8=
X-Received: by 2002:a05:6830:13c5:: with SMTP id
 e5mr11539570otq.374.1631922506562; 
 Fri, 17 Sep 2021 16:48:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwBBhYaymazRjeVf0x/4U0HHdAf+y/lRf+oFEm98yZjeyQzhLLitfIsbpFxrDuIMWlbZjdJnlWqpobONgIPnyw=
X-Received: by 2002:a05:6830:13c5:: with SMTP id
 e5mr11539561otq.374.1631922506356; 
 Fri, 17 Sep 2021 16:48:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210917054047.2042843-1-jsnow@redhat.com>
 <20210917054047.2042843-11-jsnow@redhat.com>
 <4c307fd7-850f-908e-0a51-d5a5bb99a04f@redhat.com>
In-Reply-To: <4c307fd7-850f-908e-0a51-d5a5bb99a04f@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Fri, 17 Sep 2021 19:48:15 -0400
Message-ID: <CAFn=p-apQ9GkJhfuJRNeyAvzqS9snz=g3T9Lkh_=_oEh+XEtUA@mail.gmail.com>
Subject: Re: [PATCH 10/15] python/machine: Add support for AQMP backend
To: Hanna Reitz <hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000004aeff905cc3991ed"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000004aeff905cc3991ed
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 17, 2021 at 10:16 AM Hanna Reitz <hreitz@redhat.com> wrote:

> On 17.09.21 07:40, John Snow wrote:
> > To use the AQMP backend, Machine just needs to be a little more diligen=
t
> > about what happens when closing a QMP connection. The operation is no
> > longer a freebie in the async world.
> >
> > Because async QMP continues to check for messages asynchronously, it's
> > almost certainly likely that the loop will have exited due to EOF after
> > issuing the last 'quit' command. That error will ultimately be bubbled
> > up when attempting to close the QMP connection. The manager class here
> > then is free to discard it if it was expected.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> >
> > ---
> >
> > Yes, I regret that this class has become quite a dumping ground for
> > complexity around the exit path. It's in need of a refactor to help
> > separate out the exception handling and cleanup mechanisms from the
> > VM-related stuff, but it's not a priority to do that just yet -- but
> > it's on the list.
> >
> > ---
> >   python/qemu/machine/machine.py | 51 ++++++++++++++++++++++++++++++---=
-
> >   1 file changed, 46 insertions(+), 5 deletions(-)
> >
> > diff --git a/python/qemu/machine/machine.py
> b/python/qemu/machine/machine.py
> > index 6e58d2f951..8f5a6649e5 100644
> > --- a/python/qemu/machine/machine.py
> > +++ b/python/qemu/machine/machine.py
> > @@ -342,9 +342,15 @@ def _post_shutdown(self) -> None:
> >           # Comprehensive reset for the failed launch case:
> >           self._early_cleanup()
> >
> > -        if self._qmp_connection:
> > -            self._qmp.close()
> > -            self._qmp_connection =3D None
> > +        try:
> > +            self._close_qmp_connection()
> > +        except Exception as err:  # pylint: disable=3Dbroad-except
> > +            LOG.warning(
> > +                "Exception closing QMP connection: %s",
> > +                str(err) if str(err) else type(err).__name__
> > +            )
> > +        finally:
> > +            assert self._qmp_connection is None
> >
> >           self._close_qemu_log_file()
> >
> > @@ -420,6 +426,31 @@ def _launch(self) -> None:
> >                                          close_fds=3DFalse)
> >           self._post_launch()
> >
> > +    def _close_qmp_connection(self) -> None:
> > +        """
> > +        Close the underlying QMP connection, if any.
> > +
> > +        Dutifully report errors that occurred while closing, but assum=
e
> > +        that any error encountered indicates an abnormal termination
> > +        process and not a failure to close.
> > +        """
> > +        if self._qmp_connection is None:
> > +            return
> > +
> > +        try:
> > +            self._qmp.close()
> > +        except EOFError:
> > +            # EOF can occur as an Exception here when using the Async
> > +            # QMP backend. It indicates that the server closed the
> > +            # stream. If we successfully issued 'quit' at any point,
> > +            # then this was expected. If the remote went away without
> > +            # our permission, it's worth reporting that as an abnormal
> > +            # shutdown case.
> > +            if not self._has_quit:
> > +                raise
> > +        finally:
> > +            self._qmp_connection =3D None
> > +
> >       def _early_cleanup(self) -> None:
> >           """
> >           Perform any cleanup that needs to happen before the VM exits.
> > @@ -461,8 +492,18 @@ def _soft_shutdown(self, timeout: Optional[int]) -=
>
> None:
> >
> >           if self._qmp_connection:
> >               if not self._has_quit:
> > -                # Might raise ConnectionReset
> > -                self.qmp('quit')
> > +                try:
> > +                    # May raise ExecInterruptedError or StateError if
> the
> > +                    # connection dies or has already died.
> > +                    self.qmp('quit')
> > +                finally:
> > +                    # If 'quit' fails, we'll still want to call close(=
),
> > +                    # which will raise any final errors that may have
> > +                    # occurred while trying to send 'quit'.
> > +                    self._close_qmp_connection()
> > +            else:
> > +                # Regardless, we want to tidy up the socket.
> > +                self._close_qmp_connection()
>
> Why can=E2=80=99t we wait for _post_shutdown to do that?  Has it somethin=
g to do
> with this operation being =E2=80=9Cno longer a freeby=E2=80=9D (I=E2=80=
=99m not quite sure what
> this refers to, execution time, or the set of possible exceptions, or
> perhaps something else entirely), and so we want to do it in the
> already-not-instantaneous _soft_shutdown?
>
> Hanna
>
>
I wrote that commit message too casually.

By "freebie", I meant that closing a simple sync socket does not have any
potential for raising an error, so we don't really have to worry about that
operation failing. The async machinery, by comparison, uses the
disconnection point as its synchronization point where it gathers the final
results from its various execution contexts (the reader, writer, and
disconnection tasks).

The likeliest error to see here would be something like EOFError for QEMU
hanging up before disconnect() was called. Other possible errors would be
stuff from deep in the internals of AQMP that very likely means there's a
bug I need to resolve -- so I was afraid of just wholesale silencing such
things. (Hence the logged warning in the _post_shutdown method. I genuinely
don't expect to see anything there, but I am paranoid and wanted to be
rock-solid sure that any problems are visible.) It is also possible that if
QEMU were to send a garbled and unprompted message after 'quit' succeeded
(For example, a malformed SHUTDOWN event) that this would also enqueue an
error to be shown here at this point.

One of the design points of AQMP is that calling QMPClient.disconnect() is
necessary to reset the client to a fully IDLE state to where it can be
re-used for a subsequent connection. It serves double-duty as both
disconnect *and* results gathering. So I wanted to make sure to call it
here while we still had the opportunity to report an "Abnormal Shutdown"
instead of potentially choking later during the post-shutdown and failing
to do resource cleanup.

Good: if shutdown() succeeds, you can rest well knowing that definitely
nothing weird happened.
Bad: There's a lot of complexity inherent in promising that.

Clear as mud?

--js

--0000000000004aeff905cc3991ed
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 17, 2021 at 10:16 AM Hann=
a Reitz &lt;<a href=3D"mailto:hreitz@redhat.com">hreitz@redhat.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 17.09.=
21 07:40, John Snow wrote:<br>
&gt; To use the AQMP backend, Machine just needs to be a little more dilige=
nt<br>
&gt; about what happens when closing a QMP connection. The operation is no<=
br>
&gt; longer a freebie in the async world.<br>
&gt;<br>
&gt; Because async QMP continues to check for messages asynchronously, it&#=
39;s<br>
&gt; almost certainly likely that the loop will have exited due to EOF afte=
r<br>
&gt; issuing the last &#39;quit&#39; command. That error will ultimately be=
 bubbled<br>
&gt; up when attempting to close the QMP connection. The manager class here=
<br>
&gt; then is free to discard it if it was expected.<br>
&gt;<br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank">jsnow@redhat.com</a>&gt;<br>
&gt;<br>
&gt; ---<br>
&gt;<br>
&gt; Yes, I regret that this class has become quite a dumping ground for<br=
>
&gt; complexity around the exit path. It&#39;s in need of a refactor to hel=
p<br>
&gt; separate out the exception handling and cleanup mechanisms from the<br=
>
&gt; VM-related stuff, but it&#39;s not a priority to do that just yet -- b=
ut<br>
&gt; it&#39;s on the list.<br>
&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0python/qemu/machine/machine.py | 51 ++++++++++++++++++++++=
++++++++----<br>
&gt;=C2=A0 =C2=A01 file changed, 46 insertions(+), 5 deletions(-)<br>
&gt;<br>
&gt; diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/mach=
ine.py<br>
&gt; index 6e58d2f951..8f5a6649e5 100644<br>
&gt; --- a/python/qemu/machine/machine.py<br>
&gt; +++ b/python/qemu/machine/machine.py<br>
&gt; @@ -342,9 +342,15 @@ def _post_shutdown(self) -&gt; None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Comprehensive reset for the =
failed launch case:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._early_cleanup()<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if self._qmp_connection:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._qmp.close()<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._qmp_connection =3D No=
ne<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._close_qmp_connection(=
)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 except Exception as err:=C2=A0 # pylint: =
disable=3Dbroad-except<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LOG.warning(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Excepti=
on closing QMP connection: %s&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 str(err) if s=
tr(err) else type(err).__name__<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 finally:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert self._qmp_connection=
 is None<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._close_qemu_log_file()<br=
>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -420,6 +426,31 @@ def _launch(self) -&gt; None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 close_fds=3DFalse)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._post_launch()<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +=C2=A0 =C2=A0 def _close_qmp_connection(self) -&gt; None:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 Close the underlying QMP connection, if a=
ny.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 Dutifully report errors that occurred whi=
le closing, but assume<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 that any error encountered indicates an a=
bnormal termination<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 process and not a failure to close.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if self._qmp_connection is None:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._qmp.close()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 except EOFError:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # EOF can occur as an Excep=
tion here when using the Async<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # QMP backend. It indicates=
 that the server closed the<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # stream. If we successfull=
y issued &#39;quit&#39; at any point,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # then this was expected. I=
f the remote went away without<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # our permission, it&#39;s =
worth reporting that as an abnormal<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # shutdown case.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not self._has_quit:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 finally:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._qmp_connection =3D No=
ne<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0def _early_cleanup(self) -&gt; None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Perform any cleanup that needs=
 to happen before the VM exits.<br>
&gt; @@ -461,8 +492,18 @@ def _soft_shutdown(self, timeout: Optional[int]) =
-&gt; None:<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if self._qmp_connection:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not self._has=
_quit:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Might raise=
 ConnectionReset<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.qmp(&#39=
;quit&#39;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 # May raise ExecInterruptedError or StateError if the<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 # connection dies or has already died.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 self.qmp(&#39;quit&#39;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 finally:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 # If &#39;quit&#39; fails, we&#39;ll still want to call close(),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 # which will raise any final errors that may have<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 # occurred while trying to send &#39;quit&#39;.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 self._close_qmp_connection()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Regardless,=
 we want to tidy up the socket.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._close_q=
mp_connection()<br>
<br>
Why can=E2=80=99t we wait for _post_shutdown to do that?=C2=A0 Has it somet=
hing to do <br>
with this operation being =E2=80=9Cno longer a freeby=E2=80=9D (I=E2=80=99m=
 not quite sure what <br>
this refers to, execution time, or the set of possible exceptions, or <br>
perhaps something else entirely), and so we want to do it in the <br>
already-not-instantaneous _soft_shutdown?<br>
<br>
Hanna<br>
<br></blockquote><div><br></div><div>I wrote that commit message too casual=
ly.<br></div><div><br></div><div>By &quot;freebie&quot;, I meant that closi=
ng a simple sync socket does not have any potential for raising an error, s=
o we don&#39;t really have to worry about that operation failing. The async=
 machinery, by comparison, uses the disconnection point as its synchronizat=
ion point where it gathers the final results from its various execution con=
texts (the reader, writer, and disconnection tasks).<br></div><div><br></di=
v><div>The likeliest error to see here would be something like EOFError for=
 QEMU hanging up before disconnect() was called. Other possible errors woul=
d be stuff from deep in the internals of AQMP that very likely means there&=
#39;s a bug I need to resolve -- so I was afraid of just wholesale silencin=
g such things. (Hence the logged warning in the _post_shutdown method. I ge=
nuinely don&#39;t expect to see anything there, but I am paranoid and wante=
d to be rock-solid sure that any problems are visible.) It is also possible=
 that if QEMU were to send a garbled and unprompted message after &#39;quit=
&#39; succeeded (For example, a malformed SHUTDOWN event) that this would a=
lso enqueue an error to be shown here at this point.</div><div><br></div><d=
iv>One of the design points of AQMP is that calling QMPClient.disconnect() =
is necessary to reset the client to a fully IDLE state to where it can be r=
e-used for a subsequent connection. It serves double-duty as both disconnec=
t *and* results gathering. So I wanted to make sure to call it here while w=
e still had the opportunity to report an &quot;Abnormal Shutdown&quot; inst=
ead of potentially choking later during the post-shutdown and failing to do=
 resource cleanup.</div><div><br></div><div>Good: if shutdown() succeeds, y=
ou can rest well knowing that definitely nothing weird happened.</div><div>=
Bad: There&#39;s a lot of complexity inherent in promising that.</div><div>=
<br></div><div>Clear as mud?</div><div><br></div><div><div>--js<br></div></=
div></div></div>

--0000000000004aeff905cc3991ed--


