Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 452E153FA16
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 11:44:43 +0200 (CEST)
Received: from localhost ([::1]:36374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyVlS-0002eE-Ao
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 05:44:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyVha-0007ri-Rw
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 05:40:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyVhX-0008Mf-IZ
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 05:40:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654594837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Y8n3f/Py+omgUs4vRdWAW0LdwEQDp5dY5gBRtbYvT6k=;
 b=VhaPrEm/SaP2kSktbgDR2kjOKsmaB9NTa120apolZg9F9Hi58OaSlg3zo5J5nilN/oFJpm
 m/B4pOEoYNeUX6845zRXBJVgBYpSflaE6vQ0bUvPqaDHZhiZZPF6W9bKJfmOQU+5D4T442
 uQquV3FwpK9vYA2L1X4ONYNjA40s+TQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-224-f-clLBKvNvGW9GthuUnTEw-1; Tue, 07 Jun 2022 05:40:35 -0400
X-MC-Unique: f-clLBKvNvGW9GthuUnTEw-1
Received: by mail-wr1-f72.google.com with SMTP id
 o18-20020a5d4a92000000b00213b4eebc25so3044503wrq.21
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 02:40:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Y8n3f/Py+omgUs4vRdWAW0LdwEQDp5dY5gBRtbYvT6k=;
 b=skSnXA68+mnWwcWOA3G39gAWXAxPGU608mv+hGO76DC19SvhPZJGytHcPQAydWoBlO
 K0tiXZi1+pEO5ukOuzM1xZewANcX9acqsCxK5R/j3ktDd2yRiVUi0/R91nHpk43xxUbf
 wEpBabkyUrHBhpI/1O/efuCwM+gRMIzL29mtirU84TOSGcBrsmYEAz5Olp0iOdo8WluV
 rnumML1o69x/JhAaNGCuGLGIciJ3J4Z96cJr/2IBbheoxQsF4FO/EcbnDpEDMzwWaZrZ
 O1FN4olgexNw0Kw+TbMsGRgvFRcUPTgj/4/nm1XQRm4XGJr/dOrPV3wveIDfX1iJlORB
 6A1w==
X-Gm-Message-State: AOAM530j76hiNWPZW2EoB5p798Hv9rdkl/Qbw8XFh6NmTvOb+CUBZC3Y
 mF6iEmdN4fdYJVowRVDgVZBQzMSwNuH4wEEzM7iZtQqNW8uJao1YXnfGGG7NdhqD0iuiFmDO4nW
 MlGciYHUJcFPjLIJm3LJciVMhM92aAu7p7QKN851ai8xWCIj9j4FIK028XJ5nRNH5++4=
X-Received: by 2002:adf:e88c:0:b0:214:b72b:73e1 with SMTP id
 d12-20020adfe88c000000b00214b72b73e1mr19372413wrm.135.1654594834387; 
 Tue, 07 Jun 2022 02:40:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwic3v+GRf32bgRGe8+FzLDo54BYi29QP2IMOJbq9Pr0PS/qYawt74EOT8F93blrzszpafbRQ==
X-Received: by 2002:adf:e88c:0:b0:214:b72b:73e1 with SMTP id
 d12-20020adfe88c000000b00214b72b73e1mr19372394wrm.135.1654594834114; 
 Tue, 07 Jun 2022 02:40:34 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 s8-20020a5d69c8000000b002102b16b9a4sm17371275wrw.110.2022.06.07.02.40.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 02:40:33 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	richard.henderson@linaro.org
Subject: [PATCH 0/7] More tests/tcg cleanups
Date: Tue,  7 Jun 2022 11:40:24 +0200
Message-Id: <20220607094031.1227714-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Building on the introduction of config-$target.mak, make tests/tcg a
"regular" subdirectory that is entered simply with "make -C", like the
ROMs or the plugins.

The next step could be to unify all the sub-make rules; this series
stops short of that.

Paolo

Paolo Bonzini (7):
  meson: put cross compiler info in a separate section
  build: include pc-bios/ part in the ROMS variable
  configure: allow more host/target combos to use the host compiler
  configure: move tests/tcg/Makefile.prereqs to root build directory
  configure: store container engine in config-host.mak
  tests: simplify Makefile invocation for tests/tcg
  tests/tcg: remove -f from Makefile invocation

 Makefile                      | 17 +++----
 configure                     | 90 +++++++++++++++++++++--------------
 meson.build                   | 15 +++---
 tests/Makefile.include        | 13 ++---
 tests/docker/Makefile.include |  2 +-
 tests/tcg/Makefile.target     |  2 +-
 6 files changed, 77 insertions(+), 62 deletions(-)

-- 
2.36.1


