Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2473257D8C0
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 04:46:24 +0200 (CEST)
Received: from localhost ([::1]:41116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEigI-0002xd-Kw
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 22:46:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>) id 1oEieU-0001Uc-1n
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 22:44:30 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:50341)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>) id 1oEieR-0007f5-Bn
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 22:44:29 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id E11F0580594;
 Thu, 21 Jul 2022 22:44:24 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 21 Jul 2022 22:44:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1658457864; x=
 1658461464; bh=XiFsfnUGtCtgtOPSqSG8IhIAphnMMHg8HSuBNGlfZro=; b=V
 YPq2CGOytq1aIPGDL+peoHwzA+PIPQxrA/PSn4V/Mi1fO/j72dwbz3wmtZehVIdL
 t8+Y+eBTuOJiimQ+tEWIYxjn1l3WxJh84Wr0KzndNGgEh3fIhJTCzc7OtMOKFfc4
 7nXcsjEQqldtIbJhq0MCUMVJv8SWC6pPEtFaIVBg0FAfwy8hJVnIGBIc6R8mJ8rB
 iF9Z7m1fR0qpuKIipCIvOJCQ2w29dpCa4kKH5ONyYCcJvWnkiPEJAyqvxZcpujr3
 qCv5cSavSKHmSzXLG5vmv4vJxfG7cDdNZKuPr5UpbMxpkySyw+RMxWGOmHnsiJAU
 Q3bSQGcH1nYPoOC7gv0Zw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1658457864; x=
 1658461464; bh=XiFsfnUGtCtgtOPSqSG8IhIAphnMMHg8HSuBNGlfZro=; b=d
 Cw2KYXkWA+jV99YVE6VrujHmc/AbDgAZOuiCzq8noHTvNYkj5leYZLu4UWeD18Lp
 dIdcL/q2fkUd9q71qoqHCxmSVK44FIrdhNXTSec6eOJkSJUNqhBsyPPz/Jwz0YHe
 w8oaUe54jsurOvgWTdEriwJBI9JM32NmomDOGvp1VPuwdqHZzbflqhIrR0Vm0gUB
 L0m0gdJm9gNVJr5ut6DWW8Dmj3pdiIsR9SyR850tYZd+t84GJxs8Wyp3Pizf44yO
 RMsp9tdwmq1spC29sTyeO6ErpFNiy+XtpypGgv+1Par2DJPHuGaA8MMWyrFbmqh3
 +M7hEqbjWuxJGz14ZR/Og==
X-ME-Sender: <xms:CA_aYlDAbcVjX5A0408XvOEbulRgQrl3MUoSw6mXNm-IfiOdgm1fFw>
 <xme:CA_aYjjeOJys-g32D1a1_mfprPNXC-2RAJlDF3t9NXThw8FkvBUgonKWYvciQehG3
 2jrar3rdmt9zLcugsY>
X-ME-Received: <xmr:CA_aYglG3f5BumQ44NL_ev_d8PBlHx4QvBH9VI_--eL7yyxnSt0LC1tRiA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddtuddgieegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefrvght
 vghrucffvghlvghvohhrhigrshcuoehpvghtvghrsehpjhgurdguvghvqeenucggtffrrg
 htthgvrhhnpeetvdfhudfghffhvdfhkeevvdeigeejgeetfedtvdehvdevkeelheffhefh
 veehhfenucffohhmrghinhepshhtrggtkhgvgigthhgrnhhgvgdrtghomhdpsggvrhhrrg
 hnghgvrdgtohhmpdhflhhitghkrhdrtghomhdplhhisghvihhrthdrohhrghdpvghnthgr
 nhhglhgvqdhphhhothhordhorhhgpdhinhhsthgrghhrrghmrdgtohhmnecuvehluhhsth
 gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgvthgvrhesphhjugdr
 uggvvh
X-ME-Proxy: <xmx:CA_aYvxTUvSFkbxfuVrmRLRBzc-iaAjpReihtKyr-Bk9HD3W0JusKw>
 <xmx:CA_aYqTuFS_vg6zUyYdM_XGN24yvGwDd-tG9m3Lg44RrDhCV4_gVzw>
 <xmx:CA_aYiaQ1HjB_9oQw1zfEJ9d-D2LPH4kD254haazGDWXLqpj72qRLA>
 <xmx:CA_aYnJEtiCMUdL-frCjZ_-9MVm0mMBpPDBQG0Y9nz8ctMFp5mi1J3pfuCg>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 21 Jul 2022 22:44:23 -0400 (EDT)
Date: Thu, 21 Jul 2022 19:44:21 -0700
From: Peter Delevoryas <peter@pjd.dev>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: jsnow@redhat.com, crosa@redhat.com, bleal@redhat.com, f4bug@amsat.org,
 wainersm@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH v2 1/1] python/machine: Fix AF_UNIX path too long on macOS
Message-ID: <YtoPBYGmSNfeT1Ot@pdel-mbp>
References: <20220716173434.17183-1-peter@pjd.dev>
 <20220716173434.17183-2-peter@pjd.dev>
 <YtUgMTYSQjm9O+u4@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YtUgMTYSQjm9O+u4@redhat.com>
Received-SPF: pass client-ip=66.111.4.229; envelope-from=peter@pjd.dev;
 helo=new3-smtp.messagingengine.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_FMBLA_NEWDOM28=0.798, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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

On Mon, Jul 18, 2022 at 09:56:17AM +0100, Daniel P. Berrangé wrote:
> On Sat, Jul 16, 2022 at 10:34:34AM -0700, Peter Delevoryas wrote:
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
> 
> 
> Looking at this again, I realize my suggestion for dealing with the
> second part of the path was mistaken.
> 
> The "qemu-37331-10bacf110-monitor.sock" part is combining two
> pieces.
> 
> First the result of
> 
>   f"qemu-{os.getpid()}-{id(self):02x}"
> 
> is
> 
>   qemu-37331-10bacf110
> 
> and the code later than appends '-monitor.sock'
> 
> So...
> 
> > 
> > The path limit for unix sockets on macOS is 104: [2]
> > 
> >     /*
> >      * [XSI] Definitions for UNIX IPC domain.
> >      */
> >     struct  sockaddr_un {
> 
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
> > This change reduces the size of both paths, and removes the unique
> > identification information from the socket name, since it seems to be
> > unnecessary.
> > 
> > This commit produces paths like the following:
> > 
> >     pdel@pdel-mbp:/var/folders/d7/rz20f6hd709c1ty8f6_6y_z40000gn/T
> >     $ tree qemu*
> >     qemu_oc7h7f3u
> >     ├── qmp-console.sock
> >     └── qmp-monitor.sock
> > 
> > [1] https://apple.stackexchange.com/questions/353832/why-is-mac-osx-temp-directory-in-weird-path
> > [2] /Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/sys/un.h
> > 
> > Signed-off-by: Peter Delevoryas <peter@pjd.dev>
> > ---
> >  python/qemu/machine/machine.py         | 2 +-
> >  tests/avocado/avocado_qemu/__init__.py | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
> > index 37191f433b..b1823966b3 100644
> > --- a/python/qemu/machine/machine.py
> > +++ b/python/qemu/machine/machine.py
> > @@ -157,7 +157,7 @@ def __init__(self,
> >          self._wrapper = wrapper
> >          self._qmp_timer = qmp_timer
> >  
> > -        self._name = name or f"qemu-{os.getpid()}-{id(self):02x}"
> > +        self._name = name or "qmp"
> 
> ...my suggestion here was wrong.
> 
> We don't need the os.getpid() unoiqueness because the tmpdir already
> ensures that is safe, but keeping 'id(self)' is a good idea, if the
> test case creates multiple machines concurrently. Bearing in mind we
> later append '-monitor.sock' we don't need 'qmp' in the self._name.
> 
> So on reflection I think I should have suggested using:
> 
>     self._name = name or f"{id(self):02x}"
> 
> And *in addition*, a few lines later change:
> 
>             self._monitor_address = os.path.join(
>                 self.sock_dir, f"{self._name}-monitor.sock"
>             )
> 
> To
> 
>             self._monitor_address = os.path.join(
>                 self.sock_dir, f"{self._name}.qmp"
>             )
>

Finally getting back to this (sorry, been working on other stuff), and I noticed
the console socket is just below this:

    self._console_address = os.path.join(
        self.sock_dir, f"{self._name}-console.sock"
    )

So I probably shouldn't do the "-monitor.sock" change right?

That's ok though, the other changes are sufficient to fix the problem. I'll give
you a chance to reply to this email, or else I'll just send a v3 that doesn't
include the -monitor.sock change.

Thanks,
Peter

> 
> 
> > diff --git a/tests/avocado/avocado_qemu/__init__.py b/tests/avocado/avocado_qemu/__init__.py
> > index ed4853c805..43b8c8848c 100644
> > --- a/tests/avocado/avocado_qemu/__init__.py
> > +++ b/tests/avocado/avocado_qemu/__init__.py
> > @@ -296,7 +296,7 @@ def require_accelerator(self, accelerator):
> >                          "available" % accelerator)
> >  
> >      def _new_vm(self, name, *args):
> > -        self._sd = tempfile.TemporaryDirectory(prefix="avo_qemu_sock_")
> > +        self._sd = tempfile.TemporaryDirectory(prefix="qemu_")
> 
> This bit is fine.
> 
> >          vm = QEMUMachine(self.qemu_bin, base_temp_dir=self.workdir,
> >                           sock_dir=self._sd.name, log_dir=self.logdir)
> >          self.log.debug('QEMUMachine "%s" created', name)
> 
> With regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
> 

