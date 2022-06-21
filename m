Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE06C552C7B
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 09:58:57 +0200 (CEST)
Received: from localhost ([::1]:52332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3Ymm-0001cL-S5
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 03:58:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o3Yg2-0002tA-9E
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 03:51:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o3Yfy-0005u4-K0
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 03:51:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655797913;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZPg6q3cZSFidkWLC4CukDvn1U2U7ZhMnI3HepZoLJZA=;
 b=BdSvENLU9qeIxxyiP42DhDNIiGrhWrjIZ1VrtARBiA+I4AO+hhQjUKGUa7XQBqtZlHGKXY
 8ob9yg4OmFXPVTT+1cOLO7PL5FtTotzDqoRVahavJcMbgYhsVlsZBPrmZvcGQ+UIQ0L6pW
 rooABjyackIqtP0PAq8XQoYzsSUKBdI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-249-ERk99PlcO_uyYrxq2HRjbQ-1; Tue, 21 Jun 2022 03:51:51 -0400
X-MC-Unique: ERk99PlcO_uyYrxq2HRjbQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 g7-20020a056402424700b0042dee9d11d0so10277146edb.3
 for <qemu-devel@nongnu.org>; Tue, 21 Jun 2022 00:51:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZPg6q3cZSFidkWLC4CukDvn1U2U7ZhMnI3HepZoLJZA=;
 b=PYUxLTJoR3Sjl3cmTHbEQqAeSmFESXKXY+hGuLQjtQIGrBFp4gr6ssPFs2jWCW119g
 LO71vCJauaLPtAe07masiDFZPGRuv3pgNC84NpGvYHjAbHAk6ecElYBQxiSgnzd1DOYR
 3LMYrpMvci9WZ8oiPsoB62gqFJQBPfM5y6S7GdheU47VcDyBDlnRYPB5XRweAD95/lE0
 4jGf15hekcuTmYc2hm8g4cLUezpHKBFFF2nUNuBdWGs1vei3RF46Z8qIacJha0opuHp3
 GHn1DM5SjXhabsDRO8MM8AbCLNEykvKvi4TCI/MeOHOgE8vahMwIkI7Nk5tFDy+0BmEE
 MRnA==
X-Gm-Message-State: AJIora9fGYZKheiJoBH89upqfq3i5CLqxdaxhqYDOftIJLHtX8ssjvF/
 GC2CCK8E0/fqi5yxoGFbNpFe9FvLEcMM+w2KDsqx7NXvXU/BQJn3YIVbd64oauXrVZriaw2OBMR
 r89NCfoSrxpGMDLN9nxL6wioNHJXiNQ8z26Gb3p61qsXPf5xrQ1camfCJdxldDXnhVxU=
X-Received: by 2002:a17:907:2d0c:b0:711:e835:f80c with SMTP id
 gs12-20020a1709072d0c00b00711e835f80cmr24195131ejc.257.1655797910224; 
 Tue, 21 Jun 2022 00:51:50 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u2u0lIg6jcj1b3sS8JRCSNgy7Gwnp3LomAnbpJ/vLElvYfQD+yTn7Kh9gFpOMuseGwFn6ylA==
X-Received: by 2002:a17:907:2d0c:b0:711:e835:f80c with SMTP id
 gs12-20020a1709072d0c00b00711e835f80cmr24195110ejc.257.1655797909776; 
 Tue, 21 Jun 2022 00:51:49 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 f23-20020a056402329700b004357cec7e48sm5400326eda.13.2022.06.21.00.51.48
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 00:51:49 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/6] Fix support for biarch compilers and cross cflags
Date: Tue, 21 Jun 2022 09:51:41 +0200
Message-Id: <20220621075147.36297-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series fixes two bugs with configure's cross compilation detection:

- first, --cross-cflags is not obeyed by pc-bios/ compilation

- second, on a ppc64le machine, the host compiler can be used for ppc64
  tests/tcg; however, this is not being done because $cpu does not
  match the target.  Likewise, on an x86_64 machine the host compiler
  can be used to build both i386 tests/tcg and pc-bios/optionrom, but
  the special casing done by the configure script only covers the latter.

The two are related because, if only the first was fixed, pc-bios/optionrom
would use either the i386 or the x86_64 cflags depending on which cross
compiler was found.  So patches 2-4 tackle not just the cross CFLAGS
problem with pc-bios, but also the biarch compiler problem with i386
and ppc.  Patch 5 then covers the other biarch compilers.

The other two patches are just cleanups.

Supersedes: <20220607094031.1227714-1-pbonzini@redhat.com>

Paolo Bonzini (6):
  pc-bios/optionrom: use -m16 unconditionally
  configure, pc-bios/optionrom: pass cross CFLAGS correctly
  configure, pc-bios/s390-ccw: pass cross CFLAGS correctly
  configure, pc-bios/vof: pass cross CFLAGS correctly
  configure: allow more host/target combos to use the host compiler
  configure: write EXTRA_CFLAGS for all sub-Makefiles

 configure                     | 50 ++++++++++++++++++-----------------
 pc-bios/optionrom/Makefile    | 15 +----------
 pc-bios/optionrom/code16gcc.h |  3 ---
 pc-bios/s390-ccw/Makefile     | 20 +++++++-------
 pc-bios/s390-ccw/netboot.mak  |  6 ++---
 pc-bios/vof/Makefile          |  8 +++---
 6 files changed, 43 insertions(+), 59 deletions(-)
 delete mode 100644 pc-bios/optionrom/code16gcc.h

-- 
2.36.1


