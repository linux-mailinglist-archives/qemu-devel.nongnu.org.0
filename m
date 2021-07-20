Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 665BB3D020E
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 21:10:24 +0200 (CEST)
Received: from localhost ([::1]:46042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5v8J-0003Xj-GH
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 15:10:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1m5v7E-0002gW-7Z
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 15:09:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1m5v7C-0002X0-AJ
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 15:09:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626808153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iT6hCEP4EY658ABRdcjCdsamC2BP5/78Uux7mZHdSfg=;
 b=ILlFgaICefBQSzbMZjMMhznixKyiS1cVkir9LDZ6L/z1iFMMYnOFpt/FOlZveBi2Kr7Lee
 v7axQvH4WVbIeE6I8DE9CT4AO8Nhf92S9bP+qMVmXE2vYisQ7YTe1WX46B6qrzW1OjF3xZ
 oP6ck6XejPbEDXdtF1ZxbpwUx5oSxRw=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-508-Nlv6qmbKMXuGpTh9AFv_CA-1; Tue, 20 Jul 2021 15:09:10 -0400
X-MC-Unique: Nlv6qmbKMXuGpTh9AFv_CA-1
Received: by mail-oi1-f198.google.com with SMTP id
 q34-20020a0568082022b029025c5504f461so130589oiw.22
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 12:09:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iT6hCEP4EY658ABRdcjCdsamC2BP5/78Uux7mZHdSfg=;
 b=GXwXeoKtLc9wrNdHdt8YWM87ZWmSPOBwnmEZheIBPFSWfuGC2LXgJyDHyIoojwdQR8
 hFwEhUCsy/8Zrk6g0QrFO65SQ6sdSXVWA3tcvi3mRdu/nUvxjqCJKoMG1TF1MFWlSQT0
 OWnsYGZvDQ/unh07Vp3P/WxYlxPq85H8VZfrybdaJy32XTYFKDzIKXfxg8/h3Itx/U7c
 Uf45UBKryb3/+1wFtTBbjJzaI5aOuQCURBalBliw1/bvaTJHBfBQKcd09UNyuqWsXcKK
 osFgDmsv5tuGSostdxQyUqvecdr1NvDyQdSLd5sws+rojpJub4VfwvjUHAKNLd7Rl7+3
 tkWw==
X-Gm-Message-State: AOAM533IMoXdPygfyNk8g8fMZ13l8nafoNuR8K+dKzR5vJqZfxSLnxg+
 tkvvY9uekReHVnJUukzcil27b2xz5Gv1qGrfyc8K/2X0QlWPQH7iVyrg+DWoe+kET402WC2cVeb
 n8JmmdJtkYUFHZU8DzzYbIWeB09e1rUY=
X-Received: by 2002:a9d:86d:: with SMTP id 100mr23997438oty.45.1626808149717; 
 Tue, 20 Jul 2021 12:09:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw4xHEA8SJ16q54QcyXCE9oZbAQBrkxmVHa6e/mHPlH7b+N38BXLlJrF93+X99GDuWdb0x71ATekYc2GEpFiBA=
X-Received: by 2002:a9d:86d:: with SMTP id 100mr23997428oty.45.1626808149548; 
 Tue, 20 Jul 2021 12:09:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210713220734.26302-1-niteesh.gs@gmail.com>
 <CAN6ztm97cJrVZ3=XPr9R8WoepOw81XAGXUO3fHB5nt7L9fWS4w@mail.gmail.com>
In-Reply-To: <CAN6ztm97cJrVZ3=XPr9R8WoepOw81XAGXUO3fHB5nt7L9fWS4w@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 20 Jul 2021 15:08:58 -0400
Message-ID: <CAFn=p-aP5y=a56BK7X-B4KO8YL+d3O_MX3ekp3NQnGLGs8Dnww@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] python: AQMP-TUI Prototype
To: "Niteesh G. S." <niteesh.gs@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000df307e05c792c9c0"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Cleber Rosa <crosa@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000df307e05c792c9c0
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 14, 2021 at 3:07 PM Niteesh G. S. <niteesh.gs@gmail.com> wrote:

> Hello all,
>
> UPDATE:  The pipelines have run and all tests passed #336491916
> Usually, the pipelines start running as soon as I push my code. But this
> time they took longer to start and there was no sign of starting. This is
> my
> first experience with pipelines so I assumed I messed up something from
> my side.
>
> Thanks,
> Niteesh.
>
> On Wed, Jul 14, 2021 at 3:37 AM G S Niteesh Babu <niteesh.gs@gmail.com>
> wrote:
>
>> GitLab:
>> https://gitlab.com/niteesh.gs/qemu/-/commits/aqmp-tui-prototype-v1/
>> Based-on
>> <https://gitlab.com/niteesh.gs/qemu/-/commits/aqmp-tui-prototype-v1/Based-on>:
>> <20210701041313.1696009-1-jsnow@redhat.com>
>>      [PATCH 00/20] python: introduce Asynchronous QMP package
>>
>> Updates in V2:
>> 1) Moved loop related initialization to 'run' function in 'App' class
>> 2) Added a module logger with support in TUI log messages.
>> 3) Corrected usage of logging.info and logging.debug
>> 4) Added an option in setup.cfg to silent pylint regarding duplicate-code
>> 4) Modified the arguments list to the TUI
>>
>> NOTE: I am not able to get the pipelines running after the v2 changes.
>> I was only able to test the changes locally using *make check*.
>>
>>
Why not?


> This patch series introduces AQMP-TUI prototype. This prototype has been
>> helpfull in letting us try out different ideas and giving some insights
>> into things that we had to take care of in the upcoming TUI. It was also
>> helpfull in finding out bugs in the AQMP library.
>>
>> The intent for this patch series is to get comments on the architectural
>> design of the prototype. These comments will lay down the foundation for
>> the upcoming TUI.
>>
>> G S Niteesh Babu (6):
>>   python: disable pylint errors for aqmp-tui
>>   python: Add dependencies for AQMP TUI
>>   python/aqmp-tui: Add AQMP TUI draft
>>   python: add optional pygments dependency
>>   python/aqmp-tui: add syntax highlighting
>>   python: add entry point for aqmp-tui
>>
>>  python/Pipfile.lock          |  20 ++
>>  python/qemu/aqmp/aqmp_tui.py | 342 +++++++++++++++++++++++++++++++++++
>>  python/setup.cfg             |  36 +++-
>>  3 files changed, 397 insertions(+), 1 deletion(-)
>>  create mode 100644 python/qemu/aqmp/aqmp_tui.py
>>
>>
Thanks Niteesh, a few general comments that don't relate directly to the
code:

1. It would be nice to be able to highlight/copy-paste things out of the
history window, I seemingly can't right now.

2. It would be nice if the mouse scroll wheel worked on the history panel.

3. A greeting message like the old qmp-shell might be nice to see. It would
be good if it explained how to quit the program (esc, ctrl^c) and send
messages (alt+enter).

4. Some control hints or reminder text in the footer might be nice, for how
to quit, send a message, etc.

For the next revision, I may ask you to start looking into making sure that
mypy and pylint pass without exemptions. Do the best you can, and get as
far as you are able. You can leave the warnings disabled for V3, but I'd
like you to start taking a look now so that you know where the trouble
spots are.

Thanks!
--js

--000000000000df307e05c792c9c0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 14, 2021 at 3:07 PM Nitee=
sh G. S. &lt;<a href=3D"mailto:niteesh.gs@gmail.com">niteesh.gs@gmail.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><d=
iv dir=3D"ltr"><div dir=3D"ltr"><div style=3D"font-size:small">Hello all,</=
div><div style=3D"font-size:small"><br></div><div style=3D"font-size:small"=
>UPDATE:=C2=A0 The pipelines have run and all tests passed #336491916</div>=
<div style=3D"font-size:small">Usually, the pipelines start running as soon=
 as I push my code. But this</div><div style=3D"font-size:small">time they =
took longer to start and there was no sign of starting. This is my</div><di=
v style=3D"font-size:small">first experience=C2=A0with pipelines so I assum=
ed I messed up something from</div><div style=3D"font-size:small">my side.<=
/div><div style=3D"font-size:small"><br></div><div style=3D"font-size:small=
">Thanks,</div><div style=3D"font-size:small">Niteesh.</div></div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 14,=
 2021 at 3:37 AM G S Niteesh Babu &lt;<a href=3D"mailto:niteesh.gs@gmail.co=
m" target=3D"_blank">niteesh.gs@gmail.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">GitLab: <a href=3D"https://gitlab.=
com/niteesh.gs/qemu/-/commits/aqmp-tui-prototype-v1/Based-on" rel=3D"norefe=
rrer" target=3D"_blank">https://gitlab.com/niteesh.gs/qemu/-/commits/aqmp-t=
ui-prototype-v1/<br>
Based-on</a>: &lt;<a href=3D"mailto:20210701041313.1696009-1-jsnow@redhat.c=
om" target=3D"_blank">20210701041313.1696009-1-jsnow@redhat.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0[PATCH 00/20] python: introduce Asynchronous QMP packag=
e<br>
<br>
Updates in V2:<br>
1) Moved loop related initialization to &#39;run&#39; function in &#39;App&=
#39; class<br>
2) Added a module logger with support in TUI log messages.<br>
3) Corrected usage of <a href=3D"http://logging.info" rel=3D"noreferrer" ta=
rget=3D"_blank">logging.info</a> and logging.debug<br>
4) Added an option in setup.cfg to silent pylint regarding duplicate-code<b=
r>
4) Modified the arguments list to the TUI<br>
<br>
NOTE: I am not able to get the pipelines running after the v2 changes.<br>
I was only able to test the changes locally using *make check*.<br>
<br></blockquote></div></div></blockquote><div><br></div><div>Why not?<br><=
/div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><di=
v dir=3D"ltr"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
This patch series introduces AQMP-TUI prototype. This prototype has been<br=
>
helpfull in letting us try out different ideas and giving some insights<br>
into things that we had to take care of in the upcoming TUI. It was also<br=
>
helpfull in finding out bugs in the AQMP library.<br>
<br>
The intent for this patch series is to get comments on the architectural<br=
>
design of the prototype. These comments will lay down the foundation for<br=
>
the upcoming TUI.<br>
<br>
G S Niteesh Babu (6):<br>
=C2=A0 python: disable pylint errors for aqmp-tui<br>
=C2=A0 python: Add dependencies for AQMP TUI<br>
=C2=A0 python/aqmp-tui: Add AQMP TUI draft<br>
=C2=A0 python: add optional pygments dependency<br>
=C2=A0 python/aqmp-tui: add syntax highlighting<br>
=C2=A0 python: add entry point for aqmp-tui<br>
<br>
=C2=A0python/Pipfile.lock=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 20 ++<b=
r>
=C2=A0python/qemu/aqmp/aqmp_tui.py | 342 ++++++++++++++++++++++++++++++++++=
+<br>
=C2=A0python/setup.cfg=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 36 +++-<br>
=C2=A03 files changed, 397 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 python/qemu/aqmp/aqmp_tui.py<br>
<br></blockquote></div></div></blockquote><div><br></div><div>Thanks Nitees=
h, a few general comments that don&#39;t relate directly to the code:</div>=
<div><br></div><div> 1. It would be nice to be able to highlight/copy-paste=
 things out of the history window, I seemingly can&#39;t right now.<br><br>=
2. It would be nice if the mouse scroll wheel worked on the history panel.<=
br><br>3. A greeting message like the old qmp-shell might be nice to see. I=
t would be good if it explained how to quit the program (esc, ctrl^c) and s=
end messages (alt+enter).<br><br>4. Some control hints or reminder text in =
the footer might be nice, for how to quit, send a message, etc.</div><div><=
br></div><div>For the next revision, I may ask you to start looking into ma=
king sure that mypy and pylint pass without exemptions. Do the best you can=
, and get as far as you are able. You can leave the warnings disabled for V=
3, but I&#39;d like you to start taking a look now so that you know where t=
he trouble spots are.</div><div><br></div><div>Thanks!</div><div>--js<br></=
div></div></div>

--000000000000df307e05c792c9c0--


