Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDD860D654
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 23:51:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onRmx-0002mw-QD; Tue, 25 Oct 2022 17:48:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1onRmt-0002h4-Hc
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 17:48:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1onRmq-0002EI-QY
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 17:48:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666734518;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cOjU1z43BwAxXe1Y7CvDDDVf9ZxqR0VIeeGHA/9WMfM=;
 b=GB79sT3TGFzwjrwTDkaOQI4ZdfAGfO1vM4xcPCc6m6Ww+OPqV4YK6gfP4zgtQPLbPYk8hf
 DVZ+lNgxGhXfkyFg8MdScS6SjPNnmskJYU6vJiokyXQ05TX0L0EObCXOj7mDlkkVo0uPpK
 mk6CP0FXZM/OldFjVeDCZRWHDOhceho=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-570-UXLtyzgfM_CW75cDmEe5AA-1; Tue, 25 Oct 2022 17:48:36 -0400
X-MC-Unique: UXLtyzgfM_CW75cDmEe5AA-1
Received: by mail-lj1-f199.google.com with SMTP id
 k9-20020a2ea269000000b0026fba0d4422so5950755ljm.18
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 14:48:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cOjU1z43BwAxXe1Y7CvDDDVf9ZxqR0VIeeGHA/9WMfM=;
 b=ynEV9If24tmNgYMts6f0AvLyHcKgl0tul84++0KHjYPjWJ1LC0401FxMElpmOBTd53
 uLMiazujIuXCtsZSANe7KC/1T4jtTMmBnNIjUOqvcT+odK/5suNWQ3EY26VKvBfpg3Ni
 9IwzPAySBNFGoHAQ5OnB3I2Oc1HLGGgoVLSJzumPf3EqFLAYmOj8oJgenLl+SdPvRSqB
 DKGlp9Jxa6nWRueJ2SCJ+3/ohOpBITwtCC4V8/9fYKkHYIrj7dsSuM7eIX3QVcNJLMx/
 Mupyqy449ZuOXfYO+H1rV7Kc9iNhMjB9mq+ZUQfD1nJYECtJQ92ofUmab1yVxTm7q9hs
 7FOg==
X-Gm-Message-State: ACrzQf2mfvAdiyAyApBv5mo85RMMs011WyE9Yp3IFHK+qI6nfjTBFY2i
 TvFwYUH+IOalDKgngdKvmhZCXlOx0zLlJcaBUQhv27d62+VQWEGSZjMsxPFOgDV7S+jQwjMjaUh
 29mU70G1orZpSLvJmO8smKNbPEH/TlJE=
X-Received: by 2002:a05:6512:3f8c:b0:4a1:8d5:d75b with SMTP id
 x12-20020a0565123f8c00b004a108d5d75bmr16136379lfa.670.1666734515236; 
 Tue, 25 Oct 2022 14:48:35 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4pFUahweVG/yOaNCe72Ioa4XTnKI/zW/SU4fansikYfe1m4awVqfWfagg5o8ETqh7YO+nP6BFj8Ro3tdsoRIQ=
X-Received: by 2002:a05:6512:3f8c:b0:4a1:8d5:d75b with SMTP id
 x12-20020a0565123f8c00b004a108d5d75bmr16136371lfa.670.1666734514966; Tue, 25
 Oct 2022 14:48:34 -0700 (PDT)
MIME-Version: 1.0
References: <20221024195355.860504-1-jsnow@redhat.com>
 <20221024195355.860504-2-jsnow@redhat.com>
 <Y1edRZ5nDcXu074W@redhat.com>
In-Reply-To: <Y1edRZ5nDcXu074W@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 25 Oct 2022 17:48:22 -0400
Message-ID: <CAFn=p-ZBtKMwEbYkh24fAErGM2oMRDJnLiaW-PARtbeDxXRCCA@mail.gmail.com>
Subject: Re: [PATCH 1/2] python/machine: Add debug logging to key state changes
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Beraldo Leal <bleal@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.517,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Oct 25, 2022 at 4:24 AM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> On Mon, Oct 24, 2022 at 03:53:54PM -0400, John Snow wrote:
> > When key decisions are made about the lifetime of the VM process being
> > managed, there's no log entry. Juxtaposed with the very verbose runstat=
e
> > change logging of the QMP module, machine seems a bit too introverted
> > now.
> >
> > Season the machine.py module with logging statements to taste to help
> > make a tastier soup.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >  python/qemu/machine/machine.py | 18 ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> >
> > diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machi=
ne.py
> > index 37191f433b2..c467f951d5d 100644
> > --- a/python/qemu/machine/machine.py
> > +++ b/python/qemu/machine/machine.py
> > @@ -373,6 +373,7 @@ def _post_shutdown(self) -> None:
> >          Called to cleanup the VM instance after the process has exited=
.
> >          May also be called after a failed launch.
> >          """
> > +        LOG.debug("Cleaning up after VM process")
> >          try:
> >              self._close_qmp_connection()
> >          except Exception as err:  # pylint: disable=3Dbroad-except
> > @@ -497,6 +498,7 @@ def _early_cleanup(self) -> None:
> >          # for QEMU to exit, while QEMU is waiting for the socket to
> >          # become writable.
> >          if self._console_socket is not None:
> > +            LOG.debug("Closing console socket")
> >              self._console_socket.close()
> >              self._console_socket =3D None
> >
> > @@ -507,6 +509,7 @@ def _hard_shutdown(self) -> None:
> >          :raise subprocess.Timeout: When timeout is exceeds 60 seconds
> >              waiting for the QEMU process to terminate.
> >          """
> > +        LOG.debug("Performing hard shutdown")
> >          self._early_cleanup()
> >          self._subp.kill()
> >          self._subp.wait(timeout=3D60)
> > @@ -523,6 +526,13 @@ def _soft_shutdown(self, timeout: Optional[int]) -=
> None:
> >          :raise subprocess.TimeoutExpired: When timeout is exceeded wai=
ting for
> >              the QEMU process to terminate.
> >          """
> > +        LOG.debug("Attempting graceful termination")
> > +        if self._quit_issued:
> > +            LOG.debug(
> > +                "Anticipating QEMU termination due to prior 'quit' com=
mand, "
> > +                "or explicit call to wait()"
> > +            )
> > +
> >          self._early_cleanup()
> >
> >          if self._qmp_connection:
> > @@ -553,6 +563,10 @@ def _do_shutdown(self, timeout: Optional[int]) -> =
None:
> >          try:
> >              self._soft_shutdown(timeout)
> >          except Exception as exc:
> > +            if isinstance(exc, subprocess.TimeoutExpired):
> > +                LOG.debug("Timed out waiting for QEMU process to exit"=
)
> > +            LOG.debug("Graceful shutdown failed, "
> > +                      "falling back to hard shutdown")
>
> If you add 'exc_info=3DTrue' when logging from inside an 'except'
> clause, it captures the stack trace which is often critical for
> debugging unexpected exceptions, especially when you're catchintg
> the top level 'Exception' class instead of a very specialized
> class.
>

Sure. If the exception goes unhandled, ultimately, we'll see that
stack trace twice. On the other hand, if someone handles this trace
and you still want to see the exception in the debug log somewhere,
it's probably a fair trade-off.

I'll touch it up while we're here.

--js


