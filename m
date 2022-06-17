Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56BAA54F73A
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 14:07:35 +0200 (CEST)
Received: from localhost ([::1]:52372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2AlB-0000xq-UQ
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 08:07:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoguangrong.eric@gmail.com>)
 id 1o2Ahv-0006PB-Js
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 08:04:12 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134]:43864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xiaoguangrong.eric@gmail.com>)
 id 1o2Ahq-0004aJ-5c
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 08:04:11 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-3137316bb69so39983727b3.10
 for <qemu-devel@nongnu.org>; Fri, 17 Jun 2022 05:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uZIYWy+2kxFpEWpAg+aLaeM1Ps37GAC9TnLh0/vmyfI=;
 b=ickdcpE1PN030DqKB3f4Vf0zhdjKbkiYznUTKReqqE6EFUzTsNW446hkkb3CwH4ka5
 Xc6qkdD7v20FOLKbeJ07cC6gI4nk7LFxrMpLOt0nkbgMWUkEefmMydStXsPeqEFNXx8Y
 Oa8aAzUISf2NS5WpQo1hxFL5fB4j03m2VdaZrU4hbB7izej8CV2qktSz0PIQ7L4uEId4
 KQ70ivUHgCBX28tcMW2138gksRDXC4gFUxQrfq14Er/fhbDkpqWc7IH00ShQvtQT0vwW
 AJBdPezbGIrK4ued+UH0cSHlTn/GiE09RdSSat9D33MaeN8AIEx3sxtv8YKeakspP4a3
 WULQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uZIYWy+2kxFpEWpAg+aLaeM1Ps37GAC9TnLh0/vmyfI=;
 b=HFCQ6duq16ryphefPJDPouubi/8t9YfkIiAZC2nL+RWrWmArvaaVUyfeW60mHj+tbU
 aM4aYiI7c+f666QWprsMApq/sPlBFAR/cRkmKMbWFsmVjWgb0DC7TfyFYQFnOPTTNhzX
 UI0HQG4ETs4mTW4KwROIPp0SDb69prE4CcH+1Gcju0GwNf7s9P7R+xWsofR1VkJdSIfV
 RvV6PNPCycuCwXV7fFRy/2viWpDCqobhG1qRy2s3iarvL7spAZw/jBmROvx4UnGusxIJ
 J16IsnJ3DNYo7Mvt4d2o6kagw/Y5OV7F7Mfgcmj0lRwSOnIsXbfidQrS1E6nnrnR1/0x
 XVhg==
X-Gm-Message-State: AJIora/w5ymm46siqDyFnXCyI4BGRS/YJ5t58JsOtKyzjqwfCAkNLN/G
 TAnXTtsirJSVjzpCHgqifd7n0G9M0rVRBne/iC4=
X-Google-Smtp-Source: AGRyM1uRsUKPE63zlmr7Rb/eHZkj0nc/gXKgUT1bqN/AhM9ti0uI5+KT2gHjNXfLOSH34mmUag8zi9v2Jb0eNOs0i0w=
X-Received: by 2002:a81:3248:0:b0:317:87fa:8756 with SMTP id
 y69-20020a813248000000b0031787fa8756mr1768719ywy.280.1655467442922; Fri, 17
 Jun 2022 05:04:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220531145147.61112-1-jusual@redhat.com>
 <YpY0/Pc3uoA9QQD/@stefanha-x1.localdomain>
 <CAMDeoFUxG7B67BCm4nb303VEwBdiD=JNi_OWSaxirThWnTd6LA@mail.gmail.com>
 <YqdTQYUhO/3dzJvZ@stefanha-x1.localdomain>
 <20220614105408.235f0f41@redhat.com>
 <ac7c0d9c-4fb2-c67b-db25-00e4bbc0eb42@redhat.com>
 <CAMDeoFV3SEWv5gAUd-ZJ=pGw3=JkHR9pOztkytGr1tRhM_uBNw@mail.gmail.com>
 <0fe9723a-620a-f388-68a8-c6a11f8aa3ca@redhat.com>
 <CALg51MOVVm2P5WUjnFF_xvsAk9+QYtWXjOqdU9wdCQJnv6oagg@mail.gmail.com>
 <5e00555e-1301-b1ce-db3f-e993e6a16567@redhat.com>
In-Reply-To: <5e00555e-1301-b1ce-db3f-e993e6a16567@redhat.com>
From: Xiao Guangrong <xiaoguangrong.eric@gmail.com>
Date: Fri, 17 Jun 2022 20:03:52 +0800
Message-ID: <CALg51MN5Z8pr=PzxopvVNbRPOQ5gQzJ5nJCG=wwVgVLbjNe6GA@mail.gmail.com>
Subject: Re: [PATCH] hw/mem/nvdimm: fix error message for 'unarmed' flag
To: David Hildenbrand <david@redhat.com>
Cc: Julia Suvorova <jusual@redhat.com>, Igor Mammedov <imammedo@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, 
 QEMU Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000df770d05e1a38ca4"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=xiaoguangrong.eric@gmail.com; helo=mail-yw1-x1134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

--000000000000df770d05e1a38ca4
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 15, 2022 at 7:49 PM David Hildenbrand <david@redhat.com> wrote:
>
> On 15.06.22 13:17, Xiao Guangrong wrote:
> > On Wed, Jun 15, 2022 at 4:24 PM David Hildenbrand <david@redhat.com>
wrote:
> >
> >>>> Is that a temporary or a permanent thing? Do we know?
> >>>
> >>> No idea. But his last signed-off was three years ago.
> >>
> >> I sent a patch to Xiao, asking if he's still active in QEMU. If I don't
>
> s/patch/mail/ :)
>
> >> get a reply this week, I'll move forward with proposing an update to
> >> MAINTAINERS as described.
> >>
> >
> > Okay, please do it.
> >
> > Sorry, I am just roughly reading the mailing list of qemu & kvm usually,
> > and do not get enough time to actively review or contribute on these
> > fields. :-(
>
> Not an issue, thanks for that information and thanks for your work in
> the past on that!
>
> Should I keep you entered as a reviewer for the new section?

Okay, that is good for me! :)

--000000000000df770d05e1a38ca4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Wed, Jun 15, 2022 at 7:49 PM David Hildenbrand =
&lt;<a href=3D"mailto:david@redhat.com">david@redhat.com</a>&gt; wrote:<br>=
&gt;<br>&gt; On 15.06.22 13:17, Xiao Guangrong wrote:<br>&gt; &gt; On Wed, =
Jun 15, 2022 at 4:24 PM David Hildenbrand &lt;<a href=3D"mailto:david@redha=
t.com">david@redhat.com</a>&gt; wrote:<br>&gt; &gt;<br>&gt; &gt;&gt;&gt;&gt=
; Is that a temporary or a permanent thing? Do we know?<br>&gt; &gt;&gt;&gt=
;<br>&gt; &gt;&gt;&gt; No idea. But his last signed-off was three years ago=
.<br>&gt; &gt;&gt;<br>&gt; &gt;&gt; I sent a patch to Xiao, asking if he&#3=
9;s still active in QEMU. If I don&#39;t<br>&gt;<br>&gt; s/patch/mail/ :)<b=
r>&gt;<br>&gt; &gt;&gt; get a reply this week, I&#39;ll move forward with p=
roposing an update to<br>&gt; &gt;&gt; MAINTAINERS as described.<br>&gt; &g=
t;&gt;<br>&gt; &gt;<br>&gt; &gt; Okay, please do it.<br>&gt; &gt;<br>&gt; &=
gt; Sorry, I am just roughly reading the mailing list of qemu &amp; kvm usu=
ally,<br>&gt; &gt; and do not get enough time to actively review or contrib=
ute on these<br>&gt; &gt; fields. :-(<br>&gt;<br>&gt; Not an issue, thanks =
for that information and thanks for your work in<br>&gt; the past on that!<=
br>&gt;<br>&gt; Should I keep you entered as a reviewer for the new section=
?<br><br><div>Okay, that is good for me! :)</div></div>

--000000000000df770d05e1a38ca4--

