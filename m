Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D4B6715D1
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 09:04:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI3Pr-0005mg-1H; Wed, 18 Jan 2023 03:03:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pI3Pe-0005l9-Te
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 03:03:19 -0500
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pI3Pb-0003kb-EC
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 03:03:13 -0500
Received: by mail-lj1-x231.google.com with SMTP id g14so35671835ljh.10
 for <qemu-devel@nongnu.org>; Wed, 18 Jan 2023 00:03:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=omU5TX4UleqfSJw1VaANno5E2xMbjxpYw8C7/L9/Tqw=;
 b=VmLFgI/fOQN/nLkHnGjCmhs3CXkOCj6mTwp2ZTHCbQmhxfWb6L660TVbpG1eR6IPSU
 qWEZxZFzkkLg7HGPcmpeCbxHuOsAcDj0SUhJgUDfWT+vwl8SjD4ZtftEM9jQ9Ie58utV
 5SeIA+rCIqF8uJSYYktX9pB2K+y7A5XHqhgJZ86X7cTjriwQe9/wZeNFGuO4kMptOi1t
 oEkP9AQ7QkKceu5VySeNlDfVMKR19Fd9/Q+pB01WVyPZHmnau70Gqq8FNx+RuK64PQ1a
 RwsJ4H84gc31VmdkoQVLNPdQ8zDcqiGV2GsXdY1wzbYk6RV6HAKxBlyovv1rORRX81Pk
 pupw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=omU5TX4UleqfSJw1VaANno5E2xMbjxpYw8C7/L9/Tqw=;
 b=NVk+DQny/oBB89DW8Be2GXtJqZdrOwh/lKcRTjFdKEPRU0kebntRuvxz+KGsSTpxLj
 r1+DjS1EC4efgoSIv+e2fsvJwwLxVuQYo54VepklHymFiz5d/qd3aNml++AXjq1w7HoT
 lQvG2RA81jCQaOXWl95Gutu1peNI6Avs5YGDS3nH8FjN2R1bwi/YfTBQKv0+t+Y9g39d
 YEM2X15Rnn+J+9drgJqZhalhuNjQs5bJcohZVl/KLjO79JUVJgErSduEKvzVcsZMAkcH
 gttnGvuaUZFak0wbQKzsYu+51+r9WPEhdqyAVLQPvTK+eHAgkVBFFtqb/E/0JbNe6uG0
 YiuA==
X-Gm-Message-State: AFqh2kq+DU85M6AXHGFEssbzwe/9FIbf4eyNfDQM5HWgLrDkwh6ThlaG
 wdtAb/D04HmpYvqnCwXCwxTvuWhaDDrEwa376lY=
X-Google-Smtp-Source: AMrXdXv+xjPKZ5HjQpKf6sP/HiFGyNj7L+p/m8xbf3/VplbzP/2YB22pBK0V1neVaru4IE0aRywUORSI/DRWKL9JBMY=
X-Received: by 2002:a2e:8847:0:b0:28b:629a:7422 with SMTP id
 z7-20020a2e8847000000b0028b629a7422mr313919ljj.289.1674028985997; Wed, 18 Jan
 2023 00:03:05 -0800 (PST)
MIME-Version: 1.0
References: <20230111080101.969151-1-marcandre.lureau@redhat.com>
 <20230111080101.969151-4-marcandre.lureau@redhat.com>
 <CAFn=p-bbU23Hr67ONF6Vo0fNpiCC9+77CSmdF5-145QbtWc7Cg@mail.gmail.com>
In-Reply-To: <CAFn=p-bbU23Hr67ONF6Vo0fNpiCC9+77CSmdF5-145QbtWc7Cg@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 18 Jan 2023 12:02:54 +0400
Message-ID: <CAJ+F1C+JdP6C6_H7jLwQuW1hx18TxGqJhH50uus-+mKjh=xB=A@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] python/qemu/machine: use socketpair() for QMP by
 default
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel@nongnu.org, berrange@redhat.com, 
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::231;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x231.google.com
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

Hi

On Wed, Jan 18, 2023 at 2:36 AM John Snow <jsnow@redhat.com> wrote:
>
> On Wed, Jan 11, 2023 at 3:01 AM <marcandre.lureau@redhat.com> wrote:
> >
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > When no monitor address is given, establish the QMP communication throu=
gh
> > a socketpair() (API is also supported on Windows since Python 3.5)
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> > ---
> >  python/qemu/machine/machine.py | 24 ++++++++++++++++--------
> >  1 file changed, 16 insertions(+), 8 deletions(-)
> >
> > diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machi=
ne.py
> > index 748a0d807c..5b2e499e68 100644
> > --- a/python/qemu/machine/machine.py
> > +++ b/python/qemu/machine/machine.py
> > @@ -158,17 +158,13 @@ def __init__(self,
> >          self._qmp_timer =3D qmp_timer
> >
> >          self._name =3D name or f"qemu-{os.getpid()}-{id(self):02x}"
> > +        self._sock_pair: Optional[Tuple[socket.socket, socket.socket]]=
 =3D None
> >          self._temp_dir: Optional[str] =3D None
> >          self._base_temp_dir =3D base_temp_dir
> >          self._sock_dir =3D sock_dir
> >          self._log_dir =3D log_dir
> >
> > -        if monitor_address is not None:
> > -            self._monitor_address =3D monitor_address
> > -        else:
> > -            self._monitor_address =3D os.path.join(
> > -                self.sock_dir, f"{self._name}-monitor.sock"
> > -            )
> > +        self._monitor_address =3D monitor_address
> >
> >          self._console_log_path =3D console_log
> >          if self._console_log_path:
> > @@ -303,7 +299,11 @@ def _base_args(self) -> List[str]:
> >          args =3D ['-display', 'none', '-vga', 'none']
> >
> >          if self._qmp_set:
> > -            if isinstance(self._monitor_address, tuple):
> > +            if self._sock_pair:
> > +                fd =3D self._sock_pair[0].fileno()
> > +                os.set_inheritable(fd, True)
> > +                moncdev =3D f"socket,id=3Dmon,fd=3D{fd}"
> > +            elif isinstance(self._monitor_address, tuple):
> >                  moncdev =3D "socket,id=3Dmon,host=3D{},port=3D{}".form=
at(
> >                      *self._monitor_address
> >                  )
> > @@ -337,10 +337,17 @@ def _pre_launch(self) -> None:
> >              self._remove_files.append(self._console_address)
> >
> >          if self._qmp_set:
> > +            monitor_address =3D None
> > +            sock =3D None
> > +            if self._monitor_address is None:
> > +                self._sock_pair =3D socket.socketpair()
> > +                sock =3D self._sock_pair[1]
> >              if isinstance(self._monitor_address, str):
> >                  self._remove_files.append(self._monitor_address)
> > +                monitor_address =3D self._monitor_address
> >              self._qmp_connection =3D QEMUMonitorProtocol(
> > -                self._monitor_address,
> > +                address=3Dmonitor_address,
> > +                sock=3Dsock,
> >                  server=3DTrue,
> >                  nickname=3Dself._name
> >              )
> > @@ -360,6 +367,7 @@ def _pre_launch(self) -> None:
> >          ))
> >
> >      def _post_launch(self) -> None:
> > +        self._sock_pair[0].close()
>
> Needs an assert or an error-check here for _sock_pair to be non-None,
> otherwise mypy will shout. Try running "make check-dev" from
> qemu.git/python directory as a smoke test.

Good catch, it should be:

+        if self._sock_pair:
+            self._sock_pair[0].close()

Let me know if you want me to resend the whole series, or if you can
touch it during picking.


--=20
Marc-Andr=C3=A9 Lureau

