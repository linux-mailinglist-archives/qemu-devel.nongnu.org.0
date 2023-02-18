Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4718769B7C0
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Feb 2023 03:42:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pTD9Y-0004v8-Qs; Fri, 17 Feb 2023 21:40:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samuel.ginu2010@gmail.com>)
 id 1pTD9X-0004uv-Cb
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 21:40:43 -0500
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <samuel.ginu2010@gmail.com>)
 id 1pTD9V-0004kc-6U
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 21:40:43 -0500
Received: by mail-lf1-x132.google.com with SMTP id b22so81501lfv.5
 for <qemu-devel@nongnu.org>; Fri, 17 Feb 2023 18:40:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=g87yz26j9kB/I9mvAO9sHwx2j2dsiyioasajQ1F4dqM=;
 b=kcNw7NBlq8XsGF1J91oZLKp2w7aZ+VyNXRskPBuZEIAV9kuzEQH/4yIWxACCEhqZFW
 b9iNjyPMpy5koNzoE8lX5H4lkMSbopUoctwxYuYp0h6RgQ5+RzXTvlTf1DYZQYlvj0q7
 s7gaXOhHay4VcCUL/zGyTfFsV33eI1pPfzKzm+b0gdw328znhMZLKUhaBfOvMoKFTtdl
 PJmXR8DJea9EsXpJM3k1vAZ7vY6R+uHR1DsPkMyiXxKOh6otudku4sNcBgitJRfwKnFo
 Sq4qs62xPL1fBOXVXUT1fiVacNHOj2mebt9MSUr1kQr2hDfpLTLaatHeEeglbb3qUyLq
 aCQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=g87yz26j9kB/I9mvAO9sHwx2j2dsiyioasajQ1F4dqM=;
 b=WDXoUekPVd1FfwcbdhMkdKueDWgYLyrf1ZDGw3pi++zcY5p0nU/wbqahYf/y276ovL
 HtulgEgI/9PWttEGWNWAuCcJLp4H8zv7PLKRRmsNsGucLCHFjjlB55pxfNLGec5sm6xn
 apG/AnCQAEvP+yUm+jwbscoxWqobPvDuflliw9ju8Rw/nvlHK0+uj/tD1GRB8ZkyipyA
 eHtj27b/aMOn2hO6QJ2C7jXN+Ikt1N/5zzFt2+PJuDoZB8e9OivPkWFShxjoIa4asK4K
 kWaVCvTzXr4qzeoReCauMOzXsKXd1Up2+X8NzWaZRG37ozpj6xcyNwdwDR0G9wjc14g+
 jg0w==
X-Gm-Message-State: AO0yUKWo+dJxW/aAL9r3tX3dsfeyQHkftujrT0XaAHd5NFXL/2Xt8blu
 dAlEOtZb48xodDnHBq3VVH4M0KxHlnW9Y+hwTEY=
X-Google-Smtp-Source: AK7set84qeqytxIfAm/fPloASEPkVGj8UXXo/6Vs21oOuRuubHL2EfNwFS5xDPcLZa/5f7+YUG6txcHBJpnLl1GpWFs=
X-Received: by 2002:a05:6512:4c8:b0:4d5:ca42:aee4 with SMTP id
 w8-20020a05651204c800b004d5ca42aee4mr998155lfq.4.1676688038623; Fri, 17 Feb
 2023 18:40:38 -0800 (PST)
MIME-Version: 1.0
References: <CAPWd1mzg0rWgpf_D+NC+yAosx8oJnA+tR=NpsuFNtWP-j25=pQ@mail.gmail.com>
 <CAFEAcA8dH+DDPHWg6xRmT=3oCu1rwyb1gbyVCXFTSDSzBrGg-w@mail.gmail.com>
 <4ea862746a066107573650d04f4eee6992e0ede9.camel@infradead.org>
 <c2011213-8c8b-95c0-9565-47eaf7d33688@linaro.org>
 <5c7026171d3ab5d530784308a5ce71d32e6760c7.camel@infradead.org>
 <CANCZdfpB9XdCQ97_qbnWNsquX9mwmoeJBzbx0SRQovsZp-xTTA@mail.gmail.com>
In-Reply-To: <CANCZdfpB9XdCQ97_qbnWNsquX9mwmoeJBzbx0SRQovsZp-xTTA@mail.gmail.com>
From: ginu samuel <samuel.ginu2010@gmail.com>
Date: Sat, 18 Feb 2023 08:10:27 +0530
Message-ID: <CAPWd1mzmT6mjV2uiBnnFrQd1J9xGk7bpH4g9Rq70_RX-EKkprA@mail.gmail.com>
Subject: Re: Runnig solaris binary(32 bit) on linux(64 bit)
To: Warner Losh <imp@bsdimp.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000f0fe0d05f4f05a3e"
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=samuel.ginu2010@gmail.com; helo=mail-lf1-x132.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 HTML_FONT_LOW_CONTRAST=0.001, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--000000000000f0fe0d05f4f05a3e
Content-Type: text/plain; charset="UTF-8"

Thanks to everyone.

 Ok , so I need to run QEMU in Full System Emulation mode to run the
Solaris binary.
 Is the *qemu-kvm* , the only package required to be installed ( on RHEL
machine) to launch QEMU or there are some packages also.
 Also I would need the Solars OS image, right?

Regards,
Ginu



On Fri, 17 Feb 2023 at 21:34, Warner Losh <imp@bsdimp.com> wrote:

>
>
> On Thu, Feb 16, 2023 at 12:40 PM David Woodhouse <dwmw2@infradead.org>
> wrote:
>
>> On Thu, 2023-02-16 at 09:29 -1000, Richard Henderson wrote:
>> > On 2/16/23 09:02, David Woodhouse wrote:
>> > > It wouldn't be beyond the wit of man to extend qemu-user to support
>> the
>> > > similar personality variations for SCO/Solaris/etc. using that as a
>> > > guide.
>> >
>> > Not beyond wit but perhaps beyond patience.
>> >
>> > It would certainly be possible to emulate the "easy middle" of one
>> POSIX guest on a
>> > different POSIX host.  But the dusty corners are going to get in the
>> way, where we
>> > currently rely on guest and host having identical semantics, and pass
>> the system call
>> > through to the host.
>> >
>> > It's a big job.
>>
>> True, but the existing iBCS / linux-abi kernel patches should highlight
>> a lot of those dusty corners.
>>
>
> So one thing to understand, the iBCS is a separate ABI. This means that
> you'd
> have to rewrite everything from the syscall dispatch on down. Even if this
> were
> relevant, it would be a huge job.
>
> A lot would depend on how much of Solaris is used. Solaris is ELF, which
> is good
> (it would be even worse if it were SunOS 4, then it's a.out and a whole
> lot of other
> complication that's more of a bsd-user thing). However, as others have
> pointed
> out, linux-user assumes a linux kernel. While one can run linux-user on
> FreeBSD
> with its Linux ABI implementation, even that's quite limited in what it
> can do (I
> needed to do this for some kexec support I was adding to FreeBSD boot
> loader
> that ran as a Linux binary). I had to make tweaks to FreeBSD's emulation
> to make it work, and that was for a binary that used only 10 system calls,
> no
> threads, no signals, nothing "messy" and apart from some extensions to
> 64-bits,
> nothing that wasn't in 7th Edition Unix.
>
> And there's also a number of special filesystems, IIRC, on Solaris that
> are used
> like linux's /sys and /proc filesystems, but with different details. And a
> million other
> details. Knowing the details isn't enough, assuming you could know them
> from
> cribbing from existing code. You have to actually go implement the details
> and
> that would be a very tedious job. Even if you kept it to a subset that
> your program
> uses...
>
> I started on a Venix emulator (ancient Unix V7 port to 8088/8086 micros I
> cut my
> teeth on), and even that was daunting. Now, with 3 years of bsd-user
> hacking and
> upstreaming under my belt, it would be easier, but there's a *HUGE*
> learning curve
> to understand the CPU, its exception model, how system calls are handled,
> how
> memory is mapped, etc. And the 'assume we're on linux' is definitely
> leveraged
> for memory mapping in the existing linux-user code if you were to copy it
> all
> as a starting point.
>
> When people say it's a big job, they are underselling it somewhat. It
> would be
> a big job for the maintainers of linux-user who have all the context and
> know
> where the gotchas are. For anybody else, learning everything you need to
> know itself is a big job.
>
> Your best bet is qemu-sparc-system + Solaris install.
>
> Warner
>
> P.S. Sorry to go into partial rant mode, but 4 years ago when I started
> helping
> the folks working with bsd-user, I thought how hard could it be... now I
> know...
>

--000000000000f0fe0d05f4f05a3e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks to everyone.<div><br></div><div>=C2=A0Ok , so I nee=
d to run <font face=3D"arial, sans-serif">QEMU in Full Syst</font>em Emulat=
ion mode to run the Solaris binary.</div><div>=C2=A0Is the<b>=C2=A0</b><spa=
n style=3D"background-color:rgba(0,0,0,0.05);color:rgb(0,0,0);font-size:14.=
6667px"><b style=3D"font-family:&quot;Roboto Mono&quot;,monospace">qemu-kvm=
</b>=C2=A0, the only=C2=A0<font face=3D"arial, sans-serif">package required=
 to be installed ( on RHEL machine) to launch QEMU or there are some packag=
es also.</font></span></div><div><span style=3D"background-color:rgba(0,0,0=
,0.05);color:rgb(0,0,0);font-size:14.6667px"><font face=3D"arial, sans-seri=
f">=C2=A0Also I would need the Solars OS image, right?</font></span></div><=
div><span style=3D"background-color:rgba(0,0,0,0.05);color:rgb(0,0,0);font-=
size:14.6667px"><font face=3D"arial, sans-serif"><br></font></span></div><d=
iv><font color=3D"#000000" face=3D"arial, sans-serif"><span style=3D"font-s=
ize:14.6667px;background-color:rgba(0,0,0,0.05)">Regards,</span></font></di=
v><div><font color=3D"#000000" face=3D"arial, sans-serif"><span style=3D"fo=
nt-size:14.6667px;background-color:rgba(0,0,0,0.05)">Ginu</span></font></di=
v><div><span style=3D"background-color:rgba(0,0,0,0.05);color:rgb(0,0,0);fo=
nt-size:14.6667px"><font face=3D"arial, sans-serif"><br></font></span></div=
><div><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, 17 Feb 2023 at 21:34, Warner Losh &lt;<a href=3D"ma=
ilto:imp@bsdimp.com">imp@bsdimp.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Thu, Feb 16, 2023 at 12:40 PM David Woodhouse &lt;<a href=3D"mailto:dwmw2@=
infradead.org" target=3D"_blank">dwmw2@infradead.org</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, 2023-02-16 at 0=
9:29 -1000, Richard Henderson wrote:<br>
&gt; On 2/16/23 09:02, David Woodhouse wrote:<br>
&gt; &gt; It wouldn&#39;t be beyond the wit of man to extend qemu-user to s=
upport the<br>
&gt; &gt; similar personality variations for SCO/Solaris/etc. using that as=
 a<br>
&gt; &gt; guide.<br>
&gt; <br>
&gt; Not beyond wit but perhaps beyond patience.<br>
&gt; <br>
&gt; It would certainly be possible to emulate the &quot;easy middle&quot; =
of one POSIX guest on a <br>
&gt; different POSIX host.=C2=A0 But the dusty corners are going to get in =
the way, where we <br>
&gt; currently rely on guest and host having identical semantics, and pass =
the system call <br>
&gt; through to the host.<br>
&gt; <br>
&gt; It&#39;s a big job.<br>
<br>
True, but the existing iBCS / linux-abi kernel patches should highlight<br>
a lot of those dusty corners.<br></blockquote><div><br></div><div>So one th=
ing to understand, the iBCS is a separate ABI. This means that you&#39;d</d=
iv><div>have to rewrite everything from the syscall dispatch on down. Even =
if this were</div><div>relevant, it would be a huge job.<br></div><div><br>=
</div>A lot would depend on how much of Solaris is used. Solaris is ELF, wh=
ich is good</div><div class=3D"gmail_quote">(it would be even worse if it w=
ere SunOS 4, then it&#39;s a.out and a whole lot of other</div><div class=
=3D"gmail_quote">complication that&#39;s more of a bsd-user thing). However=
, as others have pointed</div><div class=3D"gmail_quote">out, linux-user as=
sumes a linux kernel. While one can run linux-user on FreeBSD</div><div cla=
ss=3D"gmail_quote">with its Linux ABI implementation, even that&#39;s quite=
 limited in what it can do (I</div><div class=3D"gmail_quote">needed to do =
this for some kexec support I was adding to FreeBSD boot loader</div><div c=
lass=3D"gmail_quote">that ran as a Linux binary). I had to make tweaks to F=
reeBSD&#39;s emulation</div><div class=3D"gmail_quote">to make it work, and=
 that was for a binary that used only 10 system calls, no</div><div class=
=3D"gmail_quote">threads, no signals, nothing &quot;messy&quot; and apart f=
rom some extensions to 64-bits,</div><div class=3D"gmail_quote">nothing tha=
t wasn&#39;t in 7th Edition Unix.<br></div><div class=3D"gmail_quote"><br><=
/div><div class=3D"gmail_quote">And there&#39;s also a number of special fi=
lesystems, IIRC, on Solaris that are used</div><div class=3D"gmail_quote">l=
ike linux&#39;s /sys and /proc filesystems, but with different details. And=
 a million other</div><div class=3D"gmail_quote">details. Knowing the detai=
ls isn&#39;t enough, assuming you could know them from</div><div class=3D"g=
mail_quote">cribbing from existing code. You have to actually go implement =
the details and</div><div class=3D"gmail_quote">that would be a very tediou=
s job. Even if you kept it to a subset that your program</div><div class=3D=
"gmail_quote">uses...<br></div><div class=3D"gmail_quote"><br></div><div cl=
ass=3D"gmail_quote">I started on a Venix emulator (ancient Unix V7 port to =
8088/8086 micros I cut my</div><div class=3D"gmail_quote">teeth on), and ev=
en that was daunting. Now, with 3 years of bsd-user hacking and</div><div c=
lass=3D"gmail_quote">upstreaming under my belt, it would be easier, but the=
re&#39;s a *HUGE* learning curve</div><div class=3D"gmail_quote">to underst=
and the CPU, its exception model, how system calls are handled, how</div><d=
iv class=3D"gmail_quote">memory is mapped, etc. And the &#39;assume we&#39;=
re on linux&#39; is definitely leveraged</div><div class=3D"gmail_quote">fo=
r memory mapping in the existing linux-user code if you were to copy it all=
</div><div class=3D"gmail_quote">as a starting point.</div><div class=3D"gm=
ail_quote"><br></div><div class=3D"gmail_quote">When people say it&#39;s a =
big job, they are underselling it somewhat. It would be <br></div><div clas=
s=3D"gmail_quote">a big job for the maintainers of linux-user who have all =
the context and know</div><div class=3D"gmail_quote">where the gotchas are.=
 For anybody else, learning everything you need to</div><div class=3D"gmail=
_quote">know itself is a big job.<br></div><div class=3D"gmail_quote"><br><=
/div><div class=3D"gmail_quote">Your best bet is qemu-sparc-system + Solari=
s install.<br></div><div class=3D"gmail_quote"><br></div><div class=3D"gmai=
l_quote">Warner</div><div class=3D"gmail_quote"><br></div><div class=3D"gma=
il_quote">P.S. Sorry to go into partial rant mode, but 4 years ago when I s=
tarted helping</div><div class=3D"gmail_quote">the folks working with bsd-u=
ser, I thought how hard could it be... now I know...<br></div></div>
</blockquote></div>

--000000000000f0fe0d05f4f05a3e--

