Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 159743BA908
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Jul 2021 16:37:17 +0200 (CEST)
Received: from localhost ([::1]:55388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzglf-0003G7-Sv
	for lists+qemu-devel@lfdr.de; Sat, 03 Jul 2021 10:37:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crobinso@redhat.com>)
 id 1lzgkd-0002bW-G7
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 10:36:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crobinso@redhat.com>)
 id 1lzgkZ-0002Kb-OW
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 10:36:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625322966;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=x6WBYmsB4ww+crJEk5DacNmMl6S1l8nFqyvaAboQSNQ=;
 b=cVDQ+dQDVuhsxGF3XZ4pXYKMrcc2veDmDSDmbKMbMT25zg21+PJcDOyzxz1x1n9RfLjMqt
 3eIVDSCvQu0xYfNRUUZYpGnmJnTMkRkUfqjLDYPiJlyQMhH+vO/Sy75AFe6ipcBCU4j8zv
 5mYvSWQe1SqR1McL1H48ibdVb4lrgEQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-178-h8M6-FM3MJadZqpCqyHRlQ-1; Sat, 03 Jul 2021 10:34:58 -0400
X-MC-Unique: h8M6-FM3MJadZqpCqyHRlQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2C0C7800C60
 for <qemu-devel@nongnu.org>; Sat,  3 Jul 2021 14:34:57 +0000 (UTC)
Received: from [10.10.112.221] (ovpn-112-221.rdu2.redhat.com [10.10.112.221])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E3BE310074FC
 for <qemu-devel@nongnu.org>; Sat,  3 Jul 2021 14:34:56 +0000 (UTC)
From: Cole Robinson <crobinso@redhat.com>
Subject: clang build error on i686
To: qemu-devel <qemu-devel@nongnu.org>
Message-ID: <abc8f7fe-2afe-0f5d-d391-6277db6e6f42@redhat.com>
Date: Sat, 3 Jul 2021 10:34:56 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crobinso@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crobinso@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.377,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, I'm hitting build errors with clang on i686 userspace on x86_64
kernel. Affects both qemu 6.0.0 and qemu.git, tested with fedora
clang-12.0.1~rc3-1.fc35.i686.

Full build log from the 6.0.0 build:
https://gist.githubusercontent.com/crobinso/7b1206044eac7326490b2adce829e861/raw/9dddef968051fd6383ba7adb9e595081ad4f8fa4/gistfile1.txt

Lots of errors like:

/usr/bin/ld: libqemu-aarch64-softmmu.fa.p/accel_tcg_cputlb.c.o: in
function `helper_atomic_cmpxchgq_le_mmu':
/builddir/build/BUILD/qemu-6.0.0/accel/tcg/atomic_template.h:86:
undefined reference to `__atomic_compare_exchange_8'
/usr/bin/ld: libqemu-aarch64-softmmu.fa.p/accel_tcg_cputlb.c.o: in
function `helper_atomic_xchgq_le_mmu':
/builddir/build/BUILD/qemu-6.0.0/accel/tcg/atomic_template.h:134:
undefined reference to `__atomic_exchange_8'

Also warnings like:

/builddir/build/BUILD/qemu-6.0.0/include/qemu/stats64.h:58:21: warning:
misaligned atomic operation may incur significant performance penalty;
the expected alignment (8 bytes) exceeds the actual alignment (4 bytes)
[-Watomic-alignment]
    uint64_t orig = qatomic_read__nocheck(&s->value);
                    ^
/builddir/build/BUILD/qemu-6.0.0/include/qemu/atomic.h:129:5: note:
expanded from macro 'qatomic_read__nocheck'
    __atomic_load_n(ptr, __ATOMIC_RELAXED)

Search the log for __atomic for other hits.

Thanks,
Cole


