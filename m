Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FD45ECAE5
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 19:34:40 +0200 (CEST)
Received: from localhost ([::1]:49148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odETe-0008G0-Jh
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 13:34:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gmaglion@redhat.com>)
 id 1odEOI-0003Vk-3d
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 13:29:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gmaglion@redhat.com>)
 id 1odEOE-0000xg-5Y
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 13:29:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664299741;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=99zGODJaHOsGnKzp/SlpxOTnwyvpi5KIjrZSNjhFvoc=;
 b=ibprM9ZRsJZ/67WnfRKKz2MkdbuA0ps5+RI4Q13UyUm4PKXnSjU1IWmFMm34FYIgPuz7IG
 x5CE2zH1A97SYwGslW2vn22F0XtaHgg2qthhR2zjRPJgjOvtyWLjdNIOTk1qp2L2tkzliX
 XBGMNT+20podB2p4/TqQcV1/CPu4vTw=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-134-ho2oKaCnPE2EoO4NDqO9Bg-1; Tue, 27 Sep 2022 13:27:39 -0400
X-MC-Unique: ho2oKaCnPE2EoO4NDqO9Bg-1
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-3508d8c60ceso84988917b3.18
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 10:27:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=99zGODJaHOsGnKzp/SlpxOTnwyvpi5KIjrZSNjhFvoc=;
 b=FlpYwrHh140WyP8U82T68yGVfUyVYZcsYCryhI2xiXiXWL1QJuKzQegd9E1rmGYlbY
 EDKFmOl4mnUfBGWDpq6KzrWFViKv/s1ChqA4QQ21FrP2olsLSxkwLbyul42XinefJzQi
 FA0I5Yf58dBAR6VcgfByz8ohxpy0H7BmIe/8n6AzH9yJLNLAaxT5y8EupJTtCEyhwAoE
 6jYf4DwOmWqLLWxrxLFaUrmR6KsbCeopGTluRUEZAp9zW+J7DBjnGywdAgc6vOGKnMUS
 1bfHLSCGssRLxRzbwAry7KH85jwE4X0Lts/YBAsNpJxf5Sd6MT/6dbmA0Cvw2c7TUC8+
 TAxw==
X-Gm-Message-State: ACrzQf0dvjEsxwvLiHDfmmNisCGmEYjmdcBmngLtesi+FbGbiqrpL3Y3
 KbbuZToDf5o52db4zH+dupmU1UEOLRqHNBYKV+uurCxxyvFBLYfCaTv2py7jXQfCWnwFYC1qiwb
 tWRqMD64sKDVV88YM96NG7RwDvJeNYLw=
X-Received: by 2002:a0d:c981:0:b0:330:dc03:7387 with SMTP id
 l123-20020a0dc981000000b00330dc037387mr26753906ywd.380.1664299659247; 
 Tue, 27 Sep 2022 10:27:39 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7wsazdse0NUEIo9/Hq2+QOeS5K1hBFYuZ2TkLxUVRwxW/xlzaKSF3iWfzmPre0jMkYeMsXFzb7BULhqiYRIz0=
X-Received: by 2002:a0d:c981:0:b0:330:dc03:7387 with SMTP id
 l123-20020a0dc981000000b00330dc037387mr26753891ywd.380.1664299659021; Tue, 27
 Sep 2022 10:27:39 -0700 (PDT)
MIME-Version: 1.0
References: <4362261a-c762-4666-84e2-03c9daa6c4d9@www.fastmail.com>
 <YzMmu3xfOtQwuFUx@redhat.com> <YzMrYAJQeSP2hDSs@redhat.com>
In-Reply-To: <YzMrYAJQeSP2hDSs@redhat.com>
From: German Maglione <gmaglione@redhat.com>
Date: Tue, 27 Sep 2022 19:27:02 +0200
Message-ID: <CAJh=p+5rQDBJJC8VNGL10KYgDeq-Hg5WK7avONCti03eJGH+ow@mail.gmail.com>
Subject: Re: virtiofsd: Any reason why there's not an "openat2" sandbox mode?
To: Vivek Goyal <vgoyal@redhat.com>
Cc: Colin Walters <walters@verbum.org>, qemu-devel@nongnu.org, 
 virtio-fs-list <virtio-fs@redhat.com>, Sergio Lopez <slp@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gmaglion@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 27, 2022 at 6:57 PM Vivek Goyal <vgoyal@redhat.com> wrote:
>
> On Tue, Sep 27, 2022 at 12:37:15PM -0400, Vivek Goyal wrote:
> > On Fri, Sep 09, 2022 at 05:24:03PM -0400, Colin Walters wrote:
> > > We previously had a chat here https://lore.kernel.org/all/348d4774-bd5f-4832-bd7e-a21491fdac8d@www.fastmail.com/T/
> > > around virtiofsd and privileges and the case of trying to run virtiofsd inside an unprivileged (Kubernetes) container.
> > >
> > > Right now we're still using 9p, and it has bugs (basically it seems like the 9p inode flushing callback tries to allocate memory to send an RPC, and this causes OOM problems)
> > > https://github.com/coreos/coreos-assembler/issues/1812
> > >
> > > Coming back to this...as of lately in Linux, there's support for strongly isolated filesystem access via openat2():
> > > https://lwn.net/Articles/796868/
> > >
> > > Is there any reason we couldn't do an -o sandbox=openat2 ?  This operates without any privileges at all, and should be usable (and secure enough) in our use case.
> >
> > [ cc virtio-fs-list, german, sergio ]
> >
> > Hi Colin,
> >
> > Using openat2(RESOLVE_IN_ROOT) (if kernel is new enough), sounds like a
> > good idea. We talked about it few times but nobody ever wrote a patch to
> > implement it.
> >
> > And it probably makes sense with all the sandboxes (chroot(), namespaces).
> >
> > I am wondering that it probably should not be a new sandbox mode at all.
> > It probably should be the default if kernel offers openat2() syscall.
> >
> > Now all the development has moved to rust virtiofsd.
> >
> > https://gitlab.com/virtio-fs/virtiofsd
> >
> > C version of virtiofsd is just seeing small critical fixes.
> >
> > And rust version allows running unprivileged (inside a user namespace).
> > German is also working on allowing running unprivileged without
> > user namespaces but this will not allow arbitrary uid/gid switching.
> >
> > https://gitlab.com/virtio-fs/virtiofsd/-/merge_requests/136
> >
> > If one wants to run unprivileged and also do arbitrary uid/gid switching,
> > then you need to use user namepsaces and map a range of subuid/subgid
> > into the user namepsace virtiofsd is running in.
> >
> > If possible, please try to use rust virtiofsd for your situation. Its
> > already packaged for fedora.
> >
> > Coming back to original idea of using openat2(), I think we should
> > probably give it a try in rust virtiofsd and if it works, it should
> > work across all the sandboxing modes.
>
> Thinking more about it, enabling openat2() usage conditionally based on
> some option probably is not a bad idea. I was assuming that using
> openat2() by default will not break any of the existing use cases. But
> I am not sure. I have burnt my fingers so many times and had to back
> out on default settings that enabling usage of openat2() conditionally
> will probably be a safer choice. :-)
>

I could work on this for the next major version and see if anything breaks.
But I prefer to add this as a compilation feature, instead of a command line
option that we will then have to maintain for a while.

Also, I don't see it as a sandbox feature, as Stefan mentioned, a compromised
process can call openat2() without RESOLVE_IN_ROOT. I did some test with
Landlock to lock virtiofsd inside the shared directory, but IIRC it requires a
kernel 5.13

Cheers,
-- 
German


