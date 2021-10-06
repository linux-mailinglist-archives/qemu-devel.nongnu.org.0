Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD644239B8
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 10:26:25 +0200 (CEST)
Received: from localhost ([::1]:55352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY2Ft-0003pT-0Z
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 04:26:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mY2B4-0007OE-Tn
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 04:21:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33196)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mY2B2-0005n7-Q6
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 04:21:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633508483;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=E2EfvmSvkReT/tG4Au2MjSfgH3O6EVjkcgL67xhwu9Q=;
 b=gW6dCQQuP6exE6QxPF7AxuQ5en2p7nkPV4dLnlTQdgnaJwu2rAIwdyr0Xzgn+GTe5h7vs+
 cCVA2gCPWTIbTr2QiIG95KU8H0XbMRxJ5KOgq81DOhmxgULWO98o7nxLm3S25aFfkFBPBo
 e7GNukcHNAzmskeKQVCu/skk2lCHquo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-aMHx5oTvNQqcM8iDeUKoeg-1; Wed, 06 Oct 2021 04:21:23 -0400
X-MC-Unique: aMHx5oTvNQqcM8iDeUKoeg-1
Received: by mail-wr1-f69.google.com with SMTP id
 h11-20020adfa4cb000000b00160c791a550so1198943wrb.6
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 01:21:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=E2EfvmSvkReT/tG4Au2MjSfgH3O6EVjkcgL67xhwu9Q=;
 b=qj1N/5znschLN3lqRaHuKBfb9kxRl7qWL+Ldk/Z7KOM0auIzH1+qKkK7EgTd/nBACd
 65uGBQW8US4FZ4wXU/sqbkgSCBEv5jGY9+Tfe4t6anYMdiE3PFXPadfMGFhuFjlziyzl
 bZds7fndT92pliha0XkSm3l7yCMnXMGFj1MrPxsnggQPTfBiQ0gbS2aafW3xqtq+vNSs
 b1fx+oG1JiFRUaXRp/dvbx5OkN+lz00oolaeKA725rlSsuCQL67VWgwaLg+iYpq/cJ4I
 4CAJRmUt/wHl9yAURgRrXz7b+U02x30/qhY2LnutTz1i+JrkRBbucX8MR8Cw6JCot4Bj
 i4KQ==
X-Gm-Message-State: AOAM531G24f9gpAzjvkwphRlT7ykk59myuSzCjl/e8vwsKZqwOaX0jPW
 buEpLeSFsDVw5Nx/E7eU6Wp6jP3DTB0SqbUHpTSeJhzf9qphKc3etGQco37SA+5zMWx60r3fEJr
 IPu7w5EMTML797A4=
X-Received: by 2002:a05:6000:1681:: with SMTP id
 y1mr21081499wrd.340.1633508481922; 
 Wed, 06 Oct 2021 01:21:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy2m5pZc+qvlH5cv3r4qWR75RpOzDWIv1O6S1aUMmx4porTvjLBQ1Tw0vtQyBWh8jsbU7ovmw==
X-Received: by 2002:a05:6000:1681:: with SMTP id
 y1mr21081470wrd.340.1633508481708; 
 Wed, 06 Oct 2021 01:21:21 -0700 (PDT)
Received: from localhost (static-109-144-85-188.ipcom.comunitel.net.
 [188.85.144.109])
 by smtp.gmail.com with ESMTPSA id d3sm23105747wrb.36.2021.10.06.01.21.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 01:21:21 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH 09/11] qdev: Avoid QemuOpts in QMP device_add
In-Reply-To: <YVyMf7HCXGBXZQxI@redhat.com> (Kevin Wolf's message of "Tue, 5
 Oct 2021 19:33:51 +0200")
References: <20210924090427.9218-1-kwolf@redhat.com>
 <20210924090427.9218-10-kwolf@redhat.com>
 <89bbeed4-dec6-007a-175e-38a12e5bbfa1@greensocs.com>
 <YVGtXMq+JGKIIUrQ@redhat.com> <YVxjLf9vJlBqeKKh@redhat.com>
 <ea36ef56-4892-5b29-e660-964e6018e154@greensocs.com>
 <YVyMf7HCXGBXZQxI@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Wed, 06 Oct 2021 10:21:20 +0200
Message-ID: <87v92ak1hb.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Cc: Damien Hedde <damien.hedde@greensocs.com>, lvivier@redhat.com,
 pkrempa@redhat.com, berrange@redhat.com, ehabkost@redhat.com,
 qemu-block@nongnu.org, mst@redhat.com, libvir-list@redhat.com,
 qemu-devel@nongnu.org, armbru@redhat.com, its@irrelevant.dk,
 pbonzini@redhat.com, jfreimann@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kevin Wolf <kwolf@redhat.com> wrote:
> Am 05.10.2021 um 17:52 hat Damien Hedde geschrieben:

Hi

>> > Usage
>> > -----
>> >
>> > The primary device can be hotplugged or be part of the startup
>> > configuration
>> >
>> >   -device virtio-net-pci,netdev=hostnet1,id=net1,
>> >           mac=52:54:00:6f:55:cc,bus=root2,failover=on
>> >
>> > With the parameter failover=on the VIRTIO_NET_F_STANDBY feature
>> > will be enabled.
>> >
>> > -device vfio-pci,host=5e:00.2,id=hostdev0,bus=root1,
>> >         failover_pair_id=net1
>> >
>> > failover_pair_id references the id of the virtio-net standby device.
>> > This is only for pairing the devices within QEMU. The guest kernel
>> > module net_failover will match devices with identical MAC addresses.
>> >
>> > Hotplug
>> > -------
>> >
>> > Both primary and standby device can be hotplugged via the QEMU
>> > monitor.  Note that if the virtio-net device is plugged first a
>> > warning will be issued that it couldn't find the primary device.
>> 
>> So maybe this whole primary device lookup can happen during the -device CLI
>> option creation loop. And we can indeed have un-created devices still in the
>> list ?
>
> Yes, that's the only case for which I could imagine for an inconsistency
> between the qdev tree and QemuOpts, but failover_add_primary() is only
> called after feature negotiation with the guest driver, so we can be
> sure that the -device loop has completed long ago.
>
> And even if it hadn't completed yet, the paragraph also says that even
> hotplugging the device later is supported, so creating devices in the
> wrong order should still succeed.
>
> I hope that some of the people I added to CC have some more hints.

Failover is ... interesting.

You have two devices: primary and seconday.
seconday is virtio-net, primary can be vfio and some other emulated
devices.

In the command line, devices can appear on any order, primary then
secondary, secondary then primary, or only one of them.
You can add (any of them) later in the toplevel.

And now, what all this mess is about.  We only enable the primary if the
guest knows about failover.  Otherwise we use only the virtio device
(*).  The important bit here is that we need to wait until the guest is
booted, and the virtio-net driver is loaded, and then it tells us if it
understands failover (or not).  At that point we decide if we want to
"really" create the primary.

I know that it abuses device_add() as much as it can be, but I can't see
any better way to handle it.  We need to be able to "create" a device
without showing it to the guest.  And later, when we create a different
device, and depending of driver support on the guest, we "finish" the
creation of the primary device.

Any good idea?

Later, Juan.

*: This changed recently and we can only have the "primary" and not the
 virtio one, but it doesn't matter on this discussion.


