Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 177C32612E0
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Sep 2020 16:43:38 +0200 (CEST)
Received: from localhost ([::1]:42204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFeqP-0007RX-5s
	for lists+qemu-devel@lfdr.de; Tue, 08 Sep 2020 10:43:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kFepI-0006HO-N6
 for qemu-devel@nongnu.org; Tue, 08 Sep 2020 10:42:28 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:42977
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kFepH-0000zx-8Q
 for qemu-devel@nongnu.org; Tue, 08 Sep 2020 10:42:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599576146;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ng7Zl/deXvfuNTuK09wKXv5rjWKHrvTXlSuQLaRoN3I=;
 b=TypIit8fJMjQ5LjEPOYkrvKr7OJ6fY/9YoktNuNc2YeVZYgi967qQPNPTTWVukWRZDkips
 lXs2Pwm1e+k0UnR2jW1SdpOBQRt6sldWS5yTnHvuNzYXRZB9Ek7DatmEWXnwvS9RGs1/3D
 5YfsDWiskdAN0vSCnGINngLDmQlFO6E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-261-q8EdCv95NpqJU6kg3B_BLw-1; Tue, 08 Sep 2020 10:42:24 -0400
X-MC-Unique: q8EdCv95NpqJU6kg3B_BLw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8329F80EDA4;
 Tue,  8 Sep 2020 14:42:23 +0000 (UTC)
Received: from linux.fritz.box (ovpn-113-55.ams2.redhat.com [10.36.113.55])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8DED910013C4;
 Tue,  8 Sep 2020 14:42:22 +0000 (UTC)
Date: Tue, 8 Sep 2020 16:42:21 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] block/qcow2-cluster: Add missing "fallthrough" annotation
Message-ID: <20200908144221.GF8175@linux.fritz.box>
References: <20200908070028.193298-1-thuth@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200908070028.193298-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.120; envelope-from=kwolf@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/08 00:33:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 08.09.2020 um 09:00 hat Thomas Huth geschrieben:
> When compiling with -Werror=implicit-fallthrough, the compiler currently
> complains:
> 
> ../../devel/qemu/block/qcow2-cluster.c: In function ‘cluster_needs_new_alloc’:
> ../../devel/qemu/block/qcow2-cluster.c:1320:12: error: this statement may fall
>  through [-Werror=implicit-fallthrough=]
>          if (l2_entry & QCOW_OFLAG_COPIED) {
>             ^
> ../../devel/qemu/block/qcow2-cluster.c:1323:5: note: here
>      case QCOW2_CLUSTER_UNALLOCATED:
>      ^~~~
> 
> It's quite obvious that the fallthrough is intended here, so let's add
> a comment to silence the compiler warning.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Thanks, applied to the block branch.

Kevin


