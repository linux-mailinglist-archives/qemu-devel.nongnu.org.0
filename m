Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1136E664FDF
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 00:22:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFNwC-0003Dq-TU; Tue, 10 Jan 2023 18:21:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>) id 1pFNwA-0003DL-2g
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 18:21:46 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>) id 1pFNw7-0008RN-O9
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 18:21:45 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 47DE23200974;
 Tue, 10 Jan 2023 18:21:41 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Tue, 10 Jan 2023 18:21:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1673392900; x=
 1673479300; bh=DYmb98pLWA62bwnIKJEyXQi+oqIvf3VpLvJqTCxTT/w=; b=g
 6lTB40ebw04BZdCxWZ9VcS+jmS6wJgwimWlT7TIE/rI2S7g4aSpXl9tL3lGUw3hb
 uLUtcAQFgdRX66c0RI8TvY7FTLiR8iKlVbx6Xkc50uXeRksvK/o4mKzZhbCxmTRM
 Jj7TUrxq2clY070MlNTMovnLAm+cVMqlhIoL+Jjz65aSTSucL6DAKswnt/KUGClH
 0gfp7+dRTxEushDHZ2+Q8Zhw33cutVTRsuf2vquqdc3voiqsEDIMF9oYzF0mtZug
 TkLezyXdY2sU+dFoppeCx6r7S1sob+8rkmmuPJysEpaJqfWzxm6QfSchqcxC2hVr
 BvyUS7QpZ9NwfENu6qtdg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1673392900; x=
 1673479300; bh=DYmb98pLWA62bwnIKJEyXQi+oqIvf3VpLvJqTCxTT/w=; b=O
 ExSz3KImrhh6RXXBTzhiZXf/ZkRHNDDWppRqPQNsn26ItoJwZAMvLQF59Z1WOTZ/
 iPcu6ytYjDAW6m3izAa4hvjeXqOTEoCm9dzaAfOERr+3qZ3B4wiu4rty/Adfx+zy
 3BDNlA/G5nrOIT7WD/0Kbh3lJmxCP5XRTdjGbN2mrpFglcb+d3wMHES1lzhamE0m
 AUB7YJugmigCMxJh2X24i+4daHiGDHELwszPs7fsDsZg310ID/f7IYY6DA1MiFk9
 78xhoK5WDdYkcma4XIGRp3MykxdwfnE8iq80WexsHeaENy8AywSAUDCJwcbmfu8X
 PNdZTVR3f8Go/L0lpLG2g==
X-ME-Sender: <xms:BPO9Y9dYBdt7KJ54MHUCttARxNLWb2-RTHH_fKhQEgy_N80O6xG5sQ>
 <xme:BPO9Y7MZQq8x8p987EVB_g4fmsDOfm914e8Yr501LvNkQkyGz56EG6XdfNdiUz5Vw
 QOUgJ46ymx0rpByYVw>
X-ME-Received: <xmr:BPO9Y2gboORipeNWNB2Iy4YYWY1bSK6dT-grv-S4JlpNIB4KnuDZlNR-bDTx-OGMuBZxZul5SAO2HHGgFb8_9A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrleefgddtkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomheprfgvthgv
 rhcuffgvlhgvvhhorhihrghsuceophgvthgvrhesphhjugdruggvvheqnecuggftrfgrth
 htvghrnheptdelhfevueekledvtdegvefgtefggfegfeejgfevffevhfekheehleefgfei
 gffhnecuffhomhgrihhnpehsthgrtghkvgigtghhrghnghgvrdgtohhmpdhgihhtlhgrsg
 drtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
 pehpvghtvghrsehpjhgurdguvghv
X-ME-Proxy: <xmx:BPO9Y2-Hjumr7bx_07W-G855e5Io7aaLJx3edRJpIewhiEdtxTBW_A>
 <xmx:BPO9Y5so9deCrnq3fcvCyNvWHUg1-biH3cvbCsRn3mcmZ_n0s_CQnQ>
 <xmx:BPO9Y1EoqI9sjb8ZN1TrdJG76MsSgp9xobPhgwDER7UtanI_uKNhMA>
 <xmx:BPO9YzIurG-VFd5ik4DSXdXg8LGlrTnU4sbtI0BXzjA7nAPrnuZ5IA>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 10 Jan 2023 18:21:39 -0500 (EST)
Date: Tue, 10 Jan 2023 15:21:37 -0800
From: Peter Delevoryas <peter@pjd.dev>
To: John Snow <jsnow@redhat.com>
Cc: crosa@redhat.com, bleal@redhat.com, philmd@linaro.org,
 wainersm@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH v4 1/1] python/machine: Fix AF_UNIX path too long on macOS
Message-ID: <Y73zATP2zZA+NoMm@pdel-mbp.dhcp.thefacebook.com>
References: <20230110080756.38271-1-peter@pjd.dev>
 <20230110080756.38271-2-peter@pjd.dev>
 <CAFn=p-astqzr2vW0f3p9_36OfpiYJ1HXZRTLQDEdO7_F4g95hQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFn=p-astqzr2vW0f3p9_36OfpiYJ1HXZRTLQDEdO7_F4g95hQ@mail.gmail.com>
Received-SPF: pass client-ip=64.147.123.21; envelope-from=peter@pjd.dev;
 helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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

On Tue, Jan 10, 2023 at 06:18:29PM -0500, John Snow wrote:
> On Tue, Jan 10, 2023 at 3:34 AM Peter Delevoryas <peter@pjd.dev> wrote:
> >
> > On macOS, private $TMPDIR's are the default. These $TMPDIR's are
> > generated from a user's unix UID and UUID [1], which can create a
> > relatively long path:
> >
> >     /var/folders/d7/rz20f6hd709c1ty8f6_6y_z40000gn/T/
> >
> > QEMU's avocado tests create a temporary directory prefixed by
> > "avo_qemu_sock_", and create QMP sockets within _that_ as well.
> > The QMP socket is unnecessarily long, because a temporary directory
> > is created for every QEMUMachine object.
> >
> >     /avo_qemu_sock_uh3w_dgc/qemu-37331-10bacf110-monitor.sock
> >
> > The path limit for unix sockets on macOS is 104: [2]
> >
> >     /*
> >      * [XSI] Definitions for UNIX IPC domain.
> >      */
> >     struct  sockaddr_un {
> >         unsigned char   sun_len;        /* sockaddr len including null */
> >         sa_family_t     sun_family;     /* [XSI] AF_UNIX */
> >         char            sun_path[104];  /* [XSI] path name (gag) */
> >     };
> >
> > This results in avocado tests failing on macOS because the QMP unix
> > socket can't be created, because the path is too long:
> >
> >     ERROR| Failed to establish connection: OSError: AF_UNIX path too long
> >
> > This change resolves by reducing the size of the socket directory prefix
> > and the suffix on the QMP and console socket names.
> >
> > The result is paths like this:
> >
> >     pdel@pdel-mbp:/var/folders/d7/rz20f6hd709c1ty8f6_6y_z40000gn/T
> >     $ tree qemu*
> >     qemu_df4evjeq
> >     qemu_jbxel3gy
> >     qemu_ml9s_gg7
> >     qemu_oc7h7f3u
> >     qemu_oqb1yf97
> >     ├── 10a004050.con
> >     └── 10a004050.qmp
> >
> > [1] https://apple.stackexchange.com/questions/353832/why-is-mac-osx-temp-directory-in-weird-path
> > [2] /Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/sys/un.h
> >
> > Signed-off-by: Peter Delevoryas <peter@pjd.dev>
> 
> I'm tentatively staging this with a benefit-of-the-doubt [1] -- my
> tests are still running -- but I do have a question:
> 
> > ---
> >  python/qemu/machine/machine.py         | 6 +++---
> >  tests/avocado/avocado_qemu/__init__.py | 2 +-
> >  2 files changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
> > index 748a0d807c9d..d70977378305 100644
> > --- a/python/qemu/machine/machine.py
> > +++ b/python/qemu/machine/machine.py
> > @@ -157,7 +157,7 @@ def __init__(self,
> >          self._wrapper = wrapper
> >          self._qmp_timer = qmp_timer
> >
> > -        self._name = name or f"qemu-{os.getpid()}-{id(self):02x}"
> > +        self._name = name or f"{id(self):x}"
> 
> Why is it safe to not differentiate based on the process ID?
> 
> ... I suppose the thinking is: by default, in machine.py, this is a
> temp dir created by tempfile.mkdtemp which will be unique per-process.
> I suppose there's no protection against a caller supplying the same
> tempdir (or sockdir) to multiple instances, but I suppose in those
> cases we get to argue that "Well, don't do that, then."
> 
> Does that sound about right?

Yeah, I think that's it

> 
> --js
> 
> [1] staged @ https://gitlab.com/jsnow/qemu/-/commits/python
> 
> 
> >          self._temp_dir: Optional[str] = None
> >          self._base_temp_dir = base_temp_dir
> >          self._sock_dir = sock_dir
> > @@ -167,7 +167,7 @@ def __init__(self,
> >              self._monitor_address = monitor_address
> >          else:
> >              self._monitor_address = os.path.join(
> > -                self.sock_dir, f"{self._name}-monitor.sock"
> > +                self.sock_dir, f"{self._name}.qmp"
> >              )
> >
> >          self._console_log_path = console_log
> > @@ -192,7 +192,7 @@ def __init__(self,
> >          self._console_set = False
> >          self._console_device_type: Optional[str] = None
> >          self._console_address = os.path.join(
> > -            self.sock_dir, f"{self._name}-console.sock"
> > +            self.sock_dir, f"{self._name}.con"
> >          )
> >          self._console_socket: Optional[socket.socket] = None
> >          self._remove_files: List[str] = []
> > diff --git a/tests/avocado/avocado_qemu/__init__.py b/tests/avocado/avocado_qemu/__init__.py
> > index 910f3ba1eab8..25a546842fab 100644
> > --- a/tests/avocado/avocado_qemu/__init__.py
> > +++ b/tests/avocado/avocado_qemu/__init__.py
> > @@ -306,7 +306,7 @@ def require_netdev(self, netdevname):
> >              self.cancel('no support for user networking')
> >
> >      def _new_vm(self, name, *args):
> > -        self._sd = tempfile.TemporaryDirectory(prefix="avo_qemu_sock_")
> > +        self._sd = tempfile.TemporaryDirectory(prefix="qemu_")
> >          vm = QEMUMachine(self.qemu_bin, base_temp_dir=self.workdir,
> >                           sock_dir=self._sd.name, log_dir=self.logdir)
> >          self.log.debug('QEMUMachine "%s" created', name)
> > --
> > 2.39.0
> >
> >
> 

