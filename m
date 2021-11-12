Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C917E44F006
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Nov 2021 00:25:55 +0100 (CET)
Received: from localhost ([::1]:44572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlfve-0003n6-3f
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 18:25:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ctcaulfield@gmail.com>)
 id 1mlfu3-0002Xq-0N
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 18:24:15 -0500
Received: from [2607:f8b0:4864:20::934] (port=33497
 helo=mail-ua1-x934.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ctcaulfield@gmail.com>)
 id 1mlfu1-000154-0Y
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 18:24:14 -0500
Received: by mail-ua1-x934.google.com with SMTP id b17so22186647uas.0
 for <qemu-devel@nongnu.org>; Fri, 12 Nov 2021 15:24:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=by/OopUDAdONgxn4q3A3x86zJza8AGEnAHL1h9XrwlA=;
 b=VtVtENrAADJBSxmJVi7ho2n4rJtROMq9bMpZ6J2bSfP5eEMxjxUlFDqtHa4qHGGah8
 7ZcljNkbEcFEvJtmk/Y3pnT4FQxtkfQIj5i2M0S16D2P+rqTLsmyJnffsH0cP/LxTXXb
 C+9lG27h9otdXkE22V2/f/QxhL4GealVq8qs3NJTDAYbEWjKDicdzbW+IvgYA0gPzJvJ
 Q52Tji3YNU/hOl/METmgeL8iGrpNeHU/QAn4M2ZIZwKkgZs1vIbBfbYKc9GZWiyBF9eM
 8p1SBmQo9tKF4JGFkS5HPuyBopWfqwunIEaqFyrT945Vf1xzYTmtWV9nb9VJLX8zsrn1
 M8vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=by/OopUDAdONgxn4q3A3x86zJza8AGEnAHL1h9XrwlA=;
 b=g7l2C3Wb1KIVU9Qfkr0E5ge5/+8MzMB3WPgTAFG7rjMV1gjLSKFns8noFkJqwfZ4c6
 q3kKoRo8U5q4c1RNxLnm/NjM/6R0iteRCpoeP7hX6qqWU2ANTYs9GJ7BAr55QxKPPZPw
 gfwlt/e8IYWm4wv+EbQMw3HbOQougEcM+oXVMic2ehp1HRYSigRKMoYqHtLYYFBE0v2J
 sX0BOl29fGEmAqEuT/tEKAHhagDPhC3Exlmjb89/6gu6pVcd02W5fSEAJOeMplX9Ubk4
 /QUQS3cxKP/tLa6MDwyacvy6at7+1sTwLs9jeNdjE4tlKqerbsRZ7PkmAh4woF/uOnN9
 GGzw==
X-Gm-Message-State: AOAM532dpyx/tA0X2rDR4VrX2BjhGHAo7Ox28nW6sAUdZqwCnjw9Ucln
 AQsMdDzDKmXEXxir72ZHBJQYg5XtG2J9XYQ9nDi2ThJz4H5OeA==
X-Google-Smtp-Source: ABdhPJw4g2KYZV/kfYne8D8/Rt3gsqLKzxMgF5/j4tf2oocp2nbLLBXUe6F4ASJoNAHVsagn6Cy/e5/apbhKHyT3ePU=
X-Received: by 2002:a67:1c05:: with SMTP id c5mr15371779vsc.25.1636759126330; 
 Fri, 12 Nov 2021 15:18:46 -0800 (PST)
MIME-Version: 1.0
References: <CAGu1Vjjot17roFD-YTWmQcDhhMD=Lzi3b3Q51cHNRnz+6JT_HQ@mail.gmail.com>
 <CAFEAcA9QexXsrXMHMQrS-aGNbA_4_G2CB+9KeRJqMEF5LQ84ig@mail.gmail.com>
 <87zgtzg33v.fsf@linaro.org>
 <CAGu1Vjix18j69s2n4VjB=zJWvH2rKUeXhhinboCVx0Ba9vuPCw@mail.gmail.com>
In-Reply-To: <CAGu1Vjix18j69s2n4VjB=zJWvH2rKUeXhhinboCVx0Ba9vuPCw@mail.gmail.com>
From: Christopher Caulfield <ctcaulfield@gmail.com>
Date: Fri, 12 Nov 2021 15:18:36 -0800
Message-ID: <CAGu1Vjht4zbgVqkib0zXZypGs1W+dvdFEH9W--zyrn5-UabtQg@mail.gmail.com>
Subject: Re: QEMU on x64
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000004ece6605d09fae43"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::934
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::934;
 envelope-from=ctcaulfield@gmail.com; helo=mail-ua1-x934.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, HTTPS_HTTP_MISMATCH=0.1, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 alexsmendez@live.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000004ece6605d09fae43
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi folks! Wanted to share some documentation if you all want to give QEMU a
try within WinDbg. This is something we've been invested in supporting.

   - Link to public project:
   https://github.com/microsoft/WinDbg-Samples/tree/master/Exdi/exdigdbsrv
   <https://nam06.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit=
hub.com%2Fmicrosoft%2FWinDbg-Samples%2Ftree%2Fmaster%2FExdi%2Fexdigdbsrv&da=
ta=3D04%7C01%7CChristopher.Caulfield%40microsoft.com%7C7f9c66afb4f74e9cd61e=
08d9a625465a%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C63772350132050173=
0%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1ha=
WwiLCJXVCI6Mn0%3D%7C1000&sdata=3DBd%2Bvx2JaYtse35JmHigFtWLQzbXv1H9gZ1NseZB%=
2BF38%3D&reserved=3D0>
   - Link to external readme:  WinDbg-Samples/ExdiGdbSrv_readme.md at
   master =C2=B7 microsoft/WinDbg-Samples =C2=B7 GitHub
   <https://nam06.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit=
hub.com%2Fmicrosoft%2FWinDbg-Samples%2Fblob%2Fmaster%2FExdi%2Fexdigdbsrv%2F=
doc%2FExdiGdbSrv_readme.md&data=3D04%7C01%7CChristopher.Caulfield%40microso=
ft.com%7C7f9c66afb4f74e9cd61e08d9a625465a%7C72f988bf86f141af91ab2d7cd011db4=
7%7C1%7C0%7C637723501320511728%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAi=
LCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&sdata=3DkWn9Tlqtx1erY=
K8Pg0AHCSqNOLAYh171Cb9EmrR9cLg%3D&reserved=3D0>
   .

Anyone planning to add the missing x86-64 system registers to the QEMU
x86-64 GDb server?: QEMU registers support on x64 (#510) =C2=B7 Issues =C2=
=B7 QEMU /
QEMU =C2=B7 GitLab <https://gitlab.com/qemu-project/qemu/-/issues/510>? (I =
just
realized the title isn't great - O well...)

Thanks so much!
-Christopher

On Mon, Aug 2, 2021 at 6:34 PM Christopher Caulfield <ctcaulfield@gmail.com=
>
wrote:

> Thanks folks! I went ahead and made a feature/issue request based on
> Paolo's suggestion:
> QEMU registers support on x64 (#510) =C2=B7 Issues =C2=B7 QEMU / QEMU =C2=
=B7 GitLab
> <https://gitlab.com/qemu-project/qemu/-/issues/510>
>
> Please let me know if someone has the cycles to support this.
>
> -Christopher
>
> On Mon, Aug 2, 2021 at 10:37 AM Alex Benn=C3=A9e <alex.bennee@linaro.org>
> wrote:
>
>>
>> Peter Maydell <peter.maydell@linaro.org> writes:
>>
>> > On Fri, 30 Jul 2021 at 19:05, Christopher Caulfield
>> > <ctcaulfield@gmail.com> wrote:
>> >> This is Christopher from the debugging experiences team at Microsoft
>> focused on kernel debugging. I am reaching out with a few questions abou=
t
>> QEMU on x64.
>> >>
>> >> Is it possible for the QEMU-x86-64 GDB Server to send the full set
>> >> of x64 system registers (whether they are included in a separated
>> >> system xml file or as part of the core registers xml file)?
>> >
>> > Do you mean "is it possible for somebody to write code for
>> > QEMU to make it do that", or "does QEMU do it today if you pass
>> > it the right command line option" ? The answer to the former
>> > is "yes", to the latter "no". (If you want the debugger to
>> > be able to write to the system registers this might be a little
>> > trickier, mostly in terms of "auditing the code to make sure this
>> > can't confuse QEMU if you change some sysreg under its feet.".)
>> >
>> >> e.g. System registers missing from i386-64bit.xml file
>> >
>> >> DWORD64 IDTBase;
>> >> DWORD64 IDTLimit;
>> >> DWORD64 GDTBase;
>> >> DWORD64 GDTLimit;
>> >> DWORD SelLDT;
>> >> SEG64_DESC_INFO SegLDT;
>> >> DWORD SelTSS;
>> >> SEG64_DESC_INFO SegTSS;
>> >>
>> >> How can I access x64 MSR registers by using the QEMU-x86-64 GDB serve=
r?
>> >>
>> >> #define MSR_EFER 0xc0000080 // extended function enable register
>> >
>> > EFER is in the xml ("x64_efer") so should be already accessible.
>> > For anything else you're going to need to write some code to
>> > make it happen.
>> >
>> >>is there any plan to support reading/writing to MSRs via QEMU-x86-64
>> >GDB server?
>>
>> Not at the moment but I am keen to see any eventual solution try to be
>> generic rather than hardwired for one architecture. The ARM code
>> currently builds custom XML from it's register descriptors to expose
>> it's MSR registers to the gdbstub. Ideally architecture front ends
>> should register their registers with a new subsystem which can then do
>> the glue between gdbstub as well as other systems that also care about
>> register values (logging, HMP, TCG plugins).
>>
>> That said I'm not going to block any patches that just fix up the
>> current XML and target/i386/gdbstub code. I'm not familiar enough with
>> what the internal register representation state is for x86 w.r.t to TCG
>> and hypervisor based running modes.
>>
>> > Not that I know of. We'd be happy to review patches if you want to
>> > write them.
>> >
>> > thanks
>> > -- PMM
>>
>>
>> --
>> Alex Benn=C3=A9e
>>
>

--0000000000004ece6605d09fae43
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi folks! Wanted to share some documentation if you all wa=
nt to give QEMU a try within WinDbg. This is something we&#39;ve been inves=
ted in supporting.=C2=A0<div><ul><li>Link to public project:=C2=A0















<span style=3D"font-size:11pt;font-family:Calibri,sans-serif"><a href=3D"ht=
tps://nam06.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.co=
m%2Fmicrosoft%2FWinDbg-Samples%2Ftree%2Fmaster%2FExdi%2Fexdigdbsrv&amp;data=
=3D04%7C01%7CChristopher.Caulfield%40microsoft.com%7C7f9c66afb4f74e9cd61e08=
d9a625465a%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C637723501320501730%=
7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWw=
iLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DBd%2Bvx2JaYtse35JmHigFtWLQzbXv1H9gZ1NseZ=
B%2BF38%3D&amp;reserved=3D0" style=3D"color:rgb(5,99,193)">https://github.c=
om/microsoft/WinDbg-Samples/tree/master/Exdi/exdigdbsrv</a></span></li><li>=
Link to external readme:=C2=A0















<span style=3D"font-size:11pt;font-family:Calibri,sans-serif"><a href=3D"ht=
tps://nam06.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.co=
m%2Fmicrosoft%2FWinDbg-Samples%2Fblob%2Fmaster%2FExdi%2Fexdigdbsrv%2Fdoc%2F=
ExdiGdbSrv_readme.md&amp;data=3D04%7C01%7CChristopher.Caulfield%40microsoft=
.com%7C7f9c66afb4f74e9cd61e08d9a625465a%7C72f988bf86f141af91ab2d7cd011db47%=
7C1%7C0%7C637723501320511728%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLC=
JQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DkWn9Tlqtx1e=
rYK8Pg0AHCSqNOLAYh171Cb9EmrR9cLg%3D&amp;reserved=3D0" style=3D"color:rgb(5,=
99,193)">WinDbg-Samples/ExdiGdbSrv_readme.md
at master =C2=B7 microsoft/WinDbg-Samples =C2=B7 GitHub</a>.</span></li></u=
l>Anyone planning to add the missing x86-64 system registers to the QEMU x8=
6-64 GDb server?<font face=3D"Calibri, sans-serif"><span style=3D"font-size=
:14.6667px">:=C2=A0</span></font><a href=3D"https://gitlab.com/qemu-project=
/qemu/-/issues/510" target=3D"_blank"><span class=3D"gmail-il">QEMU</span>=
=C2=A0registers support on x64 (#510) =C2=B7 Issues =C2=B7=C2=A0<span class=
=3D"gmail-il">QEMU</span>=C2=A0/=C2=A0<span class=3D"gmail-il">QEMU</span>=
=C2=A0=C2=B7 GitLab</a>? (I just realized the title isn&#39;t great - O wel=
l...)</div><div><br></div><div><font face=3D"Calibri, sans-serif"><span sty=
le=3D"font-size:14.6667px">Thanks so much!</span></font></div><div><font fa=
ce=3D"Calibri, sans-serif"><span style=3D"font-size:14.6667px">-Christopher=
</span></font></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">On Mon, Aug 2, 2021 at 6:34 PM Christopher Caulfield &l=
t;<a href=3D"mailto:ctcaulfield@gmail.com">ctcaulfield@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D=
"ltr"><div>Thanks folks! I went ahead and made=C2=A0a feature/issue request=
 based on Paolo&#39;s suggestion:</div><a href=3D"https://gitlab.com/qemu-p=
roject/qemu/-/issues/510" target=3D"_blank">QEMU registers support on x64 (=
#510) =C2=B7 Issues =C2=B7 QEMU / QEMU =C2=B7 GitLab</a><br><div><br></div>=
<div>Please let me know if someone has the cycles to support this.=C2=A0</d=
iv><div><br></div><div>-Christopher</div></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 2, 2021 at 10:37 AM Al=
ex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org" target=3D"_bla=
nk">alex.bennee@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><br>
Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org" target=3D"_bl=
ank">peter.maydell@linaro.org</a>&gt; writes:<br>
<br>
&gt; On Fri, 30 Jul 2021 at 19:05, Christopher Caulfield<br>
&gt; &lt;<a href=3D"mailto:ctcaulfield@gmail.com" target=3D"_blank">ctcaulf=
ield@gmail.com</a>&gt; wrote:<br>
&gt;&gt; This is Christopher from the debugging experiences team at Microso=
ft focused on kernel debugging. I am reaching out with a few questions abou=
t QEMU on x64.<br>
&gt;&gt;<br>
&gt;&gt; Is it possible for the QEMU-x86-64 GDB Server to send the full set=
<br>
&gt;&gt; of x64 system registers (whether they are included in a separated<=
br>
&gt;&gt; system xml file or as part of the core registers xml file)?<br>
&gt;<br>
&gt; Do you mean &quot;is it possible for somebody to write code for<br>
&gt; QEMU to make it do that&quot;, or &quot;does QEMU do it today if you p=
ass<br>
&gt; it the right command line option&quot; ? The answer to the former<br>
&gt; is &quot;yes&quot;, to the latter &quot;no&quot;. (If you want the deb=
ugger to<br>
&gt; be able to write to the system registers this might be a little<br>
&gt; trickier, mostly in terms of &quot;auditing the code to make sure this=
<br>
&gt; can&#39;t confuse QEMU if you change some sysreg under its feet.&quot;=
.)<br>
&gt;<br>
&gt;&gt; e.g. System registers missing from i386-64bit.xml file<br>
&gt;<br>
&gt;&gt; DWORD64 IDTBase;<br>
&gt;&gt; DWORD64 IDTLimit;<br>
&gt;&gt; DWORD64 GDTBase;<br>
&gt;&gt; DWORD64 GDTLimit;<br>
&gt;&gt; DWORD SelLDT;<br>
&gt;&gt; SEG64_DESC_INFO SegLDT;<br>
&gt;&gt; DWORD SelTSS;<br>
&gt;&gt; SEG64_DESC_INFO SegTSS;<br>
&gt;&gt;<br>
&gt;&gt; How can I access x64 MSR registers by using the QEMU-x86-64 GDB se=
rver?<br>
&gt;&gt;<br>
&gt;&gt; #define MSR_EFER 0xc0000080 // extended function enable register<b=
r>
&gt;<br>
&gt; EFER is in the xml (&quot;x64_efer&quot;) so should be already accessi=
ble.<br>
&gt; For anything else you&#39;re going to need to write some code to<br>
&gt; make it happen.<br>
&gt;<br>
&gt;&gt;is there any plan to support reading/writing to MSRs via QEMU-x86-6=
4<br>
&gt;GDB server?<br>
<br>
Not at the moment but I am keen to see any eventual solution try to be<br>
generic rather than hardwired for one architecture. The ARM code<br>
currently builds custom XML from it&#39;s register descriptors to expose<br=
>
it&#39;s MSR registers to the gdbstub. Ideally architecture front ends<br>
should register their registers with a new subsystem which can then do<br>
the glue between gdbstub as well as other systems that also care about<br>
register values (logging, HMP, TCG plugins).<br>
<br>
That said I&#39;m not going to block any patches that just fix up the<br>
current XML and target/i386/gdbstub code. I&#39;m not familiar enough with<=
br>
what the internal register representation state is for x86 w.r.t to TCG<br>
and hypervisor based running modes.<br>
<br>
&gt; Not that I know of. We&#39;d be happy to review patches if you want to=
<br>
&gt; write them.<br>
&gt;<br>
&gt; thanks<br>
&gt; -- PMM<br>
<br>
<br>
-- <br>
Alex Benn=C3=A9e<br>
</blockquote></div>
</blockquote></div>

--0000000000004ece6605d09fae43--

