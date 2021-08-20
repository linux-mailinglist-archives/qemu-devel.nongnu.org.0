Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFEE23F28C0
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 10:58:47 +0200 (CEST)
Received: from localhost ([::1]:52140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mH0MQ-0007NE-Tl
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 04:58:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mH0LV-0006iP-Bu
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 04:57:49 -0400
Received: from mail-ot1-f48.google.com ([209.85.210.48]:40458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mH0LT-0002R9-PL
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 04:57:49 -0400
Received: by mail-ot1-f48.google.com with SMTP id
 h63-20020a9d14450000b02904ce97efee36so12147124oth.7
 for <qemu-devel@nongnu.org>; Fri, 20 Aug 2021 01:57:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:content-transfer-encoding;
 bh=2eicVX+l0Spqyia6n01+tHgoLFOFfIMouEZm2vxLtqI=;
 b=rrcxZuMSDWyiUbYy2n/umzOt4s4LXEm4nSS51onObi2GUYNz2aadYAJUP0IiUZPCjk
 Dne+gXvkLTvce6pHEsc+OHPBjYrM65dWVVIFtXpyt+EYdvMNSzxM86e2V2LFKfWbmYQo
 HelY2DgdKOv5z6FWyhhKUpWTQIUb9Gy7/6Rjf040Fc1yIXonxOaeNdeclibWYfF3JFX+
 EfgkcbTPnqV6mUvYnvL60sG9Q5r6Dg7E1zH/XQvc7iAPjKefEvuocBqlFoXZqR8cd3AX
 KJvoHo4pFuZzyYCt7YOAXNRdvoumzGgr1GfcKp8Wh+qT8TTCjl2vBbZU0aqPzBLOKf4O
 nvaw==
X-Gm-Message-State: AOAM5314yBg3AMZ23SevMnS1fT1LA322MGCGdgWHpgEGLuxJWt5VfE7n
 jC8RBlYX7FKNR7EaoX0kdnPkfKP5uQtpuo9nj88=
X-Google-Smtp-Source: ABdhPJx6CBwfpgTOeGM7S9fG8RMlizCpO3QYYq1+bhI2AqPbHNXXDu0oo6fM9SHu53yOyYvApenIihNH1YBFLecxdko=
X-Received: by 2002:a9d:5e0b:: with SMTP id d11mr16195037oti.371.1629449866600; 
 Fri, 20 Aug 2021 01:57:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210820080437.2972139-1-f4bug@amsat.org>
 <94fb14aa-fa01-195f-15c8-db536c6fb74a@chinatelecom.cn>
In-Reply-To: <94fb14aa-fa01-195f-15c8-db536c6fb74a@chinatelecom.cn>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Fri, 20 Aug 2021 10:57:35 +0200
Message-ID: <CAAdtpL5Uv4a-NqfChhEX8-=hVJs9VtRtkt1xckDvxUwGf8Ejnw@mail.gmail.com>
Subject: Re: [PATCH] .mailmap: Fix more contributor entries
To: Hyman Huang <huangy81@chinatelecom.cn>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.210.48;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ot1-f48.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Fri, Aug 20, 2021 at 10:25 AM Hyman Huang <huangy81@chinatelecom.cn> wro=
te:
> =E5=9C=A8 2021/8/20 16:04, Philippe Mathieu-Daud=C3=A9 =E5=86=99=E9=81=93=
:
> > These authors have some incorrect author email field.
> > For each of them, there is one commit with the replaced
> > entry.
> >
> > Cc: Alex Chen <alex.chen@huawei.com>
> > Cc: Bibo Mao <maobibo@loongson.cn>
> > Cc: Guoyi Tu <tu.guoyi@h3c.com>
> > Cc: Haibin Zhang <haibinzhang@tencent.com>
> > Cc: Hyman Huang <huangy81@chinatelecom.cn>
> > Cc: Lichang Zhao <zhaolichang@huawei.com>
> > Cc: Yuanjun Gong <ruc_gongyuanjun@163.com>
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > ---
> > If you are Cc'ed and agree with this change, please reply with a
> > "Reviewed-by: Name <email>" line. I'll wait 2 weeks and consider
> > no reply as a disagreement and will remove your entry from this
> > patch.
> > ---
> Reviewed-by: Hyman Huang <huangy81@chinatelecom.cn>

Thanks!

> >   .mailmap | 7 +++++++
> >   1 file changed, 7 insertions(+)
> >
> > diff --git a/.mailmap b/.mailmap
> > index f029d1c21fe..11b259e7d07 100644
> > --- a/.mailmap
> > +++ b/.mailmap
> > @@ -69,6 +69,7 @@ Yongbok Kim <yongbok.kim@mips.com> <yongbok.kim@imgte=
c.com>
> >   # git author config, or had utf8/latin1 encoding issues.
> >   Aaron Lindsay <aaron@os.amperecomputing.com>
> >   Alexey Gerasimenko <x1917x@gmail.com>
> > +Alex Chen <alex.chen@huawei.com>
> >   Alex Ivanov <void@aleksoft.net>
> >   Andreas F=C3=A4rber <afaerber@suse.de>
> >   Bandan Das <bsd@redhat.com>
> > @@ -76,6 +77,7 @@ Benjamin MARSILI <mlspirat42@gmail.com>
> >   Beno=C3=AEt Canet <benoit.canet@gmail.com>
> >   Beno=C3=AEt Canet <benoit.canet@irqsave.net>
> >   Beno=C3=AEt Canet <benoit.canet@nodalink.com>
> > +Bibo Mao <maobibo@loongson.cn>
> >   Boqun Feng <boqun.feng@gmail.com>
> >   Boqun Feng <boqun.feng@intel.com>
> >   Brad Smith <brad@comstyle.com>
> > @@ -99,9 +101,12 @@ Gautham R. Shenoy <ego@in.ibm.com>
> >   Gautham R. Shenoy <ego@linux.vnet.ibm.com>
> >   Gonglei (Arei) <arei.gonglei@huawei.com>
> >   Guang Wang <wang.guang55@zte.com.cn>
> > +Guoyi Tu <tu.guoyi@h3c.com>
> > +Haibin Zhang <haibinzhang@tencent.com>
> >   Hailiang Zhang <zhang.zhanghailiang@huawei.com>
> >   Hanna Reitz <hreitz@redhat.com> <mreitz@redhat.com>
> >   Herv=C3=A9 Poussineau <hpoussin@reactos.org>
> > +Hyman Huang <huangy81@chinatelecom.cn>
> >   Jakub Jerm=C3=A1=C5=99 <jakub@jermar.eu>
> >   Jakub Jerm=C3=A1=C5=99 <jakub.jermar@kernkonzept.com>
> >   Jean-Christophe Dubois <jcd@tribudubois.net>
> > @@ -113,6 +118,7 @@ Jun Li <junmuzi@gmail.com>
> >   Laurent Vivier <Laurent@lvivier.info>
> >   Leandro Lupori <leandro.lupori@gmail.com>
> >   Li Guang <lig.fnst@cn.fujitsu.com>
> > +Lichang Zhao <zhaolichang@huawei.com>
> >   Liming Wang <walimisdev@gmail.com>
> >   linzhecheng <linzc@zju.edu.cn>
> >   Liran Schour <lirans@il.ibm.com>
> > @@ -171,6 +177,7 @@ Xiong Zhang <xiong.y.zhang@intel.com>
> >   Yin Yin <yin.yin@cs2c.com.cn>
> >   Yu-Chen Lin <npes87184@gmail.com>
> >   Yu-Chen Lin <npes87184@gmail.com> <yuchenlin@synology.com>
> > +Yuanjun Gong <ruc_gongyuanjun@163.com>
> >   YunQiang Su <syq@debian.org>
> >   YunQiang Su <ysu@wavecomp.com>
> >   Yuri Pudgorodskiy <yur@virtuozzo.com>
> >
>
> --

