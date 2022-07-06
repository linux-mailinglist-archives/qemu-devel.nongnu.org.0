Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6AC568F97
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 18:48:33 +0200 (CEST)
Received: from localhost ([::1]:42638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o98CW-0007Ni-Fm
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 12:48:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>) id 1o98Ax-0006hX-LS
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 12:46:56 -0400
Received: from wnew2-smtp.messagingengine.com ([64.147.123.27]:54815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>) id 1o98Av-0003NB-FV
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 12:46:55 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 6E7C32B059EE;
 Wed,  6 Jul 2022 12:46:51 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 06 Jul 2022 12:46:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1657126010; x=
 1657129610; bh=bbWHfukS63L2weSRKnivIgvVPRZRG5NBbRcpg5QQsOw=; b=e
 dVHxDALZ2dTgGtcbrRAs4ShH+Qm03VV1sB5fLf1jwgLXI2K060VZDi7ieVQGJv/N
 K+J/3c9GbXjGdcOletb62LQcHiqN0tIbwFOY+8j4VpZq7fNVROcEaNNKOi4mEPvc
 mRUyzVc8eRjliN1DbAeQOYpIgZ2gkkYpdlvqFmUxtK9mNWPkBu60QsWGGOf/M5Ad
 vwez1XaXATK8BUNEb3ILWKBIpggm8ovXNUq+7YIfY2tKEjwL7Dv4spDP5u9Gy7lq
 jMAhHoO9tcdV64JnXYw+e7L4GjqobgJtCTgFuT22Y8LAzjWi+L3PH8GtJHgMdZvu
 i/4fjc/Zxn18qnQn2R4sQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1657126010; x=
 1657129610; bh=bbWHfukS63L2weSRKnivIgvVPRZRG5NBbRcpg5QQsOw=; b=h
 pMFZVr15Ih46vpR+3UIMqWOF8A8v3kMCZWDqKSKQXlw8cPDW+SCRAYGqfhohXLAA
 p+MfOYdvmw34pdf2bdKPIXYoz6QgdfhAliBlFar/fi5JAMmfxTOW55BKp4KkLGI0
 OR1TJMD8sSCAs0FC5BwkKGROfEX88FI0h3sEcYtGhAuwpR5WgpaM+PF5yQhL1Pio
 2YMNVyBp8J29KNSOesl+v/V4yIMivL8ilX+uTahz80H4CsFdnUC1YBBbszsBS5Wx
 zunsAgw8uvOJaZi/r/SWei2MrbfCwdKBoO6BxNlofoeee6Skk72YqX4l65IIAgV3
 rwX1qHnH47/SKE2qUjSRQ==
X-ME-Sender: <xms:erzFYv89smGAdfAwxcfQtCdMuavfHVAx1gNjMJ9n7hc6GtrY7c6kOg>
 <xme:erzFYruboU1FQJTpdsEszqr0XN-X5dTvVG4fKR1moecaj3WFGD2jfHySQr8ef4afb
 pTyTZvJmVyfXxXvCwk>
X-ME-Received: <xmr:erzFYtCoffEnBHoA-OyQuPksKwIIuoUM8fXufzd-SmuefRNfveEmWTL6FeKOuWh_Xh_tRoKJKQHekd5irmeYCuge>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeifedguddtgecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtudenucfhrhhomheprfgv
 thgvrhcuffgvlhgvvhhorhihrghsuceophgvthgvrhesphhjugdruggvvheqnecuggftrf
 grthhtvghrnhepfeekudeiveduheejffduuefftdeigfelheffgfejgefgfeeigedtvdet
 ledvteejnecuffhomhgrihhnpegsvghrrhgrnhhgvgdrtghomhdpfhhlihgtkhhrrdgtoh
 hmpdhlihgsvhhirhhtrdhorhhgpdgvnhhtrghnghhlvgdqphhhohhtohdrohhrghdpihhn
 shhtrghgrhgrmhdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
 grihhlfhhrohhmpehpvghtvghrsehpjhgurdguvghv
X-ME-Proxy: <xmx:erzFYrcsz_xddqjFzGRg4Qx6vQvpAjhBa0qF8dEh0n1Eu8u_-1kt5A>
 <xmx:erzFYkM4Wu3_smp1SY0c5KQuE8uyV4WcxCDMWmvSDSXdLWIDFsW8RA>
 <xmx:erzFYtnCoJaHbWXYk1aM4WrkKS7vRfnHQrzIS9Fw_g3VBgA-oHN-Bw>
 <xmx:erzFYppKwxlVNkz-kzPau0mWIcOtrroJLw8_iZu67MNsdkPfQEt6TRUPQBs>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 6 Jul 2022 12:46:49 -0400 (EDT)
Date: Wed, 6 Jul 2022 09:46:48 -0700
From: Peter Delevoryas <peter@pjd.dev>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH RESEND] python/machine: Fix AF_UNIX path too long on macOS
Message-ID: <YsW8eO5eeRKfpxJp@r37>
References: <20220705214659.73369-1-peter@pjd.dev>
 <YsVBhmvAm2ANDUEt@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YsVBhmvAm2ANDUEt@redhat.com>
Received-SPF: pass client-ip=64.147.123.27; envelope-from=peter@pjd.dev;
 helo=wnew2-smtp.messagingengine.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_FMBLA_NEWDOM14=0.998, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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

On Wed, Jul 06, 2022 at 09:02:14AM +0100, Daniel P. Berrangé wrote:
> On Tue, Jul 05, 2022 at 02:46:59PM -0700, Peter Delevoryas wrote:
> > I noticed that I can't run any avocado tests on macOS because the QMP
> > unix socket path is too long:
> 
> 
> > I think the path limit for unix sockets on macOS might be 104 [1]
> 
> All platforms have a very limited path limit, so it isn't really
> a macOS specific problem, rather....
> 
> > 
> > /*
> >  * [XSI] Definitions for UNIX IPC domain.
> >  */
> > struct  sockaddr_un {
> >     unsigned char   sun_len;        /* sockaddr len including null */
> >     sa_family_t     sun_family;     /* [XSI] AF_UNIX */
> >     char            sun_path[104];  /* [XSI] path name (gag) */
> > };
> > 
> > The path we're using is exactly 105 characters:
> > 
> > $ python
> > Python 2.7.10 (default, Jan 19 2016, 22:24:01)
> > [GCC 4.2.1 Compatible Apple LLVM 7.0.2 (clang-700.1.81)] on darwin
> > Type "help", "copyright", "credits" or "license" for more information.
> > >>> len('/var/folders/d7/rz20f6hd709c1ty8f6_6y_z40000gn/T/avo_qemu_sock_uh3w_dgc/qemu-37331-10bacf110-monitor.sock')
> 
> It is a problem related to where the test suite is creating the
> paths.
> 
> /var/folders/d7/rz20f6hd709c1ty8f6_6y_z40000gn/T/avo_qemu_sock_uh3w_dgc/
> 
> is way too deep a directory location.

That's a good point.

> 
> It seems we just create this location using 'tempfile.TemporyDirectory'
> to get a standard tmp dir.
> 
> Do you know why python is choosing
> 
>   /var/folders/d7/rz20f6hd709c1ty8f6_6y_z40000gn/T/
> 
> as the temp dir ? Is that a standard location on macOS or is it
> from some env variable you have set ?

Hmmm yeah it is odd, I'm not really sure why it's created there or if
standard glibc tmpfile creation goes there too, I'll go experiment and
report back. And yeah, maybe I'll double check any environment variables or
other things.

The macOS system I use happens to be a Facebook work laptop, which could
also be related now that I think about it.

> 
> > diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
> > index 37191f433b..93451774e3 100644
> > --- a/python/qemu/machine/machine.py
> > +++ b/python/qemu/machine/machine.py
> > @@ -157,7 +157,7 @@ def __init__(self,
> >          self._wrapper = wrapper
> >          self._qmp_timer = qmp_timer
> >  
> > -        self._name = name or f"qemu-{os.getpid()}-{id(self):02x}"
> > +        self._name = name or f"{os.getpid()}{id(self):02x}"
> 
> I don't think this is the right fix really, because IMHO the problem
> is the hugely long path, rather than the final socket name.

True, yeah let me try to investigate the directory placement.

> 
> That said, there is redundancy in the path - avocado is passing in
> a dierctory created using 'tempfile.TemporyDirectory' so there is no
> reason why we need to add more entropy via the POD and the 'id(self)'
> hex string.

Oh good point, I hadn't thought about that.

> 
> IMHO avocado should pass in the 'name' parameter explicitly, using a
> plain name and thus get a shorter string.

I see, yeah that makes sense. Maybe I can include a couple patches for this,
one fixing the directory location, and one refactoring the temporary file
name template (If I'm understanding your suggestion correctly).

Thanks for the review! I really appreciate it.
Peter

> 
> >          self._temp_dir: Optional[str] = None
> >          self._base_temp_dir = base_temp_dir
> >          self._sock_dir = sock_dir
> > @@ -167,7 +167,7 @@ def __init__(self,
> >              self._monitor_address = monitor_address
> >          else:
> >              self._monitor_address = os.path.join(
> > -                self.sock_dir, f"{self._name}-monitor.sock"
> > +                self.sock_dir, f"{self._name}.sock"
> >              )
> >  
> >          self._console_log_path = console_log
> > -- 
> > 2.37.0
> > 
> > 
> 
> With regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
> 

