Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 795BD533268
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 22:26:32 +0200 (CEST)
Received: from localhost ([::1]:45916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntb6t-0008WR-Ao
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 16:26:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1ntar9-0007CD-3j
 for qemu-devel@nongnu.org; Tue, 24 May 2022 16:10:16 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:42828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1ntar6-0002Sp-Om
 for qemu-devel@nongnu.org; Tue, 24 May 2022 16:10:14 -0400
Received: by mail-ej1-x632.google.com with SMTP id i27so37530850ejd.9
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 13:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DqFsSw18/K5Kwr9yWrV99Wlw4ylguZ1vJgUCRuIiy4I=;
 b=Q/UNMNOr/9JZ6ODDofZLnl0qkIhZXc0jxw9WseDRpbpFSA4kp08UvjECpk7p72pV2B
 KquTtj+fwcVAYgpGkICK458nX262a0p89UvsC7vmuqocOKOL3KvJMM5mgd1QDfAB05op
 RqCj4OiIDBVf4Xq94xNF4JgVTQwWlTqkCyOFZs5/FU1lbYTNnB7Inn4vsMjLPAfBVw+g
 5Ln6TWC+Cuf4QkqOUWwQTLvPDx8Hl8yU0sGlKCbfYg1Qq7rrclN1Bi8Tp3H6jbrlcBbQ
 NJ9K/8soIhGilDLerXGYH7SRc9nygbfLBnMuGc61MOJKFCI7ARUnQdrur0tUeysUfl/F
 nu8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DqFsSw18/K5Kwr9yWrV99Wlw4ylguZ1vJgUCRuIiy4I=;
 b=2eTCzWJTEJ5CULfUxeJG0FXcui3JiempDEVmxqengXUhvI+o5re8iK/YtPAmRO+PLR
 oPNsX120rOPR2URanjv6VM2ps8vPenLENsxx8XPnuqqR158/eatgW6rXFOcDkjtTQFcD
 kJoEytmlSVWq0Q/tZlVOliuUhv5Ua8YySMngvf5Zrc7FDIok6KEPlUIGvOyXaJ4BegPJ
 oaF0Sn+TT+zZ+wDe7Cfv7qN9KQ3+arolKHGDC57lfNpcDctCSaQq6QLIp52IvhmkkhgI
 ZXW7yTC+dTyQHqmtpSICAShv0Lwg3qobMlc8RA34EhbfD9OOLRy812r5Z7zVuSC77Oxh
 S1Ng==
X-Gm-Message-State: AOAM530/tXJOJS3QTSsOUuywCzfcfCgtzp/Or4SITpcKbQkLRyaNHlK2
 o5cUZ2E7MKCeyfNHgj8b7llyITjuV5i4bl/kzrIlKOLMxwo=
X-Google-Smtp-Source: ABdhPJza+g8rqkgtTlQImIlLVODUiNVenhJxv2MaVwkGMxH8VH6qupnzNH8+4icSD5yzwi1Kf+hLhVVltY2tDzLjWb0=
X-Received: by 2002:a17:906:9c82:b0:6df:baa2:9f75 with SMTP id
 fj2-20020a1709069c8200b006dfbaa29f75mr25940087ejc.762.1653423010393; Tue, 24
 May 2022 13:10:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220223090706.4888-1-damien.hedde@greensocs.com>
 <20220223090706.4888-12-damien.hedde@greensocs.com>
 <bd6f884e-a150-88d8-4b8c-9ec76171b275@greensocs.com>
 <3f8f7c74-3f9c-c0b5-e009-c962fce08eba@gmail.com>
 <892dad33-8883-1434-237c-d77ba549f04a@greensocs.com>
In-Reply-To: <892dad33-8883-1434-237c-d77ba549f04a@greensocs.com>
From: Jim Shu <jim.shu@sifive.com>
Date: Wed, 25 May 2022 04:09:57 +0800
Message-ID: <CALw707qD8uHW55oJyBOzcCCtUUySD7Mxm+1WfZfES1-4G6boXg@mail.gmail.com>
Subject: Re: [PATCH v4 11/14] softmmu/memory: add
 memory_region_try_add_subregion function
To: Damien Hedde <damien.hedde@greensocs.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="00000000000032ce4e05dfc78b16"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=jim.shu@sifive.com; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--00000000000032ce4e05dfc78b16
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Tested-by: Jim Shu <jim.shu@sifive.com>


On Fri, Mar 4, 2022 at 7:00 PM Damien Hedde <damien.hedde@greensocs.com>
wrote:

>
>
>
> On 3/3/22 14:32, Philippe Mathieu-Daud=C3=A9 wrote:
> > On 23/2/22 10:12, Damien Hedde wrote:
> >> Hi Philippe,
> >>
> >> I suppose it is ok if I change your mail in the reviewed by ?
> >
> > No, the email is fine (git tools should take care of using the
> > correct email via the .mailmap entry, see commit 90f285fd83).
> >
> >> Thanks,
> >> Damien
> >>
>
> ok.
>
> Looks like git keeps as-is the "*-by:" entries untouched when cc-ing them=
.
>
> --
> Damien
>
>

--00000000000032ce4e05dfc78b16
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Tested-by: Jim Shu &lt;<a href=3D"mailto:jim.shu@sifive.co=
m" target=3D"_blank">jim.shu@sifive.com</a>&gt;<br></div><div dir=3D"ltr"><=
br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Fri, Mar 4, 2022 at 7:00 PM Damien Hedde &lt;<a href=3D"mailto:damien=
.hedde@greensocs.com" target=3D"_blank">damien.hedde@greensocs.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
<br>
On 3/3/22 14:32, Philippe Mathieu-Daud=C3=A9 wrote:<br>
&gt; On 23/2/22 10:12, Damien Hedde wrote:<br>
&gt;&gt; Hi Philippe,<br>
&gt;&gt;<br>
&gt;&gt; I suppose it is ok if I change your mail in the reviewed by ?<br>
&gt; <br>
&gt; No, the email is fine (git tools should take care of using the<br>
&gt; correct email via the .mailmap entry, see commit 90f285fd83).<br>
&gt; <br>
&gt;&gt; Thanks,<br>
&gt;&gt; Damien<br>
&gt;&gt;<br>
<br>
ok.<br>
<br>
Looks like git keeps as-is the &quot;*-by:&quot; entries untouched when cc-=
ing them.<br>
<br>
--<br>
Damien<br>
<br>
</blockquote></div>

--00000000000032ce4e05dfc78b16--

