Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DAA95FB16D
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 13:28:10 +0200 (CEST)
Received: from localhost ([::1]:43942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiDQe-00085s-S6
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 07:28:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiCV4-00036S-8a
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:28:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiCV2-0004js-L4
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:28:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665484116;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ye3ewl4aeYucCtQhLF/MRjPSh0R7ZVGDM5ummeQfq3c=;
 b=VzccYkVOGsxaqZSJexqqtjpQKpo6Gg4JWSjI/9P8X1pvmSIDjPDPF/nPcXS0iEdBgQFs+/
 oDpBPYWoHsbNA8DFauDPb7kf4hms9ptGEM2GOS01m6Kq21vkODHr+CHGZpA2dmiZ39JX4w
 Q2Pk1AYUEfauTBr0vn/cnZs6StdgydI=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-483-fWHYdA3RMHeubzJ_0ppuLg-1; Tue, 11 Oct 2022 06:28:34 -0400
X-MC-Unique: fWHYdA3RMHeubzJ_0ppuLg-1
Received: by mail-ed1-f69.google.com with SMTP id
 s17-20020a056402521100b0045bfaaab697so4639671edd.1
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 03:28:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ye3ewl4aeYucCtQhLF/MRjPSh0R7ZVGDM5ummeQfq3c=;
 b=jKi0xAxUZRlwwvkNQpv+WunQnFBHEvBxTHz3/GG2bfHgj5if+BsI6ulJZ6l0H2PDk7
 W6qJwkUw/hS89fNTvK8L/x3IRWsfUp6qRNf8r2Tb53B/qm95Fh/gvI9UphgY39ZDlKTc
 +BRGgvmTPPtSeuxjRkJxIpYOJ55ZCKvOkro3OPweWhlphK+ysvNxMe/wCGoZhsseY3Zk
 nmnIAmZU8HGCDpmiKDnTQcPBq1A9Gd+b7J0NxejhNBRPl3dKjV54bLRH+N87zssWvrbw
 DQBcDh2T1S3NGrIFy3CIGXAMZzKAUJgukqFtX8kMtgiZhcA19zR6HIR3l/W7/6WVIiXC
 rwVQ==
X-Gm-Message-State: ACrzQf2KxGKISWo33ymXchOtWuQ63QHt7nJaIxkuiNPAy2+JAochE6Jj
 lNthej/kV+VvdEYmyRgC/dbPjzkWXpwMLTWllciSLhV9NZQOVUujawkHzhneJvwycJPnq1rlFNU
 u9JsPnYEq7eXtXwT3p8AVqsvf5/9njNePuEKOPH4GJChqEndtopQfSY+toBFicPkM3tA=
X-Received: by 2002:a17:906:15ca:b0:78d:b7b3:2afa with SMTP id
 l10-20020a17090615ca00b0078db7b32afamr7399889ejd.69.1665484113315; 
 Tue, 11 Oct 2022 03:28:33 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5bEh2FFNsl+r5bsWf7bGhCy/esq98jEHQVALRgNT6bnAvXcBh2XSxHi4CpFoxHZ0yeMfp4MQ==
X-Received: by 2002:a17:906:15ca:b0:78d:b7b3:2afa with SMTP id
 l10-20020a17090615ca00b0078db7b32afamr7399873ejd.69.1665484113060; 
 Tue, 11 Oct 2022 03:28:33 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:aad8:f393:e009:e014])
 by smtp.gmail.com with ESMTPSA id
 f13-20020a056402160d00b0044657ecfbb5sm8803464edv.13.2022.10.11.03.28.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 03:28:32 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Alexander Graf <agraf@csgraf.de>
Subject: [PULL 32/37] x86: Implement MSR_CORE_THREAD_COUNT MSR
Date: Tue, 11 Oct 2022 12:26:55 +0200
Message-Id: <20221011102700.319178-33-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221011102700.319178-1-pbonzini@redhat.com>
References: <20221011102700.319178-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexander Graf <agraf@csgraf.de>

Intel CPUs starting with Haswell-E implement a new MSR called
MSR_CORE_THREAD_COUNT which exposes the number of threads and cores
inside of a package.

This MSR is used by XNU to populate internal data structures and not
implementing it prevents virtual machines with more than 1 vCPU from
booting if the emulated CPU generation is at least Haswell-E.

This patch propagates the existing hvf logic from patch 027ac0cb516
("target/i386/hvf: add rdmsr 35H MSR_CORE_THREAD_COUNT") to TCG.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
Message-Id: <20221004225643.65036-2-agraf@csgraf.de>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/sysemu/misc_helper.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/i386/tcg/sysemu/misc_helper.c b/target/i386/tcg/sysemu/misc_helper.c
index 1328aa656f..e1528b7f80 100644
--- a/target/i386/tcg/sysemu/misc_helper.c
+++ b/target/i386/tcg/sysemu/misc_helper.c
@@ -450,6 +450,11 @@ void helper_rdmsr(CPUX86State *env)
      case MSR_IA32_UCODE_REV:
         val = x86_cpu->ucode_rev;
         break;
+    case MSR_CORE_THREAD_COUNT: {
+        CPUState *cs = CPU(x86_cpu);
+        val = (cs->nr_threads * cs->nr_cores) | (cs->nr_cores << 16);
+        break;
+    }
     default:
         if ((uint32_t)env->regs[R_ECX] >= MSR_MC0_CTL
             && (uint32_t)env->regs[R_ECX] < MSR_MC0_CTL +
-- 
2.37.3


