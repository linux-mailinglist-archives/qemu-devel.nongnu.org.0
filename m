Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8601C489BA3
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 15:54:36 +0100 (CET)
Received: from localhost ([::1]:58542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6w4A-0005b4-Kk
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 09:54:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1n6vo6-0007na-CG
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 09:38:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1n6vo3-0008Ks-A4
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 09:37:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641825473;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DkGTX/EBSGPYJNt8nBf8MoDo/yhSwm4KadBbuuMJDQc=;
 b=hXNWgagVrkd1NKhJFzjJxtzJouU3AVQz1JbMp66suAFX0PRQTpwJRhBtB/rqismitfXM4P
 +pDhiPYO8MdQa+inIzX0XxOHxU2VsTfagtiruTIs+Y4a3+WTJie0IbxSVBXj+GGxZIHKiG
 HzSAQdpedWfBA8fQqj1V6N8rhQXC7EQ=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-111-3s-pFzWBNT2mCwlqKAIQbA-1; Mon, 10 Jan 2022 09:37:51 -0500
X-MC-Unique: 3s-pFzWBNT2mCwlqKAIQbA-1
Received: by mail-yb1-f197.google.com with SMTP id
 s127-20020a252c85000000b0060be2b7b8e9so27644461ybs.8
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 06:37:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DkGTX/EBSGPYJNt8nBf8MoDo/yhSwm4KadBbuuMJDQc=;
 b=wLaKwujzcVRDKu899g8tjxD7+1qypxbqqoORIbixqCugqcILGrKPstJe4skayoSZ2Q
 01tQcXpoC1jowSFML3f6JKcrjpba3xKRBPL+h3CElLER+jbhZ6LQUlO5WLMxmOel1HYc
 zp3bDWtzhQ+7aQIiYdge3yF0rxoJg5MPbvzbUyotuJoWYhfgvDV4rNm9uFnEQ0mkPeIi
 xPRNC80jO3+DN37lYtGUY2sTnwYj7Onv4dhm30CiDjBVx5Yu572ng53FxUTrtTv1Bmwx
 RFhUweb/LRprwvn0+zu0AcP90bsnLBDjJu83YZFbO5ypCcgB0Lf1NJvSImqbJVVYD1kz
 X+gg==
X-Gm-Message-State: AOAM531QbYgyUnci9Nf7AqMPlo4rCOOJ3eP0hVRb+JwKXGFgFRAPiR0H
 Lewf6lgFIfh5sxPvH1v0D4T9HqqqaadLTViYVEqw6SAN1gy8PbCLNbuxTVFb7oRGhpEhzrhTfKA
 cyrj/smieVpuDKwdZGtK+DjicFSHMteo=
X-Received: by 2002:a25:a102:: with SMTP id z2mr18476321ybh.100.1641825470338; 
 Mon, 10 Jan 2022 06:37:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxbTUGlKzu+fCYFSQROs1eRj5ds77KmKoXeSVEaLhp9BvbyZrAPksURMpt2s9uHiHox6ui2/qdBjXSdhggCmN8=
X-Received: by 2002:a25:a102:: with SMTP id z2mr18476301ybh.100.1641825470180; 
 Mon, 10 Jan 2022 06:37:50 -0800 (PST)
MIME-Version: 1.0
References: <20220110134644.107375-1-kkostiuk@redhat.com>
 <14abede7-090b-8a8e-41d7-3b782455d6d4@amsat.org>
 <CAFEAcA-FSy7kYFp1fijhueLitBPZiiZz1U=ORF5Ygm3rHsRoQg@mail.gmail.com>
In-Reply-To: <CAFEAcA-FSy7kYFp1fijhueLitBPZiiZz1U=ORF5Ygm3rHsRoQg@mail.gmail.com>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Mon, 10 Jan 2022 16:37:39 +0200
Message-ID: <CAPMcbCouktDyjDrd5ftbKzzUYVJ8NW6F0Ce4pXBKK4o--OH-Ow@mail.gmail.com>
Subject: Re: [PULL 0/9] qemu-ga-win patches
To: Peter Maydell <peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kkostiuk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000ef033f05d53b47b6"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ef033f05d53b47b6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the information. I will read about the 'b4' tool.

Best Regards,
Konstantin Kostiuk.


On Mon, Jan 10, 2022 at 4:16 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Mon, 10 Jan 2022 at 14:14, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g>
> wrote:
> >
> > On 1/10/22 14:46, Konstantin Kostiuk wrote:
> > > The following changes since commit
> df722e33d5da26ea8604500ca8f509245a0ea524:
> > >
> > >   Merge tag 'bsd-user-arm-pull-request' of gitlab.com:bsdimp/qemu
> into staging (2022-01-08 09:37:59 -0800)
> > >
> > > are available in the Git repository at:
> > >
> > >   https://github.com/kostyanf14/qemu.git
> tags/qga-win32-pull-2022-01-10
> > >
> > > for you to fetch changes up to
> 206ce9699fae1f631ac74b7e1115db2affc759fd:
> > >
> > >   qga-win: Detect Windows 11 by build number (2022-01-10 13:05:25
> +0000)
> > >
> > > ----------------------------------------------------------------
> > > qemu-ga-win patches
> > >
> > > * Fix memory leak in get_pci_info function
> > > * Add support for Windows 11 in guest-get-osinfo command
> > >
> > >
> > > Signed-off-by: Kostiantyn Kostiuk <kkostiuk@redhat.com>
> > >
> > > ----------------------------------------------------------------
> >
> > I see the patch 'Message-ID' tag is not required on the guide:
> > https://www.qemu.org/docs/master/devel/submitting-a-pull-request.html
> > but it is sometime useful.
>
> I don't think we should be adding extra requirements if we don't
> need them. The pullrequest handling infrastructure doesn't need
> message-id tags.
>
> thanks
> -- PMM
>
>

--000000000000ef033f05d53b47b6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for the information. I will read about the &#39;b4&=
#39; tool. <div><br></div><div><div dir=3D"ltr" class=3D"gmail_signature" d=
ata-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div>Best Regards,</div>=
<div>Konstantin Kostiuk.</div></div></div></div><br></div><br><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jan 10, 2022 at=
 4:16 PM Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">pete=
r.maydell@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">On Mon, 10 Jan 2022 at 14:14, Philippe Mathieu-Daud=C3=
=A9 &lt;<a href=3D"mailto:f4bug@amsat.org" target=3D"_blank">f4bug@amsat.or=
g</a>&gt; wrote:<br>
&gt;<br>
&gt; On 1/10/22 14:46, Konstantin Kostiuk wrote:<br>
&gt; &gt; The following changes since commit df722e33d5da26ea8604500ca8f509=
245a0ea524:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0Merge tag &#39;bsd-user-arm-pull-request&#39; of gitl=
ab.com:bsdimp/qemu into staging (2022-01-08 09:37:59 -0800)<br>
&gt; &gt;<br>
&gt; &gt; are available in the Git repository at:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0<a href=3D"https://github.com/kostyanf14/qemu.git" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/kostyanf14/qemu.git</=
a> tags/qga-win32-pull-2022-01-10<br>
&gt; &gt;<br>
&gt; &gt; for you to fetch changes up to 206ce9699fae1f631ac74b7e1115db2aff=
c759fd:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0qga-win: Detect Windows 11 by build number (2022-01-1=
0 13:05:25 +0000)<br>
&gt; &gt;<br>
&gt; &gt; ----------------------------------------------------------------<=
br>
&gt; &gt; qemu-ga-win patches<br>
&gt; &gt;<br>
&gt; &gt; * Fix memory leak in get_pci_info function<br>
&gt; &gt; * Add support for Windows 11 in guest-get-osinfo command<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Kostiantyn Kostiuk &lt;<a href=3D"mailto:kkostiuk@=
redhat.com" target=3D"_blank">kkostiuk@redhat.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; ----------------------------------------------------------------<=
br>
&gt;<br>
&gt; I see the patch &#39;Message-ID&#39; tag is not required on the guide:=
<br>
&gt; <a href=3D"https://www.qemu.org/docs/master/devel/submitting-a-pull-re=
quest.html" rel=3D"noreferrer" target=3D"_blank">https://www.qemu.org/docs/=
master/devel/submitting-a-pull-request.html</a><br>
&gt; but it is sometime useful.<br>
<br>
I don&#39;t think we should be adding extra requirements if we don&#39;t<br=
>
need them. The pullrequest handling infrastructure doesn&#39;t need<br>
message-id tags.<br>
<br>
thanks<br>
-- PMM<br>
<br>
</blockquote></div>

--000000000000ef033f05d53b47b6--


