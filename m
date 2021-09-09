Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B39BD4048A3
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 12:40:48 +0200 (CEST)
Received: from localhost ([::1]:57134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOHU7-0007LY-MW
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 06:40:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1mOHOu-000722-6Z
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 06:35:24 -0400
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235]:42815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1mOHOr-0004F7-VW
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 06:35:23 -0400
Received: by mail-oi1-x235.google.com with SMTP id bi4so1887679oib.9
 for <qemu-devel@nongnu.org>; Thu, 09 Sep 2021 03:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dS+yUxx/buYeawpYFrw3vNpBlP8t9U6X88rRdQ7V2YY=;
 b=mUk2xynghD3U8nwjzw9IXqJvCn7wwhV42dw8i/WTcWFoIZAoKWDkC7l1xXhd+k1Yea
 mVLNf/Ch0acegmMfvV2GJanu2FVNO+ZWtvFCcv+x2UW5aHb2qoEdkJifiK9wa6qE8Ohm
 rrmQtShAGvKbibR29y5y0DUZQn0C+ODOiTyWjJAIrLkXMpuBKUd40bMhee7oMhq7J+2D
 7rcZ990yOJa1u7lHQI0fY+g1QdxYqIfafOTUVW9ypp8N4iqUC1HLB8U1d62BTdRzc3hV
 7RZjpVyBk+rzWS5Lqq+BjrHoVcX1IbBj7U8dL5VbUteygfZpZUaaNDy2xMUu5rbaYbnb
 UsJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dS+yUxx/buYeawpYFrw3vNpBlP8t9U6X88rRdQ7V2YY=;
 b=h/JRK4TxRmxrp4vM+qQaGxMOCDFFbON+ckObC77JRESB2q0noMcNBMTzG8fiYYhFgr
 U6ICR1F8n1x754RZmOoyGYo0BwmcDYzuusb57qWlqTo+Tegu08V3K3lDHHRd1XhmZ9C/
 pD6QRiIKfWkhUk97i7Ajni1qjL+XEB3sbHtYRakzVApVZsEh48873jOf4rQ21MSGVU+P
 41aOO2dXLnY2beWuZblsVVrJ7owllmjNfo4mJIz3dHQO8s7LkCEnfacErAi8ImODtspj
 egH7aTKvJDu6riPws2jM7MXcpZ+GUSpliF/OcUej9UNBH6nPIqZB3dyIQXbWi0fWYXzW
 93gg==
X-Gm-Message-State: AOAM531+SFxou/aABukCYJuj5xxQma4TJYI31o+8pg/abY2U1E2VEmAF
 BIBZ67XsLcfvKGD31BEQp5/0NlPT9x8i9ieWpMegGw==
X-Google-Smtp-Source: ABdhPJxztDvz4XE+PU/juxwllrg0o/Wv7i/rNFfYoZvgHh9mZFI+7dMekSaE6eHTV4coXd0MoK3X5EMoIGMBcB69WCs=
X-Received: by 2002:a05:6808:201c:: with SMTP id
 q28mr1506144oiw.18.1631183719949; 
 Thu, 09 Sep 2021 03:35:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210713153758.323614-1-andrew@daynix.com>
 <20210713153758.323614-6-andrew@daynix.com>
 <87y29dct4m.fsf@dusky.pond.sub.org>
 <CABcq3pE3vAh=Cs=VjjkioooEbbPjgNEtCEZGwtoxaCn0OCRQkg@mail.gmail.com>
 <877dgbpco1.fsf@dusky.pond.sub.org>
 <CAOEp5OcyvQ9Y2onyHuJnwjtWK+Tx9QxYXUePd1kJ=V9+H9wraw@mail.gmail.com>
 <87v93n8nu3.fsf@dusky.pond.sub.org>
 <CAOEp5Of0C4yUhwbgFmu4roiEmNXZ8qiNMUA3CCBE8Zwu=OWhtQ@mail.gmail.com>
 <87a6kz8i4g.fsf@dusky.pond.sub.org>
 <CAOEp5OfxM+YyZFMUxDrcOw6eKRhyhouJ3q+UnAx3x7sXhQQvHQ@mail.gmail.com>
 <87k0k1wtfc.fsf@dusky.pond.sub.org>
 <CABcq3pEvHUB1K_+gkwP1NpOSxFYs563WSOmAOh4qvvGczCpytA@mail.gmail.com>
 <87bl5cdav0.fsf@dusky.pond.sub.org>
 <CABcq3pGzs=RqLCuu70KyWt7W6T=qEhihK6v=iHJyfuGqiN_Q+A@mail.gmail.com>
 <CAOEp5Oc_uUn2nJq+B+SK-iQSo5udyUTirWHS5=8N0JxerRaz7A@mail.gmail.com>
In-Reply-To: <CAOEp5Oc_uUn2nJq+B+SK-iQSo5udyUTirWHS5=8N0JxerRaz7A@mail.gmail.com>
From: Andrew Melnichenko <andrew@daynix.com>
Date: Thu, 9 Sep 2021 13:35:08 +0300
Message-ID: <CABcq3pF4P50=Rv8J9M4_Gm-bG7ntP+8f5KkjkEz3TTZAXa6RBw@mail.gmail.com>
Subject: Re: [PATCH 5/5] qmp: Added qemu-ebpf-rss-path command.
To: Markus Armbruster <armbru@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000030fc6605cb8d8ee6"
Received-SPF: none client-ip=2607:f8b0:4864:20::235;
 envelope-from=andrew@daynix.com; helo=mail-oi1-x235.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Yuri Benditovich <yuri.benditovich@daynix.com>,
 Yan Vugenfirer <yan@daynix.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000030fc6605cb8d8ee6
Content-Type: text/plain; charset="UTF-8"

Hi,

> Ther first two are bogus.  /work/armbru/tmp/inst-qemu/... is where "make
> install" would put things.  I last ran "make install" almost three
> months ago.
>
The stamp check is implemented only for the RSS helper. Qemu looks for a
helper first in HelpDir, then next to the binary.
Bridge/PR helpers found in "inst-qemu" according to build configuration.
To be more strict, for the next patch we may return only ebpf helper in the
list. Other helpers may be added later with stamp check.

 It's still unreliable in the sense of "may not
> find the helper"
>
Ok, I see the problem.
Here I can propose possible solutions:

   1. Add the argument to QMP request - the path(s) where the qemu should
   look for helper by priority: argument path, installation dir, qemu's dir.
   And return an array of all possible helpers binaries.
   2. Retrieve the stamp from QMP request, so Libvirt may check the stamp
   by itself.
   3. Set suid bit to helper and pass the helper's path to the qemu, so
   qemu may run it by itself.

Searching the ELF symbol table requires ELF.  I suspect your meson.build
> doesn't reflect that.
>

>
It also requires the symbol table to be present.  Statically linked
> programs don't have one, if I remember correctly.
>

Well, qemu-ebpf-rss-helper is only for Linux and expectations are to have
ELF binaries.
The helper builds dynamically linked with libbpf.so at least.

Management applications run qemu-system-FOO and helpers.  They know
> where to find qemu-system-FOO.  It stands to reason that they also know
> where to find the matching helpers.  I fail to see why they need help
> from qemu-system-FOO via QMP.  Even if they need help, qemu-system-FOO
> can't give it, because it cannot know for sure.  It is wherever the
> system administrator / distro put it.
>

We may have several different qemu builds which may require different rss
helpers.
Domain with a custom emulator:

>
> *  <devices>
> <emulator>/path_to_my_awesome_qemu_with_custom_bpf/qemu-system-FOO</emulator>
> *
>
Libvirt would gather properties of that qemu and we need to provide the
proper helper for it.
The "default" helper from libvirt configure may not suit the qemu.
So the idea is to ask the qemu itself where is a possible helper.
So Libvirt may use only <emulator> without additional changes in XML
document.

So we need to solve next cases:


   - System admin or distributor places the qemu and helpers in InstallPath.
   Libvirt uses installed qemu and helpers. No hints from qemu are required.
   - Libvirt uses custom qemu <emulator>. Libvirt doesn't know where is the
   helper
   that was built with custom qemu. Qemu if finds the helper - verifies the
   stamp, to make sure.
   - Custom-built qemu is installed in the configured path(proper prefix
   etc.). Libvirt may
   use that emulator but don't know where is the helper - qemu knows and
   may provide a hint.


There are much easier ways for that than searching through ELF symbol
> tables.  Have a command line option to print it.  For qemu-system-FOO,
> you can also have a QMP command to query it.
>
The stamp was added in a similar way as qemu modules(special symbol,
checked during load).
Also, checking the stamp without running is a good security measure.

I get a few warnings.  I'm copying the ones from Clang:
>
Thank you, I'll fix them in v2 patches with rebased tree.

--00000000000030fc6605cb8d8ee6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex"><div>Ther first two are bogus.=C2=A0 /work/armbru/tmp/inst-qemu/... i=
s where &quot;make<br>
install&quot; would put things.=C2=A0 I last ran &quot;make install&quot; a=
lmost three<br>
months ago.</div></blockquote><div>The stamp check is implemented only for =
the RSS helper. Qemu looks for a helper first in HelpDir, then next to the =
binary.</div><div>Bridge/PR helpers found in &quot;inst-qemu&quot; accordin=
g to build configuration.</div><div>To be more strict, for the next patch w=
e may return only ebpf helper in the list. Other helpers may be added later=
 with stamp check.<br></div><div><br></div><span class=3D"gmail-im"><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex"><div>=C2=A0It&#39;s still unreli=
able in the sense of &quot;may not<br>
find the helper&quot;</div></blockquote></span><div>Ok, I see the problem.<=
/div><div>Here I can propose possible solutions:</div><div><ol><li>Add
 the argument to QMP request - the path(s) where the qemu should look for=
=20
helper by priority: argument path, installation dir, qemu&#39;s dir. And=20
return an array of all possible helpers binaries.<br></li><li>Retrieve the =
stamp from QMP request, so Libvirt may check the stamp by itself.</li><li>S=
et suid bit to helper and pass the helper&#39;s path to the qemu, so qemu m=
ay run it by itself.</li></ol><span class=3D"gmail-im"><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex"><div>Searching the ELF symbol table requires =
ELF.=C2=A0 I suspect your meson.build<br>
doesn&#39;t reflect that.</div></blockquote><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex"><div>=C2=A0</div></blockquote><div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">It also requires the symbol table to be presen=
t.=C2=A0 Statically linked<br>
programs don&#39;t have one, if I remember correctly.<span></span><br><span=
></span></blockquote>=C2=A0</div></span><div>Well, qemu-ebpf-rss-helper is =
only for Linux and expectations are to have ELF binaries.</div><div>The hel=
per builds dynamically linked with libbpf.so at least.<br></div><span class=
=3D"gmail-im"><div><br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex"><div>Management applications run qemu-system-FOO and helpers.=C2=A0 The=
y know<br>
where to find qemu-system-FOO.=C2=A0 It stands to reason that they also kno=
w<br>
where to find the matching helpers.=C2=A0 I fail to see why they need help<=
br>
from qemu-system-FOO via QMP.=C2=A0 Even if they need help, qemu-system-FOO=
<br>
can&#39;t give it, because it cannot know for sure.=C2=A0 It is wherever th=
e<br>
system administrator / distro put it.</div></blockquote><div>=C2=A0</div></=
span><div>We may have several different qemu builds which may require diffe=
rent rss helpers.<br></div><div>Domain with a custom emulator:</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex"><div><i>=C2=A0 &lt;devices&gt;<b=
r>=C2=A0 =C2=A0 &lt;emulator&gt;/path_to_my_awesome_qemu_with_custom_bpf/qe=
mu-system-FOO&lt;/emulator&gt; </i><br></div></blockquote><div>Libvirt woul=
d gather properties of that qemu and we need to provide the proper helper f=
or it.</div><div>The &quot;default&quot; helper from libvirt configure may =
not suit the qemu.<br></div><div>So the idea is to ask the qemu itself wher=
e is a possible helper.</div><div>So Libvirt may use only &lt;emulator&gt; =
without additional changes in XML document.<br></div><span class=3D"gmail-i=
m"><div><br></div><div>So we need to solve next cases:</div><div><br></div>=
</span><ul><li><span class=3D"gmail-im"></span><span class=3D"gmail-im">Sys=
tem admin or distributor places the qemu and helpers in InstallPath.<br>Lib=
virt uses installed qemu and helpers. No hints from qemu are required.</spa=
n></li><li><span class=3D"gmail-im">Libvirt uses custom qemu &lt;emulator&g=
t;. Libvirt doesn&#39;t know where is the helper<br>that was built with cus=
tom qemu. Qemu if finds the helper - verifies the stamp, to make sure.</spa=
n></li><li><span class=3D"gmail-im">Custom-built qemu is installed in the c=
onfigured path(proper prefix etc.). Libvirt may<br>use that emulator but do=
n&#39;t know where is the helper - qemu knows and may provide a hint.</span=
></li></ul><span class=3D"gmail-im"><div><br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><div>There are much easier ways for that than sea=
rching through ELF symbol<br>
tables.=C2=A0 Have a command line option to print it.=C2=A0 For qemu-system=
-FOO,<br>
you can also have a QMP command to query it.</div></blockquote></span><div>=
The stamp was added in a similar way as qemu modules(special symbol, checke=
d during load).</div><div>Also, checking the stamp without running is a goo=
d security measure.</div><span class=3D"gmail-im"><div><br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex"><div>I get a few warnings.=C2=A0 I&=
#39;m copying the ones from Clang:</div></blockquote></span><div>Thank you,=
 I&#39;ll fix them in v2 patches with rebased tree.</div></div></div>

--00000000000030fc6605cb8d8ee6--

