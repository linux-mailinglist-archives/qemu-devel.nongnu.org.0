Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA6E1BCCDF
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Apr 2020 22:00:29 +0200 (CEST)
Received: from localhost ([::1]:48388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jTWP6-0005fQ-3s
	for lists+qemu-devel@lfdr.de; Tue, 28 Apr 2020 16:00:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35358)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peterx@redhat.com>) id 1jTWLv-0002AF-8P
 for qemu-devel@nongnu.org; Tue, 28 Apr 2020 15:57:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <peterx@redhat.com>) id 1jTWLt-000727-Or
 for qemu-devel@nongnu.org; Tue, 28 Apr 2020 15:57:11 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:43571
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1jTWLt-00071q-70
 for qemu-devel@nongnu.org; Tue, 28 Apr 2020 15:57:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588103827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+n7+kWTrnLfGFD//mxdVeddc4ueq4cCEc0sn7NTVjQ4=;
 b=Zv35tX7yS295Z9vl+7zMzj7nCnZ4ChDC1Dp4EOg/PeOGJh378Hf2/uvn7e/jQHAqkvzmyO
 EN+fuZf4gz2gwQrBAwbuYsnt6q0D0zcLbAZVUXB4WjW8JCmFExnk/BQV4smeNoKTpDQAVJ
 g2RAaj5Px7IS4tOs84mJAbge7tQAmcI=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289-wSqzQcEzNMSdueSRYS8jpQ-1; Tue, 28 Apr 2020 15:57:06 -0400
X-MC-Unique: wSqzQcEzNMSdueSRYS8jpQ-1
Received: by mail-qt1-f199.google.com with SMTP id d35so25848083qtc.20
 for <qemu-devel@nongnu.org>; Tue, 28 Apr 2020 12:57:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c2ZYZNMmnMATCHYlWhhk0OEAwyp2uTk+/CRaiDuuvcg=;
 b=KEwNZVVUT27Xj+6JMZ/kXSBTgefvr4SiNVhnJN+01KzPwN1CUBlh4OVNajCzMdcNm6
 iub19oN0HbQNor7ROyeUrK1A8CEy8070rklgSMh13Wcb5SWvw0XIdBywfm1okLyBUh1k
 UT0tCv8AGFXbEoAs/iPfHDb3n7NU9jFS9wxfc5fozn3TVqqTaiLqSD+/vW1IKdwjM3Hy
 jBKsBxCvqcCns+h3tTowGbIKOFtMYqh/k03fzk71GISFLJnLiMlmm/iR9UWRybEAAJ3K
 8+tK5zNiTCvAZRQbAJZunwigGQTBp1lD5FJEMNWU7L1LAy9sNp/m0FmCjSmQ22g43EBD
 PKPg==
X-Gm-Message-State: AGi0PuaAGTR6IB2FM2eiUbc+RhSdTWbChrMnO+GexWzZjV174UvpmqEV
 r4d52hMVKma+yjQ/eL3pDRaUEsUgbp8JRHeYFr3sC0wChoo4kkSRGnOetR67jSOwWsn/q2Ogwlx
 LdpiS7+qWXI54TdU=
X-Received: by 2002:a05:6214:a8a:: with SMTP id
 ev10mr28492803qvb.20.1588103825584; 
 Tue, 28 Apr 2020 12:57:05 -0700 (PDT)
X-Google-Smtp-Source: APiQypIIn57zLuqind6I/iV3VlUc5958UOmhSGX/TtC/N6QXQyP7Lyrdp4Klaix6TKhpaw9p1TxUjA==
X-Received: by 2002:a05:6214:a8a:: with SMTP id
 ev10mr28492783qvb.20.1588103825373; 
 Tue, 28 Apr 2020 12:57:05 -0700 (PDT)
Received: from xz-x1.redhat.com ([2607:9880:19c0:32::2])
 by smtp.gmail.com with ESMTPSA id j9sm14121841qkk.99.2020.04.28.12.57.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 12:57:04 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC v2 1/9] KVM: Fixup kvm_log_clear_one_slot() ioctl return
 check
Date: Tue, 28 Apr 2020 15:56:59 -0400
Message-Id: <20200428195707.11980-2-peterx@redhat.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200428195707.11980-1-peterx@redhat.com>
References: <20200428195707.11980-1-peterx@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.81; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/28 04:11:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

kvm_vm_ioctl() handles the errno trick already for ioctl() on
returning -1 for errors.  Fix this.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 accel/kvm/kvm-all.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index e1c87fa4e1..1f1fd5316e 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -698,14 +698,13 @@ static int kvm_log_clear_one_slot(KVMSlot *mem, int a=
s_id, uint64_t start,
     d.num_pages =3D bmap_npages;
     d.slot =3D mem->slot | (as_id << 16);
=20
-    if (kvm_vm_ioctl(s, KVM_CLEAR_DIRTY_LOG, &d) =3D=3D -1) {
-        ret =3D -errno;
+    ret =3D kvm_vm_ioctl(s, KVM_CLEAR_DIRTY_LOG, &d);
+    if (ret) {
         error_report("%s: KVM_CLEAR_DIRTY_LOG failed, slot=3D%d, "
                      "start=3D0x%"PRIx64", size=3D0x%"PRIx32", errno=3D%d"=
,
                      __func__, d.slot, (uint64_t)d.first_page,
                      (uint32_t)d.num_pages, ret);
     } else {
-        ret =3D 0;
         trace_kvm_clear_dirty_log(d.slot, d.first_page, d.num_pages);
     }
=20
--=20
2.24.1


