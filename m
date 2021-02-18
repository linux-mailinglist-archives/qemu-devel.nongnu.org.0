Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D51931F111
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 21:34:47 +0100 (CET)
Received: from localhost ([::1]:51158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCq0a-0005Il-AG
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 15:34:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1lCpx9-0003Gm-5e
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 15:31:11 -0500
Received: from mail-ua1-x929.google.com ([2607:f8b0:4864:20::929]:37161)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1lCpwz-0007FB-Ci
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 15:31:07 -0500
Received: by mail-ua1-x929.google.com with SMTP id d3so1131043uap.4
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 12:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3o/G8wgAJYj+Jg4CZh331qOWl8qL8RRRCmLJS/2qRSs=;
 b=MuRQqo9TibTDU3gG+8Au3+gWAlsQ+lnTOyhkdWqPlJjblYr42x8eKg0tY92roW60id
 QZYIJZz3v2M/FB/YcJTjVNsc9i7CFBQwmInr8zh8QePL0EUstG1dxY2poHmg6yTT6DpH
 LEE+pJFFVgEjIPg+N2Y2CxAiGdxkNeyJW+fTgTH0JZMKn/ABkzr371TMMIpUSLa9BTQS
 +qoGGxh+KKntIVRiFk40QQ5mXMdgaBAT0/5dqTI7QNXf3cY8BQx8N0TNxA5agx9eS9ho
 9/CBQPxrrX2VETOv1PgqAI7qFQJuXB1J+ZX8FagFSES065V+o79VUagKfHsiivB8e+qL
 4+WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3o/G8wgAJYj+Jg4CZh331qOWl8qL8RRRCmLJS/2qRSs=;
 b=VTUyee7gR/hfqm4SZwpvnGr9Ksp9xnh1lPCs8WA20W/fwfVkQJxpL0dU2cEclmQ1Cq
 rDSwEnz6WLwg2Fi7lfvgbwu7iND57Lb7mrxHk8HkIFHyJrJPd4RQ2inLld4qKaU8Ae68
 vD9Qr3Un61NhhXwLGFydv0lHXpmT4DoIchYPCjZCwgo6dgwOKz6SXR6M9YnC2xSlHlqV
 493T5e8XQTy/nWGXyZdVdhMAlGOn9h4Ripnle+YhcPs/AetlGAXbCwuvC1wvhXQGPOdU
 xDFMbkzcMoRjDhKDPTkO9VYA+m7afUl9GVYlCt1KLW2pb6D3aN5IGS7SLM6h3LGK9qy2
 eqvw==
X-Gm-Message-State: AOAM531HtoZc1yOtCUvb4+eMyVwbk72nAKIHAOrviAoaGb2v5E7YcKvT
 pJ8PffHvcIRP6fIQ1rrYJkUTJ6cENFxW1oH+QQPGdQ==
X-Google-Smtp-Source: ABdhPJzlkZg9YLYiKfpeqq+7pWfZlYLDTmNX1F3OddAw+qEXmm2bCPMz/lJqU6kuzO/EBpcI5muUyNmtsZS2ZJEZgi8=
X-Received: by 2002:a9f:24b6:: with SMTP id 51mr5124624uar.91.1613680258194;
 Thu, 18 Feb 2021 12:30:58 -0800 (PST)
MIME-Version: 1.0
References: <20210203233539.1990032-1-dje@google.com>
 <20210204100349.GF549438@redhat.com>
 <CADPb22THtnaRgz3MAa+=U+dgZeZR4+FDO_SvpfsqKbnSJRnOmA@mail.gmail.com>
 <CADPb22Q2k0EpEG6=h=Riswitpha0okeEeoP9Use3yfYtV7t6ZA@mail.gmail.com>
 <20210210093102.GB1240644@redhat.com>
 <CADPb22QzGYw3z9tgVgcZv3vywVN_ejt_PjUrHmB4O-DLkAeT=Q@mail.gmail.com>
 <20210210164919.GL1240644@redhat.com>
 <CADPb22Sdk1Ao5wGFBEiJ2mNqeRfo81vp1U1gXYA9caf9Ht1n4g@mail.gmail.com>
 <20210211091203.GA1302824@redhat.com>
In-Reply-To: <20210211091203.GA1302824@redhat.com>
From: Doug Evans <dje@google.com>
Date: Thu, 18 Feb 2021 12:30:21 -0800
Message-ID: <CADPb22Qme+CSggwn194i+HZJYkz0COm2J=roSbjgP-DoGF3JPQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/3]
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Content-Type: multipart/alternative; boundary="00000000000092805805bba2367b"
Received-SPF: pass client-ip=2607:f8b0:4864:20::929;
 envelope-from=dje@google.com; helo=mail-ua1-x929.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000092805805bba2367b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 11, 2021 at 1:12 AM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m>
wrote:

> [...]
>
> I think the key useful part to keep common impl for is the handling
> of the [] brackets for IPv6 raw addrs. I'd suggest we try to pull the
> "address:port" part out into a new inet_addr_parse() helper that can be
> called from inet_pase and from slirp.
>
> inet_parse() can split on the first ",", and then call inet_addr_parse
> on the first segment.
>
> slirp can split on "-", and call inet_addr_parse with both segments.
>


v4 here:
https://lists.nongnu.org/archive/html/qemu-devel/2021-02/msg06011.html

--00000000000092805805bba2367b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">On Thu, Feb 11, 2021 at 1:12 AM Daniel P. Berrang=C3=A9 &lt;<=
a href=3D"mailto:berrange@redhat.com">berrange@redhat.com</a>&gt; wrote:<br=
></div></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex"><span class=3D"gmail_default" style=3D"font-size:small">[...=
]</span><br>
<br>
I think the key useful part to keep common impl for is the handling<br>
of the [] brackets for IPv6 raw addrs. I&#39;d suggest we try to pull the<b=
r>
&quot;address:port&quot; part out into a new inet_addr_parse() helper that =
can be<br>
called from inet_pase and from slirp.<br>
<br>
inet_parse() can split on the first &quot;,&quot;, and then call inet_addr_=
parse<br>
on the first segment.<br>
<br>
slirp can split on &quot;-&quot;, and call inet_addr_parse with both segmen=
ts.<br></blockquote><div><br></div><div><br></div><div class=3D"gmail_defau=
lt" style=3D"font-size:small">v4 here: <a href=3D"https://lists.nongnu.org/=
archive/html/qemu-devel/2021-02/msg06011.html">https://lists.nongnu.org/arc=
hive/html/qemu-devel/2021-02/msg06011.html</a></div></div></div>

--00000000000092805805bba2367b--

