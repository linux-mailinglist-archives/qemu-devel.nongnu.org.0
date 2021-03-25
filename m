Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B99348C21
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 10:02:22 +0100 (CET)
Received: from localhost ([::1]:53858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPLsj-0001xI-MI
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 05:02:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1lPLrN-0001RG-Cs
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 05:00:57 -0400
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f]:39436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1lPLrK-0003le-T9
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 05:00:57 -0400
Received: by mail-ot1-x32f.google.com with SMTP id
 h6-20020a0568300346b02901b71a850ab4so1254987ote.6
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 02:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=OsaYZbaqaPFIGFQeJHNjY2XxDQg1y1F8nJHAopTujEk=;
 b=xlMCZYIle1b6JGUld+AdRaHoyrgivSluEuWQny+a3PiQeI8Qy3Fs/rUWkdF69EUYVw
 kZPjGfADw1vK7VL1RhdnThK26ryAPe9OXcT7pYhnD64qfNr7ArR4vXy9Li6EOq1DGbqe
 CH/9kks/9cCUw6kgDYdbTjyJvgqjljeEXQes7japlb+R4DXefO+vxcfH2i94wcVukaJR
 1kNDLFX3egFHXcf5dYiqeSISENPdUD0+Pb+5YKbmJxUU7wz1t6si64icP0Ej/4XlH2+q
 w28mcYM7UXJtihS/bzIV0cZriZvfAWXXw//xJuXyObeOtnl/2MxSX1mkhrHy3A2g9bPF
 5n5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OsaYZbaqaPFIGFQeJHNjY2XxDQg1y1F8nJHAopTujEk=;
 b=UxrbrQqIR4BqKPKY9D6XlpYwv5alBSGlMH8z0VfLK5BSvhGqVwuF3vYj9/fu4RSI33
 /unde8ox93r2UxxhdeGplB935Rm5VUTdk17rIJE0Pwr1vGlLb+eav6e8Vbt5J10G8u14
 CgZcblN02FlilY4cOdi8Gw6kQawdG7OTw+b+IYPXHw+5CUw7nXhM0KYw1tG7JcmDfj28
 42olsTIWwgd94x7Eo8PodaDe6lYm+iVfLKd1kD2iS2p/5VxMwUj27at7i9NHr0+RoFV+
 tn63TQROzoHxYdSX7KwmASQRVEykOdbSsGu5prwwl7N2vWPyJCt202JF62shYOHcEYYS
 Rx1g==
X-Gm-Message-State: AOAM530xiOiFcuh0HJcGVnP0I2VRRHoc0i5gNb8YbJfnhKPblTCJfylP
 /MH8pBFS5Ka42uRdOetdzemh3xBV2Hr/08IpKYSj6Q==
X-Google-Smtp-Source: ABdhPJxuGt+dA+ge/QX2VMozrWku/FajlooLXHheyExy97iuhkL3WHuGLwjD433yxhslmvRfyPck3JuRE0WBVKgWtnw=
X-Received: by 2002:a9d:740a:: with SMTP id n10mr6646878otk.27.1616662852838; 
 Thu, 25 Mar 2021 02:00:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210322122452.369750-1-yuri.benditovich@daynix.com>
 <aa33a355-5980-5ff5-7264-02d6fc7f5f9d@redhat.com>
In-Reply-To: <aa33a355-5980-5ff5-7264-02d6fc7f5f9d@redhat.com>
From: Yuri Benditovich <yuri.benditovich@daynix.com>
Date: Thu, 25 Mar 2021 11:00:41 +0200
Message-ID: <CAOEp5Od+jPYdmFdD3z3hVjs5t6QXgmEoOTPHO5cLVyifjmjgRQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/3] virtio-net: graceful drop of vhost for TAP
To: Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2607:f8b0:4864:20::32f;
 envelope-from=yuri.benditovich@daynix.com; helo=mail-ot1-x32f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Yan Vugenfirer <yan@daynix.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Jason,

This was discussed earlier on the previous series of patches.
https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg01829.html
There were strong objections from both Daniel and Michael and I feel
that the series was rejected.
There was Michael's claim:
"We did what this patch is trying to change for years now, in
particular KVM also seems to happily disable CPU features not supported
by kernel so I wonder why we can't keep doing it, with tweaks for some
corner cases."
https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg03187.html
And it was Michael's question:
"Can we limit the change to when a VM is migrated in?"
https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg03163.html
So I'm trying to suggest another approach:
- In case of conflicting features (for example RSS and vhost) we in
qemu we do not have enough information to prefer one or another.
- If we drop to userspace in the first set_features we say: "vhost is
less important than other requested features"
- This series keeps backward compatibility, i.e. if you start with
vhost and some features are not available - they are silently cleared.
- But in case the features are available on source machine - they are used
- In case of migration this series says: "We prefer successful
migration even if for that we need to drop to userspace"
- On the migration back to the 1st system we again work with all the
features and with vhost as all the features are available.

Thanks,
Yuri



On Thu, Mar 25, 2021 at 8:59 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2021/3/22 =E4=B8=8B=E5=8D=888:24, Yuri Benditovich =E5=86=99=E9=
=81=93:
> > Allow fallback to userspace only upon migration, only for specific feat=
ures
> > and only if 'vhostforce' is not requested.
> >
> > Changes from v1:
> > Patch 1 dropeed (will be submitted in another series)
> > Added device callback in case the migration should fail due to missing =
features
>
>
> Hi Yuri:
>
> Have a quick glance at the series. A questions is why we need to do the
> fallback only during load?
>
> I think we should do it in the device initializating. E.g when the vhost
> features can not satisfy, we should disable vhost since there.
>
> Thanks
>
>
> >
> > Yuri Benditovich (3):
> >    net: add ability to hide (disable) vhost_net
> >    virtio: introduce 'missing_features_migrated' device callback
> >    virtio-net: implement missing_features_migrated callback
> >
> >   hw/net/vhost_net.c         |  4 ++-
> >   hw/net/virtio-net.c        | 51 +++++++++++++++++++++++++++++++++++++=
+
> >   hw/virtio/virtio.c         |  8 ++++++
> >   include/hw/virtio/virtio.h |  8 ++++++
> >   include/net/net.h          |  1 +
> >   5 files changed, 71 insertions(+), 1 deletion(-)
> >
>

