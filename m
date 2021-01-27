Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B45B13056E2
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 10:27:42 +0100 (CET)
Received: from localhost ([::1]:59538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4h6y-0001RG-62
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 04:27:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mszeredi@redhat.com>)
 id 1l4h59-0000zj-Qa
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 04:25:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mszeredi@redhat.com>)
 id 1l4h56-0003oW-TT
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 04:25:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611739542;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DKu2jtQklVyccXSdeRkFuQlvip/dbY9rK9QaeGAd9hM=;
 b=IuJok/1jS+2aT1PDlN1mKVs+IClDBc/e+X7dP2V7bk6vrTQ9pIhI+oXQw3W1MdrSTrQr5J
 dmFgYSRwJJSjC7gHStyfTvNMmJjKyBbzPx/v/HoFY2Rnlse9ltsEF94OFDwNHWH52lS159
 SI+yOgZcqUVbnQO9RUlFNIwJ8gV2Ey0=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-7-OPf7VtzqPLWLLar-vXZMtg-1; Wed, 27 Jan 2021 04:25:40 -0500
X-MC-Unique: OPf7VtzqPLWLLar-vXZMtg-1
Received: by mail-qv1-f69.google.com with SMTP id d8so897405qvs.1
 for <qemu-devel@nongnu.org>; Wed, 27 Jan 2021 01:25:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DKu2jtQklVyccXSdeRkFuQlvip/dbY9rK9QaeGAd9hM=;
 b=KF/z7D+PVpCo0Qpt+wMSrQe8QJzI4rDe+6/5QyAe0opeYZ8eolodJ7DjP9glzgHZaQ
 zi63a1GWlU89qBMyksr9L857jCCZMiY5W7XlliqldiVJFSGPYOmnpCZeDH/Yl7+fRCL3
 fcGA2KZfFBmwf+GX8LvQkgUNF4bCo11G6Hgot8V+sdiFnRo6NR7Qk2TL6npC+PnxVubH
 i2f1mmIAGUv+miET3sB+T95zCeVU6Ykb3mANFbofYUZBkzfl6hM9lNL/NyWJYss/qTiz
 xGtU8oPiLv1+YBCR1rxEQC4dD3eXtKTT6Bk36ypbJivgIsI0+A8yqoj8E1vOwEHJk9BY
 wgFQ==
X-Gm-Message-State: AOAM531KXJk00kW7aovHjlB2w6CFg58hwgAH/PdCgBpeLhiS24eOPGwM
 srMxTOB8xD9fgqRgtGw7Jz6Vz+8MwZyCmsXasWUaIKCBvkeJc7pBQi85PTq0AtUmSeJ8VCD8hge
 DHGzTke++wofAMiLgCZJ0UclZ8XFYG8Y=
X-Received: by 2002:ac8:16b9:: with SMTP id r54mr8752318qtj.68.1611739539822; 
 Wed, 27 Jan 2021 01:25:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy2m7b/Pn3yYuZZMVPky/QPob9Zy0yOnwtx5WWjyQOsbrBJDBRbEzBUpVDwXwKQ/1QsbIB/O0A1gmj3/H8jG9E=
X-Received: by 2002:ac8:16b9:: with SMTP id r54mr8752304qtj.68.1611739539642; 
 Wed, 27 Jan 2021 01:25:39 -0800 (PST)
MIME-Version: 1.0
References: <20210126103502.260758-1-stefanha@redhat.com>
 <20210126181604.1a4c69c6@bahia.lan>
In-Reply-To: <20210126181604.1a4c69c6@bahia.lan>
From: Miklos Szeredi <mszeredi@redhat.com>
Date: Wed, 27 Jan 2021 10:25:28 +0100
Message-ID: <CAOssrKdh3kqKN4uGE=s5eiymd2MXKsRXUegqRH-TFhqYOK7WOA@mail.gmail.com>
Subject: Re: [Virtio-fs] [PATCH v2] virtiofsd: prevent opening of special
 files (CVE-2020-35517)
To: Greg Kurz <groug@kaod.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mszeredi@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mszeredi@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Daniel Berrange <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, P J P <ppandit@redhat.com>,
 virtio-fs-list <virtio-fs@redhat.com>, Alex Xu <alex@alxu.ca>,
 Stefan Hajnoczi <stefanha@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 26, 2021 at 6:18 PM Greg Kurz <groug@kaod.org> wrote:
>
> On Tue, 26 Jan 2021 10:35:02 +0000
> Stefan Hajnoczi <stefanha@redhat.com> wrote:

> The patch looks pretty good to me. It just seems to be missing a change in
> lo_create():
>
>     fd = openat(parent_inode->fd, name, (fi->flags | O_CREAT) & ~O_NOFOLLOW,
>                 mode);
>
> A malicious guest could have created anything called ${name} in this directory
> before calling FUSE_CREATE and we'll open it blindly, or I'm missing something ?

Right, this seems like an omission.

Also the "& ~O_NOFOLLOW" looks like a copy-paste bug, since unlike
lo_open(), lo_create() is not opening a proc symlink.

So that should be replaced with "| O_NOFOLLOW"

Thanks,
Miklos


