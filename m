Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1917240A31
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Aug 2020 17:39:27 +0200 (CEST)
Received: from localhost ([::1]:50470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k59tX-00055r-05
	for lists+qemu-devel@lfdr.de; Mon, 10 Aug 2020 11:39:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1k59sZ-0004cP-27
 for qemu-devel@nongnu.org; Mon, 10 Aug 2020 11:38:27 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:49776
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1k59sW-00005f-Uu
 for qemu-devel@nongnu.org; Mon, 10 Aug 2020 11:38:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597073903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tPK4xe/ZzznealPvhiqdLZsC2tm9G66S8LzfaYE2cr4=;
 b=iubYakyCgjLl7JK4UP0Qm2+U0vL1Cvh16wssLUYA8qKBWZ0BSRqdjelfAcuoq0wfRnwoYR
 Y61jbFzcwHWWpr0KQzh284fEHprutm0JfB8ajmiaT9rjEuW0/EPwlso9c2j1t9Mbc/Wm+L
 mEUVvN6pfNeARgRSDqnSgx1Uch7M4dE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-277-eAyCFIWpM0aWeJvOPRMOuA-1; Mon, 10 Aug 2020 11:38:21 -0400
X-MC-Unique: eAyCFIWpM0aWeJvOPRMOuA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 19DCC80BCA6;
 Mon, 10 Aug 2020 15:38:20 +0000 (UTC)
Received: from linux.fritz.box (ovpn-112-56.ams2.redhat.com [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E89BF1000320;
 Mon, 10 Aug 2020 15:38:12 +0000 (UTC)
Date: Mon, 10 Aug 2020 17:38:11 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Zhenyu Ye <yezhenyu2@huawei.com>
Subject: Re: [PATCH v1 0/2] Add timeout mechanism to qmp actions
Message-ID: <20200810153811.GF14538@linux.fritz.box>
References: <20200810145246.1049-1-yezhenyu2@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20200810145246.1049-1-yezhenyu2@huawei.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.120; envelope-from=kwolf@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/10 03:31:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: fam@euphon.net, qemu-block@nongnu.org, armbru@redhat.com,
 xiexiangyou@huawei.com, qemu-devel@nongnu.org, stefanha@redhat.com,
 pbonzini@redhat.com, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 10.08.2020 um 16:52 hat Zhenyu Ye geschrieben:
> Before doing qmp actions, we need to lock the qemu_global_mutex,
> so the qmp actions should not take too long time.
> 
> Unfortunately, some qmp actions need to acquire aio context and
> this may take a long time.  The vm will soft lockup if this time
> is too long.

Do you have a specific situation in mind where getting the lock of an
AioContext can take a long time? I know that the main thread can
block for considerable time, but QMP commands run in the main thread, so
this patch doesn't change anything for this case. It would be effective
if an iothread blocks, but shouldn't everything running in an iothread
be asynchronous and therefore keep the AioContext lock only for a short
time?

Kevin


