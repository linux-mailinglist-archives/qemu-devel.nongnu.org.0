Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E781B2B1811
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 10:19:53 +0100 (CET)
Received: from localhost ([::1]:33388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdVFI-0002Gd-W7
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 04:19:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kdVDR-00019L-Lx
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 04:17:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kdVDP-0007X8-NL
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 04:17:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605259075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d4Uca5xcPRIXFeqRXKoohwN4OBiDtPo5+BKmZNO7z9o=;
 b=ELbF/4YIqopMNfosM5xekrkF5Msp51Fea1TA46wP05cPDmg9nKb7YB+LZhq6FVJKuLvSv3
 frRD8cXOvT3EO9JR8wNgj2aoBM5Y7X2BT9Rcc5L2x3cCL/JAncZQ6nftbk02i3pjEnZVzT
 NhKPIZ36T4TaHZsSFe/u/fD/VNF/KbU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-Lssm1dP-PHSrMmZ2im3iVQ-1; Fri, 13 Nov 2020 04:17:52 -0500
X-MC-Unique: Lssm1dP-PHSrMmZ2im3iVQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 86999101962C;
 Fri, 13 Nov 2020 09:17:49 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-177.ams2.redhat.com [10.36.112.177])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C8CE26EF7A;
 Fri, 13 Nov 2020 09:17:27 +0000 (UTC)
Subject: Re: [PATCH] Clean up includes
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20201113061216.2483385-1-armbru@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <29e45815-76c4-18d6-4e73-4df1923d5d47@redhat.com>
Date: Fri, 13 Nov 2020 10:17:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20201113061216.2483385-1-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 08:00:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: mjrosato@linux.ibm.com, mst@redhat.com, bsd@redhat.com, cohuck@redhat.com,
 david@redhat.com, laurent@vivier.eu, dgilbert@redhat.com, pasic@linux.ibm.com,
 alxndr@bu.edu, qemu-s390x@nongnu.org, kraxel@redhat.com, stefanha@redhat.com,
 marcandre.lureau@redhat.com, pbonzini@redhat.com, borntraeger@de.ibm.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/11/2020 07.12, Markus Armbruster wrote:
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

Seems to compile fine:

 https://gitlab.com/huth/qemu/-/pipelines/215598144
 https://cirrus-ci.com/build/6127772462481408
 https://travis-ci.com/github/huth/qemu/builds/201194948

Tested-by: Thomas Huth <thuth@redhat.com>


