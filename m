Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACDC4283C3
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Oct 2021 23:24:15 +0200 (CEST)
Received: from localhost ([::1]:37960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZgIn-0000FU-Hb
	for lists+qemu-devel@lfdr.de; Sun, 10 Oct 2021 17:24:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <t0rr3sp3dr0@gmail.com>)
 id 1mZgGu-0007l6-PF
 for qemu-devel@nongnu.org; Sun, 10 Oct 2021 17:22:16 -0400
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30]:37864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <t0rr3sp3dr0@gmail.com>)
 id 1mZgGo-0003Qs-Lv
 for qemu-devel@nongnu.org; Sun, 10 Oct 2021 17:22:12 -0400
Received: by mail-vs1-xe30.google.com with SMTP id f2so16713663vsj.4
 for <qemu-devel@nongnu.org>; Sun, 10 Oct 2021 14:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:content-transfer-encoding:mime-version:subject:from
 :in-reply-to:cc:date:message-id:references:to;
 bh=gRLn8y3mwKB8CdGfRG2YWK4+1KzHopjUd1iZtPBSEfc=;
 b=CdXHwNj/gOsxa8jszVc62p3sSnFIdw6beI51YooMXJK80wt4qCsDHHZfUs6TMCFw0S
 pKXF78f9DDjtViAi9bzt171vgWqmJ2QggjL9hyTCrXprQPVCmkloTVfKMf3Vul1IUi3U
 s2OgtYNrMx7eS/brf52sX3sJwlyvv4AirftpQwrGNjfsHcg9mqtG6pt+LQxJ2iT+QbU8
 KK0motujV1GWQJcXaLyOYHTc4wOZlLKZu1ghnACGaD7EZSDwVphp2rV8FP0sJe0a9+9q
 aNaPVkOJowsaom7Lv5ZrLmxk6p7yS+ED18ED7L3lnfu68l6Ss5N3pHprg/02tSqJVllJ
 72sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:content-transfer-encoding:mime-version
 :subject:from:in-reply-to:cc:date:message-id:references:to;
 bh=gRLn8y3mwKB8CdGfRG2YWK4+1KzHopjUd1iZtPBSEfc=;
 b=tYqeAhztz3YA+BeLB/q06Vd8NrcA7jdCwjTQwoolrFY4CdCE29VLkKrhrskGYViCaj
 YKqLIAMk6Nwxvvd1HuC9hAgnFJA8i+pg3Mjw/nluRhG4CBI+OYmQDb08BuSizbg/Y+St
 8OqCnzVlSY/BnLcKy4ZusOUOCOHm5hjIqIyiED3FKy80C6OPJzW+1PpWo8h01O5I9iEa
 OUhe7q041B/wpqEl4XP3qfwe/TnPcZtFwxuj3MvWePE08uODC1NKMTTZ0loabvB7mpow
 0F17VBPTXXbQZ4vBxoGN+LL5HDT9aTRqX3TGyBg9sjh2+t72484XE1eJVS7d27A5ZPR4
 2l5w==
X-Gm-Message-State: AOAM531aMUEN/A/RpmhUIfOOevE1eb3XCxrzBM4NrxPWrL7IMGH7la+b
 IchQpTi71Sugs2lXtyZqn5U=
X-Google-Smtp-Source: ABdhPJweUrkKTa3gi+OJmht8Glr5r9lYiMRj6uQeVavn67U/3J59tGSVQmP1Bqh1kRXnV0zAIHvHoA==
X-Received: by 2002:a05:6102:c13:: with SMTP id
 x19mr4625723vss.4.1633900928363; 
 Sun, 10 Oct 2021 14:22:08 -0700 (PDT)
Received: from smtpclient.apple ([191.187.160.179])
 by smtp.gmail.com with ESMTPSA id o19sm1580534vsl.29.2021.10.10.14.22.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Oct 2021 14:22:07 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary=Apple-Mail-ED8FE4B6-A642-46F3-ACF8-59B614E1ABB4
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] hw/misc: applesmc: use host osk as default on macs
From: =?utf-8?Q?Pedro_T=C3=B4rres?= <t0rr3sp3dr0@gmail.com>
In-Reply-To: <CABgObfZvicuKLqkDqK3a4zn92LRiC_g--_oT-7sPgTO3O1PrAQ@mail.gmail.com>
Date: Sun, 10 Oct 2021 18:22:04 -0300
Message-Id: <001C97D2-2710-415C-9ECD-F8C20AB52196@gmail.com>
References: <CABgObfZvicuKLqkDqK3a4zn92LRiC_g--_oT-7sPgTO3O1PrAQ@mail.gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
X-Mailer: iPhone Mail (19A348)
Received-SPF: pass client-ip=2607:f8b0:4864:20::e30;
 envelope-from=t0rr3sp3dr0@gmail.com; helo=mail-vs1-xe30.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 MIME_QP_LONG_LINE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Phil Dennis-Jordan <phil@philjordan.eu>, rene@exactcode.de, "Kiszka,
 Jan" <jan.kiszka@siemens.com>, qemu-devel <qemu-devel@nongnu.org>, "Graf,
 Alexander" <agraf@suse.de>, "Gabriel L. Somlo" <gsomlo@gmail.com>,
 suse@csgraf.de, afaerber <afaerber@suse.de>,
 =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Apple-Mail-ED8FE4B6-A642-46F3-ACF8-59B614E1ABB4
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

AFAIK there=E2=80=99s no public documentation from Apple on how to read valu=
es from SMC.

But Amit Singh wrote a book, Mac OS X Internals, and one of the processes de=
scribed on it is how to read OSK directly from SMC: https://web.archive.org/=
web/20190630050544/http://osxbook.com/book/bonus/chapter7/tpmdrmmyth/

This is actually referenced on VirtualBox=E2=80=99s source code as the base f=
or their implementation: https://www.virtualbox.org/browser/vbox/trunk/src/V=
Box/Devices/EFI/DevSmc.cpp#L520

Additionally, there is the smcFanControl project, licensed under GPLv2, that=
 performs reads and writes on SMC and have all information necessary to impl=
ement this feature on QEMU: https://github.com/hholtmann/smcFanControl

This project was used as base for the SMC in-tree driver for Linux and it=E2=
=80=99s referenced there: https://github.com/torvalds/linux/blob/master/driv=
ers/hwmon/applesmc.c#L14

I think we would be safe using these sources as the base for our implementat=
ion, given that other huge GPL projects like Linux and VirtualBox have been u=
sing them for years.

Best regards,
Pedro T=C3=B4rres

> On Oct 10, 2021, at 4:25 PM, Paolo Bonzini <pbonzini@redhat.com> wrote:
> =EF=BB=BF
> Can you instead provide documentation in English (pseudocode, tables of th=
e structs, etc.)? That's the safest bet.
>=20
> Paolo
>=20
> El s=C3=A1b., 9 oct. 2021 7:32, Pedro T=C3=B4rres <t0rr3sp3dr0@gmail.com> e=
scribi=C3=B3:
>> Hey Paolo and Phil,
>>=20
>> I understand you concerns regarding the license that Apple open-source co=
de is distributed.
>>=20
>> If I restart from scratch and implement this feature based only on Virtua=
lBox code, that is distributed under GPLv2, would it be fine?
>>=20
>> Best regards,
>> Pedro T=C3=B4rres
>>=20
>>> On Oct 8, 2021, at 3:54 PM, Paolo Bonzini <pbonzini@redhat.com> wrote:
>>> =EF=BB=BFOn 08/10/21 14:03, Phil Dennis-Jordan wrote:
>>>> 1. Licensing
>>>> Given that the code it's heavily based on is copyright Apple Computer I=
nc., licensed under APSL, is it safe including it in qemu as is?
>>>> If the integrated code is going to be quite so "directly inspired" (dow=
n to the inconsistent struct definition style and mixing unrelated constants=
 in the same anonymous enum), perhaps at minimum place it in its own isolate=
d source file with appropriate notice?
>>>=20
>>> Yeah, this should be reverted.
>>>=20
>>> Pedro, I understand that you stated it was "based on code from Apple" bu=
t you also said (by including Signed-off-by) that
>>>=20
>>> ---
>>> (a) The contribution was created in whole or in part by me and I
>>>    have the right to submit it under the open source license
>>>    indicated in the file; or
>>>=20
>>> (b) The contribution is based upon previous work that, to the best
>>>    of my knowledge, is covered under an appropriate open source
>>>    license and I have the right under that license to submit that
>>>    work with modifications, whether created in whole or in part
>>>    by me, under the same open source license (unless I am
>>>    permitted to submit under a different license), as indicated
>>>    in the file; or
>>> ---
>>>=20
>>> and this is not true.
>>>=20
>>> Thanks very much,
>>>=20
>>> Paolo

--Apple-Mail-ED8FE4B6-A642-46F3-ACF8-59B614E1ABB4
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div dir=3D"ltr"><meta http-equiv=3D"conten=
t-type" content=3D"text/html; charset=3Dutf-8">AFAIK there=E2=80=99s no publ=
ic documentation from Apple on how to read values from SMC.<div><br></div><d=
iv>But Amit Singh wrote a book, Mac OS X Internals, and one of the processes=
 described on it is how to read OSK directly from SMC:&nbsp;<a href=3D"https=
://web.archive.org/web/20190630050544/http://osxbook.com/book/bonus/chapter7=
/tpmdrmmyth/">https://web.archive.org/web/20190630050544/http://osxbook.com/=
book/bonus/chapter7/tpmdrmmyth/</a></div><div><br></div><div><span style=3D"=
caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);">This is actually referenced=
 on VirtualBox=E2=80=99s source code as the base for their implementation:&n=
bsp;</span><a href=3D"https://www.virtualbox.org/browser/vbox/trunk/src/VBox=
/Devices/EFI/DevSmc.cpp#L520">https://www.virtualbox.org/browser/vbox/trunk/=
src/VBox/Devices/EFI/DevSmc.cpp#L520</a></div><div><br></div><div>Additional=
ly, there is the smcFanControl project, licensed under GPLv2, that performs r=
eads and writes on SMC and have all information necessary to implement this f=
eature on QEMU:&nbsp;<a href=3D"https://github.com/hholtmann/smcFanControl">=
https://github.com/hholtmann/smcFanControl</a></div><div><br></div><div>This=
 project was used as base for the SMC in-tree driver for Linux and it=E2=80=99=
s referenced there:&nbsp;<a href=3D"https://github.com/torvalds/linux/blob/m=
aster/drivers/hwmon/applesmc.c#L14">https://github.com/torvalds/linux/blob/m=
aster/drivers/hwmon/applesmc.c#L14</a></div><div><br></div><div>I think we w=
ould be safe using these sources as the base for our implementation, given t=
hat other huge GPL projects like Linux and VirtualBox have been using them f=
or years.</div><div><div><br><div dir=3D"ltr">Best regards,</div><div dir=3D=
"ltr">Pedro T=C3=B4rres</div><div dir=3D"ltr"><br><blockquote type=3D"cite">=
On Oct 10, 2021, at 4:25 PM, Paolo Bonzini &lt;pbonzini@redhat.com&gt; wrote=
:<br><br></blockquote></div><blockquote type=3D"cite"><div dir=3D"ltr">=EF=BB=
=BF<div dir=3D"auto">Can you instead provide documentation in English (pseud=
ocode, tables of the structs, etc.)? That's the safest bet.<div dir=3D"auto"=
><br></div><div dir=3D"auto">Paolo</div></div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">El s=C3=A1b., 9 oct. 2021 7:32, Pedro=
 T=C3=B4rres &lt;<a href=3D"mailto:t0rr3sp3dr0@gmail.com">t0rr3sp3dr0@gmail.=
com</a>&gt; escribi=C3=B3:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"=
auto"><div dir=3D"ltr"><div dir=3D"ltr">Hey Paolo and Phil,</div><div dir=3D=
"ltr"><br></div><div dir=3D"ltr">I understand you concerns regarding the lic=
ense that Apple open-source code is distributed.</div><div dir=3D"ltr"><br><=
/div><div dir=3D"ltr">If I restart from scratch and implement this feature b=
ased only on VirtualBox code, that is distributed under GPLv2, would it be f=
ine?<br><br><div dir=3D"ltr">Best regards,</div><div id=3D"m_-53530195716819=
75835AppleMailSignature" dir=3D"ltr">Pedro T=C3=B4rres</div><div dir=3D"ltr"=
><br><blockquote type=3D"cite">On Oct 8, 2021, at 3:54 PM, Paolo Bonzini &lt=
;<a href=3D"mailto:pbonzini@redhat.com" target=3D"_blank" rel=3D"noreferrer"=
>pbonzini@redhat.com</a>&gt; wrote:<br><br></blockquote></div><blockquote ty=
pe=3D"cite"><div dir=3D"ltr">=EF=BB=BF<span>On 08/10/21 14:03, Phil Dennis-J=
ordan wrote:</span><br><blockquote type=3D"cite"><span>1. Licensing</span><b=
r></blockquote><blockquote type=3D"cite"><span>Given that the code it's heav=
ily based on is copyright Apple Computer Inc., licensed under APSL, is it sa=
fe including it in qemu as is?</span><br></blockquote><blockquote type=3D"ci=
te"><span>If the integrated code is going to be quite so "directly inspired"=
 (down to the inconsistent struct definition style and mixing unrelated cons=
tants in the same anonymous enum), perhaps at minimum place it in its own is=
olated source file with appropriate notice?</span><br></blockquote><span></s=
pan><br><span>Yeah, this should be reverted.</span><br><span></span><br><spa=
n>Pedro, I understand that you stated it was "based on code from Apple" but y=
ou also said (by including Signed-off-by) that</span><br><span></span><br><s=
pan>---</span><br><span>(a) The contribution was created in whole or in part=
 by me and I</span><br><span> &nbsp;&nbsp;&nbsp;have the right to submit it u=
nder the open source license</span><br><span> &nbsp;&nbsp;&nbsp;indicated in=
 the file; or</span><br><span></span><br><span>(b) The contribution is based=
 upon previous work that, to the best</span><br><span> &nbsp;&nbsp;&nbsp;of m=
y knowledge, is covered under an appropriate open source</span><br><span> &n=
bsp;&nbsp;&nbsp;license and I have the right under that license to submit th=
at</span><br><span> &nbsp;&nbsp;&nbsp;work with modifications, whether creat=
ed in whole or in part</span><br><span> &nbsp;&nbsp;&nbsp;by me, under the s=
ame open source license (unless I am</span><br><span> &nbsp;&nbsp;&nbsp;perm=
itted to submit under a different license), as indicated</span><br><span> &n=
bsp;&nbsp;&nbsp;in the file; or</span><br><span>---</span><br><span></span><=
br><span>and this is not true.</span><br><span></span><br><span>Thanks very m=
uch,</span><br><span></span><br><span>Paolo</span><br><span></span><br></div=
></blockquote></div></div></div></blockquote></div>
</div></blockquote></div></div></div></body></html>=

--Apple-Mail-ED8FE4B6-A642-46F3-ACF8-59B614E1ABB4--

