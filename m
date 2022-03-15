Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2534D9A99
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 12:48:01 +0100 (CET)
Received: from localhost ([::1]:40644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU5ei-0002pU-DX
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 07:48:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nU5VR-0000la-Kf
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 07:38:27 -0400
Received: from [2a00:1450:4864:20::632] (port=46993
 helo=mail-ej1-x632.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nU5VN-00035I-FS
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 07:38:23 -0400
Received: by mail-ej1-x632.google.com with SMTP id qx21so40521432ejb.13
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 04:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hW1upnVTk/L4TDU9J3Q1TPeyvZob6hkipnQ+HzDDFss=;
 b=6FUDMWdYdY9i4/ximgTcI5vkW/T6lYUWX9STpbCBZRt0wsJAy7bTIChj7I3HNaYRxw
 E2vtEM2lXx0PHOUv0ZKPobRswfHoR1AGL7/AkwV3te+XEWcj3shIDrvgL6O3vIIuo90s
 5DryMxrSi3DTLAE42/Yg2xuWoXPJbAfNaSlbPPy20r8WZINBrkcJs5CPpy3B67cBFjIa
 0UYZUB0xkFtFZaasafpZJlAr1jt89ivch7QatmCO76XLk1YjU2nMWcyrYGkf8K+NtRIi
 YlkOhw7R0SGBcjWNZMi/2BOHP9ISw2lcZq7s0Ce+KK8z0/4JArdGN3FxrZd80iD6Joz+
 6RkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hW1upnVTk/L4TDU9J3Q1TPeyvZob6hkipnQ+HzDDFss=;
 b=kUcq1O5GUIIpDOVxYYAiweMUWxVKdWDm5Cd2RC6XLDbfxdboOveA9Pv67FAFlX/rO6
 /bkXybZr1k9mdJ78F3uxzuW+Yq5S5/OTfo3T4p8MoxVlR/XWTuWW3Bbg4dLE3bGB7BEv
 UJZNx46V8NFu1LYVspQ3UqW6s91TW8xAjZZMVpDtfFDr13lzm0XsIZSrhlmPbodY4o5f
 LHZuCxJjXpSADMRk1kiIWjvgipQmtQ3PDsjaVHgrwjpjAmF18AGFwSm8kNiJghQF7b8I
 8tHl9slp/XFBOLnzPx/wiE5RH4lDd2bx4MERR6YZd+sV1Ruifj17aQ+O4nwTIFTUtiTK
 SjhQ==
X-Gm-Message-State: AOAM5336J3b7iXwQ2Vc6TGceUl/QWJhOwT2vnG3moIwWUIOvqJSYmP25
 atS5DM1vZJ1om6d5wD/XFtDdlNB6Ft+VCh0PUX3o
X-Google-Smtp-Source: ABdhPJzp152yErfD7ae8P+nReNBdcwK4Si9RiF1Gz0Uurvm20ni9u5R34z4ntDlCS9JZXJpMo6oYeH/pGImjcmKRpgk=
X-Received: by 2002:a17:907:9706:b0:6db:566a:4408 with SMTP id
 jg6-20020a170907970600b006db566a4408mr22311602ejc.374.1647344298503; Tue, 15
 Mar 2022 04:38:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220215105943.90-1-xieyongji@bytedance.com>
 <20220215105943.90-4-xieyongji@bytedance.com>
 <YjBg3QnSnpY2cAdL@stefanha-x1.localdomain>
In-Reply-To: <YjBg3QnSnpY2cAdL@stefanha-x1.localdomain>
From: Yongji Xie <xieyongji@bytedance.com>
Date: Tue, 15 Mar 2022 19:38:12 +0800
Message-ID: <CACycT3s7cgHBAqmpy=RZPwPZz4uptr0REzJ9fhM1qv+G_miS1Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] libvduse: Add VDUSE (vDPA Device in Userspace)
 library
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::632
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=xieyongji@bytedance.com; helo=mail-ej1-x632.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, mreitz@redhat.com, mlureau@redhat.com,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 15, 2022 at 5:48 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> On Tue, Feb 15, 2022 at 06:59:40PM +0800, Xie Yongji wrote:
> > VDUSE [1] is a linux framework that makes it possible to implement
> > software-emulated vDPA devices in userspace. This adds a library
> > as a subproject to help implementing VDUSE backends in QEMU.
> >
> > [1] https://www.kernel.org/doc/html/latest/userspace-api/vduse.html
> >
> > Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
> > ---
> >  meson.build                                 |   15 +
> >  meson_options.txt                           |    2 +
> >  scripts/meson-buildoptions.sh               |    3 +
> >  subprojects/libvduse/include/atomic.h       |    1 +
> >  subprojects/libvduse/libvduse.c             | 1152 +++++++++++++++++++
> >  subprojects/libvduse/libvduse.h             |  225 ++++
> >  subprojects/libvduse/linux-headers/linux    |    1 +
> >  subprojects/libvduse/meson.build            |   10 +
> >  subprojects/libvduse/standard-headers/linux |    1 +
> >  9 files changed, 1410 insertions(+)
> >  create mode 120000 subprojects/libvduse/include/atomic.h
> >  create mode 100644 subprojects/libvduse/libvduse.c
> >  create mode 100644 subprojects/libvduse/libvduse.h
> >  create mode 120000 subprojects/libvduse/linux-headers/linux
> >  create mode 100644 subprojects/libvduse/meson.build
> >  create mode 120000 subprojects/libvduse/standard-headers/linux
>
> Please update the ./MAINTAINERS file when adding new source files.

OK, sure. And would you mind being one of the maintainers since I'm
not sure if I can do this job well.

Thanks,
Yongji

