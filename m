Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3EEA43D01E
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 19:52:13 +0200 (CEST)
Received: from localhost ([::1]:35024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfn5v-0008RI-4b
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 13:52:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mfn3h-0006Dh-9m
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 13:49:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mfn3a-00066m-Ur
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 13:49:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635356985;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sZ8O+yLft3gcw7AfPibG0bgzKnUXz8xp8kqGIWP52Rc=;
 b=MPFOnohh2RQH6kJRKRl9fpOJ26tC9LEOaV6iZgWCdJ2nxhxftjV5quyezZbNXfIsaESIi3
 8UZ6tJM/mDqb+n7sb+vq4aZ8S/z/pZJaoa8Eu+waRsv9L+veps7I9OXRaaVwHukRvZ00Pc
 SbBPNa4FnPD2ZGBZpcEMCfMyCaDuqqk=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-323-wVWC1pa8Ohq9yqutIOhQGQ-1; Wed, 27 Oct 2021 13:49:37 -0400
X-MC-Unique: wVWC1pa8Ohq9yqutIOhQGQ-1
Received: by mail-ua1-f70.google.com with SMTP id
 o6-20020ab01506000000b002cbb1771ce6so1894382uae.15
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 10:49:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sZ8O+yLft3gcw7AfPibG0bgzKnUXz8xp8kqGIWP52Rc=;
 b=7NXI8LqRihvWXp1c7aDj8rG7EgFObFAJ12j9HmwIuW8wnKlWcJRcKbK3iwL28jSbH9
 1wJZVcKYucMqeDWNy3kpdIcbbWRwBVAUZOJOyXsJrUIGOUc3fLttBciWHyjCbOoMgX0Y
 QxpDHAk3eNTS13SKELuZ/XD/Tt4zPxD7efpOdIaRMFlGyRKQdSwQVK7PgA3qYjTcINbC
 bHRVZkl2W88NMe0Jo+4hlIUgWbpybWXP78ru1NY9dSPcIzd2Blav49r2UtFjI+o3BLyb
 AGlg3tuAHNEZjJP0IonsmqGkMkqrjzrWQBD6qQiXsq+TuH5f0TJSqsxNpL0H0kFAzLyE
 N4fw==
X-Gm-Message-State: AOAM532ZNRMg8jfNYYbnacF+reohiCX1ErrOLFmDACf+VOmRrFlBnIHn
 k4vuv53lKN7gOdkKKN/3gB+lla4u3d/yQst+HQH+iJMDBBLidw1gLo7IkOLi6wdMA+RLRx44C0C
 4MpAcGE6+SImE/FMmIVgGVKWsKgVCVFQ=
X-Received: by 2002:ab0:4e14:: with SMTP id g20mr31204101uah.50.1635356977212; 
 Wed, 27 Oct 2021 10:49:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzYyyTFiLzX0h6R1eSBeQd9LMRDD3/XZB/FDT8xDsSOBcttz4RzbRQs8AEaFrQ5sU0cvf2JXvYY6NlbGfROrq0=
X-Received: by 2002:ab0:4e14:: with SMTP id g20mr31204058uah.50.1635356976923; 
 Wed, 27 Oct 2021 10:49:36 -0700 (PDT)
MIME-Version: 1.0
References: <20211026175612.4127598-1-jsnow@redhat.com>
 <20211026175612.4127598-3-jsnow@redhat.com>
 <YXk1wbRWNLlvXxMU@redhat.com>
In-Reply-To: <YXk1wbRWNLlvXxMU@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Wed, 27 Oct 2021 13:49:26 -0400
Message-ID: <CAFn=p-bU3SjifQXDEBX07Fxy-G-TAj3hbBJYqMJQ=Xrr0bJqEw@mail.gmail.com>
Subject: Re: [PATCH v5 2/8] python/machine: Handle QMP errors on close more
 meticulously
To: Kevin Wolf <kwolf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000b0dbe005cf5937e1"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 qemu-devel <qemu-devel@nongnu.org>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000b0dbe005cf5937e1
Content-Type: text/plain; charset="UTF-8"

This reply is long, sorry.

On Wed, Oct 27, 2021 at 7:19 AM Kevin Wolf <kwolf@redhat.com> wrote:

> Am 26.10.2021 um 19:56 hat John Snow geschrieben:
> > To use the AQMP backend, Machine just needs to be a little more diligent
> > about what happens when closing a QMP connection. The operation is no
> > longer a freebie in the async world; it may return errors encountered in
> > the async bottom half on incoming message receipt, etc.
> >
> > (AQMP's disconnect, ultimately, serves as the quiescence point where all
> > async contexts are gathered together, and any final errors reported at
> > that point.)
> >
> > Because async QMP continues to check for messages asynchronously, it's
> > almost certainly likely that the loop will have exited due to EOF after
> > issuing the last 'quit' command. That error will ultimately be bubbled
> > up when attempting to close the QMP connection. The manager class here
> > then is free to discard it -- if it was expected.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > Reviewed-by: Hanna Reitz <hreitz@redhat.com>
> > ---
> >  python/qemu/machine/machine.py | 48 +++++++++++++++++++++++++++++-----
> >  1 file changed, 42 insertions(+), 6 deletions(-)
> >
> > diff --git a/python/qemu/machine/machine.py
> b/python/qemu/machine/machine.py
> > index 0bd40bc2f76..a0cf69786b4 100644
> > --- a/python/qemu/machine/machine.py
> > +++ b/python/qemu/machine/machine.py
> > @@ -342,9 +342,15 @@ def _post_shutdown(self) -> None:
> >          # Comprehensive reset for the failed launch case:
> >          self._early_cleanup()
> >
> > -        if self._qmp_connection:
> > -            self._qmp.close()
> > -            self._qmp_connection = None
> > +        try:
> > +            self._close_qmp_connection()
> > +        except Exception as err:  # pylint: disable=broad-except
> > +            LOG.warning(
> > +                "Exception closing QMP connection: %s",
> > +                str(err) if str(err) else type(err).__name__
> > +            )
> > +        finally:
> > +            assert self._qmp_connection is None
> >
> >          self._close_qemu_log_file()
> >
> > @@ -420,6 +426,31 @@ def _launch(self) -> None:
> >                                         close_fds=False)
> >          self._post_launch()
> >
> > +    def _close_qmp_connection(self) -> None:
> > +        """
> > +        Close the underlying QMP connection, if any.
> > +
> > +        Dutifully report errors that occurred while closing, but assume
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
> > +            if not (self._user_killed or self._quit_issued):
> > +                raise
>
> Isn't this racy for those tests that expect QEMU to quit by itself and
> then later call wait()? self._quit_issued is only set to True in wait(),
> but whatever will cause QEMU to quit happens earlier and it might
> actually quit before wait() is called.
>

_quit_issued is also set to True via qmp() and command(), but I think
you're referring to cases where QEMU terminates for other reasons than an
explicit command. So, yes, QEMU might indeed terminate/abort/quit before
machine.py has recorded that fact somewhere. I wasn't aware of that being a
problem. I suppose it'd be racy if, say, you orchestrated a "side-channel
quit" and then didn't call wait() and instead called shutdown(). I think
that's the case you're worried about? But, this code should ultimately be
called in only four cases:

(1) Connection failure
(2) shutdown()
(3) shutdown(), via wait()
(4) shutdown(), via kill()

I had considered it a matter of calling the correct exit path from the test
code. If shutdown() does what the label on the tin says (it shuts down the
VM), I actually would expect it to be racy if QEMU was in the middle of
deconstructing itself. That's the belief behind changing around iotest 300
the way I did.


> It would make sense to me that such tests need to declare that they
> expect QEMU to quit before actually performing the action. And then
> wait() becomes less weird in patch 1, too, because it can just assert
> self._quit_issued instead of unconditionally setting it.
>

That's a thought. I was working on the model that calling wait() implies
the fact that the writer is expecting it to terminate through some
mechanism otherwise invisible to machine.py (HMP perhaps, a QGA action,
migration failure, etc.) It's one less call vs. saying "expect_shutdown();
wait_shutdown()". I wasn't aware of a circumstance where you'd want to
separate these two semantic bits of info ("I expect QEMU will shut down" /
"I am waiting for QEMU to shut down") and since the latter implied the
former, I rolled 'em up into one.

I suppose in your case, you're wondering what happens if we decide to call
shutdown() instead of wait() after orchestrating a "side-channel quit"? I
*would* have considered that a semantic error in the author's code, but I
suppose it's reasonable to expect that "shutdown() should DTRT". Though, in
order for it to DTRT, you have to inform machine that you're expecting that
side-channel termination, and if you already forgot to use wait() instead
of shutdown(), I'm not sure I can help the author remember that they should
have issued a "expect_shutdown()" or similar.

The other point I'm unsure is whether you can actually kill QEMU without
> getting either self._user_killed or self._quit_issued set. The
> potentially problematic case I see is shutdown(hard = False) where soft
> shutdown fails. Then a hard shutdown will be performed without setting
> self._user_killed (is this a bug?).
>

The original intent of _user_killed was specifically to record cases where
the test-writer *intentionally* killed the VM process. We then used that
flag to change the error reporting on cleanup in _post_shutdown. The idea
was that if the QEMU process terminated due to signal and we didn't
explicitly intentionally cause it, that we should loudly report that
occurrence. We added this specifically to catch problems on the exit path
in various iotests. So, the fact that soft shutdown fails over to a hard
shutdown but doesn't set that intent flag is the intended behavior.

So, what about _close_qmp_connection()? I figured that if any of the
following were true:

1) quit was explicitly issued via qmp() or command()
2) wait() was called instead of shutdown, implying an anticipated
side-channel termination
3) kill() or shutdown(hard=True) was called

... then we were expecting the remote to hang up on us, and we didn't need
to report that error.

What about when the VM is killed but it wasn't explicitly intentional by
the test-writer? As far as machine.py knows, it was unintentional and so it
will allow that error to trickle up when _close_qmp_connection() is called.
The server hung up on us and we have no idea why. The error will be
reported upwards. From the context of just this one function, that seems
like the correct behavior.

Of course, sending the 'quit' command in _soft_shutdown() will set
> self._quit_issued at least, but are we absolutely sure that it can never
> raise an exception before getting to qmp()? I guess in theory, closing
> the console socket in _early_cleanup() could raise one? (But either way,
> not relying on such subtleties would make the code easier to
> understand.)
>

If it does raise an exception before getting to qmp(), we'll fail over to
the hard shutdown path.

shutdown()
  _do_shutdown()
    _soft_shutdown()
      _early_cleanup() -- Let's say this one chokes.

So we'll likely have _quit_issued = False and _user_killed = False.

We fail over:

shutdown()
  _do_shutdown()
    _hard_shutdown()
      _early_cleanup() -- Uh oh, if it failed once, it might fail again.
      self._subp.kill()
      self._subp.wait(timeout=60)

I'm going to ignore the _early_cleanup() problem here for a moment, as it's
a pre-existing problem and I'll fix it separately. Let's just continue the
hypothetical.

shutdown()
  _post_shutdown()
    _early_cleanup()  -- Uh oh for a third time.
    _close_qmp_connection()
    ...

At this point, we're finally going to try to close this connection.

        try:
            self._close_qmp_connection()
        except Exception as err:  # pylint: disable=broad-except

            LOG.warning(
                "Exception closing QMP connection: %s",
                str(err) if str(err) else type(err).__name__
            )
        finally:
            assert self._qmp_connection is None

And the grand result is that it's very likely just going to log a warning
to the error stream saying that the QMP connection closed in a weird way --
possibly EOFError, possibly ECONNABORTED, ECONNRESET, EPIPE.The rest of
cleanup will continue, and the exception that was stored prior to executing
the "finally:" phase of shutdown() will now be raised, which would be:

raise AbnormalShutdown("Could not perform graceful shutdown") from exc

where 'exc' is the theoretical exception from _soft_shutdown >
_early_cleanup.

Ultimately, we'll see an error log for the QMP connection terminating in a
strange way, followed by a stack trace for our failure to gracefully shut
down the VM (because the early cleanup code failed.) I think this is
probably a reasonable way to report this circumstance -- the machine.py
code has no idea what's going on, so it (as best as it can) just reports
the errors it sees. This makes the cleanup code a little "eager to fail",
but for a testing suite I thought that was actually appropriate behavior.

I think this is at least functional as written, ultimately? The trick is
remembering to call wait() instead of shutdown() when you need it, but I
don't see a way to predict or track the intent of the test-writer any
better than that, so I don't know how to improve the usability of the
library around that case, exactly.

--js


>
> Kevin
>
>

--000000000000b0dbe005cf5937e1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>This reply is long, sorry.<br><br></div><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct 27, 2021 at=
 7:19 AM Kevin Wolf &lt;<a href=3D"mailto:kwolf@redhat.com">kwolf@redhat.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>Am 26.10.2021 um 19:56 hat John Snow geschrieben:<br>
&gt; To use the AQMP backend, Machine just needs to be a little more dilige=
nt<br>
&gt; about what happens when closing a QMP connection. The operation is no<=
br>
&gt; longer a freebie in the async world; it may return errors encountered =
in<br>
&gt; the async bottom half on incoming message receipt, etc.<br>
&gt; <br>
&gt; (AQMP&#39;s disconnect, ultimately, serves as the quiescence point whe=
re all<br>
&gt; async contexts are gathered together, and any final errors reported at=
<br>
&gt; that point.)<br>
&gt; <br>
&gt; Because async QMP continues to check for messages asynchronously, it&#=
39;s<br>
&gt; almost certainly likely that the loop will have exited due to EOF afte=
r<br>
&gt; issuing the last &#39;quit&#39; command. That error will ultimately be=
 bubbled<br>
&gt; up when attempting to close the QMP connection. The manager class here=
<br>
&gt; then is free to discard it -- if it was expected.<br>
&gt; <br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank">jsnow@redhat.com</a>&gt;<br>
&gt; Reviewed-by: Hanna Reitz &lt;<a href=3D"mailto:hreitz@redhat.com" targ=
et=3D"_blank">hreitz@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 python/qemu/machine/machine.py | 48 ++++++++++++++++++++++++++++=
+-----<br>
&gt;=C2=A0 1 file changed, 42 insertions(+), 6 deletions(-)<br>
&gt; <br>
&gt; diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/mach=
ine.py<br>
&gt; index 0bd40bc2f76..a0cf69786b4 100644<br>
&gt; --- a/python/qemu/machine/machine.py<br>
&gt; +++ b/python/qemu/machine/machine.py<br>
&gt; @@ -342,9 +342,15 @@ def _post_shutdown(self) -&gt; None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Comprehensive reset for the failed=
 launch case:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._early_cleanup()<br>
&gt;=C2=A0 <br>
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
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._close_qemu_log_file()<br>
&gt;=C2=A0 <br>
&gt; @@ -420,6 +426,31 @@ def _launch(self) -&gt; None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0close_fds=3DFalse)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._post_launch()<br>
&gt;=C2=A0 <br>
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
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not (self._user_killed o=
r self._quit_issued):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise<br>
<br>
Isn&#39;t this racy for those tests that expect QEMU to quit by itself and<=
br>
then later call wait()? self._quit_issued is only set to True in wait(),<br=
>
but whatever will cause QEMU to quit happens earlier and it might<br>
actually quit before wait() is called.<br></blockquote><div><br></div><div>=
<div>_quit_issued is also set to True via qmp() and command(), but I think =
you&#39;re referring to cases where QEMU terminates for other reasons than =
an explicit command. So, yes, QEMU might indeed terminate/abort/quit before=
 machine.py has recorded that fact somewhere. I wasn&#39;t aware of that be=
ing a problem. I suppose it&#39;d be racy if, say, you orchestrated a &quot=
;side-channel quit&quot; and then didn&#39;t call wait() and instead called=
 shutdown(). I think that&#39;s the case you&#39;re worried about? But, thi=
s code should ultimately be called in only four cases:</div><div><br></div>=
<div>(1) Connection failure</div><div>(2) shutdown()</div><div>(3) shutdown=
(), via wait()<br></div><div>(4) shutdown(), via kill()<br></div><div><br><=
/div><div>I had considered it a matter of calling the correct exit path fro=
m the test code. If shutdown() does what the label on the tin says (it shut=
s down the VM), I actually would expect it to be racy if QEMU was in the mi=
ddle of deconstructing itself. That&#39;s the belief behind changing around=
 iotest 300 the way I did.</div></div><div>=C2=A0</div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
It would make sense to me that such tests need to declare that they<br>
expect QEMU to quit before actually performing the action. And then<br>
wait() becomes less weird in patch 1, too, because it can just assert<br>
self._quit_issued instead of unconditionally setting it.<br></blockquote><d=
iv><br></div><div>That&#39;s a thought. I was working on the model that cal=
ling wait() implies the fact that the writer is expecting it to terminate t=
hrough some mechanism otherwise invisible to machine.py (HMP perhaps, a QGA=
 action, migration failure, etc.) It&#39;s one less call vs. saying &quot;e=
xpect_shutdown(); wait_shutdown()&quot;. I wasn&#39;t aware of a circumstan=
ce where you&#39;d want to separate these two=20
semantic bits of info (&quot;I expect QEMU will shut down&quot; / &quot;I a=
m waiting=20
for QEMU to shut down&quot;) and since the latter implied the former, I=20
rolled &#39;em up into one.</div><div><br></div><div>I suppose in your case=
, you&#39;re wondering what happens if we decide to call shutdown() instead=
 of wait() after orchestrating a &quot;side-channel quit&quot;? I *would* h=
ave considered that a semantic error in the author&#39;s code, but I suppos=
e it&#39;s reasonable to expect that &quot;shutdown() should DTRT&quot;. Th=
ough, in order for it to DTRT, you have to inform machine that you&#39;re e=
xpecting that side-channel termination, and if you already forgot to use wa=
it() instead of shutdown(), I&#39;m not sure I can help the author remember=
 that they should have issued a &quot;expect_shutdown()&quot; or similar.</=
div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
The other point I&#39;m unsure is whether you can actually kill QEMU withou=
t<br>
getting either self._user_killed or self._quit_issued set. The<br>
potentially problematic case I see is shutdown(hard =3D False) where soft<b=
r>
shutdown fails. Then a hard shutdown will be performed without setting<br>
self._user_killed (is this a bug?).<br></blockquote><div><br></div><div>The=
 original intent of _user_killed was specifically to record cases where the=
 test-writer *intentionally* killed the VM process. We then used that flag =
to change the error reporting on cleanup in _post_shutdown. The idea was th=
at if the QEMU process terminated due to signal and we didn&#39;t explicitl=
y intentionally cause it, that we should loudly report that occurrence. We =
added this specifically to catch problems on the exit path in various iotes=
ts. So, the fact that soft shutdown fails over to a hard shutdown but doesn=
&#39;t set that intent flag is the intended behavior.</div><br></div><div c=
lass=3D"gmail_quote">So, what about _close_qmp_connection()? I figured that=
 if any of the following were true:<br><br></div><div class=3D"gmail_quote"=
>1) quit was explicitly issued via qmp() or command()<br></div><div class=
=3D"gmail_quote">2) wait() was called instead of shutdown, implying an anti=
cipated side-channel termination<br></div><div class=3D"gmail_quote"><div>3=
) kill() or shutdown(hard=3DTrue) was called</div><div><br></div><div>... t=
hen we were expecting the remote to hang up on us, and we didn&#39;t need t=
o report that error.</div><div><br></div><div>What about when the VM is kil=
led but it wasn&#39;t explicitly intentional by the test-writer? As far as =
machine.py knows, it was unintentional and so it will allow that error to t=
rickle up when _close_qmp_connection() is called. The server hung up on us =
and we have no idea why. The error will be reported upwards. From the conte=
xt of just this one function, that seems like the correct behavior.</div></=
div><div class=3D"gmail_quote"><div><br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
Of course, sending the &#39;quit&#39; command in _soft_shutdown() will set<=
br>
self._quit_issued at least, but are we absolutely sure that it can never<br=
>
raise an exception before getting to qmp()? I guess in theory, closing<br>
the console socket in _early_cleanup() could raise one? (But either way,<br=
>
not relying on such subtleties would make the code easier to<br>
understand.)<br></blockquote><div><br></div><div>If it does raise an except=
ion before getting to qmp(), we&#39;ll fail over to the hard shutdown path.=
</div><div><br></div><div>shutdown()</div><div>=C2=A0 _do_shutdown()</div><=
div>=C2=A0=C2=A0=C2=A0 _soft_shutdown()</div><div>=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 _early_cleanup() -- Let&#39;s say this one chokes.</div><div><br></d=
iv><div>So we&#39;ll likely have _quit_issued =3D False and _user_killed =
=3D False.</div><div><br></div><div>We fail over:</div><div><br></div><div>=
shutdown()</div><div>=C2=A0 _do_shutdown()</div><div>=C2=A0=C2=A0=C2=A0 _ha=
rd_shutdown()</div><div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 _early_cleanup() -- =
Uh oh, if it failed once, it might fail again.</div><div>=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 self._subp.kill()</div><div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sel=
f._subp.wait(timeout=3D60)</div></div><div class=3D"gmail_quote"><br></div>=
<div class=3D"gmail_quote">I&#39;m going to ignore the _early_cleanup() pro=
blem here for a moment, as it&#39;s a pre-existing problem and I&#39;ll fix=
 it separately. Let&#39;s just continue the hypothetical.</div><div class=
=3D"gmail_quote"><br></div><div class=3D"gmail_quote">shutdown()</div><div =
class=3D"gmail_quote">=C2=A0 _post_shutdown()</div><div class=3D"gmail_quot=
e">=C2=A0=C2=A0=C2=A0 _early_cleanup()=C2=A0 -- Uh oh for a third time.</di=
v><div class=3D"gmail_quote">=C2=A0=C2=A0=C2=A0 _close_qmp_connection()</di=
v><div class=3D"gmail_quote">=C2=A0=C2=A0=C2=A0 ...<br></div><div class=3D"=
gmail_quote"><br></div><div class=3D"gmail_quote">At this point, we&#39;re =
finally going to try to close this connection.</div><div class=3D"gmail_quo=
te"><br></div><div class=3D"gmail_quote">=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<b=
r>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._close_qmp_connection()<br=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 except Exception as err: =C2=A0# pylint: disab=
le=3Dbroad-except =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 LOG.warning(<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;Exception closing QMP connection: %s&quot;,<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 str(err) if str(err) e=
lse type(err).__name__<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 finally:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 assert self._qmp_connection is None<br></div><div class=3D"gmail_quo=
te"><br></div><div class=3D"gmail_quote">And the grand result is that it&#3=
9;s very likely just going to log a warning to the error stream saying that=
 the QMP connection closed in a weird way -- possibly EOFError, possibly EC=
ONNABORTED, ECONNRESET, EPIPE.The rest of cleanup will continue, and the ex=
ception that was stored prior to executing the &quot;finally:&quot; phase o=
f shutdown() will now be raised, which would be:</div><div class=3D"gmail_q=
uote"><br></div><div>raise AbnormalShutdown(&quot;Could not perform gracefu=
l shutdown&quot;) from exc</div><div><br></div><div>where &#39;exc&#39; is =
the theoretical exception from _soft_shutdown &gt; _early_cleanup.</div><di=
v><br></div><div>Ultimately, we&#39;ll see an error log for the QMP connect=
ion terminating in a strange way, followed by a stack trace for our failure=
 to gracefully shut down the VM (because the early cleanup code failed.) I =
think this is probably a reasonable way to report this circumstance -- the =
machine.py code has no idea what&#39;s going on, so it (as best as it can) =
just reports the errors it sees. This makes the cleanup code a little &quot=
;eager to fail&quot;, but for a testing suite I thought that was actually a=
ppropriate behavior.<br></div><div><br></div><div>I think this is at least =
functional as written, ultimately? The trick is remembering to call wait() =
instead of shutdown() when you need it, but I don&#39;t see a way to predic=
t or track the intent of the test-writer any better than that, so I don&#39=
;t know how to improve the usability of the library around that case, exact=
ly.</div><div><br></div><div>--js<br></div><div class=3D"gmail_quote"><div>=
</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Kevin<br>
<br>
</blockquote></div></div>

--000000000000b0dbe005cf5937e1--


