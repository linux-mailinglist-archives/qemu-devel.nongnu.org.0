Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E53E13DC3F0
	for <lists+qemu-devel@lfdr.de>; Sat, 31 Jul 2021 08:29:17 +0200 (CEST)
Received: from localhost ([::1]:55590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9iUm-0007bz-CX
	for lists+qemu-devel@lfdr.de; Sat, 31 Jul 2021 02:29:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m9iTL-00051E-7O
 for qemu-devel@nongnu.org; Sat, 31 Jul 2021 02:27:47 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:37764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m9iTJ-0001EQ-Es
 for qemu-devel@nongnu.org; Sat, 31 Jul 2021 02:27:46 -0400
Received: by mail-ej1-x629.google.com with SMTP id h9so5423978ejs.4
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 23:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=URmjWnjOpc0suxIXLv6qxvUnTLJgACtg+S+OcG/C9EA=;
 b=t3qJaj9LP3rHijqwQ9HRpAbZb1VnScasQ57ENqGqBMGONrtdEWR5sF1P+zs/m9poxQ
 2HevGaJVzoks7uZo4a2kiZj3oO1DJITgQQ0dlDRCgiehv6pV9JXbAakMqhRbg1pY3aLQ
 jsd1hcAI+Men69cTPamXB/PR/TGqvd3RdQ3jL1ffeGKQEOSHSQHtxLgtzMIT7LGDDNLf
 Sfi9kMXiKOOjYm+FbjQCaFOhcEhdDlBMRFOqiidOTHq9u2bC1aj83j/PhGlMbDkfI3WB
 /b1lAY3NHBR0kBiXk1YSjaDowLcdw0mUUCqn7Td4OHktRxztjcvHxEHWzTzCQh9+I/0g
 wn0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=URmjWnjOpc0suxIXLv6qxvUnTLJgACtg+S+OcG/C9EA=;
 b=nfl6VQZmePIOPtzLpL4pWDdOh0PjlauIzjXuORWUU3vGvia8SCLLUMmnuA1GoA6np/
 Cp9gehg2srZg1aY2dAcWeR44ZW3cUebUb8HSVJ1DSbl+zby3J/x+aI/vy4fsWplp3jD4
 8SAo7ccwvBaO6M401Dh0zC2PI2waqGljqPFn4YZSfcPHv7CdJLWqykWo0WA39bk6mhGm
 dxKcrAXXL6WbM6OnpMKr2ai8avZfK7uUpVFwcNtbLaiJnN4yPOI9LAYafu9jprD6I58F
 1FDuuFdWo0mlVzW+thggsGOiRF1bSBrUe4bDldxdB0d98ZOzR1SAzoeqzg6x3Cz5wANX
 Duyg==
X-Gm-Message-State: AOAM532iaYUmKeNTHxzEjFzu13E6owlGXVFVpwt8b1RrDudf3pBEzLIZ
 mgNqU/qAUXqQZZtLb0wHQt7iCvgyrJ+j7A==
X-Google-Smtp-Source: ABdhPJxyXvB97YpAIflItdCPKy12wULivB+Nawnc7iPxBPmfE98uCIXYFNrl5+I2AHjYbxbDQNQIiQ==
X-Received: by 2002:a17:906:2bd4:: with SMTP id
 n20mr6289533ejg.390.1627712862882; 
 Fri, 30 Jul 2021 23:27:42 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id
 b25sm1766116edv.9.2021.07.30.23.27.41 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 23:27:42 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/6] Updates for Coverity modeling file
Date: Sat, 31 Jul 2021 08:27:35 +0200
Message-Id: <20210731062741.301102-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Recently, an update to the Coverity tools caused it to introduce hundreds
of new complaints about using g_free() to free memory areas allocated
by GLib functions.  The solution adopted here (patch 2) is to just
make g_free a synonym of free, removing the custom g_free marker from
__coverity_mark_as_afm_allocated__ and __coverity_mark_as_afm_freed__.
This unfortunately goes against the GLib documentation, which suggests
that g_malloc() should be matched with g_free() and plain malloc() with
free(); since GLib 2.46 however g_malloc() is hardcoded to always use the
system malloc implementation, and g_free is just "free" plus a tracepoint.
Therefore, this should not cause any problem in practice.

There are still problems, in that Coverity believes that the result of
g_malloc/g_malloc0 can return NULL, which is not true.  What caused the
issue is anybody's guess; possibly a new version of Coverity changed
the semantics of __coverity_alloc__, but I also had to inline the model
of g_malloc_n in g_malloc (and likewise for the other five functions)
though it seems like Coverity.  This is implemented in patches 5-6.

On top of these changes, this includes a few more changes to the model
file:

- patch 1 include a few more simplified memory read/write models, so
  that Coverity has a model for all functions in the pci_dma_* and
  dma_memory_* family.  This fixes a few incorrect out of bounds
  false positive, where Coverity does not realize that only up to
  LEN bytes are read/written by those functions

- patch 3 removes the model for various allocation functions, which
  is unnecessary now that we need not (or cannot) detect their
  being paired with g_free

- patch 4 is a small cleanup that makes the inlined allocation
  functions smaller.

This series is a sort of FYI; since the only way to debug the model file
is to upload it to scan.coverity.com, these changes are all already live.
The last will be as of the next build, but was effective last Thursday
and worked (I tried disabling it on Friday in something like a bisection,
but it failed and I have now reverted to Thursday's model).

Thanks,

Paolo

Paolo Bonzini (6):
  coverity-model: update address_space_read/write models
  coverity-model: make g_free a synonym of free
  coverity-model: remove model for more allocation functions
  coverity-model: clean up the models for array allocation functions
  coverity-model: constrain g_malloc/g_malloc0/g_realloc as never
    returning NULL
  coverity-model: write models fully for non-array allocation functions

 scripts/coverity-scan/model.c | 235 ++++++++++++++++------------------
 1 file changed, 110 insertions(+), 125 deletions(-)

-- 
2.31.1


