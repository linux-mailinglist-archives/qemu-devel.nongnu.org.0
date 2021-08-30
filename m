Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 043683FB217
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 09:53:43 +0200 (CEST)
Received: from localhost ([::1]:45552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKc6v-0003qZ-BJ
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 03:53:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1mKc5V-00038I-PF
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 03:52:13 -0400
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232]:43662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1mKc5Q-0003i8-7U
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 03:52:13 -0400
Received: by mail-oi1-x232.google.com with SMTP id w19so18745616oik.10
 for <qemu-devel@nongnu.org>; Mon, 30 Aug 2021 00:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qC73ku1+tpja46j+FzQG4aTYs/rlWV5pPUxIQGJw5OI=;
 b=NGANoMO5ry3/s7gbzIRtpMqAjVpMroopjzAxyI05xApSih54f27MQAZwFE82U8m0Ai
 ExXl1Z8VHU2kz2CNZuBKEI+h6xwx1AWqww822fu9b07UNzZh6Sl3jy+uqh9ctI3DXIeZ
 NHR0oUAD/JDiwqA2kXSwg/OF5vcYoeaa1JU9Hf0xsW/Vx1gMbOuy+cU9suO3M76cykAY
 0X6RFHFuLXhmYnbFY2549atVLrLQNlVmvRbnhpZfMU19L9a3WaIlx2a0uyDTh9CKiKKl
 YQC2ekR+V5/SIllLhW+K6EcbYypfxEXzewFgXcjDDPrUqPLYjKECbs24heS7emKpr4mz
 /QMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qC73ku1+tpja46j+FzQG4aTYs/rlWV5pPUxIQGJw5OI=;
 b=KykkeX4WyJuSovWEYLyZk4Bc11hyS8lDwO0HKE8KqaCn6rU3wwj3Pfxr75mN63DKEG
 WTggfSppQMPzQAiQh3y+ave5evNeQUmJ9tJ4E14hqnfc6v7k1zCDnfqknOMFKRPznMUx
 I/mcOKVi6WVQw81FH8aeoU+GgA51kGC1LCTNGZoZbFi+uAsWj0a6HCW+NYdVUxtt2YvV
 IOtG8L5OUfABqefNPzzZfDjVE8NIILVc8eWb0SC5tt2sIrE6TUdAY5FanKvSTW4c1chg
 +o+SCptXPXbsO7QlTL/+dUwXPS3+pUjHXSz78oHLlKhY/E4SwQfrB6seHBnjby5sBGls
 vAUg==
X-Gm-Message-State: AOAM533j8zGpBetg6le7+38Ddf5pVRPhLKSiQdSCnQiSkThLqDRTddJk
 W4xOAbqPbbDmdC2PBAZWrt6HaJtLBeKQML9nhBV0kA==
X-Google-Smtp-Source: ABdhPJw7Fu3XXxONien1hZiu6WbJG9Xq4YGYblzHqVKJ9EZiLbgGkS0zOJTBaZb0bYapBBhRGE1g/xUFIeeCWDmWS9U=
X-Received: by 2002:a05:6808:1d3:: with SMTP id
 x19mr13958851oic.137.1630309927166; 
 Mon, 30 Aug 2021 00:52:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210713153758.323614-1-andrew@daynix.com>
 <20210713153758.323614-6-andrew@daynix.com>
 <87y29dct4m.fsf@dusky.pond.sub.org>
 <CABcq3pE3vAh=Cs=VjjkioooEbbPjgNEtCEZGwtoxaCn0OCRQkg@mail.gmail.com>
 <877dgbpco1.fsf@dusky.pond.sub.org>
 <CAOEp5OcyvQ9Y2onyHuJnwjtWK+Tx9QxYXUePd1kJ=V9+H9wraw@mail.gmail.com>
 <87v93n8nu3.fsf@dusky.pond.sub.org>
In-Reply-To: <87v93n8nu3.fsf@dusky.pond.sub.org>
From: Yuri Benditovich <yuri.benditovich@daynix.com>
Date: Mon, 30 Aug 2021 10:51:54 +0300
Message-ID: <CAOEp5Of0C4yUhwbgFmu4roiEmNXZ8qiNMUA3CCBE8Zwu=OWhtQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] qmp: Added qemu-ebpf-rss-path command.
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2607:f8b0:4864:20::232;
 envelope-from=yuri.benditovich@daynix.com; helo=mail-oi1-x232.google.com
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
Cc: Andrew Melnichenko <andrew@daynix.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Yan Vugenfirer <yan@daynix.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 30, 2021 at 9:10 AM Markus Armbruster <armbru@redhat.com> wrote:
>
> Yuri Benditovich <yuri.benditovich@daynix.com> writes:
>
> > On Tue, Aug 24, 2021 at 9:41 AM Markus Armbruster <armbru@redhat.com> wrote:
> >>
> >> Andrew Melnichenko <andrew@daynix.com> writes:
> >>
> >> > Hi,
> >> >
> >> >> The helper may or may not be installed at the path compiled into QEMU.
> >> >>
> >> > Yes, so the helper will not be called - QEMU will try to initiate eBPF RSS
> >> > or use "in-qemu" RSS.
> >>
> >> My point is: the proposed command's mission is to help the management
> >> application run the right helper.  However, its advice is *unreliable*.
> >> It may point to the wrong helper, or to nothing at all.  The right
> >> helper may still exist elsewhere.
> >
> > Hi Markus,
> > Indeed the intention of this command is to return the proper helper.
> > Especially in the case of RSS helper this is *reliable* advice and it
> > points to the helper that was built together with QEMU, i.e. with the
> > same headers.
> > This was discussed earlier, for example in
> > https://lists.nongnu.org/archive/html/qemu-devel/2021-06/msg02248.html
> >
> >>
> >> I suspect you're trying to address the problem at the wrong level.
> >
> > What is the proper solution for the problem from your point of view?
>
> I'll explain in more detail, but first I'd like you to answer my
> question below.
>
> >> Similar versioning issues exist with other helpers.  We've been doing
> >> fine without QEMU providing unreliable advice on where they might sit in
> >> the file system.  What makes this one different?
> >
> > This one is required to be *fully synchronized* with the existing build of QEMU.
> > Other helpers are probably less restrictive and do not have common
> > structures definitions with the QEMU, otherwise they would face the
> > same problem.
> >
> >>
> >> >> What happens when you use the wrong helper?
> >
> > Our intention is that libvirt should never use the wrong RSS helper.
> > But it does not have any ability to check which helper is compatible
> > with the QEMU.
> > QEMU can easily recognize the correct one.
>
> You did not actually answer my question :)
>
> So let's try again: if libvirt does use the wrong RSS helper, how does
> the system behave?

The receive-side scaling may work incorrectly, i.e. finally may move
incoming packets to a virtqueue different than expected one.

>
> >> >>
> >> > UB - in most cases, eBPF program will work with wrong configurations.
> >> > That's why the stamp was added.
> >> >
> >> > query-helper-paths checks the stamp only for RSS helper.
> >>
> >> I have no idea what you're talking about :)
> >>
> >> My best guess is that you're trying to tell me that attempting to work
> >> with the wrong helper will fail cleanly due to some stamp check.  That
> >> would be nice.
> >>
>

