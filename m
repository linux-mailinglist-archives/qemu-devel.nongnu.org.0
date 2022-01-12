Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3E448BF49
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 08:54:12 +0100 (CET)
Received: from localhost ([::1]:37710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7YSR-0004Fw-Bl
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 02:54:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <roman@roolebo.dev>) id 1n7YOY-0001xP-0k
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 02:50:10 -0500
Received: from [2a00:1450:4864:20::144] (port=34481
 helo=mail-lf1-x144.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <roman@roolebo.dev>) id 1n7YOW-0004hU-2y
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 02:50:09 -0500
Received: by mail-lf1-x144.google.com with SMTP id o12so5220666lfk.1
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 23:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=roolebo.dev; s=mail;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=UEhSoWhaj3IUNg4yooqJ6TimOX7YqOq+fi3MfaK6AJs=;
 b=aMAlAANjBQRk9rMy1K50ZfLtWzkP/InbhSUKpJex/7gOfk3aA66EmwLE1CW9lSCnfM
 +MmDQhj/Ig4WqhcrIfdovPl5EMFHCdoqZBWFQVP8bKiXqOqHaCpEM0UfXnpcVkZDKyzY
 +XsKl7uIy0HjERKx58N9baZu8GY8GYdiRdDz3fy8qM4uOFpSJDsuYlx2KBa7qaM3UZy6
 WazRa0Jb9jRfz4xDQ5uF4iX/NFhpCrVRKfDuZpmlMMdQL9zHJ10znOE1nCfjSl6mK9PX
 WZ2iVuMC20HJx9lNIx7Uogp/fWyZaQYIll3XdYAU0+c7q3ULyOBwu3ePXeSE5xtI95tL
 ikhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UEhSoWhaj3IUNg4yooqJ6TimOX7YqOq+fi3MfaK6AJs=;
 b=1CX1s4sfw3h8WYmFv8jY/JoYKLO5LVDEl9QxPSvd6uJ44TsC0wm4n0F0AGoOjxQaks
 GjzpWv6zzO/GquLFI1fALJzbLBgagaTDDYdnCWgR4LH25GhQX+TOibbMi/zWK7K8Si1Z
 JKtpG7NlXczJT2MhLb0rvh5DhVFAbpvmLYwK7cAI4gCE8jCzkAY63UBUWRgq/ozA1Flt
 ikki/p33JieceQb+I0FSZeiverVhAEgbwK2isCe/WzEXPp0et4+swAnGvyhJqTRJAFgE
 IJptgZgAGW8+qxMxZTT843iL/eh521OhhW9xsN+7XsyuwbedEInPQ+YYSznTSjf9YRKU
 +deQ==
X-Gm-Message-State: AOAM530qHa2TWcTw2GZFbrIj28A//tF45Iiq+zkmMH67dHP4pAlj/L4K
 NNVEkiIbTm/afbB9DW7MINtx9A==
X-Google-Smtp-Source: ABdhPJywDzPOCxx+teNUMeipfKV+bTktp5lPhOSeWAICgliVJTvd3hi9OfO4IhkJE3f7aU7bMQCZrQ==
X-Received: by 2002:ac2:4f03:: with SMTP id k3mr6663094lfr.72.1641973805215;
 Tue, 11 Jan 2022 23:50:05 -0800 (PST)
Received: from localhost (ip-185-108-208-32.ip.asarta.ru. [185.108.208.32])
 by smtp.gmail.com with ESMTPSA id m27sm370650lfo.231.2022.01.11.23.50.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 23:50:04 -0800 (PST)
Date: Wed, 12 Jan 2022 10:50:04 +0300
From: Roman Bolshakov <roman@roolebo.dev>
To: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
Subject: Re: [PATCH v10 0/7] Add vmnet.framework based network backend
Message-ID: <Yd6ILKV75g4jll46@roolebo.dev>
References: <20220111211422.21789-1-yaroshchuk2000@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220111211422.21789-1-yaroshchuk2000@gmail.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::144
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::144;
 envelope-from=roman@roolebo.dev; helo=mail-lf1-x144.google.com
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

On Wed, Jan 12, 2022 at 12:14:15AM +0300, Vladislav Yaroshchuk wrote:
> macOS provides networking API for VMs called 'vmnet.framework':
> https://developer.apple.com/documentation/vmnet
> 
> We can provide its support as the new QEMU network backends which
> represent three different vmnet.framework interface usage modes:
> 
>   * `vmnet-shared`:
>     allows the guest to communicate with other guests in shared mode and
>     also with external network (Internet) via NAT. Has (macOS-provided)
>     DHCP server; subnet mask and IP range can be configured;
> 
>   * `vmnet-host`:
>     allows the guest to communicate with other guests in host mode.
>     By default has enabled DHCP as `vmnet-shared`, but providing
>     network unique id (uuid) can make `vmnet-host` interfaces isolated
>     from each other and also disables DHCP.
> 
>   * `vmnet-bridged`:
>     bridges the guest with a physical network interface.
> 
> This backends cannot work on macOS Catalina 10.15 cause we use
> vmnet.framework API provided only with macOS 11 and newer. Seems
> that it is not a problem, because QEMU guarantees to work on two most
> recent versions of macOS which now are Big Sur (11) and Monterey (12).
> 
> Also, we have one inconvenient restriction: vmnet.framework interfaces
> can create only privileged user:
> `$ sudo qemu-system-x86_64 -nic vmnet-shared`
> 
> Attempt of `vmnet-*` netdev creation being unprivileged user fails with
> vmnet's 'general failure'.
> 
> This happens because vmnet.framework requires `com.apple.vm.networking`
> entitlement which is: "restricted to developers of virtualization software.
> To request this entitlement, contact your Apple representative." as Apple
> documentation says:
> https://developer.apple.com/documentation/bundleresources/entitlements/com_apple_vm_networking
> 
> One more note: we still have quite useful but not supported
> 'vmnet.framework' features as creating port forwarding rules, IPv6
> NAT prefix specifying and so on.
> 
> Nevertheless, new backends work fine and tested within `qemu-system-x86-64`
> on macOS Bir Sur 11.5.2 host with such nic models:
>   * e1000-82545em
>   * virtio-net-pci
>   * vmxnet3
> 
> The guests were:
>   * macOS 10.15.7
>   * Ubuntu Bionic (server cloudimg)
> 
> 
> This series partially reuses patches by Phillip Tennen:
> https://patchew.org/QEMU/20210218134947.1860-1-phillip.ennen@gmail.com/
> So I included them signed-off line into one of the commit messages and
> also here.
> 
> v1 -> v2:
>  Since v1 minor typos were fixed, patches rebased onto latest master,
>  redundant changes removed (small commits squashed)
> v2 -> v3:
>  - QAPI style fixes
>  - Typos fixes in comments
>  - `#include`'s updated to be in sync with recent master
> v3 -> v4:
>  - Support vmnet interfaces isolation feature
>  - Support vmnet-host network uuid setting feature
>  - Refactored sources a bit
> v4 -> v5:
>  - Missed 6.2 boat, now 7.0 candidate
>  - Fix qapi netdev descriptions and styles
>    (@subnetmask -> @subnet-mask)
>  - Support vmnet-shared IPv6 prefix setting feature
> v5 -> v6
>  - provide detailed commit messages for commits of
>    many changes
>  - rename properties @dhcpstart and @dhcpend to
>    @start-address and @end-address
>  - improve qapi documentation about isolation
>    features (@isolated, @net-uuid)
> v6 -> v7:
>  - update MAINTAINERS list
> v7 -> v8
>  - QAPI code style fixes
> v8 -> v9
>  - Fix building on Linux: add missing qapi
>    `'if': 'CONFIG_VMNET'` statement to Netdev union
> v9 -> v10
>  - Disable vmnet feature for macOS < 11.0: add
>    vmnet.framework API probe into meson.build.
>    This fixes QEMU building on macOS < 11.0:
>    https://patchew.org/QEMU/20220110034000.20221-1-jasowang@redhat.com/
> 

Hi Vladislav,

What symbols are missing on Catalina except VMNET_SHARING_BUSY?

It'd be great to get the feature working there.

Thanks,
Roman

> Vladislav Yaroshchuk (7):
>   net/vmnet: add vmnet dependency and customizable option
>   net/vmnet: add vmnet backends to qapi/net
>   net/vmnet: implement shared mode (vmnet-shared)
>   net/vmnet: implement host mode (vmnet-host)
>   net/vmnet: implement bridged mode (vmnet-bridged)
>   net/vmnet: update qemu-options.hx
>   net/vmnet: update MAINTAINERS list
> 
>  MAINTAINERS                   |   5 +
>  meson.build                   |  16 +-
>  meson_options.txt             |   2 +
>  net/clients.h                 |  11 ++
>  net/meson.build               |   7 +
>  net/net.c                     |  10 ++
>  net/vmnet-bridged.m           | 111 ++++++++++++
>  net/vmnet-common.m            | 330 ++++++++++++++++++++++++++++++++++
>  net/vmnet-host.c              | 105 +++++++++++
>  net/vmnet-shared.c            |  92 ++++++++++
>  net/vmnet_int.h               |  48 +++++
>  qapi/net.json                 | 132 +++++++++++++-
>  qemu-options.hx               |  25 +++
>  scripts/meson-buildoptions.sh |   3 +
>  14 files changed, 894 insertions(+), 3 deletions(-)
>  create mode 100644 net/vmnet-bridged.m
>  create mode 100644 net/vmnet-common.m
>  create mode 100644 net/vmnet-host.c
>  create mode 100644 net/vmnet-shared.c
>  create mode 100644 net/vmnet_int.h
> 
> -- 
> 2.23.0
> 
> 

