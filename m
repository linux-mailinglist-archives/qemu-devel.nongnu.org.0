Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C630957E649
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 20:10:58 +0200 (CEST)
Received: from localhost ([::1]:46582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEx73-0005tw-3q
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 14:10:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>) id 1oEx2Y-0001KH-Cv
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 14:06:18 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:44687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>) id 1oEx2W-0003Xm-2u
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 14:06:18 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 55731580A1C;
 Fri, 22 Jul 2022 14:06:14 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Fri, 22 Jul 2022 14:06:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1658513174; x=
 1658516774; bh=rF5rSH1Nbj9Wnuvt1YcJe4uRs65y9o23dw0gc+YHgdk=; b=W
 /uKZ4/aHveIVvBixhhVNr/oxeg+9DZ47/1GyyPJwbMtNUk1xaFVVxgcapUgB6rI4
 thMFkBcUs+I1ejDAyS3CsgLiXPxY+3wg09d0BicYVPwccJelpyDyqUb3TJdIMZwS
 sgW2ktp79x+m9klNuUCeLteuFrVA7f76/ELW8xTPuFZtNw9opYzpAQtbH3tHQrrC
 cPWKZZgGr3oJXrkSKZTH0FWkPYJvFoiIatRfkRYhO7SnWQIx23wgkEyJz0xPW+//
 RkGqs/AHuKXMtsmFIJGPnN36i6LPgrbPGMmWZEDTy5cJuWxdfbCrl+nJ/B0O/tV0
 k5bfgC6UPlumjthl4EwTg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1658513174; x=
 1658516774; bh=rF5rSH1Nbj9Wnuvt1YcJe4uRs65y9o23dw0gc+YHgdk=; b=m
 cOuy7fdqBUPqct2ylDwb7O172MXiRW+f1aFifrIO+OCdrCXMyt/51o0fL/CQo+MB
 JdUAbwM7mMW/tkbjyrG7ZrKx+o0EC39o9jYdB5BP8q12sGYiHANLOM9TF7vXhj3s
 zeazVfiJoibpt+Nk/3boKckzP5gt3S8doWLhYjtCwu5Fb4XwfbEyCE1CM5N3FNEI
 qLTqTCkAKHaXMARzrpnQ0lSGUoxbOiTplgzPEr0iVnrslZwJflwrVoLTBQAxwbZq
 hiMuWqwQy5nDdzDgRtncWIdk6AuR8PL6XB2pNKpBg4kBh5sMjTj8lZV5kZX2cuzR
 Qwzb2nwpV9z6jl600HNCg==
X-ME-Sender: <xms:FefaYmY8tumZuVqfdynjC4fC0UAWWn5fJyZ6x0vDE3ov6fHWO7BuUw>
 <xme:FefaYpZ32aasl6dAR4V00O1Nfl6r7LdUIV3DaCjSIZFsncfq7rAeo7D3AO1TlTmqi
 3Pus80oJ60kkHzfmvM>
X-ME-Received: <xmr:FefaYg8HsbVR7FnUYUzPI2GnolbfRkkvbxHoeiHb0bCOMVuy5W7HkWVGdPWTElE3SRM0VD9GCMuymH8lW3bcxA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddtvddguddvudcutefuodetggdotefrod
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
X-ME-Proxy: <xmx:FefaYornbjFC4RnEN7gv36aW0t9EvSStU7mKaOkd6EbMC_cAKo_ArQ>
 <xmx:FefaYhpWugs7SYMuM6zSQt2LjiFGJMpdmTbeAs1zShwLMMq5I6oyug>
 <xmx:FefaYmShkNSpVotIEsK5Hkw4xE766D9VMrdtx02uILwLjzHhKiWBJA>
 <xmx:FufaYqDiIWJgpWOJgEUE7OIwyoSiuMy6fE84Ntm3y5aL9nNph89GKnC979A>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 22 Jul 2022 14:06:12 -0400 (EDT)
Date: Fri, 22 Jul 2022 11:06:10 -0700
From: Peter Delevoryas <peter@pjd.dev>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: jsnow@redhat.com, crosa@redhat.com, bleal@redhat.com, f4bug@amsat.org,
 wainersm@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH v2 1/1] python/machine: Fix AF_UNIX path too long on macOS
Message-ID: <YtrnEov8b4EqNt1H@pdel-mbp.dhcp.thefacebook.com>
References: <20220716173434.17183-1-peter@pjd.dev>
 <20220716173434.17183-2-peter@pjd.dev>
 <YtUgMTYSQjm9O+u4@redhat.com> <YtoPBYGmSNfeT1Ot@pdel-mbp>
 <YtpPltJi/tl5mlBb@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YtpPltJi/tl5mlBb@redhat.com>
Received-SPF: pass client-ip=66.111.4.224; envelope-from=peter@pjd.dev;
 helo=new2-smtp.messagingengine.com
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

On Fri, Jul 22, 2022 at 08:20:11AM +0100, Daniel P. Berrangé wrote:
> On Thu, Jul 21, 2022 at 07:44:21PM -0700, Peter Delevoryas wrote:
> > On Mon, Jul 18, 2022 at 09:56:17AM +0100, Daniel P. Berrangé wrote:
> > > On Sat, Jul 16, 2022 at 10:34:34AM -0700, Peter Delevoryas wrote:
> > > > On macOS, private $TMPDIR's are the default. These $TMPDIR's are
> > > > generated from a user's unix UID and UUID [1], which can create a
> > > > relatively long path:
> > > > 
> > > >     /var/folders/d7/rz20f6hd709c1ty8f6_6y_z40000gn/T/
> > > > 
> > > > QEMU's avocado tests create a temporary directory prefixed by
> > > > "avo_qemu_sock_", and create QMP sockets within _that_ as well.
> > > > The QMP socket is unnecessarily long, because a temporary directory
> > > > is created for every QEMUMachine object.
> > > > 
> > > >     /avo_qemu_sock_uh3w_dgc/qemu-37331-10bacf110-monitor.sock
> > > 
> > > 
> > > Looking at this again, I realize my suggestion for dealing with the
> > > second part of the path was mistaken.
> > > 
> > > The "qemu-37331-10bacf110-monitor.sock" part is combining two
> > > pieces.
> > > 
> > > First the result of
> > > 
> > >   f"qemu-{os.getpid()}-{id(self):02x}"
> > > 
> > > is
> > > 
> > >   qemu-37331-10bacf110
> > > 
> > > and the code later than appends '-monitor.sock'
> > > 
> > > So...
> > > 
> > > > 
> > > > The path limit for unix sockets on macOS is 104: [2]
> > > > 
> > > >     /*
> > > >      * [XSI] Definitions for UNIX IPC domain.
> > > >      */
> > > >     struct  sockaddr_un {
> > > 
> > > >         unsigned char   sun_len;        /* sockaddr len including null */
> > > >         sa_family_t     sun_family;     /* [XSI] AF_UNIX */
> > > >         char            sun_path[104];  /* [XSI] path name (gag) */
> > > >     };
> > > > 
> > > > This results in avocado tests failing on macOS because the QMP unix
> > > > socket can't be created, because the path is too long:
> > > > 
> > > >     ERROR| Failed to establish connection: OSError: AF_UNIX path too long
> > > > 
> > > > This change reduces the size of both paths, and removes the unique
> > > > identification information from the socket name, since it seems to be
> > > > unnecessary.
> > > > 
> > > > This commit produces paths like the following:
> > > > 
> > > >     pdel@pdel-mbp:/var/folders/d7/rz20f6hd709c1ty8f6_6y_z40000gn/T
> > > >     $ tree qemu*
> > > >     qemu_oc7h7f3u
> > > >     ├── qmp-console.sock
> > > >     └── qmp-monitor.sock
> > > > 
> > > > [1] https://apple.stackexchange.com/questions/353832/why-is-mac-osx-temp-directory-in-weird-path
> > > > [2] /Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/sys/un.h
> > > > 
> > > > Signed-off-by: Peter Delevoryas <peter@pjd.dev>
> > > > ---
> > > >  python/qemu/machine/machine.py         | 2 +-
> > > >  tests/avocado/avocado_qemu/__init__.py | 2 +-
> > > >  2 files changed, 2 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
> > > > index 37191f433b..b1823966b3 100644
> > > > --- a/python/qemu/machine/machine.py
> > > > +++ b/python/qemu/machine/machine.py
> > > > @@ -157,7 +157,7 @@ def __init__(self,
> > > >          self._wrapper = wrapper
> > > >          self._qmp_timer = qmp_timer
> > > >  
> > > > -        self._name = name or f"qemu-{os.getpid()}-{id(self):02x}"
> > > > +        self._name = name or "qmp"
> > > 
> > > ...my suggestion here was wrong.
> > > 
> > > We don't need the os.getpid() unoiqueness because the tmpdir already
> > > ensures that is safe, but keeping 'id(self)' is a good idea, if the
> > > test case creates multiple machines concurrently. Bearing in mind we
> > > later append '-monitor.sock' we don't need 'qmp' in the self._name.
> > > 
> > > So on reflection I think I should have suggested using:
> > > 
> > >     self._name = name or f"{id(self):02x}"
> > > 
> > > And *in addition*, a few lines later change:
> > > 
> > >             self._monitor_address = os.path.join(
> > >                 self.sock_dir, f"{self._name}-monitor.sock"
> > >             )
> > > 
> > > To
> > > 
> > >             self._monitor_address = os.path.join(
> > >                 self.sock_dir, f"{self._name}.qmp"
> > >             )
> > >
> > 
> > Finally getting back to this (sorry, been working on other stuff), and I noticed
> > the console socket is just below this:
> > 
> >     self._console_address = os.path.join(
> >         self.sock_dir, f"{self._name}-console.sock"
> >     )
> > 
> > So I probably shouldn't do the "-monitor.sock" change right?
> 
> I'd suggest changing this one to   f"{self._name}.con" at the
> same time.

Ohh ok, yeah that's nice and short. Ok I'll include the socket name suffix
changes then.

> 
> 
> With regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
> 

