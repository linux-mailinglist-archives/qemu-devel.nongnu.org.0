Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B05FD3D17E2
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 22:20:54 +0200 (CEST)
Received: from localhost ([::1]:48914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6Ii5-0007Gj-MY
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 16:20:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1m6IRQ-0000zw-9d
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 16:03:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23209)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1m6IRN-0007tH-EQ
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 16:03:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626897815;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Pyj+h5yVmQVl71XrDhZZqer9Clxdw3GrFULMfTer75E=;
 b=Ei43gwvzAk5THpCoaD7W8Temi++MB/zOEmBLmfoqOn9kwyYKmxvZgii/73pywo87IaPwnq
 GqwVaE65CnuRt8snb/biFg/KCp7pdJDxu6LeNCaeWnV5kWmVLP+uV8+yjZUA3LiCxYCKwg
 WcaBb3tayysNV2JCxYmaZcaxgf9AXlc=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-nXEBLsC-P6W91aAoNPbBeQ-1; Wed, 21 Jul 2021 16:03:32 -0400
X-MC-Unique: nXEBLsC-P6W91aAoNPbBeQ-1
Received: by mail-oi1-f198.google.com with SMTP id
 q199-20020aca75d00000b029025a3cb2429bso2399643oic.20
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 13:03:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Pyj+h5yVmQVl71XrDhZZqer9Clxdw3GrFULMfTer75E=;
 b=FfsE9Gs4xy6qg+S1xiNQmxC94YZ2bs6GheORRVsoXcHCJfu/ozZy/ojTN1ASSnObJ9
 O5Rdki6MZO6pZZvqaLLjquF2msZhXj+W/t2a0VXL4kqi7qnYclUO1mf/eg8FTe5oUpeR
 poH2B1EZVSIyQJZ9aAhX55AUVREPmjj2XngTTO6i2xSaLAfWidrbZ5fLaTSQkufrjR1t
 P2YCCLUnYXVMv92IlX+x0e76CBKbHfl6ClKX/SUJCMOo5GayhmWl3rwA6mJcMn7L/QKL
 ZGfpM7bXw8pr91GPQRlqCrw9leu7ygPZvtwbDTxNDnZD2RscsReV39pEhrWl5nXlzR1d
 P0qg==
X-Gm-Message-State: AOAM530e8JFHAHznhVoUB41+dqsg7zFSohS3K4JiY17X3Szp/Jyb30yR
 k7FuyLudzlfgI6kDJUNY0aBKzfvxh6HPkgo3ElI4akL+VkcMhNnUkVBfVo9LJAB01IxWK2kguSC
 kNE+shWPaV0tXfAkgi9BsUHniQbFndvE=
X-Received: by 2002:a05:6808:1309:: with SMTP id
 y9mr3637862oiv.112.1626897812007; 
 Wed, 21 Jul 2021 13:03:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJymPu+/2ok59b03x0T4eQJK25c9wN+CNXDIVoATu//5tARDwiKiUoNxnZCsJamdVwYxUDaJL9QmJoABCx1rhkk=
X-Received: by 2002:a05:6808:1309:: with SMTP id
 y9mr3637837oiv.112.1626897811575; 
 Wed, 21 Jul 2021 13:03:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210713220734.26302-1-niteesh.gs@gmail.com>
 <CAN6ztm97cJrVZ3=XPr9R8WoepOw81XAGXUO3fHB5nt7L9fWS4w@mail.gmail.com>
 <CAFn=p-aP5y=a56BK7X-B4KO8YL+d3O_MX3ekp3NQnGLGs8Dnww@mail.gmail.com>
 <CAN6ztm8yqX=VZON3is8ni5a5kXr7xQrdNubA6Pj+p0fUGadOEA@mail.gmail.com>
In-Reply-To: <CAN6ztm8yqX=VZON3is8ni5a5kXr7xQrdNubA6Pj+p0fUGadOEA@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Date: Wed, 21 Jul 2021 16:03:20 -0400
Message-ID: <CAFn=p-b=Q9_BFQpnb5yXEjUcU0WJLSXyUS9EquHNWGs6XZ6UCQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] python: AQMP-TUI Prototype
To: "Niteesh G. S." <niteesh.gs@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000002527a805c7a7aae8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.459,
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

--0000000000002527a805c7a7aae8
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 21, 2021 at 2:09 PM Niteesh G. S. <niteesh.gs@gmail.com> wrote:

> On Wed, Jul 21, 2021 at 12:39 AM John Snow <jsnow@redhat.com> wrote:
>
>> On Wed, Jul 14, 2021 at 3:07 PM Niteesh G. S. <niteesh.gs@gmail.com>
>> wrote:
>>
>> Why not?
>>
> I have already updated the status of this
> https://lists.gnu.org/archive/html/qemu-devel/2021-07/msg04059.html
>

Sorry, I missed this.

Thanks Niteesh, a few general comments that don't relate directly to the
>> code:
>>
>> 1. It would be nice to be able to highlight/copy-paste things out of the
>> history window, I seemingly can't right now.
>>
>> 2. It would be nice if the mouse scroll wheel worked on the history panel.
>>
>> 3. A greeting message like the old qmp-shell might be nice to see. It
>> would be good if it explained how to quit the program (esc, ctrl^c) and
>> send messages (alt+enter).
>>
>> 4. Some control hints or reminder text in the footer might be nice, for
>> how to quit, send a message, etc.
>>
>

> I'll update the status here as I start working on them one by one.
>
>
OK - They don't need to go into this series, these are just some
observations. All of these items seem like good candidates for standalone
follow-up patches to happen in another series that follows this one.


> For the next revision, I may ask you to start looking into making sure
>> that mypy and pylint pass without exemptions. Do the best you can, and get
>> as far as you are able. You can leave the warnings disabled for V3, but I'd
>> like you to start taking a look now so that you know where the trouble
>> spots are.
>>
>

> Sure.
>
>
I'll be on PTO for the next three business days, returning 2021-07-27 -- If
you get blocked on other tasks, try adding mypy type hints using this
downtime.

Thanks again,
--js

--0000000000002527a805c7a7aae8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 21, 2021 at 2:09 PM Nitee=
sh G. S. &lt;<a href=3D"mailto:niteesh.gs@gmail.com">niteesh.gs@gmail.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><d=
iv dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Wed, Jul 21, 2021 at 12:39 AM John Snow &lt;<a href=3D"mailto:jsnow=
@redhat.com" target=3D"_blank">jsnow@redhat.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 14, 2021=
 at 3:07 PM Niteesh G. S. &lt;<a href=3D"mailto:niteesh.gs@gmail.com" targe=
t=3D"_blank">niteesh.gs@gmail.com</a>&gt; wrote:<br></div><br><div>Why not?=
<br></div></div></div></blockquote><div><span class=3D"gmail_default" style=
=3D"font-size:small">I have already updated the status of this</span></div>=
<div><span class=3D"gmail_default" style=3D"font-size:small"><a href=3D"htt=
ps://lists.gnu.org/archive/html/qemu-devel/2021-07/msg04059.html" target=3D=
"_blank">https://lists.gnu.org/archive/html/qemu-devel/2021-07/msg04059.htm=
l</a><br></span></div></div></div></blockquote><div><br></div><div>Sorry, I=
 missed this.<br></div><div><br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote=
"><div>Thanks Niteesh, a few general comments that don&#39;t relate directl=
y to the code:</div><div><br></div><div> 1. It would be nice to be able to =
highlight/copy-paste things out of the history window, I seemingly can&#39;=
t right now.<br><br>2. It would be nice if the mouse scroll wheel worked on=
 the history panel.<br><br>3. A greeting message like the old qmp-shell mig=
ht be nice to see. It would be good if it explained how to quit the program=
 (esc, ctrl^c) and send messages (alt+enter).<br><br>4. Some control hints =
or reminder text in the footer might be nice, for how to quit, send a messa=
ge, etc.</div></div></div></blockquote></div></div></blockquote><div>=C2=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><d=
iv class=3D"gmail_quote"><div><div style=3D"font-size:small">I&#39;ll updat=
e the status here as I start working on them one by one.</div></div><div st=
yle=3D"font-size:small"><br></div></div></div></blockquote><div><br></div><=
div>OK - They don&#39;t need to go into this series, these are just some ob=
servations. All of these items seem like good candidates for standalone fol=
low-up patches to happen in another series that follows this one.<br></div>=
<div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr"><div class=3D"gmail_quote"><div style=3D"font-size:small"></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=
=3D"gmail_quote"><div>For the next revision, I may ask you to start looking=
 into making sure that mypy and pylint pass without exemptions. Do the best=
 you can, and get as far as you are able. You can leave the warnings disabl=
ed for V3, but I&#39;d like you to start taking a look now so that you know=
 where the trouble spots are.</div></div></div></blockquote></div></div></b=
lockquote><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
"><div dir=3D"ltr"><div class=3D"gmail_quote"><div><div style=3D"font-size:=
small">Sure.</div><br></div></div></div></blockquote><div><br></div><div>I&=
#39;ll be on PTO for the next three business days, returning 2021-07-27 -- =
If you get blocked on other tasks, try adding mypy type hints using this do=
wntime.<br></div><div>=C2=A0</div><div>Thanks again,</div><div>--js<br></di=
v></div></div>

--0000000000002527a805c7a7aae8--


