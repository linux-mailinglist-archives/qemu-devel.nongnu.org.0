Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 010316A2070
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 18:25:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVbnc-00055A-3M; Fri, 24 Feb 2023 12:24:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pVbnb-000550-2V
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 12:23:59 -0500
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pVbnZ-0007pl-FX
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 12:23:58 -0500
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-53852143afcso155332297b3.3
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 09:23:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OIUR3OX7z+9tiRTsWrOB/wXMms+PHWE9MXL4csGiWcw=;
 b=aTuMijKjb6oPHV71kwddZHL1nl35v1PE3BRKJQxWmL1FNBv++fl/FjghF4r9d8KBKk
 O2TJELxALvWswG9qReZpvUkVxGNCKif/ZdrPiJuEV9ZaeKM8t9mwn6tKdHzFSo+GW2f3
 B2/aIprV38Clvsg5L6SEmNlbCAUsJLxV1MHvpEo9NdfLZxSibTj8ltVAI0ahj1s4TgtB
 hX1nJlvD7iRp1iyGjIt1YsOv08wYmTzBqF2bvZxixyGmbOxi3PLzUWJQZwEdXSXsKB/x
 251i2SUGBKWcOjLCKz+1/qZXYx313aXUqWg5jwr7KdQA236IrOzpNebKUP1uDhGHqFx8
 6sew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OIUR3OX7z+9tiRTsWrOB/wXMms+PHWE9MXL4csGiWcw=;
 b=WAtoLznzDMKsou9hGMOGq/QY35Cf1YmecxjbOZLRss9IdP4MBQ7nq+Dxlh2oIUeQeb
 fNJ0fE3MmDgoJ5IARYehzUO3BBlPTUWtVUdAy6cZu7JuhTBUv6n1+AMUG/gn0ur7/rrQ
 1He+QpxNCLB3cwckck3h3cwfYwiLGYQ3jLmGflfKOs+8skVr0UKFWABpRfnOCY9GOE5m
 xjfntFNCCtpfeDzjZo9Apez5eOjp31nSVE59Pl6QRfXc+Jf7d5yC5jVxrsoYV9GeH/HA
 1E4F0tg+6Sdgito/VbIx/vLbEDn5N9Uhm24Eqsrs7ceXB4IjawwudlierhhL6XVStb/y
 efAA==
X-Gm-Message-State: AO0yUKW/zjqIDw1E6ImgiduHy5MkWl8BWaNR58B/bDGqYivfwqRdXHfq
 56Q8DcyTni3X1DjQhJ+M54H6u9qq1iVoac5u0iY=
X-Google-Smtp-Source: AK7set+PXKaP4fm/UFuiWZLYBvJTmRHBRcT6K3pTgxxnSnpfqWo/4KT7verc/AWIJdVfKnKhKfEkDTC+3cHpQ44Xtqw=
X-Received: by 2002:a81:ae43:0:b0:52e:b48f:7349 with SMTP id
 g3-20020a81ae43000000b0052eb48f7349mr4974626ywk.6.1677259435974; Fri, 24 Feb
 2023 09:23:55 -0800 (PST)
MIME-Version: 1.0
References: <b155ad6fe6bb026377a8f75882e26078da10ab70.camel@inf.elte.hu>
In-Reply-To: <b155ad6fe6bb026377a8f75882e26078da10ab70.camel@inf.elte.hu>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Fri, 24 Feb 2023 12:23:43 -0500
Message-ID: <CAJSP0QX3VTU+_wngw+8jHttKykJ-WzMgns+PASDaD91or+zp5A@mail.gmail.com>
Subject: Re: question: QEMU guest with Virtiofs but without virtiofsd
To: Ferenc Fejes <fejes@inf.elte.hu>
Cc: virtio-fs-list <virtio-fs@redhat.com>, qemu-devel@nongnu.org,
 stefanha@redhat.com, 
 =?UTF-8?B?UMOpdGVyIEFudGFs?= <peti.antal99@gmail.com>, 
 Christian Schoenebeck <qemu_oss@crudebyte.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x112e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 24 Feb 2023 at 11:47, Ferenc Fejes <fejes@inf.elte.hu> wrote:
> I'm using a QEMU VM with a debootstrap rootfs, shared over virtiofs for
> the guest. My best understanding is that virtiofsd must required even
> if just using one guest.

Yes, virtiofsd is required even if just one guest is accessing a
shared directory using a virtiofs device. The virtiofsd daemon is
responsible for emulating the virtiofs device (QEMU does not do the
emulation), so that's why it's essential even with just a single
guest.

> Looking around in the QEMU manpages I got a little bit confused by
> virtfs parameter. Is it something entirely connected with 9P or it is
> possible to pass folders to the guest through virtiofs without
> virtiofsd? Unfortunately none of my trial with the parameters
> succeeded.

There are two separate VIRTIO devices for sharing files/directories:
virtiofs and virtio-9p (sometimes called virtfs). It's easy to confuse
them because "virtiofs" and "virtfs" look similar. They have different
features and are completely independent of each other. In terms of the
file system protocol, virtiofs is based on Linux FUSE while virtio-9p
is based on the 9P protocol.

virtiofs uses the --device vhost-user-fs-pci syntax together with a
virtiofsd process.

virtio-9p uses either the full --device virtio-9p-pci and --fsdev
syntax or the shortcut --virtfs syntax that combines both these
options.

> Could someone can give me a confirmation if virtiofsd is must or its
> optional. Thanks in advance!

If you want to use virtiofs then virtiofsd is required.

If you use virtio-9p then virtiofsd is not needed.

In terms of which one you should use, both are widely used today.
Unless you have specific requirements, I think you can choose
whichever one seems most convenient to you.

Stefan

