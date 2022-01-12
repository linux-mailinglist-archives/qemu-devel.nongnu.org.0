Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C1648BFE8
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 09:30:14 +0100 (CET)
Received: from localhost ([::1]:43082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7Z1J-0006qP-8S
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 03:30:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <roman@roolebo.dev>) id 1n7Yu1-0002DY-AN
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 03:22:42 -0500
Received: from [2a00:1450:4864:20::141] (port=39571
 helo=mail-lf1-x141.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <roman@roolebo.dev>) id 1n7Ytz-00015d-4V
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 03:22:41 -0500
Received: by mail-lf1-x141.google.com with SMTP id br17so5376349lfb.6
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 00:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=roolebo.dev; s=mail;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=pC8WAlcN6WFnbDSiH/7K1iEmUxZ0MIWzgmBnQX6TyZo=;
 b=cQ3bLiSyudimd5b6xRTubF6xFyaBiZqgTvLnMvrItqr0y/XCHBKJMRO3MJluDZ+W+A
 bvNF3d/YezbOKZjXhQ3+Q8tNvgyUPfHdvZ9dThmgoH14yx6XTADuBuKeuVFf1lSX02xT
 svw4OZS7eC/DnS42XiKIQ/4Wsinkb5URXlPH8cxdoRrwMQvRpwmAS4T+AX6o3qxEOwCT
 99OVMO5TtC99q1Qj1s6LXiY9Z2WTHvQjBLTfdc6ntb9ckS6knJ/i7+GKBo6/ivcgtg3K
 jfpqbBwwDUtZl401L4e2vISq/+spTcUHCCvl9rHvjB1hfsQIIhWYpOO46sdDnpnkToRg
 pkAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pC8WAlcN6WFnbDSiH/7K1iEmUxZ0MIWzgmBnQX6TyZo=;
 b=CxQQwqgwTYIgYaL2qJyqXO34b2Rbp8IxEJzpcR3Q5h1lHVHOTlIKayiJuKYOpddlwy
 iMUHBB7n2qRq0JaNv8sWphaZTtl2n4IWQPYf98p/OQrfLBmEhPeY9M1jZcu9/fJnA5sr
 gmyvkMLgtVLuOK/aZ0g/2yKDwOSytTWXsfxVT+JjhJyEn54owaL8fGQ/Qm0OCgnaz3Io
 eqUVDRE/FggAA1lrwEAeGDLNOyJxCHroLE/YsB2/mi+KTLbESuMsKPTD4OC8b2q9QJng
 sk9yWQcb5ytuWOhy8ixibwGGowRigsYpnhSnLGVdFmRsIUh3jQx70TjuVA79vtbM7y6T
 ik9Q==
X-Gm-Message-State: AOAM5335E/eXFW2E36ARKn5jJuh1j7ZxqYlPUcqBywnYQn0i5fRukzQ1
 oO/3k8heP2wprlH0XOubLz0KMQ==
X-Google-Smtp-Source: ABdhPJwvmZkZ+X7f29yQVSd7vY+31da0w1+LEl7rBwEwuR8oBDy2jbFAmdm3tV8tyNsCj2uha49c9w==
X-Received: by 2002:a2e:a4ca:: with SMTP id p10mr2681447ljm.214.1641975757402; 
 Wed, 12 Jan 2022 00:22:37 -0800 (PST)
Received: from localhost (ip-185-108-208-32.ip.asarta.ru. [185.108.208.32])
 by smtp.gmail.com with ESMTPSA id c20sm1522089ljf.40.2022.01.12.00.22.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 00:22:37 -0800 (PST)
Date: Wed, 12 Jan 2022 11:22:36 +0300
From: Roman Bolshakov <roman@roolebo.dev>
To: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
Subject: Re: [PATCH v10 0/7] Add vmnet.framework based network backend
Message-ID: <Yd6PzI05p7y7PkGy@roolebo.dev>
References: <20220111211422.21789-1-yaroshchuk2000@gmail.com>
 <Yd6ILKV75g4jll46@roolebo.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yd6ILKV75g4jll46@roolebo.dev>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::141
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::141;
 envelope-from=roman@roolebo.dev; helo=mail-lf1-x141.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: jasowang@redhat.com, phillip.ennen@gmail.com, qemu-devel@nongnu.org,
 armbru@redhat.com, r.bolshakov@yadro.com, phillip@axleos.com,
 akihiko.odaki@gmail.com, hsp.cat7@gmail.com, hello@adns.io, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 12, 2022 at 10:50:04AM +0300, Roman Bolshakov wrote:
> On Wed, Jan 12, 2022 at 12:14:15AM +0300, Vladislav Yaroshchuk wrote:
> > macOS provides networking API for VMs called 'vmnet.framework':
> > https://developer.apple.com/documentation/vmnet
> > 
> > We can provide its support as the new QEMU network backends which
> > represent three different vmnet.framework interface usage modes:
> > 
> >   * `vmnet-shared`:
> >     allows the guest to communicate with other guests in shared mode and
> >     also with external network (Internet) via NAT. Has (macOS-provided)
> >     DHCP server; subnet mask and IP range can be configured;
> > 
> >   * `vmnet-host`:
> >     allows the guest to communicate with other guests in host mode.
> >     By default has enabled DHCP as `vmnet-shared`, but providing
> >     network unique id (uuid) can make `vmnet-host` interfaces isolated
> >     from each other and also disables DHCP.
> > 
> >   * `vmnet-bridged`:
> >     bridges the guest with a physical network interface.
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
> >   * e1000-82545em
> >   * virtio-net-pci
> >   * vmxnet3
> > 
> > The guests were:
> >   * macOS 10.15.7
> >   * Ubuntu Bionic (server cloudimg)
> > 
> > 
> > This series partially reuses patches by Phillip Tennen:
> > https://patchew.org/QEMU/20210218134947.1860-1-phillip.ennen@gmail.com/
> > So I included them signed-off line into one of the commit messages and
> > also here.
> > 
> > v1 -> v2:
> >  Since v1 minor typos were fixed, patches rebased onto latest master,
> >  redundant changes removed (small commits squashed)
> > v2 -> v3:
> >  - QAPI style fixes
> >  - Typos fixes in comments
> >  - `#include`'s updated to be in sync with recent master
> > v3 -> v4:
> >  - Support vmnet interfaces isolation feature
> >  - Support vmnet-host network uuid setting feature
> >  - Refactored sources a bit
> > v4 -> v5:
> >  - Missed 6.2 boat, now 7.0 candidate
> >  - Fix qapi netdev descriptions and styles
> >    (@subnetmask -> @subnet-mask)
> >  - Support vmnet-shared IPv6 prefix setting feature
> > v5 -> v6
> >  - provide detailed commit messages for commits of
> >    many changes
> >  - rename properties @dhcpstart and @dhcpend to
> >    @start-address and @end-address
> >  - improve qapi documentation about isolation
> >    features (@isolated, @net-uuid)
> > v6 -> v7:
> >  - update MAINTAINERS list
> > v7 -> v8
> >  - QAPI code style fixes
> > v8 -> v9
> >  - Fix building on Linux: add missing qapi
> >    `'if': 'CONFIG_VMNET'` statement to Netdev union
> > v9 -> v10
> >  - Disable vmnet feature for macOS < 11.0: add
> >    vmnet.framework API probe into meson.build.
> >    This fixes QEMU building on macOS < 11.0:
> >    https://patchew.org/QEMU/20220110034000.20221-1-jasowang@redhat.com/
> > 
> 
> Hi Vladislav,
> 
> What symbols are missing on Catalina except VMNET_SHARING_BUSY?
> 
> It'd be great to get the feature working there.
> 
> Thanks,
> Roman
> 

Ok it turned out not that many symbols are needed for successfull
compilation on Catalina:

vmnet_enable_isolation_key
vmnet_network_identifier_key
VMNET_SHARING_SERVICE_BUSY

The compilation suceeds if they're wrappeed by ifdefs. I haven't tested
it yet though.

Regards,
Roman

> > Vladislav Yaroshchuk (7):
> >   net/vmnet: add vmnet dependency and customizable option
> >   net/vmnet: add vmnet backends to qapi/net
> >   net/vmnet: implement shared mode (vmnet-shared)
> >   net/vmnet: implement host mode (vmnet-host)
> >   net/vmnet: implement bridged mode (vmnet-bridged)
> >   net/vmnet: update qemu-options.hx
> >   net/vmnet: update MAINTAINERS list
> > 
> >  MAINTAINERS                   |   5 +
> >  meson.build                   |  16 +-
> >  meson_options.txt             |   2 +
> >  net/clients.h                 |  11 ++
> >  net/meson.build               |   7 +
> >  net/net.c                     |  10 ++
> >  net/vmnet-bridged.m           | 111 ++++++++++++
> >  net/vmnet-common.m            | 330 ++++++++++++++++++++++++++++++++++
> >  net/vmnet-host.c              | 105 +++++++++++
> >  net/vmnet-shared.c            |  92 ++++++++++
> >  net/vmnet_int.h               |  48 +++++
> >  qapi/net.json                 | 132 +++++++++++++-
> >  qemu-options.hx               |  25 +++
> >  scripts/meson-buildoptions.sh |   3 +
> >  14 files changed, 894 insertions(+), 3 deletions(-)
> >  create mode 100644 net/vmnet-bridged.m
> >  create mode 100644 net/vmnet-common.m
> >  create mode 100644 net/vmnet-host.c
> >  create mode 100644 net/vmnet-shared.c
> >  create mode 100644 net/vmnet_int.h
> > 
> > -- 
> > 2.23.0
> > 
> > 

