Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB83331F8A0
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 12:50:52 +0100 (CET)
Received: from localhost ([::1]:51782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD4J9-0001Pq-Pq
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 06:50:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lD4Dn-0003Hd-08
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 06:45:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lD4Dk-0002CV-4a
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 06:45:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613735115;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YJlwy/QOkf0QIlTzPZ6przivK3+kqukDr5TR8oal+wM=;
 b=dJVP5+S1tMVic0IRKW2XmEswBeQV8YIS+t1d3w+xxw75aN4BbJft5z8j8elVX8zlG4mtrd
 Hxf3OlSMIAAt/ID4rqLcfJ5RVBSqodb3LTI7giRjJUA7Wx6XtpUk/s4cW6n636kO983pzl
 KnNPLkMRPtJaobU1I3E+gpVgVo19sz8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61-wiawy9e3OhKB6rua8u2G3Q-1; Fri, 19 Feb 2021 06:45:13 -0500
X-MC-Unique: wiawy9e3OhKB6rua8u2G3Q-1
Received: by mail-wr1-f70.google.com with SMTP id q5so2313315wrs.20
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 03:45:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YJlwy/QOkf0QIlTzPZ6przivK3+kqukDr5TR8oal+wM=;
 b=LR1DbNF8b7QfZlWteydGL4Lij/N7pVNBy4YySf5kkYHB9z1ZyMkt7QOb6Mmr3N70xn
 kbyeMntvbdpzNku/xB45qTakSddSjMJJs9AGIC6t1bLauyEpDSCJ/SKsIUnl3WYc1NG9
 ParV/leDfGdc77ZRYatibqCloPqE4wc3oBszGiIx1JbeK+9K3Bjk/UphjUkm1N+6H9Ai
 dhrAXsEYNF9OVQMTBu1fPrCswwKgGuzSsV0/Riuqg14r+Ki+7nJiDlp9rFnO7apeE3q+
 n2+/qTXNrDfhuRkkoUEXHqgjEnaGxsiIWce5w3RpPd2ElZkR/yCeKhb4ikC1Ih5aihJB
 lWsw==
X-Gm-Message-State: AOAM530dlW7aCB5VbZNyvpCkeTMoYMfjF9quZ7y0GiMYva0hTAxI1g8D
 QN1xW6xx7xrefldTYjZeDz6FrnJJrnfLcidR653GnBxOueuf4TI/VW+Ja2muvIUvI/flTFGqlRi
 /knNntyYTq2Y3/CH7sIFakitdbUAGuXxHmgiDoKHTXXUU18P9CiNibyJ1h6ogMKwm
X-Received: by 2002:adf:bbca:: with SMTP id z10mr8877285wrg.168.1613735112200; 
 Fri, 19 Feb 2021 03:45:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxZHhoZ2Wy0Wkb5v1FsmoSovOJoQjV0ghbc4hAJ/cIFmfZspDESkeyO+OZmJZh6DupK3/KHUQ==
X-Received: by 2002:adf:bbca:: with SMTP id z10mr8877239wrg.168.1613735111985; 
 Fri, 19 Feb 2021 03:45:11 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id z17sm15710920wrv.9.2021.02.19.03.45.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 03:45:11 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 7/7] accel/kvm: Exit gracefully when KVM is not supported
Date: Fri, 19 Feb 2021 12:44:28 +0100
Message-Id: <20210219114428.1936109-8-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210219114428.1936109-1-philmd@redhat.com>
References: <20210219114428.1936109-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>, kvm@vger.kernel.org,
 David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Thomas Huth <thuth@redhat.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Huacai Chen <chenhuacai@kernel.org>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Leif Lindholm <leif@nuviainc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>, Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that we added the 'kvm_supported' field to MachineClass
and all our machines able to use KVM have this field set,
we can check it in kvm_init() and exit gracefully with
a friendly error message.

Before:

  $ qemu-system-aarch64 -M raspi3b -enable-kvm
  qemu-system-aarch64: /build/qemu-ETIdrs/qemu-4.2/exec.c:865: cpu_address_space_init: Assertion `asidx == 0 || !kvm_enabled()' failed.
  Aborted

  $ qemu-system-aarch64 -M xlnx-zcu102 -enable-kvm -smp 6
  qemu-system-aarch64: kvm_init_vcpu: kvm_arch_init_vcpu failed (0): Invalid argument

After:

  $ qemu-system-aarch64 -M raspi3b -enable-kvm
  Machine 'raspi3b' does not support KVM

  $ qemu-system-aarch64 -M xlnx-zcu102 -enable-kvm -smp 6
  Machine 'xlnx-zcu102' does not support KVM

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 accel/kvm/kvm-all.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index b069938d881..8a8d3f64248 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -2001,6 +2001,12 @@ static int kvm_init(MachineState *ms)
 
     s = KVM_STATE(ms->accelerator);
 
+    if (!mc->kvm_supported) {
+        ret = -EINVAL;
+        fprintf(stderr, "Machine '%s' does not support KVM\n", mc->name);
+        exit(1);
+    }
+
     /*
      * On systems where the kernel can support different base page
      * sizes, host page size may be different from TARGET_PAGE_SIZE,
-- 
2.26.2


