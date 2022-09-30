Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 479865F064E
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 10:17:42 +0200 (CEST)
Received: from localhost ([::1]:47930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeBDJ-0000k7-DH
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 04:17:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gmaglion@redhat.com>)
 id 1oeBAg-0007Ww-Cs
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 04:14:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gmaglion@redhat.com>)
 id 1oeBAP-0003RO-S4
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 04:14:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664525679;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lHkCsBIgcUKOAUKZvFSrk/TdGvtbqaezgQCzVREOs4E=;
 b=MjKdCLkjiNtEt89wHN9anxMbi6g6Z8Jezfg9vw4TDjKx3ji7rT+D8zDpzD4DoVGTGRxd5o
 Qus7ko39QMqJxzywSTqXEJ4qSfvxX2dGPORxCICw6h7uEc67CS4Sc9nkqsViJ8ZZkuH9hE
 CVb6koW4ajRbOfCfayqxIYuqWVPh31Q=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-172-gsWLk91ENKWwBFNioKlW_A-1; Fri, 30 Sep 2022 04:14:35 -0400
X-MC-Unique: gsWLk91ENKWwBFNioKlW_A-1
Received: by mail-qt1-f199.google.com with SMTP id
 cb22-20020a05622a1f9600b0035bb51792d2so2489427qtb.5
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 01:14:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=lHkCsBIgcUKOAUKZvFSrk/TdGvtbqaezgQCzVREOs4E=;
 b=D/YyDHJqZh2x0BHr/fGKHpdpfVdYC7SyfJL1KImnanR61FJOiK1S5HWMr/q+F41bMZ
 CjpWlSymmC2COqNPKKNB8R5fOB27elzf5SBgdBGSaHxT32Xy/mabnHQQLV5YOs8eS7JB
 7vRNdTh6mZAkczEnnU5jqNDv+bIja6fY2GsBpl/vkVk94cWJi7Ut+BF2EXWMcCP65WKV
 rPAj69/SSVSD6JB30MRAUFvre9WoR/AfhVq9auAHV5Oj/sexnKCtDaKgXeYmJeJP6v9G
 yzC8Wk4IpHE2mojA/xJOchzzMSL+TqT+OOTV1jvrrt5tlFtfkUkaXQT9nz6V+6Hz+kXn
 voTA==
X-Gm-Message-State: ACrzQf0hqKd2fb7ypqng24U+PONgTWkobUmACuHpp7Io/UnzZ2wIINj8
 aRjsUkq2sSP0Y2K93LMSIzhJno7tuIedcBV20ouaXpPEiMDD4NALIgL4mxH3KQfvbbPqQG3/nFJ
 uR8mfbHkLxcruJIYrwE6MVQl2dDKcF7Q=
X-Received: by 2002:a05:620a:2b90:b0:6ce:30a5:b716 with SMTP id
 dz16-20020a05620a2b9000b006ce30a5b716mr5281570qkb.494.1664525675197; 
 Fri, 30 Sep 2022 01:14:35 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM61vCEpB+8/f3IP8B6+xQGtqijzYLPRhZdtC22wTsc0R59+i06ACGjNSc3lhIE9LtMPxioCMWp9G9aj6A6rQSA=
X-Received: by 2002:a05:620a:2b90:b0:6ce:30a5:b716 with SMTP id
 dz16-20020a05620a2b9000b006ce30a5b716mr5281557qkb.494.1664525674968; Fri, 30
 Sep 2022 01:14:34 -0700 (PDT)
MIME-Version: 1.0
References: <YzMmu3xfOtQwuFUx@redhat.com> <YzMrYAJQeSP2hDSs@redhat.com>
 <CAJh=p+5rQDBJJC8VNGL10KYgDeq-Hg5WK7avONCti03eJGH+ow@mail.gmail.com>
 <798fe353-9537-44fe-a76a-819e8c93abb5@www.fastmail.com>
 <YzNZnPiUqySu6sGh@fedora>
 <20220928083340.eyizwu6mm3cc3bxu@mhamilton> <YzSgeDdpHOw1hTM0@redhat.com>
 <b963f623-aa85-4285-9bfa-5fcb4744c354@app.fastmail.com>
 <YzWnPZ5Y6ivS8e1v@redhat.com>
 <b1cf0d02-cc45-4f5c-bfef-fda3e750bef3@app.fastmail.com>
 <YzXP8XhCG5ta2Dvv@redhat.com>
In-Reply-To: <YzXP8XhCG5ta2Dvv@redhat.com>
From: German Maglione <gmaglione@redhat.com>
Date: Fri, 30 Sep 2022 10:13:59 +0200
Message-ID: <CAJh=p+651FCpU-c+539cS-0o0bHiKjnbK-g60yW=hmaTH=qXLQ@mail.gmail.com>
Subject: Re: [Virtio-fs] virtiofsd: Any reason why there's not an "openat2"
 sandbox mode?
To: Vivek Goyal <vgoyal@redhat.com>
Cc: Colin Walters <walters@verbum.org>, Sergio Lopez <slp@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, virtio-fs-list <virtio-fs@redhat.com>,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gmaglion@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.08,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, Sep 29, 2022 at 7:03 PM Vivek Goyal <vgoyal@redhat.com> wrote:
>
> On Thu, Sep 29, 2022 at 11:47:32AM -0400, Colin Walters wrote:
> >
> >
> > On Thu, Sep 29, 2022, at 10:10 AM, Vivek Goyal wrote:
> >
> > > What's your use case. How do you plan to use virtiofs.
> >
> > At the current time, the Kubernetes that we run does not support user n=
amespaces.  We want to do the production builds of our operating system (Fe=
dora CoreOS and RHEL CoreOS) today inside an *unprivileged* Kubernetes pod =
(actually in OpenShift using anyuid, i.e. random unprivileged uid too), jus=
t with /dev/kvm exposed from the host (which is safe).  Operating system bu=
ilds *and* tests in qemu are just another workload that can be shared with =
other tenants.
> >
> > qemu works fine in this model, as does 9p.  It's just the virtiofs isol=
ation requires privileges to be used today.
>
> [ cc German ]
>
> Hi Colin,
>
> So rust version of virtiofsd, already supports running unprivileged
> (inside a user namespace).
>
> https://gitlab.com/virtio-fs/virtiofsd/-/blob/main/README.md#running-as-n=
on-privileged-user
>
> host$ podman unshare -- virtiofsd --socket-path=3D/tmp/vfsd.sock --shared=
-dir /mnt \
>         --announce-submounts --sandbox chroot &
>
> I think only privileged operation it needs is assigning a range of
> subuid/subgid to the uid you are using on host.
>
> I think that should be usable for you as of now.
>
> Having said that, openat2() and landlock are interesting improvements,
> especially when somebody does not want to use user namespaces. Without
> user namespaces, one will not be able to do arbitrary swithing of uid/gid=
.
> IOW, inside guest, you will be limited to one uid/gid.
>
> I am hoping German or somebody else can have a look openat2() and landloc=
k
> improvements in near future.

I will do it.

>
> I am assuming you are fine with using user namespaces on host. And by
> assigning subuid/subgid range, it will allow you arbitrary swithching
> of uid/gid inside guest.
>
> Can you give rust virtiofsd (unprivileged) a try.
>
> Thanks
> Vivek
>


--=20
German


