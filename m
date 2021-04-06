Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D78354B81
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 06:07:26 +0200 (CEST)
Received: from localhost ([::1]:60720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTczt-0007LA-8J
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 00:07:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lTcym-0006ur-OQ
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 00:06:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lTcyi-0004OI-6O
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 00:06:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617681971;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z9nzYyUzJceCzs4Ev46SP+poLWcHec13vDyN4051p+c=;
 b=VnOE0hF5BbG6E1ozzKk5WzmbOfpMeX0KaNertEXMw20moT2Bt3vp2ILYLwDx9AQwInLmwj
 KU44XcpFTTU7j4ZJlv3/cqW9jr4Qiij4wmbJc2DorFnCyPEgOXeZlXTguc4hc161OYoYUw
 dD/WZfoPTYmT8ZQ19zUY3I9E2wANcQc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-gqWwjig_McaH5gXNYmmGWA-1; Tue, 06 Apr 2021 00:06:09 -0400
X-MC-Unique: gqWwjig_McaH5gXNYmmGWA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D194C1005D57;
 Tue,  6 Apr 2021 04:06:03 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-13-96.pek2.redhat.com
 [10.72.13.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8BB86610F0;
 Tue,  6 Apr 2021 04:05:59 +0000 (UTC)
Subject: Re: [PATCH 0/5] Revert query-netdev command for 6.0
To: qemu-devel@nongnu.org, lekiravi@yandex-team.ru
References: <20210402081519.78878-1-jasowang@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <ccbe69ce-3680-909b-d5ca-c822812e46f3@redhat.com>
Date: Tue, 6 Apr 2021 12:05:58 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210402081519.78878-1-jasowang@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_CHARSET_FARAWAY=2.45, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


ÔÚ 2021/4/2 ÏÂÎç4:15, Jason Wang Ð´µÀ:
> Hi All:
>
> Several issues has been reported for query-netdev command:
>
> - coverity warnings of memory leak and cut-and-paste issue
> - lacking of documentation for future new netdev development
>
> Consider it's late in the rc, I would like to revert this series and
> let's retry for 6.1.


Applied.

Thanks


>
> Thanks
>
> Jason Wang (5):
>    Revert "net: Do not fill legacy info_str for backends"
>    Revert "hmp: Use QAPI NetdevInfo in hmp_info_network"
>    Revert "net: Move NetClientState.info_str to dynamic allocations"
>    Revert "tests: Add tests for query-netdev command"
>    Revert "qapi: net: Add query-netdev command"
>
>   hw/net/xen_nic.c                  |   5 +-
>   include/net/net.h                 |   5 +-
>   include/qapi/hmp-output-visitor.h |  30 -----
>   net/l2tpv3.c                      |   8 +-
>   net/net.c                         |  73 ++---------
>   net/netmap.c                      |   7 --
>   net/slirp.c                       | 124 +------------------
>   net/socket.c                      |  92 ++++----------
>   net/tap-win32.c                   |  10 +-
>   net/tap.c                         | 107 ++---------------
>   net/vde.c                         |  25 +---
>   net/vhost-user.c                  |  20 +---
>   net/vhost-vdpa.c                  |  15 +--
>   qapi/hmp-output-visitor.c         | 193 ------------------------------
>   qapi/meson.build                  |   1 -
>   qapi/net.json                     |  80 -------------
>   tests/qtest/meson.build           |   3 -
>   tests/qtest/test-query-netdev.c   | 120 -------------------
>   18 files changed, 62 insertions(+), 856 deletions(-)
>   delete mode 100644 include/qapi/hmp-output-visitor.h
>   delete mode 100644 qapi/hmp-output-visitor.c
>   delete mode 100644 tests/qtest/test-query-netdev.c
>


