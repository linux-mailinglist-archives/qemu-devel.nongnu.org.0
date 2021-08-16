Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B77123ED37A
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 13:59:54 +0200 (CEST)
Received: from localhost ([::1]:57628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFbHV-0007e0-Qt
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 07:59:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1mFbFr-0005Ga-72
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 07:58:11 -0400
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e]:44999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1mFbFp-0008Ai-Bt
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 07:58:11 -0400
Received: by mail-ot1-x32e.google.com with SMTP id
 l36-20020a0568302b24b0290517526ce5e3so13112789otv.11
 for <qemu-devel@nongnu.org>; Mon, 16 Aug 2021 04:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FaHIUwBZ6SWft3UA4xdNj7PXcTUaxxPijlfYVAzU2P4=;
 b=ZxrYNaOX3LcP8nA1yOnI5/Bh3g35g60aryte8AYPnP6mKC+4aQtXAYL9bgWtQl/h7F
 kTFjNRI/q8yGrCSG/+m8s8MWBpUjpwbQDiJNO1uO2AUoL7fOSsQ+kp4MMeKlbI0mRi65
 kb3jGe0iAF3C7B1tsW2U7p5oAx3n+4CYWWbigHHPF98tLcz9GV5fOiKLRwRciSy22NbZ
 B+S3WB7l7AfImqZBcdMpiiFo2vi07vKDcp/cjvrZOy/L9P9wclUjtaYNvHEAeiZXbS6t
 F5HySjwLg87/kul3SeyCrva8TLYWgPjYY52pvbMMdf4xqyq659VzOBWiojvUX15hmfP9
 OxWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FaHIUwBZ6SWft3UA4xdNj7PXcTUaxxPijlfYVAzU2P4=;
 b=cZA3hjEiJ+R5HIiueN+hxNAmzlOYAsEwQ8NlQF2ldho0h9AJg647RSaAayJ8Wy6NBl
 YBfJckf2kD/EJermDWC60HvZg691mW9a8fC8uH7oaAY5WQGPUzOmCeDi/EvtNIAqRY2r
 m8IwkLy+qqxSmojXkxA0gR//VK18ulhm0RhRdXiooftrwObX1gMDjlBEFZWXmgr/Fjq/
 bajv83St/uaNF+H+zGx9YCoVW/MMfCgeb6kzGRns0askMl8kiIiPLJfiYLOxrHMC8eT6
 ncvXwjhv71QPIIyR8myHb4IEmR+39H0xKBr0A06K9dbHSfrEw+uhqb2S1YAepCzGsavo
 oGvg==
X-Gm-Message-State: AOAM533fQElEKLKqJGjakd8mQmf8Uc0JVIQmjNUeL4xyLwcO9/WvQoGf
 J6pM7gzd29Lnq+Md0nL3h6sSpHuICfb3DdAVdSa7Zg==
X-Google-Smtp-Source: ABdhPJzrXp+7tmSLchfKwPVh2RmwlkpE/lOZYn8Hg8kUMCyCtzPTPZyxbgnC9oRzxoXuHHCVe3+KoYmOf1PNBJwNsyU=
X-Received: by 2002:a9d:5a16:: with SMTP id v22mr12627228oth.27.1629115087588; 
 Mon, 16 Aug 2021 04:58:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210713153758.323614-1-andrew@daynix.com>
 <CABcq3pE=n4iPB-9cX7bRMhz=O2csAtTeYtbA1_sBnC9Fh8Pihg@mail.gmail.com>
In-Reply-To: <CABcq3pE=n4iPB-9cX7bRMhz=O2csAtTeYtbA1_sBnC9Fh8Pihg@mail.gmail.com>
From: Yuri Benditovich <yuri.benditovich@daynix.com>
Date: Mon, 16 Aug 2021 14:57:56 +0300
Message-ID: <CAOEp5OdpiceovWJE1pzC17dKVmbc7yLRGOjJhziuBBdF-1kDww@mail.gmail.com>
Subject: Re: [PATCH 0/5] ebpf: Added ebpf helper for libvirtd.
To: Jason Wang <jasowang@redhat.com>
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
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Yan Vugenfirer <yan@daynix.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Jason,
Can you please review the series?

Thanks,
Yuri

On Thu, Jul 22, 2021 at 11:38 AM Andrew Melnichenko <andrew@daynix.com> wrote:
>
> ping
>
> On Tue, Jul 13, 2021 at 6:38 PM Andrew Melnychenko <andrew@daynix.com> wrote:
>>
>> Libvirt usually launches qemu with strict permissions.
>> To enable eBPF RSS steering, qemu-ebpf-rss-helper was added.
>>
>> Added property "ebpf_rss_fds" for "virtio-net" that allows to
>> initialize eBPF RSS context with passed program & maps fds.
>>
>> Added qemu-ebpf-rss-helper - simple helper that loads eBPF
>> context and passes fds through unix socket.
>> Libvirt should call the helper and pass fds to qemu through
>> "ebpf_rss_fds" property.
>>
>> Added explicit target OS check for libbpf dependency in meson.
>> eBPF RSS works only with Linux TAP, so there is no reason to
>> build eBPF loader/helper for non-Linux.
>>
>> Changed Qemu updates eBPF maps to array mmaping. Mmaping allows
>> bypassing unprivileged BPF map update. Also, instead of 3 maps
>> (config, key and indirection table) there is one map that
>> combines everything.
>>
>> Added helper stamp. To check that helper was build with qemu,
>> qemu would check helper symbols that should contain the stamp.
>> It was done similar to qemu modules, but checking was performed
>> by the helper's ELF parsing.
>>
>> Overall, libvirt process should not be aware of the "interface"
>> of eBPF RSS, it will not be aware of eBPF maps/program "type" and
>> their quantity. That's why qemu and the helper should be from
>> the same build and be "synchronized". Technically each qemu may
>> have its own helper. That's why "query-helper-paths" qmp command
>> was added. Qemu should return the path to the helper that suits
>> and libvirt should use "that" helper for "that" emulator.
>>
>> qmp sample:
>> C: { "execute": "query-helper-paths" }
>> S: { "return": [
>>      {
>>        "name": "qemu-ebpf-rss-helper",
>>        "path": "/usr/local/libexec/qemu-ebpf-rss-helper"
>>      }
>>     ]
>>    }
>>
>> Changes since v1:
>> * Mmap() used instead if bpf_map_update_elem().
>> * Added helper stamp.
>>
>> Andrew Melnychenko (5):
>>   ebpf: Added eBPF initialization by fds and map update.
>>   virtio-net: Added property to load eBPF RSS with fds.
>>   qmp: Added the helper stamp check.
>>   ebpf_rss_helper: Added helper for eBPF RSS.
>>   qmp: Added qemu-ebpf-rss-path command.
>>
>>  ebpf/ebpf_rss-stub.c              |   6 +
>>  ebpf/ebpf_rss.c                   | 120 ++++---
>>  ebpf/ebpf_rss.h                   |   8 +-
>>  ebpf/qemu-ebpf-rss-helper.c       | 130 +++++++
>>  ebpf/rss.bpf.skeleton.h           | 557 +++++++++++++++---------------
>>  hw/net/virtio-net.c               |  77 ++++-
>>  include/hw/virtio/virtio-net.h    |   1 +
>>  meson.build                       |  47 ++-
>>  monitor/meson.build               |   1 +
>>  monitor/qemu-helper-stamp-utils.c | 297 ++++++++++++++++
>>  monitor/qemu-helper-stamp-utils.h |  24 ++
>>  monitor/qmp-cmds.c                |  32 ++
>>  qapi/misc.json                    |  33 ++
>>  tools/ebpf/rss.bpf.c              |  67 ++--
>>  14 files changed, 990 insertions(+), 410 deletions(-)
>>  create mode 100644 ebpf/qemu-ebpf-rss-helper.c
>>  create mode 100644 monitor/qemu-helper-stamp-utils.c
>>  create mode 100644 monitor/qemu-helper-stamp-utils.h
>>
>> --
>> 2.31.1
>>

