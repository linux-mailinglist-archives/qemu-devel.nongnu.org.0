Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 108B3E0146
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Oct 2019 11:57:14 +0200 (CEST)
Received: from localhost ([::1]:52588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMquf-0007GC-1y
	for lists+qemu-devel@lfdr.de; Tue, 22 Oct 2019 05:57:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59266)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1iMqsD-0005Kd-Md
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 05:54:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1iMqsC-0005bh-Ms
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 05:54:41 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:58341
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1iMqsC-0005bW-J0
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 05:54:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571738080;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jrukwy3qLkjNpvlpQhyMtQtDCAAf6F741m0tR4j18s8=;
 b=LkXyUsXUyauyE200I0WyKYRDSc8rW8Ocw2iEF0guxueBCO3Dxuh9O5CWsQyQG83997+CKW
 iKzegDi8+0H1RsyhTjRMlFmuvXpoEU7YRsFcdi8BIw+COGGLz2eNMAUKcNKFdzaxOFTjmR
 ZIR1lY0i8l/zSwR+bqZV7noTPj9MDE4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-R1jegDolMwuK-HCp6vD2Bw-1; Tue, 22 Oct 2019 05:54:36 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A7F2A107AD31;
 Tue, 22 Oct 2019 09:54:35 +0000 (UTC)
Received: from localhost (dhcp-192-218.str.redhat.com [10.33.192.218])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1516460C5D;
 Tue, 22 Oct 2019 09:54:32 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 1/9] s390x/cpumodel: Add missing visit_free
Date: Tue, 22 Oct 2019 11:54:20 +0200
Message-Id: <20191022095428.20780-2-cohuck@redhat.com>
In-Reply-To: <20191022095428.20780-1-cohuck@redhat.com>
References: <20191022095428.20780-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: R1jegDolMwuK-HCp6vD2Bw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andrew Jones <drjones@redhat.com>

Beata Michalska noticed this missing visit_free() while reviewing
arm's implementation of qmp_query_cpu_model_expansion(), which is
modeled off this s390x implementation.

Signed-off-by: Andrew Jones <drjones@redhat.com>
Message-Id: <20191016145434.7007-1-drjones@redhat.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 target/s390x/cpu_models.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/s390x/cpu_models.c b/target/s390x/cpu_models.c
index 009afc38b92d..7e92fb2e156d 100644
--- a/target/s390x/cpu_models.c
+++ b/target/s390x/cpu_models.c
@@ -515,6 +515,7 @@ static void cpu_model_from_info(S390CPUModel *model, co=
nst CpuModelInfo *info,
         visitor =3D qobject_input_visitor_new(info->props);
         visit_start_struct(visitor, NULL, NULL, 0, errp);
         if (*errp) {
+            visit_free(visitor);
             object_unref(obj);
             return;
         }
--=20
2.21.0


