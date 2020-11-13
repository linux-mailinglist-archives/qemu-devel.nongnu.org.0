Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 633CF2B18A6
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 10:50:30 +0100 (CET)
Received: from localhost ([::1]:51900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdViv-0003kK-E0
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 04:50:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kdVhj-0003Gp-Mu
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 04:49:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kdVhi-000263-2d
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 04:49:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605260953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XGUQNmFbb1qgyKULmh1xswG69/gcHsODXA9gIlyI3ZQ=;
 b=erTP7NzaimmXmalPvND0dr1k4NDkAXD+46KyKAlJOcmV9pLrqZk9eelZm7lGvAnhqldpmM
 J+spRwmY52uhRRmBGVwZeHrx3lPDS+voFGD66TWeCivEstgujRC8CmbCeqj6hJgETCSMJ/
 MVCu7XGD6SnvqQzAWZcsP3dgfLp7WTU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-9KXaTZxdOmCnMydtwyXyAw-1; Fri, 13 Nov 2020 04:49:09 -0500
X-MC-Unique: 9KXaTZxdOmCnMydtwyXyAw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3F39C64160;
 Fri, 13 Nov 2020 09:49:08 +0000 (UTC)
Received: from gondolin (ovpn-113-133.ams2.redhat.com [10.36.113.133])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6138D10023A5;
 Fri, 13 Nov 2020 09:48:38 +0000 (UTC)
Date: Fri, 13 Nov 2020 10:47:58 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH] Clean up includes
Message-ID: <20201113104758.35721e42.cohuck@redhat.com>
In-Reply-To: <20201113061216.2483385-1-armbru@redhat.com>
References: <20201113061216.2483385-1-armbru@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 08:00:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: alxndr@bu.edu, thuth@redhat.com, mjrosato@linux.ibm.com, mst@redhat.com,
 qemu-s390x@nongnu.org, david@redhat.com, qemu-devel@nongnu.org,
 laurent@vivier.eu, pasic@linux.ibm.com, borntraeger@de.ibm.com, bsd@redhat.com,
 kraxel@redhat.com, stefanha@redhat.com, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, dgilbert@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 13 Nov 2020 07:12:16 +0100
Markus Armbruster <armbru@redhat.com> wrote:

> Clean up includes so that osdep.h is included first and headers
> which it implies are not included manually.
> 
> This commit was created with scripts/clean-includes, with the changes
> to the following files manually reverted:
> 
>     contrib/libvhost-user/libvhost-user-glib.h
>     contrib/libvhost-user/libvhost-user.c
>     contrib/libvhost-user/libvhost-user.h
>     contrib/plugins/hotblocks.c
>     contrib/plugins/hotpages.c
>     contrib/plugins/howvec.c
>     contrib/plugins/lockstep.c
>     linux-user/mips64/cpu_loop.c
>     linux-user/mips64/signal.c
>     linux-user/sparc64/cpu_loop.c
>     linux-user/sparc64/signal.c
>     linux-user/x86_64/cpu_loop.c
>     linux-user/x86_64/signal.c
>     target/s390x/gen-features.c
>     tests/fp/platform.h
>     tests/migration/s390x/a-b-bios.c
>     tests/plugin/bb.c
>     tests/plugin/empty.c
>     tests/plugin/insn.c
>     tests/plugin/mem.c
>     tests/test-rcu-simpleq.c
>     tests/test-rcu-slist.c
>     tests/test-rcu-tailq.c
>     tests/uefi-test-tools/UefiTestToolsPkg/BiosTablesTest/BiosTablesTest.c
> 
> contrib/plugins/, tests/plugin/, and tests/test-rcu-slist.c appear not
> to include osdep.h intentionally.  The remaining reverts are the same
> as in commit bbfff19688d.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
> No real need to get this into 5.2 at this stage.  No real risk either.
> 
>  contrib/vhost-user-gpu/vugbm.h          |  2 --
>  contrib/vhost-user-gpu/vugpu.h          |  1 -
>  include/hw/block/swim.h                 |  1 -
>  include/hw/display/macfb.h              |  1 -
>  include/qemu/nvdimm-utils.h             |  1 -
>  tests/qtest/fuzz/fuzz.h                 |  1 -
>  tests/qtest/fuzz/generic_fuzz_configs.h |  1 -
>  tools/virtiofsd/fuse_common.h           |  2 --
>  tools/virtiofsd/fuse_log.h              |  1 -
>  tools/virtiofsd/fuse_lowlevel.h         |  3 ---
>  tools/virtiofsd/fuse_misc.h             |  1 -
>  tools/virtiofsd/passthrough_seccomp.h   |  1 -
>  contrib/vhost-user-gpu/virgl.c          |  1 +
>  contrib/vhost-user-gpu/vugbm.c          |  1 +
>  contrib/vhost-user-input/main.c         |  1 -
>  hw/display/artist.c                     |  1 -
>  hw/s390x/s390-pci-vfio.c                |  3 ++-
>  tools/virtiofsd/buffer.c                |  5 -----
>  tools/virtiofsd/fuse_log.c              |  2 --
>  tools/virtiofsd/fuse_lowlevel.c         | 10 ----------
>  tools/virtiofsd/fuse_opt.c              |  4 ----
>  tools/virtiofsd/fuse_signals.c          |  5 -----
>  tools/virtiofsd/fuse_virtio.c           | 10 ----------
>  tools/virtiofsd/helper.c                |  8 --------
>  tools/virtiofsd/passthrough_ll.c        | 12 ------------
>  tools/virtiofsd/passthrough_seccomp.c   |  3 ---
>  util/nvdimm-utils.c                     |  1 +
>  27 files changed, 5 insertions(+), 78 deletions(-)

Acked-by: Cornelia Huck <cohuck@redhat.com>


