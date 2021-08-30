Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E673FBA78
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 18:57:34 +0200 (CEST)
Received: from localhost ([::1]:36872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKkb4-00059R-Eg
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 12:57:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1mKka3-0004Og-D6
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 12:56:19 -0400
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e]:38730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1mKka1-0006Hc-D6
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 12:56:19 -0400
Received: by mail-ot1-x32e.google.com with SMTP id
 i8-20020a056830402800b0051afc3e373aso19237607ots.5
 for <qemu-devel@nongnu.org>; Mon, 30 Aug 2021 09:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+dCCdDV4BPZdyGCItByPUoT49rYjWC3LEpTdddrbEQo=;
 b=gJgUAnt05QVp1Ph7dDaqfiIpWMCLIa19o0ULea9B0zMeJho5m1uxArChp0GZWzLdGd
 xBqaAddsTDlb7NJnX66AFN3rV8roIQfDw48T4hqijigqQsFXS9YZcJX1fj6deUlsk7Oe
 /SyqCq6Wm+9Sy8gShmb7H+p2eZIi4qdRH6HyMqSMEE0ml3ReOQIuOy87GH0D8wH02X8Q
 hLAUoURxbgtQpayKKTZigyei2ONgsgqWUSUtrCXwk2shJvFhgXDtGjWwAJtikpX6K0S3
 KsMK6y0odyuYKYUthsUT7AQ2OFCGukuzgtMmpEeeHVIi6iOqLeIgynP9YqiJ9GAYP7YF
 zuJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+dCCdDV4BPZdyGCItByPUoT49rYjWC3LEpTdddrbEQo=;
 b=f6TKQ4Rl5vH090Nqvth6+S9dNy6p6oogjou8w+88lSzkZqiRam8pp5EXWqNP44R9zY
 SuoohFntHNSCYyZSYygjGMNiaUTKdWbNYcAi5OtULrMTcV+9ltx2GqYhPN6NYj1NVXnu
 O/xlmrMG3uW5z7MWAKUp3qE6KHYrRFzQQOh9Eyvw2s9cMuvDNEaNVgzdLGwRqDYcO2KX
 loqJtGAVQ3OMHbBZR12HB7L+034wIT+eN10hWj6q90is+NpGvDSoAmYQFa6QAhwJlgFt
 OdGsSMTgXOYBG/3JcoZf+T3v3IL4T1ixgvckUDl11OMoXcdDKz9BEdaw1iFOjYDbj9T4
 EHjw==
X-Gm-Message-State: AOAM530IUWCQFC6l8RF8Av1eQ6hNkcrEgd5EDxYKkl2aQung/fAue2R2
 Tu7sNCyN1DRtGF2Wj1QarwPeG4na/P/lleRNv8na3Q==
X-Google-Smtp-Source: ABdhPJyB2z5sOVmE9qCQZzvyumGfwoV7OdSwzBxYqKMmK/UnCgwr/JEfcH4dlBA9RVZVrDecaBQL5oZkd17OpLQU5nI=
X-Received: by 2002:a05:6830:1009:: with SMTP id
 a9mr21302752otp.220.1630342575889; 
 Mon, 30 Aug 2021 09:56:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210713153758.323614-1-andrew@daynix.com>
 <20210713153758.323614-6-andrew@daynix.com>
 <87y29dct4m.fsf@dusky.pond.sub.org>
 <CABcq3pE3vAh=Cs=VjjkioooEbbPjgNEtCEZGwtoxaCn0OCRQkg@mail.gmail.com>
 <877dgbpco1.fsf@dusky.pond.sub.org>
 <CAOEp5OcyvQ9Y2onyHuJnwjtWK+Tx9QxYXUePd1kJ=V9+H9wraw@mail.gmail.com>
 <87v93n8nu3.fsf@dusky.pond.sub.org>
 <CAOEp5Of0C4yUhwbgFmu4roiEmNXZ8qiNMUA3CCBE8Zwu=OWhtQ@mail.gmail.com>
 <87a6kz8i4g.fsf@dusky.pond.sub.org>
In-Reply-To: <87a6kz8i4g.fsf@dusky.pond.sub.org>
From: Yuri Benditovich <yuri.benditovich@daynix.com>
Date: Mon, 30 Aug 2021 19:56:03 +0300
Message-ID: <CAOEp5OfxM+YyZFMUxDrcOw6eKRhyhouJ3q+UnAx3x7sXhQQvHQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] qmp: Added qemu-ebpf-rss-path command.
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2607:f8b0:4864:20::32e;
 envelope-from=yuri.benditovich@daynix.com; helo=mail-ot1-x32e.google.com
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

On Mon, Aug 30, 2021 at 11:14 AM Markus Armbruster <armbru@redhat.com> wrote:
>
> Yuri Benditovich <yuri.benditovich@daynix.com> writes:
>
> > On Mon, Aug 30, 2021 at 9:10 AM Markus Armbruster <armbru@redhat.com> wrote:
> >>
> >> Yuri Benditovich <yuri.benditovich@daynix.com> writes:
> >>
> >> > On Tue, Aug 24, 2021 at 9:41 AM Markus Armbruster <armbru@redhat.com> wrote:
> >> >>
> >> >> Andrew Melnichenko <andrew@daynix.com> writes:
> >> >>
> >> >> > Hi,
> >> >> >
> >> >> >> The helper may or may not be installed at the path compiled into QEMU.
> >> >> >>
> >> >> > Yes, so the helper will not be called - QEMU will try to initiate eBPF RSS
> >> >> > or use "in-qemu" RSS.
> >> >>
> >> >> My point is: the proposed command's mission is to help the management
> >> >> application run the right helper.  However, its advice is *unreliable*.
> >> >> It may point to the wrong helper, or to nothing at all.  The right
> >> >> helper may still exist elsewhere.
> >> >
> >> > Hi Markus,
> >> > Indeed the intention of this command is to return the proper helper.
> >> > Especially in the case of RSS helper this is *reliable* advice and it
> >> > points to the helper that was built together with QEMU, i.e. with the
> >> > same headers.
> >> > This was discussed earlier, for example in
> >> > https://lists.nongnu.org/archive/html/qemu-devel/2021-06/msg02248.html
> >> >
> >> >>
> >> >> I suspect you're trying to address the problem at the wrong level.
> >> >
> >> > What is the proper solution for the problem from your point of view?
> >>
> >> I'll explain in more detail, but first I'd like you to answer my
> >> question below.
> >>
> >> >> Similar versioning issues exist with other helpers.  We've been doing
> >> >> fine without QEMU providing unreliable advice on where they might sit in
> >> >> the file system.  What makes this one different?
> >> >
> >> > This one is required to be *fully synchronized* with the existing build of QEMU.
> >> > Other helpers are probably less restrictive and do not have common
> >> > structures definitions with the QEMU, otherwise they would face the
> >> > same problem.
> >> >
> >> >>
> >> >> >> What happens when you use the wrong helper?
> >> >
> >> > Our intention is that libvirt should never use the wrong RSS helper.
> >> > But it does not have any ability to check which helper is compatible
> >> > with the QEMU.
> >> > QEMU can easily recognize the correct one.
> >>
> >> You did not actually answer my question :)
> >>
> >> So let's try again: if libvirt does use the wrong RSS helper, how does
> >> the system behave?
> >
> > The receive-side scaling may work incorrectly, i.e. finally may move
> > incoming packets to a virtqueue different than expected one.
>
> Then I'm confused about the purpose of "the stamp" mentioned below.  Can
> you enlighten me?

The stamp is a string (common for qemu executable and RSS helper
executable during build) that qemu can later retrieve from the helper
in run-time and ensure this helper is fully compatible with this build
of qemu (in terms of eBPF operation). The helper is built with the
same C headers (related to ebpf operation) as the qemu, the qemu is
able to receive file descriptors created by the helper (of ebpf
program and ebpf data structure's maps) from libvirt and deal with
them as if it has created them.

>
> >
> >>
> >> >> >>
> >> >> > UB - in most cases, eBPF program will work with wrong configurations.
> >> >> > That's why the stamp was added.
> >> >> >
> >> >> > query-helper-paths checks the stamp only for RSS helper.
> >> >>
> >> >> I have no idea what you're talking about :)
> >> >>
> >> >> My best guess is that you're trying to tell me that attempting to work
> >> >> with the wrong helper will fail cleanly due to some stamp check.  That
> >> >> would be nice.
>

