Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BA269976F
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 15:30:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSfGj-0006XD-G5; Thu, 16 Feb 2023 09:29:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samuel.ginu2010@gmail.com>)
 id 1pSa7r-0004qt-7e
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 04:00:23 -0500
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <samuel.ginu2010@gmail.com>)
 id 1pSa7o-0003I8-HD
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 04:00:22 -0500
Received: by mail-lj1-x233.google.com with SMTP id a9so1174712ljr.13
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 01:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=JQlAeGMUz+W0FvjU+Wix+xY+9zeggi3oMBEbyiyjUNA=;
 b=HAHjnnxQcAB/vFhRO3a6grmiso4aUX3BHuZ+D5DHgznbuatGKu/nGsmLwVTEQsiAlT
 dhYPl4V9+tzIL5B13R7MuVwxelRtJZJcfe7JNFVEDRB2L73VKMkH2KwVabeot/n2dD8B
 u5GjYEakbR5hufebIv7WfVwmPXU+ySmxkrJRalj9Z4E1ZxROVi6uWGITtVZ888oQ3vqL
 VqiWrfRQFVQ9iOSNiF+EiaPUHlUBiD+sU9joKDYYz6osFbjwjSbE8DD/wx4eFsBivZ1p
 drazDClBS8CFmS1p6mdAVAZA8AbbP00rrZRdGo1VAbZU6MCPQ8NciFZaTHqp675+FiRF
 tl1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JQlAeGMUz+W0FvjU+Wix+xY+9zeggi3oMBEbyiyjUNA=;
 b=l8ugJw7/dfgjIu58dc7Y2AL05M4QtxtPW6ocefybbGYLdS0CoxxzAO1e3jdqcaFJD4
 cIBPJWzRWv3BrdKCo54KZU7A4ZC1DEib71UfkhHeUAamVVGmvFFWb0EjhTqQJB3OhLFt
 4ozEoyoDUwPgZhG6wSQZCOattj94zpm424NPhUtIfKYPIq3u+xkVco/b+nYQHLYzUkal
 VThumUK+3gWbgs2p/ljwSAhhRtCoCm5omA0fTl9lBZnc0fcldRcAD6FxBODeNJuXNRpC
 u0wPP3i/B/x3ShdhWZyfS6+C5JObNF8uOeMzlnk0OLQGkmrNrkBUXpGMI4q/ME2SN90o
 vJ6A==
X-Gm-Message-State: AO0yUKU7LiGNKzTr3AxHgUytftQKkHYYbY4w9I0YF6h0eyK08jZ7lX2k
 3WiAtV75rcfKtLu9FioHs7vagzfnW88wgKv3vQH/AmmcmYo=
X-Google-Smtp-Source: AK7set8+fA0HPAenWNljLMm3hggRt0vrLceycJaw4iB/CevWj0ZUj5geHCJszgZtYg8RhYKGAifi8M6Ct8p+T/bDaD0=
X-Received: by 2002:a2e:8e21:0:b0:293:4ffa:a68c with SMTP id
 r1-20020a2e8e21000000b002934ffaa68cmr1407137ljk.8.1676538017676; Thu, 16 Feb
 2023 01:00:17 -0800 (PST)
MIME-Version: 1.0
From: ginu samuel <samuel.ginu2010@gmail.com>
Date: Thu, 16 Feb 2023 14:30:05 +0530
Message-ID: <CAPWd1mzg0rWgpf_D+NC+yAosx8oJnA+tR=NpsuFNtWP-j25=pQ@mail.gmail.com>
Subject: Runnig solaris binary(32 bit) on linux(64 bit)
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000ff023b05f4cd6cdd"
Received-SPF: pass client-ip=2a00:1450:4864:20::233;
 envelope-from=samuel.ginu2010@gmail.com; helo=mail-lj1-x233.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 16 Feb 2023 09:29:51 -0500
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

--000000000000ff023b05f4cd6cdd
Content-Type: text/plain; charset="UTF-8"

Hi,
    I have a requirement to run a Solaris binary ( 32 bit ) on linux (64
bit).

Since some of the sources for the binary are not available, recompilation
on linux is not possible.

So we are trying to run on linux using QEMU

the uname output on solaris box is -
#uname -sip
SunOS sparc sun4v

the uname output on linux box is -
#uname -siop
Linux x86_64 x86_64 GNU/Linux

Following are the questions:
1. Is the user mode emulation (of QEMU) the right way to do this?

2. If yes, what would be actual command to do this. The Linux User space
emulator ( https://www.qemu.org/docs/master/user/main.html) gives the
command :

qemu-i386 [-h] [-d] [-L path] [-s size] [-cpu model] [-g port] [-B
offset] [-R size] program [arguments...]

Is there a suitable command for 64 bit linux to run the program ?

3.  Is this the package to install for RHEL as given in documentation?


   -

   RHEL/CentOS: yum install qemu-kvm


4. Does the program require Super user privileges to run?

Regards,
Ginu

--000000000000ff023b05f4cd6cdd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div>=C2=A0 =C2=A0 I=C2=A0have a requirement to run a S=
olaris binary ( 32 bit ) on linux (64 bit).</div><div><br></div><div>Since =
some of=C2=A0the=C2=A0sources=C2=A0for the binary are not available, recomp=
ilation on linux is not possible.</div><div><br></div><div>So we are trying=
=C2=A0to run on linux using QEMU</div><div><br></div><div>the uname output =
on solaris box is -=C2=A0</div><div>#uname -sip</div><div>SunOS sparc sun4v=
</div><div><br></div><div>the uname output=C2=A0on linux box is -</div><div=
>#uname -siop</div><div>Linux x86_64 x86_64 GNU/Linux</div><div><br></div><=
div>Following are the questions:</div><div>1. Is the user mode emulation=C2=
=A0(of QEMU) the right way to do this?=C2=A0</div><div><br></div><div>2. If=
 yes, what would be actual command to do this. The=C2=A0Linux User space em=
ulator (=C2=A0<a href=3D"https://www.qemu.org/docs/master/user/main.html">h=
ttps://www.qemu.org/docs/master/user/main.html</a>) gives the command :</di=
v><div><pre style=3D"box-sizing:border-box;font-family:SFMono-Regular,Menlo=
,Monaco,Consolas,&quot;Liberation Mono&quot;,&quot;Courier New&quot;,Courie=
r,monospace;font-size:12px;line-height:1.4;margin-top:0px;margin-bottom:0px=
;color:rgb(0,0,0);padding:12px;overflow:auto"><span class=3D"gmail-n" style=
=3D"box-sizing:border-box">qemu</span><span class=3D"gmail-o" style=3D"box-=
sizing:border-box;color:rgb(102,102,102)">-</span><span class=3D"gmail-n" s=
tyle=3D"box-sizing:border-box">i386</span> <span class=3D"gmail-p" style=3D=
"box-sizing:border-box">[</span><span class=3D"gmail-o" style=3D"box-sizing=
:border-box;color:rgb(102,102,102)">-</span><span class=3D"gmail-n" style=
=3D"box-sizing:border-box">h</span><span class=3D"gmail-p" style=3D"box-siz=
ing:border-box">]</span> <span class=3D"gmail-p" style=3D"box-sizing:border=
-box">[</span><span class=3D"gmail-o" style=3D"box-sizing:border-box;color:=
rgb(102,102,102)">-</span><span class=3D"gmail-n" style=3D"box-sizing:borde=
r-box">d</span><span class=3D"gmail-p" style=3D"box-sizing:border-box">]</s=
pan> <span class=3D"gmail-p" style=3D"box-sizing:border-box">[</span><span =
class=3D"gmail-o" style=3D"box-sizing:border-box;color:rgb(102,102,102)">-<=
/span><span class=3D"gmail-n" style=3D"box-sizing:border-box">L</span> <spa=
n class=3D"gmail-n" style=3D"box-sizing:border-box">path</span><span class=
=3D"gmail-p" style=3D"box-sizing:border-box">]</span> <span class=3D"gmail-=
p" style=3D"box-sizing:border-box">[</span><span class=3D"gmail-o" style=3D=
"box-sizing:border-box;color:rgb(102,102,102)">-</span><span class=3D"gmail=
-n" style=3D"box-sizing:border-box">s</span> <span class=3D"gmail-n" style=
=3D"box-sizing:border-box">size</span><span class=3D"gmail-p" style=3D"box-=
sizing:border-box">]</span> <span class=3D"gmail-p" style=3D"box-sizing:bor=
der-box">[</span><span class=3D"gmail-o" style=3D"box-sizing:border-box;col=
or:rgb(102,102,102)">-</span><span class=3D"gmail-n" style=3D"box-sizing:bo=
rder-box">cpu</span> <span class=3D"gmail-n" style=3D"box-sizing:border-box=
">model</span><span class=3D"gmail-p" style=3D"box-sizing:border-box">]</sp=
an> <span class=3D"gmail-p" style=3D"box-sizing:border-box">[</span><span c=
lass=3D"gmail-o" style=3D"box-sizing:border-box;color:rgb(102,102,102)">-</=
span><span class=3D"gmail-n" style=3D"box-sizing:border-box">g</span> <span=
 class=3D"gmail-n" style=3D"box-sizing:border-box">port</span><span class=
=3D"gmail-p" style=3D"box-sizing:border-box">]</span> <span class=3D"gmail-=
p" style=3D"box-sizing:border-box">[</span><span class=3D"gmail-o" style=3D=
"box-sizing:border-box;color:rgb(102,102,102)">-</span><span class=3D"gmail=
-n" style=3D"box-sizing:border-box">B</span> <span class=3D"gmail-n" style=
=3D"box-sizing:border-box">offset</span><span class=3D"gmail-p" style=3D"bo=
x-sizing:border-box">]</span> <span class=3D"gmail-p" style=3D"box-sizing:b=
order-box">[</span><span class=3D"gmail-o" style=3D"box-sizing:border-box;c=
olor:rgb(102,102,102)">-</span><span class=3D"gmail-n" style=3D"box-sizing:=
border-box">R</span> <span class=3D"gmail-n" style=3D"box-sizing:border-box=
">size</span><span class=3D"gmail-p" style=3D"box-sizing:border-box">]</spa=
n> <span class=3D"gmail-n" style=3D"box-sizing:border-box">program</span> <=
span class=3D"gmail-p" style=3D"box-sizing:border-box">[</span><span class=
=3D"gmail-n" style=3D"box-sizing:border-box">arguments</span><span class=3D=
"gmail-o" style=3D"box-sizing:border-box;color:rgb(102,102,102)">...</span>=
<span class=3D"gmail-p" style=3D"box-sizing:border-box">]</span></pre><pre =
style=3D"box-sizing:border-box;font-size:12px;line-height:1.4;margin-top:0p=
x;margin-bottom:0px;color:rgb(0,0,0);padding:12px;overflow:auto"><font face=
=3D"arial, sans-serif">Is there a suitable command for 64 bit linux to run =
the program ?</font></pre><pre style=3D"box-sizing:border-box;font-size:12p=
x;line-height:1.4;margin-top:0px;margin-bottom:0px;color:rgb(0,0,0);padding=
:12px;overflow:auto"><font face=3D"arial, sans-serif">3. </font> Is this th=
e package to install for RHEL as given in documentation?</pre><pre style=3D=
"box-sizing:border-box;line-height:1.4;margin-top:0px;margin-bottom:0px;col=
or:rgb(0,0,0);padding:12px;overflow:auto"><ul style=3D"font-size:14.6667px;=
box-sizing:border-box;margin-bottom:0px;font-family:Roboto,sans-serif;white=
-space:normal"><li style=3D"box-sizing:border-box"><p style=3D"box-sizing:b=
order-box;margin-bottom:1em"><span style=3D"box-sizing:border-box">RHEL/Cen=
tOS:</span>=C2=A0<code style=3D"box-sizing:border-box;font-family:&quot;Rob=
oto Mono&quot;,monospace;font-size:1em;background:rgba(0,0,0,0.05)">yum ins=
tall qemu-kvm</code></p></li></ul><div style=3D""><font face=3D"Roboto Mono=
, monospace"><span style=3D"font-size:14.6667px;white-space:normal"><br></s=
pan></font></div><div style=3D""><font face=3D"Roboto Mono, monospace"><spa=
n style=3D"font-size:14.6667px;white-space:normal">4. Does the program requ=
ire Super user privileges to run?</span></font></div><div style=3D""><font =
face=3D"Roboto Mono, monospace"><span style=3D"font-size:14.6667px;white-sp=
ace:normal"><br></span></font></div><div style=3D""><font face=3D"Roboto Mo=
no, monospace"><span style=3D"font-size:14.6667px;white-space:normal">Regar=
ds,</span></font></div><div style=3D""><font face=3D"Roboto Mono, monospace=
"><span style=3D"font-size:14.6667px;white-space:normal">Ginu</span></font>=
</div>

</pre></div><div><br></div><div><br></div></div>

--000000000000ff023b05f4cd6cdd--

