Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C550334A230
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 07:53:01 +0100 (CET)
Received: from localhost ([::1]:39126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPgL5-0003bV-W1
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 02:53:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lPgJL-0002dj-CW
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 02:51:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lPgJH-0000k9-Be
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 02:51:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616741465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1sc34Rm4OCNbTU2kKx14Xw5gbNJRizIRSn6nEyxwkp4=;
 b=e4yGGQyTkv0ZYi7rPplO2e7luWwCQR/xeFE2RHKDY1P48/QlWFLxKfvPA4qLaXokLrMlax
 focRxN/hmM2KYBbgAdQ1UbzJoPn6NBs8BPJtUUXHsX2I0471xFJtyWjNgcUSRFpUWu2Cr5
 zVBPA/CRl9jl/WgesS1zknHFxJzeyKw=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-7VbCpiyiMsOaEhFxrxeZsA-1; Fri, 26 Mar 2021 02:51:00 -0400
X-MC-Unique: 7VbCpiyiMsOaEhFxrxeZsA-1
Received: by mail-pl1-f199.google.com with SMTP id x7so2056231plg.18
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 23:51:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1sc34Rm4OCNbTU2kKx14Xw5gbNJRizIRSn6nEyxwkp4=;
 b=DDzgL4nvu/6DizTqEok5fQPm7AhVjwxStJBrruFdwxsXCD5lnq5fBzUQVAxb6Uqnmb
 3lO5IOtUPT8pbWSbjjKNvFdbUGIpjRWqyMeqpabVY+P39y3mnqFnhRS2FZmBtwEEkdnZ
 MsoT9RpXIrCSONTa1cL7VgKHXgdekc6qg5s36fgNkEnkx+L1rDLbvwzn7TEDhvdHay3R
 lBJQTFQpCluFkCckXaE513+IDt+SezVqnz/wjrxEU5zHDi/GbbSDRukE4+pS/QX0OANY
 wxatEprx7mpFkFiNxZhrnMk2CVfTvGt7EE3LiJgvaPv/K1RiW1//AU3CEb8KYHMlXTU5
 +Ifg==
X-Gm-Message-State: AOAM531b2H2uSJmkRngGnEsExYslhhO2uBY3cg6OvO6SHOTHDCUteibY
 RpdPBJEe7jLta25lteF9aZk4Q905au17f+zk5pmNCQQVRZ2RoZ+FExqK+6d0bGZUOzUAMHiSKMY
 Fwh1HF7tvlqzFt1xzmi5ExBXewBfyYv0=
X-Received: by 2002:a63:3ecb:: with SMTP id
 l194mr10845959pga.146.1616741459585; 
 Thu, 25 Mar 2021 23:50:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzRra4Ral/F9ScM2hOETyW7OZXMVhQP9qdfRhlHM5hOK76HcMdTSk4iROIbttWR+YMrQFyKs3lH4ycQZD9HN3A=
X-Received: by 2002:a63:3ecb:: with SMTP id
 l194mr10845947pga.146.1616741459347; 
 Thu, 25 Mar 2021 23:50:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210323181928.311862-1-pbonzini@redhat.com>
 <7aeb5c5b-59a5-20b5-4aff-c622e6914d24@redhat.com>
In-Reply-To: <7aeb5c5b-59a5-20b5-4aff-c622e6914d24@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 26 Mar 2021 07:50:46 +0100
Message-ID: <CABgObfZdMvySUHZTJqWYx-_vx+F9jtw4z3ueiZ=rrxKzo-dw0w@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] qemu-iotests: quality of life improvements
To: Max Reitz <mreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000060ecfd05be6af4ee"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>, "Wolf,
 Kevin" <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 "open list:Block layer core" <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000060ecfd05be6af4ee
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Il gio 25 mar 2021, 19:15 Max Reitz <mreitz@redhat.com> ha scritto:

> I=E2=80=99ve applied an s/,attr/, attr/ to patch 1 (as suggested by Vladi=
mir)
> and an s/debug: bool=3D False/debug: bool =3D False/ to patch 2.  I hope
> that=E2=80=99s OK for you.
>
> With that I=E2=80=99ve applied the series to my block branch:
>
> https://git.xanclic.moe/XanClic/qemu/commits/branch/block


Of course, thanks Max!

Paolo

--00000000000060ecfd05be6af4ee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">Il gio 25 mar 2021, 19:15 Max Reitz &lt;<a href=3D"mailto:mrei=
tz@redhat.com">mreitz@redhat.com</a>&gt; ha scritto:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">I=E2=80=99ve applied an s/,attr/, attr/ to patch 1 (as su=
ggested by Vladimir) <br>
and an s/debug: bool=3D False/debug: bool =3D False/ to patch 2.=C2=A0 I ho=
pe <br>
that=E2=80=99s OK for you.<br>
<br>
With that I=E2=80=99ve applied the series to my block branch:<br>
<br>
<a href=3D"https://git.xanclic.moe/XanClic/qemu/commits/branch/block" rel=
=3D"noreferrer noreferrer" target=3D"_blank">https://git.xanclic.moe/XanCli=
c/qemu/commits/branch/block</a></blockquote></div></div><div dir=3D"auto"><=
br></div><div dir=3D"auto"><span style=3D"font-family:sans-serif">Of course=
, thanks Max!</span><br></div><div dir=3D"auto"><br></div><div dir=3D"auto"=
>Paolo</div><div dir=3D"auto"></div></div>

--00000000000060ecfd05be6af4ee--


