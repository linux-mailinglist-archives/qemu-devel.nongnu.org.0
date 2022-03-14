Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8AE4D7F07
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 10:52:06 +0100 (CET)
Received: from localhost ([::1]:37500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nThMz-0002be-7f
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 05:52:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nTh3p-000854-Sp; Mon, 14 Mar 2022 05:32:18 -0400
Received: from [2a00:1450:4864:20::434] (port=45882
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nTh3n-00085i-8O; Mon, 14 Mar 2022 05:32:16 -0400
Received: by mail-wr1-x434.google.com with SMTP id p9so22808134wra.12;
 Mon, 14 Mar 2022 02:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rJ5t0QlYbGPaQo4OSda80/LOzZ+BH7tVMn0K+fkw8fI=;
 b=fB9G4iQGa9mZ9h7OLfgKwJpJStUCDleGORUdnjA0jDUTGCcg/wcVGIIAs7bJ8PXbqI
 isqR+kIbKx1Z5E0E0Ydhrbgphh6yn0K16SusseJeaU30jA/RzX2U1AqNAXPnx6qg2JYs
 RBeTVTa+jqSs5C6HuoQVn80xa0oIFxAtUhNhwYpddlTr5lrThhlbseLH/oQuDd4QD26L
 9PT/Sr6MssXYSFUgo1jUgkjcWxbQ9zTcig7rqyp3/WElUMofkBxSn1p4hg+wxlPnEeGF
 /L9i59lgE3irApewua27t6/mIBqHXVHDK9N2uKH+eulOsEPMRvpwOdKE5tOsmQBvt1ig
 fHdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=rJ5t0QlYbGPaQo4OSda80/LOzZ+BH7tVMn0K+fkw8fI=;
 b=Gfa5PhcpPd03yBYrNTDwy+PsVXsrkvp237EsXu/uqxT4Grq7+i5Bx0DpHx8muOWEyz
 m9g8Ubn9SWq/CPCBKYXUuptjDswzgMqirtUs6qj4Sb2zKMOvnHDsCfkHSRjef1eq7KiL
 J+ySqGamuU5txHE5ISfnLPKLBgTHHusyt6XZSXJ33Dl3XEQdEcYeHWlsenv7ja2hkXN8
 8zVSyJiW7/UbqDYK6hPdfsOnyHe81rCCRWcpS8GQxomX+UQ+6lUgzNtZ5n3BC7dj1kUb
 ibF3r68dikrtgVfbw9X/8heq/4dXh0dio0bwpXg6tUydAfg7z7wJ4QS/yM8tGrXsuu5p
 /Tvw==
X-Gm-Message-State: AOAM530kN7fiKNKJLCAeciiUGF6pf61WqVC/tQy+59pbSfJLSz87SDft
 I/SBsNaKuZpqysqSjR4lScMLYUkZvZ8=
X-Google-Smtp-Source: ABdhPJwjKowugrRfHHz3dvo3kHlY1QrczUU5e0Vc+qdzIZkp2WAqbVMpS1MPDn3hIJgrKLR0SdjR8w==
X-Received: by 2002:a5d:6dad:0:b0:203:84b4:da13 with SMTP id
 u13-20020a5d6dad000000b0020384b4da13mr15310651wrs.162.1647250333459; 
 Mon, 14 Mar 2022 02:32:13 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 l7-20020adfe9c7000000b001f06f8ec92dsm12707517wrn.30.2022.03.14.02.32.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Mar 2022 02:32:13 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH experiment 10/16] add space between liter and string macro
Date: Mon, 14 Mar 2022 10:31:57 +0100
Message-Id: <20220314093203.1420404-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220314093203.1420404-1-pbonzini@redhat.com>
References: <20220314093203.1420404-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: kwolf@redhat.com, hreitz@redhat.com, berrange@redhat.com,
 qemu-block@nongnu.org, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/trace-events | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/util/trace-events b/util/trace-events
index c8f53d7d9f..5bc718eff7 100644
--- a/util/trace-events
+++ b/util/trace-events
@@ -1,10 +1,10 @@
 # See docs/devel/tracing.rst for syntax documentation.
 
 # aio-posix.c
-run_poll_handlers_begin(void *ctx, int64_t max_ns, int64_t timeout) "ctx %p max_ns %"PRId64 " timeout %"PRId64
-run_poll_handlers_end(void *ctx, bool progress, int64_t timeout) "ctx %p progress %d new timeout %"PRId64
-poll_shrink(void *ctx, int64_t old, int64_t new) "ctx %p old %"PRId64" new %"PRId64
-poll_grow(void *ctx, int64_t old, int64_t new) "ctx %p old %"PRId64" new %"PRId64
+run_poll_handlers_begin(void *ctx, int64_t max_ns, int64_t timeout) "ctx %p max_ns %" PRId64 " timeout %" PRId64
+run_poll_handlers_end(void *ctx, bool progress, int64_t timeout) "ctx %p progress %d new timeout %" PRId64
+poll_shrink(void *ctx, int64_t old, int64_t new) "ctx %p old %" PRId64" new %" PRId64
+poll_grow(void *ctx, int64_t old, int64_t new) "ctx %p old %" PRId64" new %" PRId64
 poll_add(void *ctx, void *node, int fd, unsigned revents) "ctx %p node %p fd %d revents 0x%x"
 poll_remove(void *ctx, void *node, int fd) "ctx %p node %p fd %d"
 
@@ -52,9 +52,9 @@ qemu_vfree(void *ptr) "ptr %p"
 qemu_anon_ram_free(void *ptr, size_t size) "ptr %p size %zu"
 
 # hbitmap.c
-hbitmap_iter_skip_words(const void *hb, void *hbi, uint64_t pos, unsigned long cur) "hb %p hbi %p pos %"PRId64" cur 0x%lx"
-hbitmap_reset(void *hb, uint64_t start, uint64_t count, uint64_t sbit, uint64_t ebit) "hb %p items %"PRIu64",%"PRIu64" bits %"PRIu64"..%"PRIu64
-hbitmap_set(void *hb, uint64_t start, uint64_t count, uint64_t sbit, uint64_t ebit) "hb %p items %"PRIu64",%"PRIu64" bits %"PRIu64"..%"PRIu64
+hbitmap_iter_skip_words(const void *hb, void *hbi, uint64_t pos, unsigned long cur) "hb %p hbi %p pos %" PRId64" cur 0x%lx"
+hbitmap_reset(void *hb, uint64_t start, uint64_t count, uint64_t sbit, uint64_t ebit) "hb %p items %" PRIu64",%" PRIu64" bits %" PRIu64"..%" PRIu64
+hbitmap_set(void *hb, uint64_t start, uint64_t count, uint64_t sbit, uint64_t ebit) "hb %p items %" PRIu64",%" PRIu64" bits %" PRIu64"..%" PRIu64
 
 # lockcnt.c
 lockcnt_fast_path_attempt(const void *lockcnt, int expected, int new) "lockcnt %p fast path %d->%d"
@@ -82,15 +82,15 @@ qemu_vfio_ram_block_added(void *s, void *p, size_t size) "s %p host %p size 0x%z
 qemu_vfio_ram_block_removed(void *s, void *p, size_t size) "s %p host %p size 0x%zx"
 qemu_vfio_dump_mapping(void *host, uint64_t iova, size_t size) "vfio mapping %p to iova 0x%08" PRIx64 " size 0x%zx"
 qemu_vfio_find_mapping(void *s, void *p) "s %p host %p"
-qemu_vfio_new_mapping(void *s, void *host, size_t size, int index, uint64_t iova) "s %p host %p size 0x%zx index %d iova 0x%"PRIx64
-qemu_vfio_do_mapping(void *s, void *host, uint64_t iova, size_t size) "s %p host %p <-> iova 0x%"PRIx64 " size 0x%zx"
+qemu_vfio_new_mapping(void *s, void *host, size_t size, int index, uint64_t iova) "s %p host %p size 0x%zx index %d iova 0x%" PRIx64
+qemu_vfio_do_mapping(void *s, void *host, uint64_t iova, size_t size) "s %p host %p <-> iova 0x%" PRIx64 " size 0x%zx"
 qemu_vfio_dma_map(void *s, void *host, size_t size, bool temporary, uint64_t *iova) "s %p host %p size 0x%zx temporary %d &iova %p"
-qemu_vfio_dma_mapped(void *s, void *host, uint64_t iova, size_t size) "s %p host %p <-> iova 0x%"PRIx64" size 0x%zx"
+qemu_vfio_dma_mapped(void *s, void *host, uint64_t iova, size_t size) "s %p host %p <-> iova 0x%" PRIx64" size 0x%zx"
 qemu_vfio_dma_unmap(void *s, void *host) "s %p host %p"
-qemu_vfio_pci_read_config(void *buf, int ofs, int size, uint64_t region_ofs, uint64_t region_size) "read cfg ptr %p ofs 0x%x size 0x%x (region addr 0x%"PRIx64" size 0x%"PRIx64")"
-qemu_vfio_pci_write_config(void *buf, int ofs, int size, uint64_t region_ofs, uint64_t region_size) "write cfg ptr %p ofs 0x%x size 0x%x (region addr 0x%"PRIx64" size 0x%"PRIx64")"
-qemu_vfio_region_info(const char *desc, uint64_t region_ofs, uint64_t region_size, uint32_t cap_offset) "region '%s' addr 0x%"PRIx64" size 0x%"PRIx64" cap_ofs 0x%"PRIx32
-qemu_vfio_pci_map_bar(int index, uint64_t region_ofs, uint64_t region_size, int ofs, void *host) "map region bar#%d addr 0x%"PRIx64" size 0x%"PRIx64" ofs 0x%x host %p"
+qemu_vfio_pci_read_config(void *buf, int ofs, int size, uint64_t region_ofs, uint64_t region_size) "read cfg ptr %p ofs 0x%x size 0x%x (region addr 0x%" PRIx64" size 0x%" PRIx64")"
+qemu_vfio_pci_write_config(void *buf, int ofs, int size, uint64_t region_ofs, uint64_t region_size) "write cfg ptr %p ofs 0x%x size 0x%x (region addr 0x%" PRIx64" size 0x%" PRIx64")"
+qemu_vfio_region_info(const char *desc, uint64_t region_ofs, uint64_t region_size, uint32_t cap_offset) "region '%s' addr 0x%" PRIx64" size 0x%" PRIx64" cap_ofs 0x%" PRIx32
+qemu_vfio_pci_map_bar(int index, uint64_t region_ofs, uint64_t region_size, int ofs, void *host) "map region bar#%d addr 0x%" PRIx64" size 0x%" PRIx64" ofs 0x%x host %p"
 
 #userfaultfd.c
 uffd_query_features_nosys(int err) "errno: %i"
-- 
2.35.1



