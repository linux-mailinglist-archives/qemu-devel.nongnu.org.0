Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7876E56970F
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 02:54:11 +0200 (CEST)
Received: from localhost ([::1]:59380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9FmU-00056H-Ea
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 20:54:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>) id 1o9FlJ-0004GN-2G
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 20:52:57 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:52609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>) id 1o9FlH-0007XH-4D
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 20:52:56 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 0FD96580582;
 Wed,  6 Jul 2022 20:52:52 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 06 Jul 2022 20:52:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1657155172; x=
 1657158772; bh=X70JhSGF+WTbL9Lkgm7o9W0KfFX1y3JLx3XzJ0cvNKw=; b=n
 7ApKdCRvf5iTTYBkIlW59sbVNGmufAo5u9iH+aCUjLqFmeRNq/fFpixnQiOYqZs7
 knWHwgAzu4xE6/sstW+DcfBv7of55NLyT6z7Thw5xRefvkWqWUirqNW7hQoG80nn
 sSE1tj/3AQiisBT4Z47V7r+LdYEYVUls3HmlNetEKWHXQIIoKsIrcU4RsxY+kvXg
 sP0+IYg4Rg6GfegChvFEeuugLM8A5HpsmW8MeOSCbTkPdDXFRTsUB0QfTCUDl6Z6
 6YjEw4ISJkknd3zP4DsCnqbnBnJh4cbbMroj+Vo8hV2cdbUlCw5iZU/fP3LPcI6z
 QuERMsJ2ZX27uU3YZE5lQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1657155172; x=
 1657158772; bh=X70JhSGF+WTbL9Lkgm7o9W0KfFX1y3JLx3XzJ0cvNKw=; b=b
 L16wAFGqQdr4OthSuDY7rduAtYu0g69jwAVmIOVpQeAdizkHK5nRiWSfE/OSmFdC
 baKOniWkH4pyFpJeopqtpW8UXMMmPU0IlgZrD/c/srm/Wrh+PEvSKnn8qmyh2DlZ
 TZCw651McqsxajShf4h07zs/oqfYL6iCGRTmeFeunti6WMBKDmbLqf9K8n6ujCaS
 lM9jgYTgIFCJSMLd+pAUQeEBownQXwZF6bRAHQu4JHl8nYZ8/QOOCwnhJKS+0qX5
 /9IeUBqC92J1Zi4gtKAw0yjk9NrxiTfAnlwYMb5llJfeO4xSv4cCZPw+YDOL9+HT
 FZ/cKQwmHEJNnb+f1Rr/A==
X-ME-Sender: <xms:Yy7GYr0jzLDKXy5wM6IuneihhB9S_renERpfvvUg2JFi8Cq5Lu-b0Q>
 <xme:Yy7GYqEhOc8ybl_Y8Ov60vtpHLU2kykaBsSuSkZdvdJuQei3Ac9dww9toEXqCaglY
 T9hY5qeFbd89mIpNfg>
X-ME-Received: <xmr:Yy7GYr5PViXoXKc2XoDTVC1YuimGvESrwAQK4BysrjUtI-OYp46TpbdypV-4OazOb46sb9zcU-rY5V-zfAyvAxkb>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeigedggeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefrvght
 vghrucffvghlvghvohhrhigrshcuoehpvghtvghrsehpjhgurdguvghvqeenucggtffrrg
 htthgvrhhnpeetfedvveevhfeuleeuheeludevjeeftdduheeuhedvveefvdffleejfeeh
 geeffeenucffohhmrghinhepsggvrhhrrghnghgvrdgtohhmpdhflhhitghkrhdrtghomh
 dplhhisghvihhrthdrohhrghdpvghnthgrnhhglhgvqdhphhhothhordhorhhgpdhinhhs
 thgrghhrrghmrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
 hilhhfrhhomhepphgvthgvrhesphhjugdruggvvh
X-ME-Proxy: <xmx:Yy7GYg0UcP0rwNQdBgfpkHOA5uwLGIEIkkItYsT34h5IJnq-SXdzhw>
 <xmx:Yy7GYuH7-5hMmCvBgTK70zpaE63O2lc_wb4hft8Gc71HcxPhTXJXLA>
 <xmx:Yy7GYh8B6VkoUljX212wsJ2U600RdvKv4i_6jssvKYaoik--psU9tA>
 <xmx:Yy7GYqDL3p44JyOyLTVciHAHFIHbUQ8KVAOS84k7R1Hg-11t7D9HQg>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 6 Jul 2022 20:52:50 -0400 (EDT)
Date: Wed, 6 Jul 2022 17:52:48 -0700
From: Peter Delevoryas <peter@pjd.dev>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH RESEND] python/machine: Fix AF_UNIX path too long on macOS
Message-ID: <YsYuYAJE2Hx64aIY@pdel-mbp.dhcp.thefacebook.com>
References: <20220705214659.73369-1-peter@pjd.dev>
 <YsVBhmvAm2ANDUEt@redhat.com> <YsW8eO5eeRKfpxJp@r37>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YsW8eO5eeRKfpxJp@r37>
Received-SPF: pass client-ip=66.111.4.224; envelope-from=peter@pjd.dev;
 helo=new2-smtp.messagingengine.com
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

On Wed, Jul 06, 2022 at 09:46:48AM -0700, Peter Delevoryas wrote:
> On Wed, Jul 06, 2022 at 09:02:14AM +0100, Daniel P. Berrangé wrote:
> > On Tue, Jul 05, 2022 at 02:46:59PM -0700, Peter Delevoryas wrote:
> > > I noticed that I can't run any avocado tests on macOS because the QMP
> > > unix socket path is too long:
> > 
> > 
> > > I think the path limit for unix sockets on macOS might be 104 [1]
> > 
> > All platforms have a very limited path limit, so it isn't really
> > a macOS specific problem, rather....
> > 
> > > 
> > > /*
> > >  * [XSI] Definitions for UNIX IPC domain.
> > >  */
> > > struct  sockaddr_un {
> > >     unsigned char   sun_len;        /* sockaddr len including null */
> > >     sa_family_t     sun_family;     /* [XSI] AF_UNIX */
> > >     char            sun_path[104];  /* [XSI] path name (gag) */
> > > };
> > > 
> > > The path we're using is exactly 105 characters:
> > > 
> > > $ python
> > > Python 2.7.10 (default, Jan 19 2016, 22:24:01)
> > > [GCC 4.2.1 Compatible Apple LLVM 7.0.2 (clang-700.1.81)] on darwin
> > > Type "help", "copyright", "credits" or "license" for more information.
> > > >>> len('/var/folders/d7/rz20f6hd709c1ty8f6_6y_z40000gn/T/avo_qemu_sock_uh3w_dgc/qemu-37331-10bacf110-monitor.sock')
> > 
> > It is a problem related to where the test suite is creating the
> > paths.
> > 
> > /var/folders/d7/rz20f6hd709c1ty8f6_6y_z40000gn/T/avo_qemu_sock_uh3w_dgc/
> > 
> > is way too deep a directory location.
> 
> That's a good point.
> 
> > 
> > It seems we just create this location using 'tempfile.TemporyDirectory'
> > to get a standard tmp dir.
> > 
> > Do you know why python is choosing
> > 
> >   /var/folders/d7/rz20f6hd709c1ty8f6_6y_z40000gn/T/
> > 
> > as the temp dir ? Is that a standard location on macOS or is it
> > from some env variable you have set ?
> 
> Hmmm yeah it is odd, I'm not really sure why it's created there or if
> standard glibc tmpfile creation goes there too, I'll go experiment and
> report back. And yeah, maybe I'll double check any environment variables or
> other things.
> 
> The macOS system I use happens to be a Facebook work laptop, which could
> also be related now that I think about it.

Hmmm yeah looks like this is because my TMPDIR is weird.

$ echo $TMPDIR
/var/folders/d7/rz20f6hd709c1ty8f6_6y_z40000gn/T/

I didn't think to check this cause I wasn't familiar with TMPDIR. 🤷

Thanks for responding, I'll just use TMPDIR=/tmp for now. It's probably
something wrong with the Facebook development environment.

Peter

> 
> > 
> > > diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
> > > index 37191f433b..93451774e3 100644
> > > --- a/python/qemu/machine/machine.py
> > > +++ b/python/qemu/machine/machine.py
> > > @@ -157,7 +157,7 @@ def __init__(self,
> > >          self._wrapper = wrapper
> > >          self._qmp_timer = qmp_timer
> > >  
> > > -        self._name = name or f"qemu-{os.getpid()}-{id(self):02x}"
> > > +        self._name = name or f"{os.getpid()}{id(self):02x}"
> > 
> > I don't think this is the right fix really, because IMHO the problem
> > is the hugely long path, rather than the final socket name.
> 
> True, yeah let me try to investigate the directory placement.
> 
> > 
> > That said, there is redundancy in the path - avocado is passing in
> > a dierctory created using 'tempfile.TemporyDirectory' so there is no
> > reason why we need to add more entropy via the POD and the 'id(self)'
> > hex string.
> 
> Oh good point, I hadn't thought about that.
> 
> > 
> > IMHO avocado should pass in the 'name' parameter explicitly, using a
> > plain name and thus get a shorter string.
> 
> I see, yeah that makes sense. Maybe I can include a couple patches for this,
> one fixing the directory location, and one refactoring the temporary file
> name template (If I'm understanding your suggestion correctly).
> 
> Thanks for the review! I really appreciate it.
> Peter
> 
> > 
> > >          self._temp_dir: Optional[str] = None
> > >          self._base_temp_dir = base_temp_dir
> > >          self._sock_dir = sock_dir
> > > @@ -167,7 +167,7 @@ def __init__(self,
> > >              self._monitor_address = monitor_address
> > >          else:
> > >              self._monitor_address = os.path.join(
> > > -                self.sock_dir, f"{self._name}-monitor.sock"
> > > +                self.sock_dir, f"{self._name}.sock"
> > >              )
> > >  
> > >          self._console_log_path = console_log
> > > -- 
> > > 2.37.0
> > > 
> > > 
> > 
> > With regards,
> > Daniel
> > -- 
> > |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> > |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> > |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
> > 
> 

