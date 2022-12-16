Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0493664EB66
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 13:27:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p69nH-00079o-Hj; Fri, 16 Dec 2022 07:26:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1p69n3-00076r-Hl
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 07:26:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1p69n1-0000yM-Lc
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 07:26:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671193569;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=hZQ4waPEY4ibJ9qc4XNEQ6CYTjonfWWFLUf75YQdLPk=;
 b=Iri71aa2cuNU6ODNFF6zzEeHE4J5fsgmpQrpnoe9dphEzdQWpy1OhMUxi9nOydHdjlrbEN
 b6F0ZYs0Pp2ZAJWIGWj9zPA2H2n2QjRkSUVLodU9QqyBRUkgRuLDv2Kqn0xRBApKJqB5fN
 +NzpkK7xu76SeY+NJpDlVYgwhkbL37M=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-570-8rkjbw1uP3SM9sXDwFaGnA-1; Fri, 16 Dec 2022 07:24:56 -0500
X-MC-Unique: 8rkjbw1uP3SM9sXDwFaGnA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EF1843C0F80F;
 Fri, 16 Dec 2022 12:24:55 +0000 (UTC)
Received: from [10.39.193.99] (unknown [10.39.193.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EB6DC1121314;
 Fri, 16 Dec 2022 12:24:54 +0000 (UTC)
Content-Type: multipart/mixed; boundary="------------Q4SgW0ur4hbJt9e1KWFos0ND"
Message-ID: <fd460da9-8f6d-560a-36c9-b4116aaa186d@redhat.com>
Date: Fri, 16 Dec 2022 13:24:53 +0100
MIME-Version: 1.0
Content-Language: en-US
To: Fam Zheng <fam@euphon.net>
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org, qemu devel list <qemu-devel@nongnu.org>
From: Laszlo Ersek <lersek@redhat.com>
Subject: misleading error message when converting an empty raw file to VMDK
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This is a multi-part message in MIME format.
--------------Q4SgW0ur4hbJt9e1KWFos0ND
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Fam,

the following commands produce an error message that's unexpected IMO:

truncate --size=0 z.raw
qemu-img convert -f raw -O vmdk z.raw z.vmdk

qemu-img: Could not open 'z.vmdk': Unsupported image type 'monolithicSparse'

The exit status is 1, and the attached z.vmdk file is created.

My understanding:

- Commit 7fa60fa3778f ("VMDK: open/read/write for monolithicFlat image",
2011-07-19) introduced the vmdk_open_desc_file() function. This function
would only support (at the time) the "monolithicFlat" extent (or image?)
type.

Previously to the patch, "monolithicSparse" had been supported (that was
the type QEMU would create), but (AIUI) vmdk_open_desc_file() was never
supposed to be called for "monolithicSparse", so there was no need to
handle "monolithicSparse" in vmdk_open_desc_file().

- Commit f16f509d17de ("VMDK: bugfix, open Haiku vmdk image",
2011-09-06) introduced a vmdk_open_desc_file() call, for when a VMDK4
extent with "zero capacity" (header.capacity == 0) would be opened.
Apparently the Haiku image did not use the "monolithicSparse" subformat.

- When converting a zero-sized file to VMDK, a single extent with zero
capacity is produced (see the attachment), triggering this latter call
to vmdk_open_desc_file().

- QEMU creates the VMDK file by default in "monolithicSparse" subformat
by default, but vmdk_open_desc_file() cannot handle that; hence the error.

What's missing? Should vmdk_open_desc_file() recognize
"monolithicSparse", or should vmdk_open_desc_file() not be called in
this situation at all? Or is the zero-capacity file created by QEMU
malformed?

Thanks,
Laszlo
--------------Q4SgW0ur4hbJt9e1KWFos0ND
Content-Type: application/gzip; name="z.vmdk.gz"
Content-Disposition: attachment; filename="z.vmdk.gz"
Content-Transfer-Encoding: base64

H4sICHpgnGMCA3oudm1kawDt0s1u00AUBlAXdpbY0b2V7KOkCSmbLCguAqFKqKnatRtPidUk
jmwTEVY8OvkxAuUNKp2zGet+1zN3pPma3tyfRVH0Ovrnd7uetevbv8GrKDpvP89PeqM4eRNH
vDTdJC3q5yQN9awq1k1ZfSoWId6Eqi7K1WQQf/ySTobvHgcX/ac8XmdVWDX70lMrnlUha8Ld
dh0mnWW5KhdFMy9m011nHTpx3E2ufza7f5K8PWC3a3z7kPST6bcPt9PrpPOrt1nmz4fWu3lo
p8maLLnK6hB30/QqjvP8sbcpquZHtvj8cH+cLZkknVHnEH0P5TI01bY32y6KVb7L92H/JJyH
LD8Eg/FJUofZ7uKHbDw8ZlmerZtQ7e+1Lxd5ONabslzU/01wMRhdjt4Px6PLjtcPAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AMDL9wcYSUINAAABAA==

--------------Q4SgW0ur4hbJt9e1KWFos0ND--


