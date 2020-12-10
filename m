Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4834A2D5C2F
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 14:47:13 +0100 (CET)
Received: from localhost ([::1]:57400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knMHo-00006r-9U
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 08:47:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1knLA6-0002F9-Rz
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 07:35:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1knLA4-0004pP-6t
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 07:35:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607603705;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yaiQnXlnDDNt4Ckq8Ey0nl2rvh4mUntkDuB6R3VVmqw=;
 b=fV0UUnysLNHL6a1Bj++FO0y0If8GlxEkXdzlIcEjn6F3AchZRo7CnedMhpdgeLPGxUbE7F
 Yyo6B/7TRrMeEumfOmRoJwi1j2gIV8bhiI1ygs7ezOuaRiyWDEQGzsXaPUDMOLAupJkFUc
 PIEkhZAez1ZRTuFBPQ+s3pNL6m3jOQI=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-478-kdBh5ZHcOgShV2TiZM9Kxg-1; Thu, 10 Dec 2020 07:35:02 -0500
X-MC-Unique: kdBh5ZHcOgShV2TiZM9Kxg-1
Received: by mail-ej1-f69.google.com with SMTP id f12so1557271ejk.2
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 04:35:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yaiQnXlnDDNt4Ckq8Ey0nl2rvh4mUntkDuB6R3VVmqw=;
 b=DjeklFETJENg0l3clWOQdBONDtJfr6J55/P0tCjOP6geyZ4yZcFrDC5zOrcPGV+jt7
 epeS2C7tMvJKus18Pk23XqUj3cyc49xlo8BVjGtfyBIyvXElS9Wf2UyLVG3g41nasxIC
 o9tTmdvsi0nMP3pcUaQxPKlZxX5ouCxPTElwfrrehx4sRUn77ZE8Dsjms+UK+RK1eijc
 j/jeDxRdDREk03zOTIgN5hjqbHLzmNec3IZ7GT87zOuqQn63R3fercOOcMAtzdcg+U8y
 gZzhOEU0twkKO/Q3VlRzfS5u6xrt1VdO8frUPGDPYcGxnO3YgtjhP0wL+cJzVO8DqB0+
 m+CQ==
X-Gm-Message-State: AOAM531CzrmjyiTXD6u6lFTuWgGDfE/mI3wMXJzZIxjkicMI3kT4SrWC
 ubN8ItmFb/fC04IITkwCjHAL1spKrub61ydNrLaQREQDwu3X6uBFWAHF8rmdROWG+2Ap6RjtEJB
 0+kSdoN47pyudkh8=
X-Received: by 2002:a17:906:4881:: with SMTP id
 v1mr5920408ejq.465.1607603701411; 
 Thu, 10 Dec 2020 04:35:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzf7jkNu0aBbod2ZnT3sUgeW8mUe4+ZKMEjctP2HsaSfcfqnFao9rssXKN+Jd7yVeVV7ISoYA==
X-Received: by 2002:a17:906:4881:: with SMTP id
 v1mr5920392ejq.465.1607603701151; 
 Thu, 10 Dec 2020 04:35:01 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id qt1sm9222ejb.115.2020.12.10.04.35.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Dec 2020 04:35:00 -0800 (PST)
Subject: Re: [PATCH 1/1] spapr.c: set a 'kvm-type' default value instead of
 relying on NULL
To: David Gibson <david@gibson.dropbear.id.au>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
References: <20201208134536.1012045-1-danielhb413@gmail.com>
 <20201208153309.78825861@bahia.lan>
 <d142b41a-69c2-77de-861e-e68c3c0459b4@gmail.com>
 <20201210033736.GK2555@yekko.fritz.box>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <ffee7463-13e9-0bd2-a3c3-c6239a861be8@redhat.com>
Date: Thu, 10 Dec 2020 13:34:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201210033736.GK2555@yekko.fritz.box>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To sum up everything:

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 2d5aeeb45a..61f0963916 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -3028,11 +3028,11 @@ static int spapr_kvm_type(MachineState *machine, 
const char *vm_type)
          return 0;
      }

-    if (!strcmp(vm_type, "HV")) {
+    if (!g_ascii_strcasecmp(vm_type, "hv")) {
          return 1;
      }

-    if (!strcmp(vm_type, "PR")) {
+    if (!g_ascii_strcasecmp(vm_type, "pr")) {
          return 2;
      }

@@ -3132,16 +3132,6 @@ static char *spapr_get_kvm_type(Object *obj, 
Error **errp)
  {
      SpaprMachineState *spapr = SPAPR_MACHINE(obj);

-    /*
-     * In case the user didn't set 'kvm-type', return DEFAULT_KVM_TYPE
-     * instead of NULL. This allows us to be more predictable with what
-     * is expected to happen in spapr_kvm_type(), since we can stop relying
-     * on receiving a 'NULL' parameter as a valid input there.
-     */
-    if (!spapr->kvm_type) {
-        return g_strdup(DEFAULT_KVM_TYPE);
-    }
-
      return g_strdup(spapr->kvm_type);
  }

@@ -3294,11 +3284,13 @@ static void spapr_instance_init(Object *obj)

      spapr->htab_fd = -1;
      spapr->use_hotplug_event_source = true;
+
+    spapr->kvm_type = g_strdup(DEFAULT_KVM_TYPE);
      object_property_add_str(obj, "kvm-type",
                              spapr_get_kvm_type, spapr_set_kvm_type);
      object_property_set_description(obj, "kvm-type",
-                                    "Specifies the KVM virtualization 
mode (HV, PR)."
-                                    " If not specified, defaults to any 
available KVM"
+                                    "Specifies the KVM virtualization 
mode (hv, pr, auto)."
+                                    " auto is the default and allows 
any available KVM"
                                      " module loaded in the host. In 
case both kvm_hv"
                                      " and kvm_pr are loaded, kvm_hv 
takes precedence.");


