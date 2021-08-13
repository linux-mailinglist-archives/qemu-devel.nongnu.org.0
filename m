Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A298F3EB489
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Aug 2021 13:28:14 +0200 (CEST)
Received: from localhost ([::1]:48528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEVMD-0005hb-MR
	for lists+qemu-devel@lfdr.de; Fri, 13 Aug 2021 07:28:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mEVKU-0002ux-FZ
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 07:26:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58123)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mEVKS-0004Z1-SJ
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 07:26:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628853982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8+x5cDRqGYYB882mrXq6yDCo4MYAmB6tqQmNrQFCSL8=;
 b=UwIgCIBKEM0DmuttF287kVQE6rLYqandzwd07n6iC8j9I93I8ibuT6w2CLRu4/gajGy/SP
 6knkWBInVmHjLQ//HZdxMtuwSoIHrEWNG2a8mab1txVSem9+sELFNDlNZBIaDr6loaJ8YZ
 +6cFTX2TU23mSON4nOFVErLQjMwiRBI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-518-1XTo2PoJPqK6V87HRg7RZg-1; Fri, 13 Aug 2021 07:26:21 -0400
X-MC-Unique: 1XTo2PoJPqK6V87HRg7RZg-1
Received: by mail-wm1-f72.google.com with SMTP id
 u15-20020a05600c210fb02902e6a5231792so1836821wml.0
 for <qemu-devel@nongnu.org>; Fri, 13 Aug 2021 04:26:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8+x5cDRqGYYB882mrXq6yDCo4MYAmB6tqQmNrQFCSL8=;
 b=c2U4pyODDcjc6m2k/Gq3+UWcfsXDECjgOey87w01ZEKJ9ShEHc+6WS1c4H6IM5FcMb
 IgDbpKOMlyF2Y67oUOk5s6zO2uzbNKDSZt7D27qpOeUg+e21Z07pc3dfEhj12tNUifFT
 l3H5z0xJDa9B67ALqGqyUhB0qDwKrLL2KAcsRPwTE4Zcu91ledwvJnPereMFN4rIougu
 bYWgf9CYnh9DoUJSDR2zq5GoFc8ps4e7ICOMxFI7SWKn+hBEAD6neHAzgWJOQ4a+kUbZ
 BQc6LpG/GHRcSFLi/0xEzNWLmB3U+hte1h5SqNh0hWnJD29gc353vE19n8JD1kAW/q2+
 sgAQ==
X-Gm-Message-State: AOAM530uDEZcb2E3rWbdrtVYjyoBmIALn59k/5lB+7cgqnZKEj13Ft6r
 36yRPWdHOZcTaezLxx46CkfhbDxwm5llyv4u25FzabpfbUu2roPoaEMO1jKDw50XFgzLhD62HgH
 zvdCj8jpI29Tb/EncvwpdbOogT9SxjUu5AI6CpLo+ef6mA0l5pQtBbbhNpr/89tz4
X-Received: by 2002:a1c:9dcc:: with SMTP id g195mr1526613wme.125.1628853979676; 
 Fri, 13 Aug 2021 04:26:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzDieBdnjSLfVD6+rvO2WxiF+dQr521Rd88x9WgAXxzR0U5ksNcWHB0I7Qc1unECLaCzK3+hg==
X-Received: by 2002:a1c:9dcc:: with SMTP id g195mr1526579wme.125.1628853979358; 
 Fri, 13 Aug 2021 04:26:19 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 d8sm209710wrx.12.2021.08.13.04.26.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Aug 2021 04:26:18 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.1? v2 2/3] hw/core: Have MachineClass::smp_parse()
 return boolean on error
Date: Fri, 13 Aug 2021 13:26:07 +0200
Message-Id: <20210813112608.1452541-3-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210813112608.1452541-1-philmd@redhat.com>
References: <20210813112608.1452541-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Just for consistency, following the example documented since
commit e3fe3988d7 ("error: Document Error API usage rules"),
return a boolean value indicating an error is set or not.
Directly pass errp as the local_err is not requested in our
case.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/boards.h |  2 +-
 hw/core/machine.c   | 12 +++++++-----
 hw/i386/pc.c        | 10 ++++++----
 3 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index accd6eff35a..d5b7058c2e2 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -209,7 +209,7 @@ struct MachineClass {
     void (*reset)(MachineState *state);
     void (*wakeup)(MachineState *state);
     int (*kvm_type)(MachineState *machine, const char *arg);
-    void (*smp_parse)(MachineState *ms, SMPConfiguration *config, Error **errp);
+    bool (*smp_parse)(MachineState *ms, SMPConfiguration *config, Error **errp);
 
     BlockInterfaceType block_default_type;
     int units_per_default_bus;
diff --git a/hw/core/machine.c b/hw/core/machine.c
index abaeda589b7..159c6b098e2 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -743,7 +743,7 @@ void machine_set_cpu_numa_node(MachineState *machine,
     }
 }
 
-static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
+static bool smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
 {
     unsigned cpus    = config->has_cpus ? config->cpus : 0;
     unsigned sockets = config->has_sockets ? config->sockets : 0;
@@ -752,7 +752,7 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
 
     if (config->has_dies && config->dies != 0 && config->dies != 1) {
         error_setg(errp, "dies not supported by this machine's CPU topology");
-        return;
+        return true;
     }
 
     /* compute missing values, prefer sockets over cores over threads */
@@ -778,14 +778,14 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
                    "sockets (%u) * cores (%u) * threads (%u) < "
                    "smp_cpus (%u)",
                    sockets, cores, threads, cpus);
-        return;
+        return true;
     }
 
     ms->smp.max_cpus = config->has_maxcpus ? config->maxcpus : cpus;
 
     if (ms->smp.max_cpus < cpus) {
         error_setg(errp, "maxcpus must be equal to or greater than smp");
-        return;
+        return true;
     }
 
     if (sockets * cores * threads != ms->smp.max_cpus) {
@@ -794,13 +794,15 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
                    "!= maxcpus (%u)",
                    sockets, cores, threads,
                    ms->smp.max_cpus);
-        return;
+        return true;
     }
 
     ms->smp.cpus = cpus;
     ms->smp.cores = cores;
     ms->smp.threads = threads;
     ms->smp.sockets = sockets;
+
+    return false;
 }
 
 static void machine_get_smp(Object *obj, Visitor *v, const char *name,
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index c2b9d62a358..84138a8bfd2 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -712,7 +712,7 @@ void pc_acpi_smi_interrupt(void *opaque, int irq, int level)
  * This function is very similar to smp_parse()
  * in hw/core/machine.c but includes CPU die support.
  */
-static void pc_smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
+static bool pc_smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
 {
     unsigned cpus    = config->has_cpus ? config->cpus : 0;
     unsigned sockets = config->has_sockets ? config->sockets : 0;
@@ -743,14 +743,14 @@ static void pc_smp_parse(MachineState *ms, SMPConfiguration *config, Error **err
                    "sockets (%u) * dies (%u) * cores (%u) * threads (%u) < "
                    "smp_cpus (%u)",
                    sockets, dies, cores, threads, cpus);
-        return;
+        return true;
     }
 
     ms->smp.max_cpus = config->has_maxcpus ? config->maxcpus : cpus;
 
     if (ms->smp.max_cpus < cpus) {
         error_setg(errp, "maxcpus must be equal to or greater than smp");
-        return;
+        return true;
     }
 
     if (sockets * dies * cores * threads != ms->smp.max_cpus) {
@@ -759,7 +759,7 @@ static void pc_smp_parse(MachineState *ms, SMPConfiguration *config, Error **err
                    "!= maxcpus (%u)",
                    sockets, dies, cores, threads,
                    ms->smp.max_cpus);
-        return;
+        return true;
     }
 
     ms->smp.cpus = cpus;
@@ -767,6 +767,8 @@ static void pc_smp_parse(MachineState *ms, SMPConfiguration *config, Error **err
     ms->smp.threads = threads;
     ms->smp.sockets = sockets;
     ms->smp.dies = dies;
+
+    return false;
 }
 
 static
-- 
2.31.1


