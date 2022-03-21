Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3954E1F1C
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 03:43:45 +0100 (CET)
Received: from localhost ([::1]:34346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nW81I-00074P-4j
	for lists+qemu-devel@lfdr.de; Sun, 20 Mar 2022 22:43:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nW80D-0006OH-IN
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 22:42:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nW80A-0002ms-6u
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 22:42:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647830552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=j2PzGdMXgszBLS7fQ7fCBWuvTIlsPpoEzpksOd83VPI=;
 b=Rrw+1xTrQY1+BepOSW8QFPhCWtYes+w2nQ9iS+p5guqRpPr1g6lgjm861TqNnLyOw41z8G
 Prepz8eD/lfbdueLLRJR5KUCdB/PckF9Erw7H+b/foe9uSVgk1p/6W2x8NN1hGp/3DYyhZ
 zk9eJkqcXLNqMjrjrjCOMuKuJC7XIVk=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-302-xjs6CI1IO4G-1zbTdrL9ww-1; Sun, 20 Mar 2022 22:42:27 -0400
X-MC-Unique: xjs6CI1IO4G-1zbTdrL9ww-1
Received: by mail-lf1-f72.google.com with SMTP id
 u29-20020ac251dd000000b0044a245bcc1aso357558lfm.7
 for <qemu-devel@nongnu.org>; Sun, 20 Mar 2022 19:42:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j2PzGdMXgszBLS7fQ7fCBWuvTIlsPpoEzpksOd83VPI=;
 b=mLcA5UeXgTDNnAklVK+1w2mAaYfnKZCDxXPslJzYylBuDDnwxYq7KWVQBVlE2vsWvZ
 siyNKa2TYGZCg+gZWFz/Z0GoVdLQEITczkSwEpNsvIlqm7mP8zGgogsVsMBXrK7INTPp
 KC507MmSPa7VbZnYvwnb6nnBPxjvobNk4b67eIZlQ/cePbJwNy4wc+TYk9TPVW87mQ8n
 cAako0d/XKKpCR8DJzbtobeLR6mxioKWCplIUNTLYN4ZUCOtXVLGRPEgdKwJTB6U0EiQ
 2Q1m/V89IPHchP/KvE20LUngyoohwxt2g7YMn9OZbF7L24TCtY8doPEL3PYzFoirFvbZ
 P6RQ==
X-Gm-Message-State: AOAM530jPU6n/whnr8uNsWm7GRSuZ6HusNPR/IxvxY7yQueGr07M4YLm
 lkOMIBg6LGzZwnKojsG3RdWqtOZELj9g84UI6SlaRM+ldqrJQonWDOSvuvGdO5FQcceqoJ+Ah0j
 TlCtfZorLlXFNSMMdo0ee0+CzEbWJs88=
X-Received: by 2002:a05:6512:ad2:b0:448:ac0a:2df8 with SMTP id
 n18-20020a0565120ad200b00448ac0a2df8mr13079303lfu.376.1647830546259; 
 Sun, 20 Mar 2022 19:42:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyTi0ieNpKGJesxeup+/tqhCMfiIxig95ubQJwdkhEyXlGCEfDBlrTmDCU5oolxeY0oqtgTvqYWO8RKHHvvf8o=
X-Received: by 2002:a05:6512:ad2:b0:448:ac0a:2df8 with SMTP id
 n18-20020a0565120ad200b00448ac0a2df8mr13079270lfu.376.1647830545918; Sun, 20
 Mar 2022 19:42:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220317172839.28984-1-Vladislav.Yaroshchuk@jetbrains.com>
 <691be87c-6bac-cdb7-28f9-009735a94c28@gmail.com>
In-Reply-To: <691be87c-6bac-cdb7-28f9-009735a94c28@gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 21 Mar 2022 10:42:14 +0800
Message-ID: <CACGkMEsxqxNtvFnu9qnoncUEngmXMn=OvZpWFj++3r5aJ5bO3w@mail.gmail.com>
Subject: Re: [PATCH v22 0/7] Add vmnet.framework based network backend
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Cameron Esfahani <dirty@apple.com>,
 Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, phillip.ennen@gmail.com,
 qemu-devel <qemu-devel@nongnu.org>,
 Vladislav Yaroshchuk <vladislav.yaroshchuk@jetbrains.com>, "Armbruster,
 Markus" <armbru@redhat.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Alexander Graf <agraf@csgraf.de>, Phillip Tennen <phillip@axleos.com>,
 Roman Bolshakov <roman@roolebo.dev>, Howard Spoelstra <hsp.cat7@gmail.com>,
 Alessio Dionisi <hello@adns.io>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Eric Blake <eblake@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 18, 2022 at 5:30 PM Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
>
> Reviewed-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> Tested-by: Akihiko Odaki <akihiko.odaki@gmail.com>
>
> Thank you for this great work!

We miss 7.0 so I will queue this for 7.1

Thanks everyone!

>
> On 2022/03/18 2:28, Vladislav Yaroshchuk wrote:
> > macOS provides networking API for VMs called 'vmnet.framework':
> > https://developer.apple.com/documentation/vmnet
> >
> > We can provide its support as the new QEMU network backends which
> > represent three different vmnet.framework interface usage modes:
> >
> >    * `vmnet-shared`:
> >      allows the guest to communicate with other guests in shared mode and
> >      also with external network (Internet) via NAT. Has (macOS-provided)
> >      DHCP server; subnet mask and IP range can be configured;
> >
> >    * `vmnet-host`:
> >      allows the guest to communicate with other guests in host mode.
> >      By default has enabled DHCP as `vmnet-shared`, but providing
> >      network unique id (uuid) can make `vmnet-host` interfaces isolated
> >      from each other and also disables DHCP.
> >
> >    * `vmnet-bridged`:
> >      bridges the guest with a physical network interface.
> >
> > This backends cannot work on macOS Catalina 10.15 cause we use
> > vmnet.framework API provided only with macOS 11 and newer. Seems
> > that it is not a problem, because QEMU guarantees to work on two most
> > recent versions of macOS which now are Big Sur (11) and Monterey (12).
> >
> > Also, we have one inconvenient restriction: vmnet.framework interfaces
> > can create only privileged user:
> > `$ sudo qemu-system-x86_64 -nic vmnet-shared`
> >
> > Attempt of `vmnet-*` netdev creation being unprivileged user fails with
> > vmnet's 'general failure'.
> >
> > This happens because vmnet.framework requires `com.apple.vm.networking`
> > entitlement which is: "restricted to developers of virtualization software.
> > To request this entitlement, contact your Apple representative." as Apple
> > documentation says:
> > https://developer.apple.com/documentation/bundleresources/entitlements/com_apple_vm_networking
> >
> > One more note: we still have quite useful but not supported
> > 'vmnet.framework' features as creating port forwarding rules, IPv6
> > NAT prefix specifying and so on.
> >
> > Nevertheless, new backends work fine and tested within `qemu-system-x86-64`
> > on macOS Bir Sur 11.5.2 host with such nic models:
> >    * e1000-82545em
> >    * virtio-net-pci
> >    * vmxnet3
> >
> > The guests were:
> >    * macOS 10.15.7
> >    * Ubuntu Bionic (server cloudimg)
> >
> >
> > This series partially reuses patches by Phillip Tennen:
> > https://patchew.org/QEMU/20210218134947.1860-1-phillip.ennen@gmail.com/
> > So I included them signed-off line into one of the commit messages and
> > also here.
> >
> > v1 -> v2:
> >   Since v1 minor typos were fixed, patches rebased onto latest master,
> >   redundant changes removed (small commits squashed)
> > v2 -> v3:
> >   - QAPI style fixes
> >   - Typos fixes in comments
> >   - `#include`'s updated to be in sync with recent master
> > v3 -> v4:
> >   - Support vmnet interfaces isolation feature
> >   - Support vmnet-host network uuid setting feature
> >   - Refactored sources a bit
> > v4 -> v5:
> >   - Missed 6.2 boat, now 7.0 candidate
> >   - Fix qapi netdev descriptions and styles
> >     (@subnetmask -> @subnet-mask)
> >   - Support vmnet-shared IPv6 prefix setting feature
> > v5 -> v6
> >   - provide detailed commit messages for commits of
> >     many changes
> >   - rename properties @dhcpstart and @dhcpend to
> >     @start-address and @end-address
> >   - improve qapi documentation about isolation
> >     features (@isolated, @net-uuid)
> > v6 -> v7:
> >   - update MAINTAINERS list
> > v7 -> v8
> >   - QAPI code style fixes
> > v8 -> v9
> >   - Fix building on Linux: add missing qapi
> >     `'if': 'CONFIG_VMNET'` statement to Netdev union
> > v9 -> v10
> >   - Disable vmnet feature for macOS < 11.0: add
> >     vmnet.framework API probe into meson.build.
> >     This fixes QEMU building on macOS < 11.0:
> >     https://patchew.org/QEMU/20220110034000.20221-1-jasowang@redhat.com/
> > v10 -> v11
> >   - Enable vmnet for macOS 10.15 with subset of available
> >     features. Disable vmnet for macOS < 10.15.
> >   - Fix typos
> > v11 -> v12
> >   - use more general macOS version check with
> >     MAC_OS_VERSION_11_0 instead of manual
> >     definition creating.
> > v12 -> v13
> >   - fix incorrect macOS version bound while
> >     'feature available since 11.0' check.
> >     Use MAC_OS_X_VERSION_MIN_REQUIRED instead of
> >     MAC_OS_X_VERSION_MAX_ALLOWED.
> > v13 -> v14
> >   - fix memory leaks
> >   - get rid of direct global mutex taking while resending
> >     packets from vmnet to QEMU, schedule a bottom half
> >     instead (it can be a thing to discuss, maybe exists a
> >     better way to perform the packets transfer)
> >   - update hmp commands
> >   - a bit refactor everything
> >   - change the email from which patches are being
> >     submitted, same to email in MAINTAINERS list
> >   - P.S. sorry for so late reply
> > v14 -> v15
> >   - restore --enable-vdi and --disable-vdi
> >     mistakenly dropped in previous series
> > v15 -> v16
> >   - common: complete sending pending packets when
> >     QEMU is ready, refactor, fix memory leaks
> >   - QAPI: change version to 7.1 (cause 7.0 feature freeze
> >     happened). This is the only change in QAPI, Markus Armbruster,
> >     please confirm if you can (decided to drop your Acked-by due
> >     to this change)
> >   - vmnet-bridged: extend "supported ifnames" message buffer len
> >   - fix behaviour dependence on debug (add "return -1" after
> >     assert_not_reached)
> >   - use PRIu64 for proper printing
> >   - NOTE: This version of patch series may be one the last
> >     I submit - JetBrains has suspended operations in
> >     Russia indefinitely due to all the awful things happened
> >     the last weeks. I may leave this company and loose the
> >     ability to work on vmnet support :(
> >     It will be perfect if someone can handle my unfinished work,
> >     if something required to fix/improve is found.
> >     Because of this, MAINTAINERS list update is dropped
> > v16 -> v17
> >   - host: move network_uuid to local variable
> >   - common: refactor, add documentation
> >   - common/send (vmnet->qemu): read new packets after QEMU
> >     send_cb invoked
> >   - common/receive (qemu->vmnet): drop redundant vmnet
> >     status checks
> >   - restore dropped commit messaged from the previous series
> > v17 -> v18
> >   - use VmnetState struct for all three operation modes
> >   - drop send_enabled flag
> >   - do not unregister vmnet event callback on cleanup,
> >     let vmnet.framework do everything itself while interface
> >     destruction
> > v18 -> v19
> >   - use positive pointers values to describe unsent packets
> >     window of VmnetState buffer
> > v19 -> v20
> >   - vmnet-host: minor but required refactor
> > v20 -> v21
> >   - vmnet-bridged: dynamically allocate valid ifnames list
> >   - QAPI schema: add `Markus Armbruster <armbru@redhat.com>`'s acked-by
> > v21 -> v22
> >   - common: fix if_desc memory leak
> >
> > Vladislav Yaroshchuk (7):
> >    net/vmnet: add vmnet dependency and customizable option
> >    net/vmnet: add vmnet backends to qapi/net
> >    net/vmnet: implement shared mode (vmnet-shared)
> >    net/vmnet: implement host mode (vmnet-host)
> >    net/vmnet: implement bridged mode (vmnet-bridged)
> >    net/vmnet: update qemu-options.hx
> >    net/vmnet: update hmp-commands.hx
> >
> >   hmp-commands.hx               |   6 +-
> >   meson.build                   |  16 +-
> >   meson_options.txt             |   2 +
> >   net/clients.h                 |  11 +
> >   net/meson.build               |   7 +
> >   net/net.c                     |  10 +
> >   net/vmnet-bridged.m           | 152 ++++++++++++++
> >   net/vmnet-common.m            | 378 ++++++++++++++++++++++++++++++++++
> >   net/vmnet-host.c              | 128 ++++++++++++
> >   net/vmnet-shared.c            | 114 ++++++++++
> >   net/vmnet_int.h               |  63 ++++++
> >   qapi/net.json                 | 133 +++++++++++-
> >   qemu-options.hx               |  25 +++
> >   scripts/meson-buildoptions.sh |   1 +
> >   14 files changed, 1042 insertions(+), 4 deletions(-)
> >   create mode 100644 net/vmnet-bridged.m
> >   create mode 100644 net/vmnet-common.m
> >   create mode 100644 net/vmnet-host.c
> >   create mode 100644 net/vmnet-shared.c
> >   create mode 100644 net/vmnet_int.h
> >
>


