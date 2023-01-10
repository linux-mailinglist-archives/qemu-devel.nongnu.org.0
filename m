Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44DA7663F05
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 12:10:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFCGS-0005AJ-1e; Tue, 10 Jan 2023 05:53:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pFCGO-00058p-K5
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 05:53:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pFCGN-0005Gj-0d
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 05:53:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673348030;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4tmYaFBmNik+WGeB0TZCIjX+6rLEUijFsKPWHQ+78Jk=;
 b=VrGI43nIpnVvp2ak3mLBPpq2+0w0PDgmGUqyb0W0MjlGiI7ikeXY5aAvqkYgLIXaVwA4tV
 bZ9SSfMaKcpVRCDGN87MB7xd8Gl4/XvPIEDzfpcfKOXlYJLCRW16av0qt2MGMfYbpoVeP9
 188VrFlCJ22ZHZL8DVDApJXD+POtfYo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-plqdiF85NBua6NIpvbN3qw-1; Tue, 10 Jan 2023 05:53:46 -0500
X-MC-Unique: plqdiF85NBua6NIpvbN3qw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 85A0680D0E3;
 Tue, 10 Jan 2023 10:53:46 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 01D57492C14;
 Tue, 10 Jan 2023 10:53:35 +0000 (UTC)
Date: Tue, 10 Jan 2023 10:53:28 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-block@nongnu.org, jsnow@redhat.com, crosa@redhat.com,
 kwolf@redhat.com, hreitz@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH v4 02/11] python/qemu: rename command() to cmd()
Message-ID: <Y71DqHAgg/Wvbz7+@redhat.com>
References: <20230110083758.161201-1-vsementsov@yandex-team.ru>
 <20230110083758.161201-3-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230110083758.161201-3-vsementsov@yandex-team.ru>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Jan 10, 2023 at 11:37:49AM +0300, Vladimir Sementsov-Ogievskiy wrote:
> Use a shorter name. We are going to move in iotests from qmp() to
> command() where possible. But command() is longer than qmp() and don't
> look better. Let's rename.
> 
> You can simply grep for '\.command(' and for 'def command(' to check
> that everything is updated (command() in tests/docker/docker.py is
> unrelated).
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> ---
>  docs/devel/testing.rst                    |  10 +-
>  python/qemu/machine/machine.py            |   8 +-
>  python/qemu/qmp/legacy.py                 |   2 +-
>  python/qemu/qmp/qmp_shell.py              |   2 +-
>  python/qemu/utils/qemu_ga_client.py       |   2 +-
>  python/qemu/utils/qom.py                  |   8 +-
>  python/qemu/utils/qom_common.py           |   2 +-
>  python/qemu/utils/qom_fuse.py             |   6 +-
>  scripts/cpu-x86-uarch-abi.py              |   8 +-
>  scripts/device-crash-test                 |   8 +-
>  scripts/render_block_graph.py             |   8 +-
>  tests/avocado/avocado_qemu/__init__.py    |   4 +-
>  tests/avocado/cpu_queries.py              |   5 +-
>  tests/avocado/hotplug_cpu.py              |  10 +-
>  tests/avocado/info_usernet.py             |   4 +-
>  tests/avocado/machine_arm_integratorcp.py |   6 +-
>  tests/avocado/machine_m68k_nextcube.py    |   4 +-
>  tests/avocado/machine_mips_malta.py       |   6 +-
>  tests/avocado/machine_s390_ccw_virtio.py  |  28 ++--
>  tests/avocado/migration.py                |  10 +-
>  tests/avocado/pc_cpu_hotplug_props.py     |   2 +-
>  tests/avocado/version.py                  |   4 +-
>  tests/avocado/virtio_check_params.py      |   6 +-
>  tests/avocado/virtio_version.py           |   5 +-
>  tests/avocado/x86_cpu_model_versions.py   |  13 +-
>  tests/migration/guestperf/engine.py       | 150 +++++++++++-----------
>  tests/qemu-iotests/256                    |  34 ++---
>  tests/qemu-iotests/257                    |  36 +++---
>  28 files changed, 198 insertions(+), 193 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


