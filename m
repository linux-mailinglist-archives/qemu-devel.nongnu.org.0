Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 282B43FAE5E
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Aug 2021 22:16:13 +0200 (CEST)
Received: from localhost ([::1]:40572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKRDv-0004JR-Nv
	for lists+qemu-devel@lfdr.de; Sun, 29 Aug 2021 16:16:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1mKRBm-0000tq-8P
 for qemu-devel@nongnu.org; Sun, 29 Aug 2021 16:13:58 -0400
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229]:40464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1mKRBk-00042K-Cd
 for qemu-devel@nongnu.org; Sun, 29 Aug 2021 16:13:57 -0400
Received: by mail-oi1-x229.google.com with SMTP id h133so17298983oib.7
 for <qemu-devel@nongnu.org>; Sun, 29 Aug 2021 13:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FEjC6UQkVmhHrBAXv4K5oKTSaSQACRnHYNSE0EDzrfg=;
 b=nKtQNNpxoIUA55luqDO8/TLgCFesgSOBJkEABqgtXYrM/6rckM3n18ER12qNLE4IC0
 jXEpNkPSP7oqZUrmYh5RQELbhssRWKWhwlWCSmL1PpfI2kiIt+bRnXRH4IUSROqavm8K
 eA7TngNULywmwqJazp3XWoP06lgOfB4Aq1zPVXQv09P36XEBMhGO8bh65dGwuTCArSx1
 XJBfhCBFDGfwQiGg9Ei8mIFIyjvxjXQPbGbO3fEE7Uzy51N/4Xq/nEHVsVqaetMj5q3r
 315YvNHIfSJEadYedi5/Q+FDsQ2He2dI60tFJgoIfc9jmaCZElkp/BFdAEaRLr+qlwpU
 yLcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FEjC6UQkVmhHrBAXv4K5oKTSaSQACRnHYNSE0EDzrfg=;
 b=oFQjAhVFXFOGDJbykazdvuMNsi/kMgXNreZBGAD48tltNDadqUheWJGM97hc0g2tqf
 S4JRJ+DgkI9WiwBAWe5xG18zchcPCEAiH8herxLcqrPTtIwROleZr7w4s2v2F1Hb8cDp
 kA6IlEQuQiE3yr3YFD8J1tyjPOhJFL7Z4xmuCGt5/mb0NLssQn1eYJ18jKOKCF4X51IB
 RD5T4dpL4xe/dqRHjMedLSAoEpxdS8xNnInCCmezlgDdM+5cHNYv/5L8q5nMqDt5iavL
 v51F/nmJ7JX4eX6DDz0yoqFK8S+Oo6Bn8Lp1tnr3llMOXwqGdDB2XuU7JtOjhhmKR/21
 lO/w==
X-Gm-Message-State: AOAM532+qfHZHfdMKSFoqdnxN7e8g/XRD5SBGffP8g5QawLF8rkTdwUy
 8WY/zIZFUKcY/quWnQPEUiv2UwsLcpn8JnxolqiB0Q==
X-Google-Smtp-Source: ABdhPJwnENF8reTEYrmRUizBdRtmSwLdQ1fnMNERsXQw3q17vaGnrr6em5j78sVQnEzFuDLTzaURgO5Y+tfJ4mL1bH4=
X-Received: by 2002:a54:4686:: with SMTP id k6mr22342752oic.54.1630268034681; 
 Sun, 29 Aug 2021 13:13:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210713153758.323614-1-andrew@daynix.com>
 <20210713153758.323614-6-andrew@daynix.com>
 <87y29dct4m.fsf@dusky.pond.sub.org>
 <CABcq3pE3vAh=Cs=VjjkioooEbbPjgNEtCEZGwtoxaCn0OCRQkg@mail.gmail.com>
 <877dgbpco1.fsf@dusky.pond.sub.org>
In-Reply-To: <877dgbpco1.fsf@dusky.pond.sub.org>
From: Yuri Benditovich <yuri.benditovich@daynix.com>
Date: Sun, 29 Aug 2021 23:13:42 +0300
Message-ID: <CAOEp5OcyvQ9Y2onyHuJnwjtWK+Tx9QxYXUePd1kJ=V9+H9wraw@mail.gmail.com>
Subject: Re: [PATCH 5/5] qmp: Added qemu-ebpf-rss-path command.
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2607:f8b0:4864:20::229;
 envelope-from=yuri.benditovich@daynix.com; helo=mail-oi1-x229.google.com
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

On Tue, Aug 24, 2021 at 9:41 AM Markus Armbruster <armbru@redhat.com> wrote:
>
> Andrew Melnichenko <andrew@daynix.com> writes:
>
> > Hi,
> >
> >> The helper may or may not be installed at the path compiled into QEMU.
> >>
> > Yes, so the helper will not be called - QEMU will try to initiate eBPF RSS
> > or use "in-qemu" RSS.
>
> My point is: the proposed command's mission is to help the management
> application run the right helper.  However, its advice is *unreliable*.
> It may point to the wrong helper, or to nothing at all.  The right
> helper may still exist elsewhere.

Hi Markus,
Indeed the intention of this command is to return the proper helper.
Especially in the case of RSS helper this is *reliable* advice and it
points to the helper that was built together with QEMU, i.e. with the
same headers.
This was discussed earlier, for example in
https://lists.nongnu.org/archive/html/qemu-devel/2021-06/msg02248.html

>
> I suspect you're trying to address the problem at the wrong level.

What is the proper solution for the problem from your point of view?

>
> Similar versioning issues exist with other helpers.  We've been doing
> fine without QEMU providing unreliable advice on where they might sit in
> the file system.  What makes this one different?

This one is required to be *fully synchronized* with the existing build of QEMU.
Other helpers are probably less restrictive and do not have common
structures definitions with the QEMU, otherwise they would face the
same problem.

>
> >> What happens when you use the wrong helper?

Our intention is that libvirt should never use the wrong RSS helper.
But it does not have any ability to check which helper is compatible
with the QEMU.
QEMU can easily recognize the correct one.

> >>
> > UB - in most cases, eBPF program will work with wrong configurations.
> > That's why the stamp was added.
> >
> > query-helper-paths checks the stamp only for RSS helper.
>
> I have no idea what you're talking about :)
>
> My best guess is that you're trying to tell me that attempting to work
> with the wrong helper will fail cleanly due to some stamp check.  That
> would be nice.
>

