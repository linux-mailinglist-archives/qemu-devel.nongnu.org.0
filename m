Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 885D7303A38
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 11:29:34 +0100 (CET)
Received: from localhost ([::1]:49100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4LbF-0005Ib-LH
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 05:29:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mszeredi@redhat.com>)
 id 1l4LZP-0004I1-1M
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 05:27:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mszeredi@redhat.com>)
 id 1l4LZM-0007fT-KP
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 05:27:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611656851;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bQx8wFuWkQuENf1xCYjoWXr23HTnv7ZRaUmiUcDW2G0=;
 b=GDclrAwaRYLMyIZWcRU4Ji7C8nlIweATw7qQaM8NQ9hW9xparrRE5ya/yr0nyQWt1KEO96
 v2ZcQf1H8qPqpgaQv1siQaD0wzFwo+Jt+V7sINyGuYHJqi9WTIfK2glqcO00z5TFU7JWTM
 dhrLOAJILd0kSmY2Cxp8RLKQpBoKLXA=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-yB64HiZzNbqAB0hsuJIUUQ-1; Tue, 26 Jan 2021 05:27:29 -0500
X-MC-Unique: yB64HiZzNbqAB0hsuJIUUQ-1
Received: by mail-qk1-f200.google.com with SMTP id 70so2222866qkh.4
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 02:27:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bQx8wFuWkQuENf1xCYjoWXr23HTnv7ZRaUmiUcDW2G0=;
 b=f4rBAKYFJpaqABxSnzeKWTL656N6SqjR/VPQAPCZiwcWECl+meFoShVdX+EWMq4DaY
 23lcPDnVWMvVOE0JSJYnTOTKQ2Qeoftm5daFsGtuRpDcA3r+1arv4CwXBkJxlEQVLhwt
 Mm9sCC7tCHSTYE9pBaXYYrK0DZb9/Dos+Kd8GO0T8n9IDlHhik+wHxtfBjvoD667idj+
 Do7EbwC6iyDn1QofL5/JlTaMVFQyu0wNVkcOFKVdxBickdAeT1vDRdCHaCZwY0TnOwB7
 ao3KyF1agcOEiU9gI3z5/M2q/tG7mNpHSDQ7TA5xRpTDAJsv8iEADglVVJu8nubtLmYZ
 gm6w==
X-Gm-Message-State: AOAM532pFNj+JAl7byaH4gxZS4ESvwW/I2A1MOspv7Uh83xC3rML4qa6
 87Cx6E8i7fdGJ4vAuR+VC8d9aUfkXQw8Y8NrzjR11ot07J1gMmz9daMoAgL5dAPUVG4Pv0IrpTG
 cyaakkPlEnwjORH42wJ+LKWPPT8vkAaY=
X-Received: by 2002:a05:622a:201:: with SMTP id
 b1mr4235496qtx.237.1611656849487; 
 Tue, 26 Jan 2021 02:27:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJySSwbWYLNS30NvjzVtt2HGrmad2CDd+fEiHY84rshp3XOmGyKvf42En3oUMSfpTWF/sqlBmEVO568YUpvjcQk=
X-Received: by 2002:a05:622a:201:: with SMTP id
 b1mr4235481qtx.237.1611656849273; 
 Tue, 26 Jan 2021 02:27:29 -0800 (PST)
MIME-Version: 1.0
References: <20210121144429.58885-1-stefanha@redhat.com>
 <CAOssrKfjLrR0TXqPgk7sYAz9xiuNankgQpOtX69-zXWaGOnu6w@mail.gmail.com>
 <20210126101839.GC226981@stefanha-x1.localdomain>
In-Reply-To: <20210126101839.GC226981@stefanha-x1.localdomain>
From: Miklos Szeredi <mszeredi@redhat.com>
Date: Tue, 26 Jan 2021 11:27:18 +0100
Message-ID: <CAOssrKfc2zFgYfBVRmmNt2sW1Ktpwe2xCMz8__1-wHFV7SpCLA@mail.gmail.com>
Subject: Re: [PATCH] virtiofsd: prevent opening of special files
 (CVE-2020-35517)
To: Stefan Hajnoczi <stefanha@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mszeredi@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mszeredi@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Sergio Lopez Pascual <slp@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, P J P <ppandit@redhat.com>,
 virtio-fs-list <virtio-fs@redhat.com>, Alex Xu <alex@alxu.ca>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 26, 2021 at 11:18 AM Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> On Mon, Jan 25, 2021 at 05:12:23PM +0100, Miklos Szeredi wrote:
> > On Thu, Jan 21, 2021 at 3:44 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:
> >
> > > This patch adds the missing checks to virtiofsd. This is a short-term
> > > solution because it does not prevent a compromised virtiofsd process
> > > from opening device nodes on the host.
> >
> > I think the proper solution is adding support to the host in order to
> > restrict opens on filesystems that virtiofsd has access to.
> >
> > My idea was to add a "force_nodev" mount option that cannot be
> > disabled and will make propagated mounts  also be marked
> > "force_nodev,nodev".
>
> Interesting idea! Mount options that are relevant:
>  * noexec
>  * nosuid
>  * nodev
>  * nosymfollow
>
> Do you have time to work on the force_* mount options?

Not at the moment, but first we need to probe Al to see if this idea sticks...

> > A possibly simpler solution is to extend seccomp to restrict the
> > process itself from being able to open special files.  Not sure if
> > that's within the scope of seccomp though.
>
> I don't think seccomp can provide that restriction since it's unrelated
> to the syscall or its arguments.

How about selinux, then?

Thanks,
Miklos


