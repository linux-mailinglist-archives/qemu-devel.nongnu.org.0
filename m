Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2353570FAE
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 03:48:24 +0200 (CEST)
Received: from localhost ([::1]:50374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oB50f-0005H9-MU
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 21:48:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>) id 1oB4zB-0003Pd-Ty
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 21:46:50 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:55533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>) id 1oB4z2-0000jH-CO
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 21:46:49 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id B0F28580897;
 Mon, 11 Jul 2022 21:46:38 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 11 Jul 2022 21:46:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1657590398; x=
 1657593998; bh=/utS1DScPsJqD5k/uheow1p//566o6s2u0/OQWuefZ8=; b=S
 aLHMcO1g2e780g7/ROW/k2FRv79yCyTKqEvFBkEDe5wPCaO5PVhUU3JjO/TiUmyf
 Snu4YTrg7bcXcybEEEUoB3M46SlwMblmBk/TmBtqFL4wzVjChdnAIMk2a9p50ACj
 TSvE6Q4i5PeXrGlqHHwotgvT6i+PWh23XPg7pi4BmkQSqcyE3rnd3gxZVE5WXNe0
 UsDJs0T7TQj3PeXvsdlyzgcnAqXSAYUTGEuaQ6gJdQwA5thvVpGoAMOgAHqrQ4d2
 umV5hAzKBgVVmOtsNnuTZQX1e2e1lw2kNabi0Z+sYOw+nsPZ8JhpAXyb5HdHsC5F
 GnVVtd9i9oiEi1v+utycA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1657590398; x=
 1657593998; bh=/utS1DScPsJqD5k/uheow1p//566o6s2u0/OQWuefZ8=; b=0
 xgW3I4mkynMralNrCEzgYNW+kxLR6oMBXuar4JZ908e7sHOew2tIaPO2G/kMWg08
 NkOd9fHvxQ8tGn7rcJJZsTjffdJGr4ti3SFIE7lEZF40EDqSM++Nub1fxY72oDa0
 JIp4Hlq9lc00FwFUvIoMKTkFR7LtnQkbnYQW8fyWgiNEe8yP7kMo+IXuxxuL+enm
 IvoHwvynQPYCH2qaFHwZwpWG2ZFZ9VUg78J8vWqa0BZF6PwTX0VMEsx/PFfetjrj
 UnTAOnlPJTTw8JpORcuZQSAa8PynXW9tGjm6xruF57aVbiPp1gOEnVF3+Ohg7zo1
 YD2p3hE3qZOh022sXWpQQ==
X-ME-Sender: <xms:fdLMYvvugU_2i-7vL-0805P6UDjvZyobj75BrR9RrssYrS9XZirrWw>
 <xme:fdLMYgdfYtjc9IHTzkIhxYxwXmQJCrDyL9dmJ0S_xYKbN6t3T0Fx6dAyjsDEaLDGg
 zVkAzxWjUz1Va3iwQQ>
X-ME-Received: <xmr:fdLMYiwYFydYJJi9r7wuGpIp4B_C972wkybpEpcwLhR0aIgc2AECAkyXQVhNZOGn1wwtyqQ74tDck9xaf_4ZsVEb>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejgedgheduucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:ftLMYuM-ABq_ariBXNA8D_3XBe272MV_m5RrVKZY5_DfPdbwfM6tCw>
 <xmx:ftLMYv98IlreyoTvBXO0hU9W0kYakFBnSpzEgKts-2RwXaZqER59Yw>
 <xmx:ftLMYuXu9jpCBYFAdDbmvso9AIDuAG9k2Emh7o2vsHkPeMxT1A6jfA>
 <xmx:ftLMYiZs9p_CQT1NojHx5695sFGKmU19U2_YiUuToFB7-FeRV6b8cw>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 21:46:37 -0400 (EDT)
Date: Mon, 11 Jul 2022 18:46:35 -0700
From: Peter Delevoryas <peter@pjd.dev>
To: John Snow <jsnow@redhat.com>
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [PATCH RESEND] python/machine: Fix AF_UNIX path too long on macOS
Message-ID: <YszSe2qCVcqd0CVI@pdel-mbp.dhcp.thefacebook.com>
References: <20220705214659.73369-1-peter@pjd.dev>
 <YsVBhmvAm2ANDUEt@redhat.com> <YsW8eO5eeRKfpxJp@r37>
 <YsYuYAJE2Hx64aIY@pdel-mbp.dhcp.thefacebook.com>
 <YscqCErtNGOG9GVx@pdel-mbp.dhcp.thefacebook.com>
 <CAFn=p-bhhu+G-p=w_K2OSOe0WkDHbBaO0ZS53F+jTDuo074VFw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFn=p-bhhu+G-p=w_K2OSOe0WkDHbBaO0ZS53F+jTDuo074VFw@mail.gmail.com>
Received-SPF: pass client-ip=66.111.4.229; envelope-from=peter@pjd.dev;
 helo=new3-smtp.messagingengine.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_FMBLA_NEWDOM14=0.998, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On Mon, Jul 11, 2022 at 04:56:28PM -0400, John Snow wrote:
> On Thu, Jul 7, 2022 at 2:46 PM Peter Delevoryas <peter@pjd.dev> wrote:
> >
> > On Wed, Jul 06, 2022 at 05:52:48PM -0700, Peter Delevoryas wrote:
> > > On Wed, Jul 06, 2022 at 09:46:48AM -0700, Peter Delevoryas wrote:
> > > > On Wed, Jul 06, 2022 at 09:02:14AM +0100, Daniel P. Berrangé wrote:
> > > > > On Tue, Jul 05, 2022 at 02:46:59PM -0700, Peter Delevoryas wrote:
> > > > > > I noticed that I can't run any avocado tests on macOS because the QMP
> > > > > > unix socket path is too long:
> > > > >
> > > > >
> > > > > > I think the path limit for unix sockets on macOS might be 104 [1]
> > > > >
> > > > > All platforms have a very limited path limit, so it isn't really
> > > > > a macOS specific problem, rather....
> > > > >
> > > > > >
> > > > > > /*
> > > > > >  * [XSI] Definitions for UNIX IPC domain.
> > > > > >  */
> > > > > > struct  sockaddr_un {
> > > > > >     unsigned char   sun_len;        /* sockaddr len including null */
> > > > > >     sa_family_t     sun_family;     /* [XSI] AF_UNIX */
> > > > > >     char            sun_path[104];  /* [XSI] path name (gag) */
> > > > > > };
> > > > > >
> > > > > > The path we're using is exactly 105 characters:
> > > > > >
> > > > > > $ python
> > > > > > Python 2.7.10 (default, Jan 19 2016, 22:24:01)
> > > > > > [GCC 4.2.1 Compatible Apple LLVM 7.0.2 (clang-700.1.81)] on darwin
> > > > > > Type "help", "copyright", "credits" or "license" for more information.
> > > > > > >>> len('/var/folders/d7/rz20f6hd709c1ty8f6_6y_z40000gn/T/avo_qemu_sock_uh3w_dgc/qemu-37331-10bacf110-monitor.sock')
> > > > >
> > > > > It is a problem related to where the test suite is creating the
> > > > > paths.
> > > > >
> > > > > /var/folders/d7/rz20f6hd709c1ty8f6_6y_z40000gn/T/avo_qemu_sock_uh3w_dgc/
> > > > >
> > > > > is way too deep a directory location.
> > > >
> > > > That's a good point.
> > > >
> > > > >
> > > > > It seems we just create this location using 'tempfile.TemporyDirectory'
> > > > > to get a standard tmp dir.
> > > > >
> > > > > Do you know why python is choosing
> > > > >
> > > > >   /var/folders/d7/rz20f6hd709c1ty8f6_6y_z40000gn/T/
> > > > >
> > > > > as the temp dir ? Is that a standard location on macOS or is it
> > > > > from some env variable you have set ?
> > > >
> > > > Hmmm yeah it is odd, I'm not really sure why it's created there or if
> > > > standard glibc tmpfile creation goes there too, I'll go experiment and
> > > > report back. And yeah, maybe I'll double check any environment variables or
> > > > other things.
> > > >
> > > > The macOS system I use happens to be a Facebook work laptop, which could
> > > > also be related now that I think about it.
> > >
> > > Hmmm yeah looks like this is because my TMPDIR is weird.
> > >
> > > $ echo $TMPDIR
> > > /var/folders/d7/rz20f6hd709c1ty8f6_6y_z40000gn/T/
> > >
> > > I didn't think to check this cause I wasn't familiar with TMPDIR. 🤷
> > >
> > > Thanks for responding, I'll just use TMPDIR=/tmp for now. It's probably
> > > something wrong with the Facebook development environment.
> > >
> > > Peter
> >
> > Update: Actually, this might not be a Facebook-work-laptop specific
> > thing.  I asked my non-engineer friend to print out $TMPDIR on his
> > macbook and he got the same thing.
> >
> > https://apple.stackexchange.com/questions/353832/why-is-mac-osx-temp-directory-in-weird-path
> >
> > I guess this person suggests it's just to separate the permissions for
> > each user's /tmp directory, for better isolation.
> >
> > I'll resubmit this patch with the suggestions you had, because perhaps
> > this is actually affecting other macOS users too.
> >
> > >
> > > >
> > > > >
> > > > > > diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
> > > > > > index 37191f433b..93451774e3 100644
> > > > > > --- a/python/qemu/machine/machine.py
> > > > > > +++ b/python/qemu/machine/machine.py
> > > > > > @@ -157,7 +157,7 @@ def __init__(self,
> > > > > >          self._wrapper = wrapper
> > > > > >          self._qmp_timer = qmp_timer
> > > > > >
> > > > > > -        self._name = name or f"qemu-{os.getpid()}-{id(self):02x}"
> > > > > > +        self._name = name or f"{os.getpid()}{id(self):02x}"
> > > > >
> > > > > I don't think this is the right fix really, because IMHO the problem
> > > > > is the hugely long path, rather than the final socket name.
> > > >
> > > > True, yeah let me try to investigate the directory placement.
> > > >
> > > > >
> > > > > That said, there is redundancy in the path - avocado is passing in
> > > > > a dierctory created using 'tempfile.TemporyDirectory' so there is no
> > > > > reason why we need to add more entropy via the POD and the 'id(self)'
> > > > > hex string.
> > > >
> > > > Oh good point, I hadn't thought about that.
> > > >
> > > > >
> > > > > IMHO avocado should pass in the 'name' parameter explicitly, using a
> > > > > plain name and thus get a shorter string.
> > > >
> > > > I see, yeah that makes sense. Maybe I can include a couple patches for this,
> > > > one fixing the directory location, and one refactoring the temporary file
> > > > name template (If I'm understanding your suggestion correctly).
> > > >
> > > > Thanks for the review! I really appreciate it.
> > > > Peter
> 
> I agree with Dan: I believe the correct solution here is for Avocado
> to provide its own less redundant name; but the default name that
> machine.py provides is not *that* long and provides adequate
> protection against collisions with multiple instances of the VM
> utility within a single python process. If Avocado is creating its own
> directories that guard against that redundancy, Avocado should provide
> a shortened name for the VM.

Hmmm, I see.

> 
> Note that the QEMUMachine process also provides a sock_dir parameter
> that was introduced for precisely this reason; it should be possible
> to instruct the avocado tests to use a shorter path for sock_dir.
> 
> I'm not clear on what the best "just works" solution will be when
> certain operating environments choose a tmp dir that's quite long to
> begin with; maybe we need a different default sockfile naming strategy
> that avoids the instance collision problem in machine.py, too. Ideas?

I guess I don't really understand why QEMU is attempting to create a
unique path instead of just using mktemp(), right? This seems like
something that the OS can provide. If we want some semblance of meaning
to the filename, we can provide a short template, right?

-- Peter

> 
> --js
> 
> > > >
> > > > >
> > > > > >          self._temp_dir: Optional[str] = None
> > > > > >          self._base_temp_dir = base_temp_dir
> > > > > >          self._sock_dir = sock_dir
> > > > > > @@ -167,7 +167,7 @@ def __init__(self,
> > > > > >              self._monitor_address = monitor_address
> > > > > >          else:
> > > > > >              self._monitor_address = os.path.join(
> > > > > > -                self.sock_dir, f"{self._name}-monitor.sock"
> > > > > > +                self.sock_dir, f"{self._name}.sock"
> > > > > >              )
> > > > > >
> > > > > >          self._console_log_path = console_log
> > > > > > --
> > > > > > 2.37.0
> > > > > >
> > > > > >
> > > > >
> > > > > With regards,
> > > > > Daniel
> > > > > --
> > > > > |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> > > > > |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> > > > > |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
> > > > >
> > > >
> > >
> >
> 

