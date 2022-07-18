Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7FD9578984
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 20:26:01 +0200 (CEST)
Received: from localhost ([::1]:58096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDVRP-0000Vx-U6
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 14:25:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>) id 1oDVOP-0006Ut-OX
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 14:22:53 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:54189)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>) id 1oDVON-0003vL-Gf
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 14:22:53 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id AC50A5819CF;
 Mon, 18 Jul 2022 14:22:49 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 18 Jul 2022 14:22:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1658168569; x=
 1658172169; bh=XRWjWOstJuv045KaE8r0GI4CKklVrjVeTYG8bLm9suI=; b=I
 I2eY56Ru531baOTOqbfuRuUSpJ+Rbe++1Xhkj5TXd4kjNSws4qZlWFrGat5S/ZP3
 0IKvdhNlBcfYorBNNtDP4GEnNnQMarCAB4yjcdsivNY4pP8x1PsxTx/VK3eBnKJY
 t7JrWBDY6vxVdFxKgyPcm5QTVovyP2hhnhqGJ20zEhdu5h/ApVkI8ZdjcVDMS3E0
 z3bwZcyStpHXETpCoLTpG7BoFq2cTFkBTwbgOa3CwyjzsICriq4Q3HpCCO5Rq+3z
 ihNqTA12OLkAZTvlCAxb9+suwbQj6vgKYO/IoGOlUMkZ1tFWjOiFxJYEFpqHiMfi
 S4Zwar7dxWM5ArN/UGKQQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1658168569; x=
 1658172169; bh=XRWjWOstJuv045KaE8r0GI4CKklVrjVeTYG8bLm9suI=; b=E
 w4oS7XLY81T+X81zNDL8bAbMhPQlF9Jfa9K8WFk3uJokrqesOJJEytPbymysmgEu
 uLBf12g+L1mmyB2rO7p0YedtFawh7jjVrJ+feFN3fVhY3PjBxZFeOcaVb4dXY4Zc
 gHsPHBPWE5uj6UlgDoZkxqMHkXI6pD+IRR+sbu3dkd3/6J6Rhggzq/T7TnZKd3q7
 56QzCGO3UxldW43BrBvDz4yt3eOFXBJzVgNZuIrAEnYu8p8/c8REi49yilb+ruw0
 +c2K8tWHgKp4/udvBx3IiDy6Dk0zWF9CWaqY2E3feXj65PKBvzzRhumhVlk+vT3Q
 kvzTUemHaSkZmNH+poreg==
X-ME-Sender: <xms:-KTVYshBYPld6bqT-1sjjNMOeuTkZ-cAZxyGTt_lnw1zdaW1EnF1OA>
 <xme:-KTVYlDOawXt0WjOxZdYYNwx4GcfTdcAWKjYRCe6xTJ3LZq80puhImFC5ftSQ8ksm
 39G0lgK8u6cqDbfHrc>
X-ME-Received: <xmr:-KTVYkEQY7N7vJvVUUJ8-QLA6pjv2z_GIjqRBFfE9SdweDXM0af6O3wf-wBOb7-eFI5BkNZSbZmaZbquR4h8iNO5>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudekkedguddvvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomheprfgv
 thgvrhcuffgvlhgvvhhorhihrghsuceophgvthgvrhesphhjugdruggvvheqnecuggftrf
 grthhtvghrnheptedvhfdugffhhfdvhfekvedvieegjeegteeftddvhedvveekleehffeh
 hfevhefhnecuffhomhgrihhnpehsthgrtghkvgigtghhrghnghgvrdgtohhmpdgsvghrrh
 grnhhgvgdrtghomhdpfhhlihgtkhhrrdgtohhmpdhlihgsvhhirhhtrdhorhhgpdgvnhht
 rghnghhlvgdqphhhohhtohdrohhrghdpihhnshhtrghgrhgrmhdrtghomhenucevlhhush
 htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehpvghtvghrsehpjhgu
 rdguvghv
X-ME-Proxy: <xmx:-KTVYtS9lwCvhQB5yu1LvvVJDAPEv8uylsnnQfGd0vqxcsSmLLuzow>
 <xmx:-KTVYpwP3KjZ5BlCGuaWo5abUGEGwqQMwqYrZ8LPyLTWZ-HiRUmT_Q>
 <xmx:-KTVYr5pb8iHf57_UcfpbjLI7gyZp6XsvrUdZtAlOjDzwRPFWIOSHw>
 <xmx:-aTVYsoGP0fembzUuMBCFQe-ie8eav6Li8qDSFkTCB2CVOq7HYySVg>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 18 Jul 2022 14:22:47 -0400 (EDT)
Date: Mon, 18 Jul 2022 11:22:46 -0700
From: Peter Delevoryas <peter@pjd.dev>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: jsnow@redhat.com, crosa@redhat.com, bleal@redhat.com, f4bug@amsat.org,
 wainersm@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH v2 1/1] python/machine: Fix AF_UNIX path too long on macOS
Message-ID: <YtWk9g9ZYaw5KkMg@pdel-mbp.dhcp.thefacebook.com>
References: <20220716173434.17183-1-peter@pjd.dev>
 <20220716173434.17183-2-peter@pjd.dev>
 <YtUgMTYSQjm9O+u4@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YtUgMTYSQjm9O+u4@redhat.com>
Received-SPF: pass client-ip=66.111.4.230; envelope-from=peter@pjd.dev;
 helo=new4-smtp.messagingengine.com
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

Yeah you're right, it's a good idea to make the QEMUMachine name unique.

When I made v2, I looked around to see if we were creating 2
QEMUMachine's concurrently. I didn't see anything, but looking again, I
see this in tests/migration/guestperf/engine.py:

    if self._dst_host != "localhost":
        dstmonaddr = ("localhost", 9001)
    else:
        dstmonaddr = "/var/tmp/qemu-dst-%d-monitor.sock" % os.getpid()
    srcmonaddr = "/var/tmp/qemu-src-%d-monitor.sock" % os.getpid()

    src = QEMUMachine(self._binary,
                      args=self._get_src_args(hardware),
                      wrapper=self._get_src_wrapper(hardware),
                      name="qemu-src-%d" % os.getpid(),
                      monitor_address=srcmonaddr)

    dst = QEMUMachine(self._binary,
                      args=self._get_dst_args(hardware, uri),
                      wrapper=self._get_dst_wrapper(hardware),
                      name="qemu-dst-%d" % os.getpid(),
                      monitor_address=dstmonaddr)

This test case would probably still pass with this change, because the
monitor_address is specified, but I think you're right, it's a good idea
to make the default name different for each QEMUMachine instance to
avoid breaking anything.

> 
> So on reflection I think I should have suggested using:
> 
>     self._name = name or f"{id(self):02x}"

+1, yeah I'll change it to that

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

Oh ok, yeah that looks good too. Thanks for the detailed review and
suggestions!

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

+1

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

