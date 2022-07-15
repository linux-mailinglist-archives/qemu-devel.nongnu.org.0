Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F6D5765A4
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 19:05:29 +0200 (CEST)
Received: from localhost ([::1]:56886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCOkq-0004i4-Av
	for lists+qemu-devel@lfdr.de; Fri, 15 Jul 2022 13:05:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oCOiT-0000bO-93
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 13:03:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oCOiQ-0003eT-1b
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 13:02:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657904575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=SqHD2jSkMZHjeytQ/TqEX/D3DTj0xNvKQH7hEQ64a0Q=;
 b=YmvWxiuBCrLcngqhERTDDrjQBuu3rEoWS5ezyEqLCk2Ozf4vDzhZw4TpR9mcN1kEklHm8p
 GpLobj26pxHHqD/U0rpHcmG8zruXJsqVOSAOJUL9xaP0HwaAKyqmf/EFMIInQYa5n2NOOK
 SoPdoAKWUEBYowofYsnIsZZaKaQ1hrQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-347-UTZ4HCJtOJa6-GH1YWdEQQ-1; Fri, 15 Jul 2022 13:02:54 -0400
X-MC-Unique: UTZ4HCJtOJa6-GH1YWdEQQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 f13-20020a0564021e8d00b00437a2acb543so3801093edf.7
 for <qemu-devel@nongnu.org>; Fri, 15 Jul 2022 10:02:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SqHD2jSkMZHjeytQ/TqEX/D3DTj0xNvKQH7hEQ64a0Q=;
 b=2+rHWnJ5/5vZwCCosODusac/S1jZahAIrCI0fce0YkfwtPJBk0Bvs496gzf0r/V2C0
 0AK2nnpg0J5sH7TUpKh1qZKzDJ6XSwsXHzdWnbe5cjte+bmKXGfy/6hBB/zzb/rBDFpo
 2GwEYxm/iApxJIEm9iTk4cI1+OGC7yGXomMiFCfya2Z5IsaEskS5MvMdzkfuwkNmy7/z
 2mr+GJzyFgVJAds9Kswu6ybEniRl8MyVV64a2JIWJPq/DVvc23Me3HqFFtlygkGzjeUb
 nj8AU/AOd2HNyAaH9q8pWF/NX7AqX/hh9nf8hsGITb2fvMl9hDdMIjuepT8qOn30pJnp
 eO2A==
X-Gm-Message-State: AJIora+8Iu5TteSrfwcIzYeBTBzj5pH7b4eDmOyQkRUsDeFKjfwB040d
 WMCiHDVywiQNLfcZBlF7GSdJHDkH164Y6DSM4UolEA1Lop1xBEaMfmN60f7+/GlhOBgYXPGwanA
 A8FF0+FGLu1NzVtxRTtJW+P8CW7rHryJh7ebbUHljiM1v/ZMBWByn1YHjck9Ny7g2YSg=
X-Received: by 2002:aa7:df83:0:b0:43a:4b96:f126 with SMTP id
 b3-20020aa7df83000000b0043a4b96f126mr20582483edy.309.1657904572820; 
 Fri, 15 Jul 2022 10:02:52 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tkBR304pxl0RHArG8qc9Jc/zNIOQMb5nZFowJ/IM72FqTX9y9oT+UfIAVWrOyWSEAOtkSbEw==
X-Received: by 2002:aa7:df83:0:b0:43a:4b96:f126 with SMTP id
 b3-20020aa7df83000000b0043a4b96f126mr20582459edy.309.1657904572595; 
 Fri, 15 Jul 2022 10:02:52 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 lc10-20020a170906f90a00b0070efa110afcsm2236098ejb.83.2022.07.15.10.02.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jul 2022 10:02:51 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: natto@weirdnatto.in
Subject: [PATCH 0/2] monitor, kvm: support for boolean statistics
Date: Fri, 15 Jul 2022 19:02:47 +0200
Message-Id: <20220715170249.404786-1-pbonzini@redhat.com>
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

Some statistics exported by KVM only ever have a 0 or 1 value, and Linux has
grown the ability to mark them as such.  Bring it over to the new statistics
subsystem of QEMU: they will be presented to QAPI clients as JSON booleans, and
in HMP as "yes"/"no".

(This was proposed in the context of the Libvirt query-stats GSoC project,
and support will be in Linux 5.19-rc7).

Paolo

Paolo Bonzini (2):
  monitor: add support for boolean statistics
  kvm: add support for boolean statistics

 accel/kvm/kvm-all.c       | 10 +++++++++-
 linux-headers/linux/kvm.h |  1 +
 monitor/hmp-cmds.c        |  2 ++
 qapi/stats.json           |  4 +++-
 4 files changed, 15 insertions(+), 2 deletions(-)

-- 
2.36.1


