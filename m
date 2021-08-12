Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 934C93E9E35
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 08:02:13 +0200 (CEST)
Received: from localhost ([::1]:43536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mE3nA-0006aU-6z
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 02:02:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1mE3m8-0005v5-T8
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 02:01:08 -0400
Received: from mta-02.yadro.com ([89.207.88.252]:45924 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1mE3m4-0000Jo-BS
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 02:01:08 -0400
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 5FDE246793;
 Thu, 12 Aug 2021 06:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1628748057;
 x=1630562458; bh=wFxn7MHPNLDF7dBO4oNV1knvEMbT6wTscONu1nWJGqM=; b=
 rOqwvWUKpfu0wGL7UZ47YG6OSwy28XpoJzIMkYa1Y/geaHO9F5htSBLTVqZLjcw5
 mJ4ZTNlgKY2vlwBqXC+W78sIZccqJLGfiaVh8uk3kTeTX+4L45fIalEgitWoJJJw
 1cHjggDrvRuN9J7isBZQYOjD2AikQae3N2oD7AJ56bs=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TN6BWij8u2k7; Thu, 12 Aug 2021 09:00:57 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (t-exch-04.corp.yadro.com
 [172.17.100.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 3127249DDF;
 Thu, 12 Aug 2021 09:00:37 +0300 (MSK)
Received: from localhost (172.22.1.233) by T-EXCH-04.corp.yadro.com
 (172.17.100.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Thu, 12
 Aug 2021 09:00:37 +0300
Date: Thu, 12 Aug 2021 09:00:37 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
Subject: Re: [PATCH 0/7] Add vmnet.framework based network backend
Message-ID: <YRS5BaIhk0sWhwIQ@SPB-NB-133.local>
References: <20210617143246.55336-1-yaroshchuk2000@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210617143246.55336-1-yaroshchuk2000@gmail.com>
X-Originating-IP: [172.22.1.233]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-04.corp.yadro.com (172.17.100.104)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=r.bolshakov@yadro.com;
 helo=mta-01.yadro.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>,
 jasowang@redhat.com, qemu-devel@nongnu.org, Cameron Esfahani <dirty@apple.com>,
 Markus Armbruster <armbru@redhat.com>, Phillip Tennen <phillip@axleos.com>,
 Howard Spoelstra <hsp.cat7@gmail.com>, Alessio Dionisi <hello@adns.io>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 17, 2021 at 05:32:39PM +0300, Vladislav Yaroshchuk wrote:
> macOS provides networking API for VMs called vmnet.framework.
> I tried to add it as a network backend. All three modes are supported:
> 
> -shared:
>   allows the guest to comminicate with other guests in shared mode and
>   also with external network (Internet) via NAT
> 
> -host:
>   allows the guest to communicate with other guests in host mode
> 
> -bridged:
>   bridges the guest with a physical network interface
> 
> Separate netdev for each vmnet mode was created because they use quite
> different settings, especially since macOS 11.0 when vmnet.framework
> gets a lot of updates.
> 
> Not sure that I use qemu_mutex_lock_iothread() and
> qemu_mutex_unlock_iothread() in correct way while sending packet
> from vmnet interface to QEMU. I'll be happy to receive
> recomendations how to make this thing better if I done sth wrong.
> 
> Also vmnet.framework requires com.apple.vm.networking entitlement to
> run without root priveledges. Ad-hoc signing does not fit there,
> so I didn't touch anything related to signing. As a result we should
> run qemu-system by a priviledged user:
> `$ sudo qemu-system-x86_64 -nic vmnet-shared`
> otherwise vmnet fails with 'general failure'.
> 
> But in any way it seems working now,
> I tested it within qemu-system-x86-64 on macOS 10.15.7 host, with nic
> models:
> - e1000-82545em
> - virtio-net-pci
> 
> and having such guests:
> - macOS 10.15.7
> - Ubuntu Bionic (server cloudimg) 
> 

Hi Vladislav,

I appreciate the efforts and I'm sorry I didn't look into it yet, lack
of time :(

To all: earlier this year another series was sent by Phillip Tennen to
add vmnet.framework and some comments were provided:
https://mail.gnu.org/archive/html/qemu-devel/2021-02/msg05874.html

I'm not sure how to proceed with arbitration which of the series is
preferred. FIFO or LIFO?

Regards,
Roman

> Vladislav Yaroshchuk (7):
>   net/vmnet: dependencies setup, initial preparations
>   net/vmnet: add new netdevs to qapi/net
>   net/vmnet: create common netdev state structure
>   net/vmnet: implement shared mode (vmnet-shared)
>   net/vmnet: implement host mode (vmnet-host)
>   net/vmnet: implement bridged mode (vmnet-bridged)
>   net/vmnet: update qemu-options.hx
> 
>  configure           |  31 +++++
>  meson.build         |   5 +
>  net/clients.h       |  11 ++
>  net/meson.build     |   7 ++
>  net/net.c           |  10 ++
>  net/vmnet-bridged.m | 123 ++++++++++++++++++
>  net/vmnet-common.m  | 294 ++++++++++++++++++++++++++++++++++++++++++++
>  net/vmnet-host.c    |  93 ++++++++++++++
>  net/vmnet-shared.c  |  94 ++++++++++++++
>  net/vmnet_int.h     |  48 ++++++++
>  qapi/net.json       |  99 ++++++++++++++-
>  qemu-options.hx     |  17 +++
>  12 files changed, 830 insertions(+), 2 deletions(-)
>  create mode 100644 net/vmnet-bridged.m
>  create mode 100644 net/vmnet-common.m
>  create mode 100644 net/vmnet-host.c
>  create mode 100644 net/vmnet-shared.c
>  create mode 100644 net/vmnet_int.h
> 
> -- 
> 2.23.0
> 

