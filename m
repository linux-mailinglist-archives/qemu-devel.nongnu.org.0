Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 542D83F34AE
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 21:33:36 +0200 (CEST)
Received: from localhost ([::1]:49776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHAGk-0006Wj-Sv
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 15:33:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mHAEc-0005Ew-Qh
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 15:31:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mHAEY-0001dW-98
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 15:31:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629487875;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KO2Beb/1oYcAadl45wTArgVgODcVAUSsJ7N+u1XfN7w=;
 b=KMeiH53ps1u4NFXlTUrt0tOcZdrUszxLLbhmPcuIGewVPI/EGT0sr6EfjrhrAH3gY7CUb1
 MoaP5jA+bTuum+yuUhUwMxb01KJCZEFzjwESm85NYOw1FghImddELbX6S9958pWcJ+6WXt
 /ies5sCDdHqIhTS2nXfTmHgqqiLsExs=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-545-io-X3i2POI-l78_aAFQLpg-1; Fri, 20 Aug 2021 15:31:14 -0400
X-MC-Unique: io-X3i2POI-l78_aAFQLpg-1
Received: by mail-ot1-f71.google.com with SMTP id
 b25-20020a9d60d9000000b00519be3bdc04so5214893otk.7
 for <qemu-devel@nongnu.org>; Fri, 20 Aug 2021 12:31:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KO2Beb/1oYcAadl45wTArgVgODcVAUSsJ7N+u1XfN7w=;
 b=n9v8a/IVFPTMSCFxL1ucSO4ar3cG0DePOVsxne0SJqIB5h+L/lfgG4CgH7W4pTx5se
 x0fRiLpgpXKoFWovF2m8HjFlsOkkp8LzaWHgkCFjW1doxWRtq+JwpAxHJxnrQSmB1+ES
 cx5XbGZ26pF/F/yx1OtNZFGmuWHUdk5M4XT5YRxAefMOgrPGLLXrJCT6ZBcqdpDQ85TL
 vlaZ6MpEDJsEjeP9SECsEG5sEW/B43RWY8hY4QXxCUmbsfOLcuzgGJDOAitkq9+wwwz2
 8PwcV8wouIGqJlimvo0QdidpGiTmywIdCii6wKyrfOFgp8FDZHz7bmHHgGszdVYYtcxq
 MWPw==
X-Gm-Message-State: AOAM531yDXNNqmeZ/HCqtANf0gPtriNgQTLUtGi9wTuR/RffEMweh71v
 ixdDRPZ3HLdW0GCHuRXyo9GBw8LRNKbPNcWH9RYXTJnV26gGsZCGaD8LakNgBBlBv0n0A5WaIYK
 b0RaCaumsuAxSPjQU5MZfuyZnWfZkAQI=
X-Received: by 2002:a05:6808:a01:: with SMTP id
 n1mr4004711oij.52.1629487873521; 
 Fri, 20 Aug 2021 12:31:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxXHAKXeYg9lK7RJ8DhbglNu9hKHA2kofTMajqMP+VYKOblXmvpGIEdj29A8Lavi0vwv4Q+6MFjdmFbqJCQRlQ=
X-Received: by 2002:a05:6808:a01:: with SMTP id
 n1mr4004695oij.52.1629487873349; 
 Fri, 20 Aug 2021 12:31:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210730201846.5147-1-niteesh.gs@gmail.com>
 <20210730201846.5147-10-niteesh.gs@gmail.com>
 <CAFn=p-bBXyDQDa7-sD2_zOwU-QVdYJLEJ+LwH2t8472LHgvHyA@mail.gmail.com>
 <CAN6ztm--n7FuOm2DMj8nbpMr=-_LyiFM-7J0gZymqKddrZ6rOg@mail.gmail.com>
 <CAFn=p-boj5GurWmTQEnNSRZtaLPWvbLbqx_bh-JRmxSj_ZM1QQ@mail.gmail.com>
In-Reply-To: <CAFn=p-boj5GurWmTQEnNSRZtaLPWvbLbqx_bh-JRmxSj_ZM1QQ@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Date: Fri, 20 Aug 2021 15:31:02 -0400
Message-ID: <CAFn=p-YEeB6dm6sHAQ7bER-NGEwuFLE8FQxyr1OCFcENsaow+w@mail.gmail.com>
Subject: Re: [PATCH v3 09/13] python/aqmp-tui: Add QMP connection manager
To: "Niteesh G. S." <niteesh.gs@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000db724605ca02b5ce"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Kashyap Chamarthy <kchamart@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Wainer Moschetta <wainersm@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000db724605ca02b5ce
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 18, 2021 at 3:36 PM John Snow <jsnow@redhat.com> wrote:

> On Tue, Aug 17, 2021 at 3:07 PM Niteesh G. S. <niteesh.gs@gmail.com>
> wrote:
>
>> On Tue, Aug 17, 2021 at 10:21 AM John Snow <jsnow@redhat.com> wrote:
>>
>>> On Fri, Jul 30, 2021 at 4:19 PM G S Niteesh Babu <niteesh.gs@gmail.com>
>>> wrote:
>>>
>>
> Is this required? I would have hoped that after calling disconnect that
>>> the state would have again changed to IDLE and you wouldn't need this
>>> clause here.
>>>
>> After you mentioned it I too felt it was redundant. But on removing it
>> the whole app freezes when trying to exit.
>> I logged the state after the call to disconnect, instead of being in the
>> IDLE state, it is still in DISCONNECTING state.
>> I suspect this results in the constant infinite looping which doesn't
>> give other coroutines a chance to run and blocks
>> the event loop thus resulting in the freezing of the app. But I am not
>> sure why the state isn't changing to IDLE.
>>
>
> Hmm ... That may well be a bug in AQMP then. I will investigate.
>

No, it's not -- It's just tricky. The "problem" is that the
runstate_changed() event only returns once the runstate has changed *after*
you await it. So this code is perfectly correct and I am just bad at
reading.

--js

--000000000000db724605ca02b5ce
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 18, 2021 at =
3:36 PM John Snow &lt;<a href=3D"mailto:jsnow@redhat.com">jsnow@redhat.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><=
div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_=
attr">On Tue, Aug 17, 2021 at 3:07 PM Niteesh G. S. &lt;<a href=3D"mailto:n=
iteesh.gs@gmail.com" target=3D"_blank">niteesh.gs@gmail.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, A=
ug 17, 2021 at 10:21 AM John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" t=
arget=3D"_blank">jsnow@redhat.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jul 30, 2021 at 4:19 PM G S=
 Niteesh Babu &lt;<a href=3D"mailto:niteesh.gs@gmail.com" target=3D"_blank"=
>niteesh.gs@gmail.com</a>&gt; wrote:<br></div></div></div></blockquote></di=
v></div></blockquote><div><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><=
div>Is this required? I would have hoped that after calling disconnect that=
 the state would have again changed to IDLE and you wouldn&#39;t need this =
clause here.<br></div></div></div></blockquote><div><div style=3D"font-size=
:small">After you mentioned it I too felt it was redundant. But on removing=
 it the whole app freezes when trying to exit.</div></div><div style=3D"fon=
t-size:small">I logged the state after the call to disconnect, instead of b=
eing in the IDLE state, it is still in DISCONNECTING state.</div><div style=
=3D"font-size:small">I suspect this results in the constant infinite loopin=
g which doesn&#39;t give other coroutines a chance to run and blocks</div><=
div style=3D"font-size:small">the event loop thus resulting in the freezing=
 of the app. But I am not sure why the state isn&#39;t changing to IDLE.</d=
iv></div></div></blockquote><div><br></div><div>Hmm ... That may well be a =
bug in AQMP then. I will investigate.<br></div></div></div></blockquote><di=
v><br></div><div>No, it&#39;s not -- It&#39;s just tricky. The &quot;proble=
m&quot; is that the runstate_changed() event only returns once the runstate=
 has changed *after* you await it. So this code is perfectly correct and I =
am just bad at reading.</div><div><br></div><div>--js<br></div></div></div>=
</div>

--000000000000db724605ca02b5ce--


