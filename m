Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DF0425880
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 18:56:31 +0200 (CEST)
Received: from localhost ([::1]:36330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYWh4-0003P5-Dy
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 12:56:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mYWdI-0008WP-Vh
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 12:52:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mYWdE-0006VR-Ex
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 12:52:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633625551;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PQ9ZeDPb+qnT9v1LYQ9h3bgDbeaT5bx/LQ5KGN7ahbQ=;
 b=FascrwPQhstZlNmMRXQe324yoSCMSwNKQkf1M0IxRDm5qqbpws1NK+ptwWcjN2xKDJR2Z4
 DOZHCqqlIMOmFNoHxHFdRpmrv5o77KF2kB3g9HAs/Vxs16BLAykYJ1P+jh1HuWDeI08lYX
 b3gXuQYdt8QVmqTM7n3lfebzkMPXzTY=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-136-EgGjI05wN8O4ZwAUTsL8AQ-1; Thu, 07 Oct 2021 12:52:30 -0400
X-MC-Unique: EgGjI05wN8O4ZwAUTsL8AQ-1
Received: by mail-ua1-f70.google.com with SMTP id
 b20-20020ab05f94000000b002ca067c0203so3233318uaj.16
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 09:52:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PQ9ZeDPb+qnT9v1LYQ9h3bgDbeaT5bx/LQ5KGN7ahbQ=;
 b=KrBE95FzWy+tf7CEUC2NMTHcnwFW/vKgpf3S5a4s2AxC1wmrZDjJPZEA7nH+x/DKop
 cPjAflvP5ypneRgSbCzHgAWYxtbBO9AMLVPyXs8n9B0HvyLPBu7R9/ha2J6IfJvUgi1w
 ZavM7n18iNr/1pT27cRQ5lA0/81zQXsmg3TVDEXYh2q+dxA6JA1jCKlyk+wo4mzUUGtK
 R9wYb9VLDsZCsSkKoUX6tHHnp+RSjDwhC3XMS2iaxkzYPawsRCYKluWTNgsqi4Lv91V1
 fSlNEtEQfocJNZDSNXFr7oIPJYE425C4z4upukRxLjoX7+6tMTVFcW5dg5XNLtgwtc2J
 cT9A==
X-Gm-Message-State: AOAM530gTbRmau1jDQeCy1EYV2P40V7nq+YenKEZbGaJti297wpBi3ZI
 7APcCSJz+OWf1d+lP2i+qOLDECoriFWa390iQVSUh5fo6MN+Ee1i8GWPo7/f47qZP2gAUGAQ7ql
 Y0R4/uSfr6+WYmeRurIvzN5uIqNS+lhY=
X-Received: by 2002:ab0:1111:: with SMTP id e17mr5800601uab.128.1633625549690; 
 Thu, 07 Oct 2021 09:52:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz+UC3kPWcDyushtwf/iLZGxkorOJa0z8XYfkgQyjdElEsfzIcV5c1cZ4ESy0bYP0xs6sDmHX+sg2Ye6nH9sbY=
X-Received: by 2002:ab0:1111:: with SMTP id e17mr5800553uab.128.1633625549386; 
 Thu, 07 Oct 2021 09:52:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210923004938.3999963-1-jsnow@redhat.com>
 <20210923004938.3999963-13-jsnow@redhat.com>
In-Reply-To: <20210923004938.3999963-13-jsnow@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 7 Oct 2021 12:52:18 -0400
Message-ID: <CAFn=p-YwL+v7_rvC40z_T3DiKhH0cdgu53KTghwTjmixakHC+Q@mail.gmail.com>
Subject: Re: [PATCH v2 12/17] python/machine: Handle QMP errors on close more
 meticulously
To: qemu-devel <qemu-devel@nongnu.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000091552b05cdc61619"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
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
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000091552b05cdc61619
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 22, 2021 at 8:50 PM John Snow <jsnow@redhat.com> wrote:

> To use the AQMP backend, Machine just needs to be a little more diligent
> about what happens when closing a QMP connection. The operation is no
> longer a freebie in the async world; it may return errors encountered in
> the async bottom half on incoming message receipt, etc.
>
> (AQMP's disconnect, ultimately, serves as the quiescence point where all
> async contexts are gathered together, and any final errors reported at
> that point.)
>
> Because async QMP continues to check for messages asynchronously, it's
> almost certainly likely that the loop will have exited due to EOF after
> issuing the last 'quit' command. That error will ultimately be bubbled
> up when attempting to close the QMP connection. The manager class here
> then is free to discard it -- if it was expected.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
>
> ---
>
> Yes, I regret that this class has become quite a dumping ground for
> complexity around the exit path. It's in need of a refactor to help
> separate out the exception handling and cleanup mechanisms from the
> VM-related stuff, but it's not a priority to do that just yet -- but
> it's on the list.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/qemu/machine/machine.py | 48 +++++++++++++++++++++++++++++-----
>  1 file changed, 42 insertions(+), 6 deletions(-)
>
> diff --git a/python/qemu/machine/machine.py
> b/python/qemu/machine/machine.py
> index 0bd40bc2f76..c33a78a2d9f 100644
> --- a/python/qemu/machine/machine.py
> +++ b/python/qemu/machine/machine.py
> @@ -342,9 +342,15 @@ def _post_shutdown(self) -> None:
>          # Comprehensive reset for the failed launch case:
>          self._early_cleanup()
>
> -        if self._qmp_connection:
> -            self._qmp.close()
> -            self._qmp_connection = None
> +        try:
> +            self._close_qmp_connection()
> +        except Exception as err:  # pylint: disable=broad-except
> +            LOG.warning(
> +                "Exception closing QMP connection: %s",
> +                str(err) if str(err) else type(err).__name__
> +            )
> +        finally:
> +            assert self._qmp_connection is None
>
>          self._close_qemu_log_file()
>
> @@ -420,6 +426,31 @@ def _launch(self) -> None:
>                                         close_fds=False)
>          self._post_launch()
>
> +    def _close_qmp_connection(self) -> None:
> +        """
> +        Close the underlying QMP connection, if any.
> +
> +        Dutifully report errors that occurred while closing, but assume
> +        that any error encountered indicates an abnormal termination
> +        process and not a failure to close.
> +        """
> +        if self._qmp_connection is None:
> +            return
> +
> +        try:
> +            self._qmp.close()
> +        except EOFError:
> +            # EOF can occur as an Exception here when using the Async
> +            # QMP backend. It indicates that the server closed the
> +            # stream. If we successfully issued 'quit' at any point,
> +            # then this was expected. If the remote went away without
> +            # our permission, it's worth reporting that as an abnormal
> +            # shutdown case.
> +            if not self._quit_issued:
>

I strongly suspect that this line needs to actually be "if not
(self._user_killed or self._quit_issued):" to also handle the force-kill
cases.

I wrote a different sync compatibility layer in a yet-to-be-published
branch and noticed this code still allows EOFError through. Why it did not
seem to come up in *this* series I still don't know -- I think the timing
of when exactly the coroutines get scheduled can be finnicky depending on
what else is running. So, sometimes, we manage to close the loop before we
get EOF and sometimes we don't.

I am mulling over adding a "tolerate_eof: bool = False" argument to
disconnect() to allow the caller to handle this stuff with a little less
boilerplate. Anyone have strong feelings on that?

(Ultimately, because there's no canonical "goodbye" in-band message, the
QMP layer itself can never really know if EOF was expected or not -- that's
really up to whomever is managing the connection, but it does add a layer
of complexity around the exit path that I am starting to find is a
nuisance. Not to mention that there are likely many possible cases in which
we might expect the remote to disappear on us that don't involve using QMP
at all -- kill is one, using the guest agent to coerce the guest into
shutdown is another. Networking and migration are other theoretical(?)
avenues for intended disconnects.)


> +                raise
> +        finally:
> +            self._qmp_connection = None
> +
>      def _early_cleanup(self) -> None:
>          """
>          Perform any cleanup that needs to happen before the VM exits.
> @@ -460,9 +491,14 @@ def _soft_shutdown(self, timeout: Optional[int]) ->
> None:
>          self._early_cleanup()
>
>          if self._qmp_connection:
> -            if not self._quit_issued:
> -                # Might raise ConnectionReset
> -                self.qmp('quit')
> +            try:
> +                if not self._quit_issued:
> +                    # May raise ExecInterruptedError or StateError if the
> +                    # connection dies or has *already* died.
> +                    self.qmp('quit')
> +            finally:
> +                # Regardless, we want to quiesce the connection.
> +                self._close_qmp_connection()
>
>          # May raise subprocess.TimeoutExpired
>          self._subp.wait(timeout=timeout)
> --
> 2.31.1
>
>

--00000000000091552b05cdc61619
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 22, 2021 at 8:50 PM John =
Snow &lt;<a href=3D"mailto:jsnow@redhat.com">jsnow@redhat.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">To use the AQM=
P backend, Machine just needs to be a little more diligent<br>
about what happens when closing a QMP connection. The operation is no<br>
longer a freebie in the async world; it may return errors encountered in<br=
>
the async bottom half on incoming message receipt, etc.<br>
<br>
(AQMP&#39;s disconnect, ultimately, serves as the quiescence point where al=
l<br>
async contexts are gathered together, and any final errors reported at<br>
that point.)<br>
<br>
Because async QMP continues to check for messages asynchronously, it&#39;s<=
br>
almost certainly likely that the loop will have exited due to EOF after<br>
issuing the last &#39;quit&#39; command. That error will ultimately be bubb=
led<br>
up when attempting to close the QMP connection. The manager class here<br>
then is free to discard it -- if it was expected.<br>
<br>
Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" target=3D"=
_blank">jsnow@redhat.com</a>&gt;<br>
<br>
---<br>
<br>
Yes, I regret that this class has become quite a dumping ground for<br>
complexity around the exit path. It&#39;s in need of a refactor to help<br>
separate out the exception handling and cleanup mechanisms from the<br>
VM-related stuff, but it&#39;s not a priority to do that just yet -- but<br=
>
it&#39;s on the list.<br>
<br>
Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" target=3D"=
_blank">jsnow@redhat.com</a>&gt;<br>
---<br>
=C2=A0python/qemu/machine/machine.py | 48 +++++++++++++++++++++++++++++----=
-<br>
=C2=A01 file changed, 42 insertions(+), 6 deletions(-)<br>
<br>
diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.p=
y<br>
index 0bd40bc2f76..c33a78a2d9f 100644<br>
--- a/python/qemu/machine/machine.py<br>
+++ b/python/qemu/machine/machine.py<br>
@@ -342,9 +342,15 @@ def _post_shutdown(self) -&gt; None:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Comprehensive reset for the failed laun=
ch case:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._early_cleanup()<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if self._qmp_connection:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._qmp.close()<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._qmp_connection =3D None<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._close_qmp_connection()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 except Exception as err:=C2=A0 # pylint: disab=
le=3Dbroad-except<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LOG.warning(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Exception cl=
osing QMP connection: %s&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 str(err) if str(er=
r) else type(err).__name__<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 finally:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert self._qmp_connection is N=
one<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._close_qemu_log_file()<br>
<br>
@@ -420,6 +426,31 @@ def _launch(self) -&gt; None:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 close_fd=
s=3DFalse)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._post_launch()<br>
<br>
+=C2=A0 =C2=A0 def _close_qmp_connection(self) -&gt; None:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Close the underlying QMP connection, if any.<b=
r>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Dutifully report errors that occurred while cl=
osing, but assume<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 that any error encountered indicates an abnorm=
al termination<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 process and not a failure to close.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if self._qmp_connection is None:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._qmp.close()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 except EOFError:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # EOF can occur as an Exception =
here when using the Async<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # QMP backend. It indicates that=
 the server closed the<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # stream. If we successfully iss=
ued &#39;quit&#39; at any point,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # then this was expected. If the=
 remote went away without<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # our permission, it&#39;s worth=
 reporting that as an abnormal<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # shutdown case.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not self._quit_issued:<br></b=
lockquote><div><br></div><div>I strongly suspect that this line needs to ac=
tually be &quot;if not (self._user_killed or self._quit_issued):&quot; to a=
lso handle the force-kill cases.</div><div><br></div><div>I wrote a differe=
nt sync compatibility layer in a yet-to-be-published branch and noticed thi=
s code still allows EOFError through. Why it did not seem to come up in *th=
is* series I still don&#39;t know -- I think the timing of when exactly the=
 coroutines get scheduled can be finnicky depending on what else is running=
. So, sometimes, we manage to close the loop before we get EOF and sometime=
s we don&#39;t.</div><div><br></div><div>I am mulling over adding a &quot;t=
olerate_eof: bool =3D False&quot; argument to disconnect() to allow the cal=
ler to handle this stuff with a little less boilerplate. Anyone have strong=
 feelings on that?</div><div><br></div><div>(Ultimately, because there&#39;=
s no canonical &quot;goodbye&quot; in-band message, the QMP layer itself ca=
n never really know if EOF was expected or not -- that&#39;s really up to w=
homever is managing the connection, but it does add a layer of complexity a=
round the exit path that I am starting to find is a nuisance. Not to mentio=
n that there are likely many possible cases in which we might expect the re=
mote to disappear on us that don&#39;t involve using QMP at all -- kill is =
one, using the guest agent to coerce the guest into shutdown is another. Ne=
tworking and migration are other theoretical(?) avenues for intended discon=
nects.)<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 finally:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._qmp_connection =3D None<br=
>
+<br>
=C2=A0 =C2=A0 =C2=A0def _early_cleanup(self) -&gt; None:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Perform any cleanup that needs to happen =
before the VM exits.<br>
@@ -460,9 +491,14 @@ def _soft_shutdown(self, timeout: Optional[int]) -&gt;=
 None:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._early_cleanup()<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if self._qmp_connection:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not self._quit_issued:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Might raise Conn=
ectionReset<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.qmp(&#39;quit=
&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not self._quit_=
issued:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Ma=
y raise ExecInterruptedError or StateError if the<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # co=
nnection dies or has *already* died.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self=
.qmp(&#39;quit&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 finally:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Regardless, we w=
ant to quiesce the connection.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._close_qmp_co=
nnection()<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# May raise subprocess.TimeoutExpired<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._subp.wait(timeout=3Dtimeout)<br>
-- <br>
2.31.1<br>
<br>
</blockquote></div></div>

--00000000000091552b05cdc61619--


