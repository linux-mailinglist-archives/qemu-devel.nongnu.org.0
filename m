Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E202CBB34
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 12:07:47 +0100 (CET)
Received: from localhost ([::1]:56584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkPz8-0005IH-W2
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 06:07:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kkOr8-000631-ID
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 04:55:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kkOr6-0003rK-06
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 04:55:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606902922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LxQm8HYRluQ2KsLQ5Wb59cTM48nbxDBCrsZXAFlwN84=;
 b=e53j8137K/5E0gPue2LCPzyx2HX6pAxzZEcybQX6378dVNQ51eSLiRaAihzDN4LMWSRYU5
 +lwZ/fl37+lBFYvi7Zgjfm1heu+q4N/EDGbvkUvknyWovSFyX13d7Xut3W0AbeZs3+90lv
 FtxV7OeqTCFPz46mUohN3oe2jxShPtg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-348-RqF2FvDyMiWkKTmWf4wIDg-1; Wed, 02 Dec 2020 04:55:19 -0500
X-MC-Unique: RqF2FvDyMiWkKTmWf4wIDg-1
Received: by mail-wm1-f71.google.com with SMTP id g198so2584592wme.7
 for <qemu-devel@nongnu.org>; Wed, 02 Dec 2020 01:55:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LxQm8HYRluQ2KsLQ5Wb59cTM48nbxDBCrsZXAFlwN84=;
 b=PFNS0ItWSSVufV3X2ZbCNxJlPWVnoFO4Q1AJr9YTYz6rbMLxd/1P+6n06/ybhaVBS6
 kmnror2TGJfZoJIfRjfpDDaxm0WdTSFyg0EMsnthRME6ZJtehgwpjPYTbR6pzE9MXefk
 MHW+vN5+i+RQrcsMlDoe3MFg2AGjp4f6km4osN7E/WG/WIFYxmgWLsjdjXfuTsADLalT
 ZJ2qzPMSyNn43MsoXo+NkRio1gBS6HHzpKae290faEyPR/uZS1ecdagZo1YQAt5vp1Tb
 fT1XGvYdqcefQbnH52ucn6L8NjOOz5Ot7WHsjQCmrtWjpTvKrikB9qo++ZGB1h1Zk5H9
 1tGA==
X-Gm-Message-State: AOAM532L7mBkGTH/KgzWw8wCqDMu6dzA6gD1zFNUDCnybbU1gnIDNcI9
 Nd6iq8W74dypineeISmNg1xVOH/fk38+h5ye+i09Ax9kzO1RbdyScNDHVGEBMVYp4GWhWTs+6fA
 UXu+Efd5xfLg8fxE=
X-Received: by 2002:adf:e88b:: with SMTP id d11mr2391655wrm.4.1606902918392;
 Wed, 02 Dec 2020 01:55:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwNYww+ThTTheuF0kshm74pRExeQI5Kxp6QMEF20y1cMwgH/+OjI5+G2i6a7upuNo9qQ+rKtQ==
X-Received: by 2002:adf:e88b:: with SMTP id d11mr2391630wrm.4.1606902918162;
 Wed, 02 Dec 2020 01:55:18 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id c2sm1594884wrf.68.2020.12.02.01.55.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Dec 2020 01:55:17 -0800 (PST)
Date: Wed, 2 Dec 2020 04:55:14 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v2 00/27] Virtio net failover fixes
Message-ID: <20201202045447-mutt-send-email-mst@kernel.org>
References: <20201118083748.1328-1-quintela@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201118083748.1328-1-quintela@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 18, 2020 at 09:37:21AM +0100, Juan Quintela wrote:
> Hi

I tagged this for after the release. To help make sure this
is not lost pls ping me after the release. Thanks!


> This is a big rework of the network failover setup.  General idea is:
> * We don't cache the name of the primary/standby devices
>   We have several problems there with stale pointers
> * After this:
> - We can always remove either the primary/standby devices without trouble
> - Pluggin/unplugging works
> - We go to device opts to see what the failover device are.
>   Notice that we are plugging/unplugging the device, so it is not critical.
> - Once there, I "fixed" managedsave for libvirt (now gives an error instead o=
> f just hanging)
> * Fields not cached anymore:
> - primary_device_dict
> - primary_device_opts
> - standby_id
> - primary_device_id
> - primary_dev
> * I renamed the should_be_hidden() callback to hide device, but if
>   people preffer the old name I can leave it.
> * Add (some) doc to some functions
> * Remove almost 100 lines of code while fixing things.
> 
> Please review.
> 
> Later, Juan.
> 
> Juan Quintela (27):
>   migration: Network Failover can't work with a paused guest
>   failover: fix indentantion
>   failover: Use always atomics for primary_should_be_hidden
>   failover: primary bus is only used once, and where it is set
>   failover: Remove unused parameter
>   failover: Remove external partially_hotplugged property
>   failover: qdev_device_add() returns err or dev set
>   failover: Rename bool to failover_primary_hidden
>   failover: g_strcmp0() knows how to handle NULL
>   failover: Remove primary_device_opts
>   failover: remove standby_id variable
>   failover: Remove primary_device_dict
>   failover: Remove memory leak
>   failover: simplify virtio_net_find_primary()
>   failover: should_be_hidden() should take a bool
>   failover: Rename function to hide_device()
>   failover: virtio_net_connect_failover_devices() does nothing
>   failover: Rename to failover_find_primary_device()
>   failover: simplify qdev_device_add() failover case
>   failover: simplify qdev_device_add()
>   failover: make sure that id always exist
>   failover: remove failover_find_primary_device() error parameter
>   failover: split failover_find_primary_device_id()
>   failover: We don't need to cache primary_device_id anymore
>   failover: Caller of this two functions already have primary_dev
>   failover: simplify failover_unplug_primary
>   failover: Remove primary_dev member
> 
>  include/hw/qdev-core.h         |  28 ++--
>  include/hw/virtio/virtio-net.h |   9 +-
>  hw/core/qdev.c                 |  19 +--
>  hw/net/virtio-net.c            | 298 +++++++++++++--------------------
>  migration/migration.c          |  13 ++
>  softmmu/qdev-monitor.c         |  43 ++---
>  6 files changed, 167 insertions(+), 243 deletions(-)
> 
> --=20
> 2.26.2
> 


