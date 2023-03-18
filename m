Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5090F6BFC10
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Mar 2023 18:56:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdamu-0008Gi-5f; Sat, 18 Mar 2023 13:56:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abhishek@drut.io>) id 1pdams-0008DO-HV
 for qemu-devel@nongnu.org; Sat, 18 Mar 2023 13:56:14 -0400
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <abhishek@drut.io>) id 1pdamq-0000wl-9X
 for qemu-devel@nongnu.org; Sat, 18 Mar 2023 13:56:14 -0400
Received: by mail-qk1-x72e.google.com with SMTP id j10so2650841qkg.12
 for <qemu-devel@nongnu.org>; Sat, 18 Mar 2023 10:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=drut-io.20210112.gappssmtp.com; s=20210112; t=1679162168;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BjAKaepWncF6u/H1Pa+P+d/hZgx3SRRXSBdLXH1jpIA=;
 b=Z4XcFK0SahQipoajB6s/LnuSsJ2OMB6ez+4THJKCQLDLdMJ9h7ZlnLeZgavhgQ+Ebr
 i262icLWJ0163R35MD1DG1KRLKi5x2yzS8htn6vx5ADEpRn2qYYAXMlkpug8eG5WF8h+
 tY/UcBfKOsq6vjSEZD14Ulvse4QlVtMQagwct6wW+lOxC+ykA6WyqHkKnv3J8Gc7fD2B
 P612cobkhOKySRw6CQZGJUoXq8Thgfv0+ITNulPYmzcRPnmenlAeigVpWPcPghu5YrBy
 bAqsjaChiSFxdgJUcz3nAPsrWTjQ50ezYYxQo8V2SI92Z78FxKxpxv/hFCQruNY7dToH
 7CXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679162168;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BjAKaepWncF6u/H1Pa+P+d/hZgx3SRRXSBdLXH1jpIA=;
 b=BK+Uo0fKEsj0SMYGLP7MrHY8Hkz3BPjTD1fU3kRllE+ozdfPOrg3FI1Ulptm+wLY5S
 eFEvY4Q9sIyiscerRRN1usjMvH5LtRIDo1KshsAawLLXpaPiXpWzJe50gUrtp0P1MxNl
 0uHxxmuzlV8KGZgm3TAkES2Y4Xq50nnwfqbL1kjl4LYG+51bqb7LdNW5Jqq5djCHFvwD
 pQcIWgocyXkBMKukn39Zo33aLkfX7C403g4NcUm+jTYo9PYe2yfIrzLvQN+I4L10BEew
 Ha1W9JbAAXQx98q4ASqUwqpUQ7Cn6HiTdgBsm9ND9lsAwmvrhQ9K42J+Ew4S7KecWO3E
 bcbQ==
X-Gm-Message-State: AO0yUKVLpP/DOa7JVJs+MP3JbJGC34X0BSeo/U0Y1wjm9cYKHHQVfLb7
 4uzdoPujDql+MmaAD8TUZfdz7NZ3aFA3eTfgii//cA==
X-Google-Smtp-Source: AK7set99mEWc5QiRWK5ztS6qVx5r9ZGqpV1XvEsO7KjQFrwfvtCVQpv1ykidfEakfCpbXBcsSJQn2YmzMQV9PgsZBdg=
X-Received: by 2002:a05:620a:a1d:b0:745:6bad:76a1 with SMTP id
 i29-20020a05620a0a1d00b007456bad76a1mr6343363qka.5.1679162168572; Sat, 18 Mar
 2023 10:56:08 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ1un7j0FNpYaaviQxoKQN4O+C8RejqA918CdBamPySKyAEJUQ@mail.gmail.com>
 <87mt4b73sv.fsf@linaro.org> <b2c11d07-ee58-715d-2994-3add1c60b95d@kaod.org>
In-Reply-To: <b2c11d07-ee58-715d-2994-3add1c60b95d@kaod.org>
From: Abhishek Singh Dagur <abhishek@drut.io>
Date: Sat, 18 Mar 2023 23:25:58 +0530
Message-ID: <CAJ1un7gM4Zf1ZRCG9c-FAcrgUcEtrRX5C0PXFxqOjMq=FzQvvw@mail.gmail.com>
Subject: Re: Using QEMU how to redirect serial /dev/ttyS2 output of guest
 machine to host machine.
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Srinivas Kodali <srini@drut.io>, qemu-devel@nongnu.org,
 Anand Moon <anand@drut.io>
Content-Type: multipart/alternative; boundary="00000000000094119405f7306813"
Received-SPF: pass client-ip=2607:f8b0:4864:20::72e;
 envelope-from=abhishek@drut.io; helo=mail-qk1-x72e.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, HTML_OBFUSCATE_05_10=0.26,
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

--00000000000094119405f7306813
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alex , C=C3=A9dric,
we have tried this *option:-serial *pty* -serial *pty* -serial *pty
*-serial *pty *-serial *pty to check the serial output on screen.

Here we are providing 2 scenarios without and with the changes
suggested by @C=C3=A9dric
Le Goater <clg@kaod.org> .
In first we are able to get /dev/ttyS4 serial port not /dev/ttyS2
In second we are able to get /dev/ttyS2 not /dev/ttyS4

*Scenario1:* *previously with normal qemu build i have tried emulation as:*

qemu-system-arm -m 512 -M ast2500-evb,fmc-model=3Dmx66u51235f,spi-model=3Dm=
x66u
51235f -nographic -drive file=3D./pru-1.2.4_dev-rc1.static.mtd,format=3Draw=
,if=3Dmtd
-serial pty -serial pty -serial pty -serial pty

which gives us output as.

QEMU 7.2.0 monitor - type 'help' for more information
(qemu) char device redirected to /dev/pts/15 (label serial0)
char device redirected to /dev/pts/16 (label serial1)
char device redirected to /dev/pts/17 (label serial2)
char device redirected to /dev/pts/18 (label serial3)

so we can use *screen *to interact with the ttyS4 serial port like :
screen /dev/pts/15
In which we have our boot process and shell prompt .

*Scenario2:* *when I am using the newly build image with the changes *@C=C3=
=A9dric
Le Goater <clg@kaod.org>*  provided*

With the below command:
./qemu-system-arm -m 512 -M ast2500-evb,uart-default=3Duart2,fmc-model=3Dmx=
66u
51235f,spi-model=3Dmx66u51235f -nographic -drive
file=3D./pru-1.2.4_dev-rc1.static.mtd,format=3Draw,if=3Dmtd
-serial pty -serial pty -serial pty -serial pty

got the output:

QEMU 7.2.90 monitor - type 'help' for more information
(qemu) char device redirected to /dev/pts/4 (label serial0)
char device redirected to /dev/pts/5 (label serial1)
char device redirected to /dev/pts/6 (label serial2)
char device redirected to /dev/pts/7 (label serial3)
where we are able to get the output of /dev/ttyS2 serial in the *screen*
/dev/pts/7
but we are not getting the output of serial /dev/ttyS4
we have tried increasing the number of *-serial pty* options also
and checked the output of each with a screen but no success.

Can you please guide us further.

Regards,
Abhishek




>

--00000000000094119405f7306813
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><font face=3D"arial, sans-serif">Hi Alex =
,=C2=A0<span style=3D"color:rgb(31,31,31);white-space:nowrap">C=C3=A9dric,<=
/span></font><div><font face=3D"arial, sans-serif">we have tried this=C2=A0=
<b>option:-serial=C2=A0</b>pty<b>=C2=A0-serial=C2=A0</b>pty<b>=C2=A0-serial=
=C2=A0</b>pty=C2=A0<b>-serial=C2=A0</b>pty=C2=A0<b>-serial=C2=A0</b>pty to =
check the serial output on screen.</font></div><div><font face=3D"arial, sa=
ns-serif"><br></font></div><div><font face=3D"arial, sans-serif">Here we ar=
e providing 2 scenarios without and with the changes=C2=A0suggested by=C2=
=A0<a class=3D"gmail_plusreply" id=3D"plusReplyChip-1" href=3D"mailto:clg@k=
aod.org" tabindex=3D"-1">@C=C3=A9dric Le Goater</a>=C2=A0.</font></div><div=
><font face=3D"arial, sans-serif">In first we are able to get /dev/ttyS4 se=
rial port not /dev/ttyS2=C2=A0</font></div><div><font face=3D"arial, sans-s=
erif">In second we are able to get /dev/ttyS2 not /dev/ttyS4</font></div><d=
iv><font face=3D"arial, sans-serif"><br></font></div><div><span style=3D"fo=
nt-family:arial,sans-serif"><b>Scenario1:</b></span><span style=3D"color:rg=
b(31,31,31);white-space:nowrap"><font face=3D"arial, sans-serif"><b>=C2=A0<=
/b></font></span><b style=3D"font-family:arial,sans-serif;color:rgb(31,31,3=
1);white-space:nowrap">previously=C2=A0with normal qemu build i have tried =
emulation as:</b></div><div><span style=3D"color:rgb(31,31,31);white-space:=
nowrap"><font face=3D"arial, sans-serif"><br></font></span></div><div><div =
style=3D"color:rgb(0,0,0);line-height:19px;white-space:pre"><div><font face=
=3D"arial, sans-serif">qemu-system-arm -m <span style=3D"color:rgb(9,134,88=
)">512</span> -M ast<span style=3D"color:rgb(9,134,88)">2500</span>-evb,fmc=
-model=3Dmx<span style=3D"color:rgb(9,134,88)">66</span>u<span style=3D"col=
or:rgb(9,134,88)">51235</span>f,spi-model=3Dmx<span style=3D"color:rgb(9,13=
4,88)">66</span>u<span style=3D"color:rgb(9,134,88)">51235</span>f -nograph=
ic -drive file=3D./pru<span style=3D"color:rgb(9,134,88)">-1.2</span>.<span=
 style=3D"color:rgb(9,134,88)">4</span>_dev-rc<span style=3D"color:rgb(9,13=
4,88)">1</span>.static.mtd,format=3Draw,if=3Dmtd -serial pty -serial pty -s=
erial pty -serial pty</font></div></div></div><div><font face=3D"arial, san=
s-serif"><br></font></div><div><font face=3D"arial, sans-serif">which gives=
 us output as.</font></div><div><font face=3D"arial, sans-serif"><br></font=
></div><div><div style=3D"color:rgb(0,0,0);line-height:19px;white-space:pre=
"><div><font face=3D"arial, sans-serif">QEMU <span style=3D"color:rgb(9,134=
,88)">7.2</span>.<span style=3D"color:rgb(9,134,88)">0</span> monitor - typ=
e &#39;help&#39; for more information</font></div><div><font face=3D"arial,=
 sans-serif">(qemu) char device redirected to /dev/pts/<span style=3D"color=
:rgb(9,134,88)">15</span> (label serial<span style=3D"color:rgb(9,134,88)">=
0</span>)</font></div><div><font face=3D"arial, sans-serif">char device red=
irected to /dev/pts/<span style=3D"color:rgb(9,134,88)">16</span> (label se=
rial<span style=3D"color:rgb(9,134,88)">1</span>)</font></div><div><font fa=
ce=3D"arial, sans-serif">char device redirected to /dev/pts/<span style=3D"=
color:rgb(9,134,88)">17</span> (label serial<span style=3D"color:rgb(9,134,=
88)">2</span>)</font></div><div><font face=3D"arial, sans-serif">char devic=
e redirected to /dev/pts/<span style=3D"color:rgb(9,134,88)">18</span> (lab=
el serial<span style=3D"color:rgb(9,134,88)">3</span>)</font></div></div></=
div><div><span style=3D"color:rgb(31,31,31);white-space:nowrap"><font face=
=3D"arial, sans-serif"><br></font></span></div><div><font color=3D"#1f1f1f"=
 face=3D"arial, sans-serif"><span style=3D"white-space:nowrap">so we can us=
e <b>screen </b>to interact with the ttyS4 serial port like :</span></font>=
</div><div><font face=3D"arial, sans-serif"><span style=3D"color:rgb(0,0,0)=
;white-space:pre">screen /dev/pts/</span><span style=3D"white-space:pre;col=
or:rgb(9,134,88)">15 </span></font></div><div><span style=3D"white-space:no=
wrap;color:rgb(31,31,31)"><font face=3D"arial, sans-serif">In which we have=
 our=C2=A0boot process and shell prompt .</font></span></div><div><span sty=
le=3D"white-space:nowrap;color:rgb(31,31,31)"><font face=3D"arial, sans-ser=
if"><br></font></span></div><div><span style=3D"font-family:arial,sans-seri=
f"><b>Scenario2:</b>=C2=A0</span><span style=3D"white-space:nowrap;color:rg=
b(31,31,31)"><font face=3D"arial, sans-serif"><b>when I am using the newly =
build image with the changes=C2=A0</b></font><a class=3D"gmail_plusreply" i=
d=3D"gmail-plusReplyChip-0" href=3D"mailto:clg@kaod.org" tabindex=3D"-1" st=
yle=3D"">@C=C3=A9dric Le Goater</a><font face=3D"arial, sans-serif"><b>=C2=
=A0 provided</b></font></span></div><div><span style=3D"white-space:nowrap;=
color:rgb(31,31,31)"><font face=3D"arial, sans-serif"><br></font></span></d=
iv><div><font color=3D"#1f1f1f" face=3D"arial, sans-serif"><span style=3D"w=
hite-space:nowrap">With the below command:</span></font></div><div><div sty=
le=3D"color:rgb(0,0,0);line-height:19px;white-space:pre"><div><font face=3D=
"arial, sans-serif">./qemu-system-arm -m <span style=3D"color:rgb(9,134,88)=
">512</span> -M ast<span style=3D"color:rgb(9,134,88)">2500</span>-evb,uart=
-default=3Duart<span style=3D"color:rgb(9,134,88)">2</span>,fmc-model=3Dmx<=
span style=3D"color:rgb(9,134,88)">66</span>u<span style=3D"color:rgb(9,134=
,88)">51235</span>f,spi-model=3Dmx<span style=3D"color:rgb(9,134,88)">66</s=
pan>u<span style=3D"color:rgb(9,134,88)">51235</span>f -nographic -drive fi=
le=3D./pru<span style=3D"color:rgb(9,134,88)">-1.2</span>.<span style=3D"co=
lor:rgb(9,134,88)">4</span>_dev-rc<span style=3D"color:rgb(9,134,88)">1</sp=
an>.static.mtd,format=3Draw,if=3Dmtd -serial pty -serial pty -serial pty -s=
erial pty</font></div><div><font face=3D"arial, sans-serif"><br></font></di=
v><div><font face=3D"arial, sans-serif">got the output:</font></div><div><f=
ont face=3D"arial, sans-serif"><br></font></div><div><font face=3D"arial, s=
ans-serif">

</font><div style=3D"line-height:19px"><div><font face=3D"arial, sans-serif=
">QEMU <span style=3D"color:rgb(9,134,88)">7.2</span>.<span style=3D"color:=
rgb(9,134,88)">90</span> monitor - type &#39;help&#39; for more information=
</font></div><div><font face=3D"arial, sans-serif">(qemu) char device redir=
ected to /dev/pts/<span style=3D"color:rgb(9,134,88)">4</span> (label seria=
l<span style=3D"color:rgb(9,134,88)">0</span>)</font></div><div><font face=
=3D"arial, sans-serif">char device redirected to /dev/pts/<span style=3D"co=
lor:rgb(9,134,88)">5</span> (label serial<span style=3D"color:rgb(9,134,88)=
">1</span>)</font></div><div><font face=3D"arial, sans-serif">char device r=
edirected to /dev/pts/<span style=3D"color:rgb(9,134,88)">6</span> (label s=
erial<span style=3D"color:rgb(9,134,88)">2</span>)</font></div><div><font f=
ace=3D"arial, sans-serif">char device redirected to /dev/pts/<span style=3D=
"color:rgb(9,134,88)">7</span> (label serial<span style=3D"color:rgb(9,134,=
88)">3</span>)</font></div></div><font face=3D"arial, sans-serif">
where we are able to get the output of /dev/ttyS2 serial in the <b>screen</=
b> /dev/pts/<span style=3D"color:rgb(9,134,88)">7</span></font></div><font =
face=3D"arial, sans-serif">but we are not getting the output of serial /dev=
/ttyS4 </font></div></div><div style=3D"color:rgb(0,0,0);line-height:19px;w=
hite-space:pre"><font face=3D"arial, sans-serif">we have tried increasing t=
he number of <b>-serial pty</b> options also</font></div><div style=3D"colo=
r:rgb(0,0,0);line-height:19px;white-space:pre"><font face=3D"arial, sans-se=
rif">and checked the output of each with a screen but no success.</font></d=
iv><div style=3D"color:rgb(0,0,0);line-height:19px;white-space:pre"><font f=
ace=3D"arial, sans-serif"><br></font></div><div style=3D"color:rgb(0,0,0);l=
ine-height:19px;white-space:pre"><font face=3D"arial, sans-serif">Can you p=
lease guide us further.</font></div><div style=3D"color:rgb(0,0,0);line-hei=
ght:19px;white-space:pre"><br></div><div style=3D"color:rgb(0,0,0);line-hei=
ght:19px;white-space:pre">Regards,</div><div style=3D"color:rgb(0,0,0);line=
-height:19px;white-space:pre"><font face=3D"arial, sans-serif">Abhishek</fo=
nt></div><div style=3D"color:rgb(0,0,0);line-height:19px;white-space:pre"><=
font face=3D"arial, sans-serif"><br></font></div><div style=3D"color:rgb(0,=
0,0);font-family:&quot;FiraCode NF&quot;,&quot;FiraCode NF&quot;,&quot;Fira=
Code NF&quot;,Consolas,&quot;Courier New&quot;,monospace;line-height:19px;w=
hite-space:pre"><br></div><div style=3D"color:rgb(0,0,0);font-family:&quot;=
FiraCode NF&quot;,&quot;FiraCode NF&quot;,&quot;FiraCode NF&quot;,Consolas,=
&quot;Courier New&quot;,monospace;line-height:19px;white-space:pre"><br></d=
iv></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><br>
</blockquote></div></div>

--00000000000094119405f7306813--

