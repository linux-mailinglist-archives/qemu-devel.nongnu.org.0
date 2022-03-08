Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3D94D1921
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 14:26:41 +0100 (CET)
Received: from localhost ([::1]:40338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRZrM-00055X-35
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 08:26:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nRZoP-0003sW-Kv
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 08:23:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50077)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nRZoM-0008V4-GD
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 08:23:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646745813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+BFpMveWz1PM4HPWOdYk4KHbFe/+Wx8MQGLoc1pigYg=;
 b=hAhOwM8g2FmVYMlMkLYDPGZSPMbMwoO8ukDV+m7kEVec9qsLzmTpOv6hf99bEIVVwvNse6
 iuLN6a4w9bRqrY+q9ibS8wR1ac6OIB/x3SZ067mkbtP/TKx0q6dRK4EhMNaQ6biuRwuFG4
 Zx6Huc88Vubr2t+b6imSf4d5vneNmzE=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-118-av4XfypFMZqGLaNo2PtP4w-1; Tue, 08 Mar 2022 08:23:29 -0500
X-MC-Unique: av4XfypFMZqGLaNo2PtP4w-1
Received: by mail-lf1-f72.google.com with SMTP id
 m13-20020a19520d000000b00443423ff116so4894322lfb.11
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 05:23:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+BFpMveWz1PM4HPWOdYk4KHbFe/+Wx8MQGLoc1pigYg=;
 b=Z6csE/7fVgurh57572p7RaS9ZO4DdMRT20xbUTNtD3CGAvl+psEVc1ihGO8MRtRV/h
 9AKFGfbtIdZRigj40mbj2x5f8kn4zUWJnJQOkMwZxL9wOdj9w9+AIl34UAyRWiX27PGH
 xxsNYE8R5aYI1TrRrlGlwfyP9ksgn9LCrRD2uriEvIoNQqFok0RWujq1b6wLX2dH+Cye
 d1U+tSzrCMIY7S1fXfZJIgSQvAVzcSGNr7rCLhgkrF33wDq0CvTJI0+hfuBCy0LnAWhg
 Ldgn2MWU7kjv4ITSIWf0/vDC4iXgfqz3nXI+fzf75lDz1Wp+xX2zji3LIlty7grY3v4V
 FzcA==
X-Gm-Message-State: AOAM531vvcDGw6WgDjVaitfa5JKc2lhmmhPUGg/l0W2MFhYim2X8qOlG
 AogsLX4Qp/1xAbDL5WLLxUaPu9KORn2SzGamjRRzidBS2kXNkReuXJdFIkSIc4C9xempt4NIQNC
 x9pep4asG2BhWSpohBlMgUJKTYlMu1z0=
X-Received: by 2002:ac2:4c4f:0:b0:448:21cd:596f with SMTP id
 o15-20020ac24c4f000000b0044821cd596fmr10919142lfk.257.1646745808203; 
 Tue, 08 Mar 2022 05:23:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw5c0Eg+3oJM/eNirofea31KPsRHlR2kaX0V1EVtxG1oGS7954rRkDe0bQlO3Y0rgGZ9XJ1likpuzCoYv7Jfl0=
X-Received: by 2002:ac2:4c4f:0:b0:448:21cd:596f with SMTP id
 o15-20020ac24c4f000000b0044821cd596fmr10919108lfk.257.1646745807969; Tue, 08
 Mar 2022 05:23:27 -0800 (PST)
MIME-Version: 1.0
References: <20220307153334.3854134-1-eperezma@redhat.com>
 <14d4fde4-6ea5-4805-b684-c33f6b448565@redhat.com>
 <20220308020348-mutt-send-email-mst@kernel.org>
 <CACGkMEvY-+XpPWbtiX9dy+fwDxPp7sHFhH_LY0PB2YuusEugyw@mail.gmail.com>
 <20220308022300-mutt-send-email-mst@kernel.org>
 <CACGkMEvuTPCRk7Ng7CbgpPSPgs_QYijzc5fU+cV3kW09W1R7Qg@mail.gmail.com>
 <20220308024724-mutt-send-email-mst@kernel.org>
 <CACGkMEsPBDM8ko1qgnCR1DcofPNJJo3S2j3pOJHk4xaSGQimcQ@mail.gmail.com>
 <20220308054213-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220308054213-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 8 Mar 2022 21:23:16 +0800
Message-ID: <CACGkMEtRG5cH41MV5gGKyGKtX4Lvok-OQpvkP48qCArr_pOZ3Q@mail.gmail.com>
Subject: Re: [PATCH v5 00/15] vDPA shadow virtqueue
To: "Michael S. Tsirkin" <mst@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000eb874805d9b4e268"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Eli Cohen <eli@mellanox.com>, Eric Blake <eblake@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cindy Lu <lulu@redhat.com>,
 "Fangyi \(Eric\)" <eric.fangyi@huawei.com>,
 Markus Armbruster <armbru@redhat.com>, yebiaoxiang@huawei.com,
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Parav Pandit <parav@mellanox.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gautam Dawar <gdawar@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000eb874805d9b4e268
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 8, 2022 at 6:46 PM Michael S. Tsirkin <mst@redhat.com> wrote:

> On Tue, Mar 08, 2022 at 04:20:53PM +0800, Jason Wang wrote:
> > Generally, yes.
>
>
> So generally I support the idea of merging code gradually.  And merging
> with an unstable flag to enable it is a reasonable way to do it.
> However we are half a day away from soft freeze, so this will just
> result in the feature getting to users in it's current not really
> useable form. If we just want to simplify upstreaming then
> merging patches 1-14 for now would be one way to do it.
>

Yes.


> If you want to do it through your tree then ok
>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
>

Thanks. Will send a pull request soon.


>
>
> --
> MST
>
>

--000000000000eb874805d9b4e268
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 8, 2022 at 6:46 PM Michae=
l S. Tsirkin &lt;<a href=3D"mailto:mst@redhat.com">mst@redhat.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, Ma=
r 08, 2022 at 04:20:53PM +0800, Jason Wang wrote:<br>
&gt; Generally, yes.<br>
<br>
<br>
So generally I support the idea of merging code gradually.=C2=A0 And mergin=
g<br>
with an unstable flag to enable it is a reasonable way to do it.<br>
However we are half a day away from soft freeze, so this will just<br>
result in the feature getting to users in it&#39;s current not really<br>
useable form. If we just want to simplify upstreaming then<br>
merging patches 1-14 for now would be one way to do it.<br></blockquote><di=
v><br></div><div>Yes.</div><div>=C2=A0</div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
If you want to do it through your tree then ok<br>
<br>
Acked-by: Michael S. Tsirkin &lt;<a href=3D"mailto:mst@redhat.com" target=
=3D"_blank">mst@redhat.com</a>&gt;<br></blockquote><div><br></div><div>Than=
ks. Will send a pull request soon.</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
<br>
-- <br>
MST<br>
<br>
</blockquote></div></div>

--000000000000eb874805d9b4e268--


