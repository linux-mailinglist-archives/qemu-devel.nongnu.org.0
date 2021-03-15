Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6144D33BFAE
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 16:25:52 +0100 (CET)
Received: from localhost ([::1]:59488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLp6N-0002qP-EQ
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 11:25:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lLp4u-0001NF-EC
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 11:24:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lLp4s-0001Hj-1A
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 11:24:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615821856;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZSKQWrkO9RMPHwiJxjpMWIJS7tTd2U4kHcgyKaayea4=;
 b=HrOrvtI86oSzSyRjyowzScmetxT5tp0ijX+E7w8jHNZ2hA22mZyKlz6x4xLzXG+7eOSSIA
 IfH3gVMTmHRruPZiO0jm25pvyHPThv2zeri4MyQDBkh4MPFgsGh11F3aM5R3t+ArimqXtG
 kXVu7pDlcBJ60AdQQXFKw2bInR1iAxA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-6-uyQo4a6IOZSEIfyn8L42Jw-1; Mon, 15 Mar 2021 11:24:15 -0400
X-MC-Unique: uyQo4a6IOZSEIfyn8L42Jw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 35C7781746F
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 15:24:14 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-72.ams2.redhat.com [10.36.112.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5AE065D745;
 Mon, 15 Mar 2021 15:24:13 +0000 (UTC)
Subject: Re: [RFC PATCH] configure: Poison (almost) all target-specific
 #defines
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210315135410.221729-1-thuth@redhat.com>
 <5f8be2a7-5baf-7cdc-42a1-954ea3aeba82@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <9a6fd794-8ac5-a054-7bf5-b485d57fb1a3@redhat.com>
Date: Mon, 15 Mar 2021 16:24:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <5f8be2a7-5baf-7cdc-42a1-954ea3aeba82@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/03/2021 15.52, Philippe Mathieu-Daudé wrote:
> On 3/15/21 2:54 PM, Thomas Huth wrote:
>> We are generating a lot of target-specific defines in the *-config-devices.h
>> and *-config-target.h files. Using them in common code is wrong and leads
>> to very subtle bugs since a "#ifdef CONFIG_SOMETHING" is not working there
>> as expected. To avoid these issues, we are already poisoning some of the
>> macros in include/exec/poison.h - but maintaining this list manually is
>> cumbersome. Thus let's generate the list of poisoned macros automatically
>> instead.
>> Note that CONFIG_TCG (which is also defined in config-host.h) and
> 
> IIRC we can't poison CONFIG_XEN / CONFIG_HAX because they are
> pulled in via "sysemu/hw_accel.h".

That's a good hint ... but I think it can be fixed with a patch like this:

diff a/include/sysemu/hw_accel.h b/include/sysemu/hw_accel.h
--- a/include/sysemu/hw_accel.h
+++ b/include/sysemu/hw_accel.h
@@ -12,19 +12,24 @@
  #define QEMU_HW_ACCEL_H

  #include "hw/core/cpu.h"
+
+#ifdef NEED_CPU_H
+
  #include "sysemu/hax.h"
  #include "sysemu/kvm.h"
  #include "sysemu/hvf.h"
  #include "sysemu/whpx.h"

-void cpu_synchronize_state(CPUState *cpu);
-void cpu_synchronize_post_reset(CPUState *cpu);
-void cpu_synchronize_post_init(CPUState *cpu);
-void cpu_synchronize_pre_loadvm(CPUState *cpu);
-
  static inline bool cpu_check_are_resettable(void)
  {
      return kvm_enabled() ? kvm_cpu_check_are_resettable() : true;
  }

+#endif
+
+void cpu_synchronize_state(CPUState *cpu);
+void cpu_synchronize_post_reset(CPUState *cpu);
+void cpu_synchronize_post_init(CPUState *cpu);
+void cpu_synchronize_pre_loadvm(CPUState *cpu);
+
  #endif /* QEMU_HW_ACCEL_H */

  Thomas


