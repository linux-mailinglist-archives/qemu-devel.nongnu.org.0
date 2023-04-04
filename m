Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9982D6D6305
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 15:34:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjgmI-0006jo-6e; Tue, 04 Apr 2023 09:32:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pjgmG-0006jb-EK
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 09:32:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pjgmE-00051N-HD
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 09:32:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680615163;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aXuzuKafnuae/3oN96eGYCmt+IVkAU8BLv/eG+Hs+DA=;
 b=PjclNnAGMy7od+AUdl8QoOquUrXqozZ4xB1Vz0ZhO3ZXln1P6271/kfN2P2krlW6ngsYio
 KGa8ljAHJGn3fH4eeem6kkHGdpVuTuZxG11jmCaVQTlsxZWzbLwUvngLQf2LVSGNAFBbQJ
 HK3fPIyCN/n3zAWwZZWSOFgKiv+PoOo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-67-1vk4oSPmOUWquKxTubmhng-1; Tue, 04 Apr 2023 09:32:42 -0400
X-MC-Unique: 1vk4oSPmOUWquKxTubmhng-1
Received: by mail-wm1-f72.google.com with SMTP id
 m21-20020a05600c3b1500b003f05f614318so752627wms.0
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 06:32:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680615161; x=1683207161;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aXuzuKafnuae/3oN96eGYCmt+IVkAU8BLv/eG+Hs+DA=;
 b=lyLoEwbDL/dfHDZSE4YZXjl/Ikl12cS84XLs1L5191cXwsYug2f0ruPtvI6ChDJWxE
 9d6etc6MkoavoHLpjzb2HCcFpsqR8zBtNeav+746O4UuigSEMnyf0FoyOVIoGE94130D
 k08Kaeq7pC/a6oBAVEJT7ZpGbOhTs9Xkh46XNOInDl9bi889vdauPphjiCN/Fy442Z3O
 uXbxl925KtqrbPmFQ73Df58kxZ+kHhve6SQpnra3tNKx93mmJ0yzKUBZdcphE0m7JGQF
 R1mpIE35PHk9W0KmDkgccNvcHyVhNJgnvwgpjZtcOdPks8//X5h4q76QoNPel0QTMNlT
 bB5w==
X-Gm-Message-State: AAQBX9dEHxww3qqKtvdg5sI3tevURIsonWR0w9EMqO78soXVS0KZuy+u
 fWJCmeY05ghjr/+etgFu11UN567/SfUdJBPUAqWPpi9o8BUbFA3XBQv8aeQhyEOeeQMYuMV+5/x
 UQH5Rbz7YuEtwZKQ=
X-Received: by 2002:adf:fdd0:0:b0:2ce:a862:551 with SMTP id
 i16-20020adffdd0000000b002cea8620551mr1802063wrs.58.1680615160919; 
 Tue, 04 Apr 2023 06:32:40 -0700 (PDT)
X-Google-Smtp-Source: AKy350b9ezXtaF3F+WyTePLsHdOj9YOOfp/IPp00uI96RhHll0j67NbpGUy4HgUWMrsVy5Qdouw1xw==
X-Received: by 2002:adf:fdd0:0:b0:2ce:a862:551 with SMTP id
 i16-20020adffdd0000000b002cea8620551mr1802038wrs.58.1680615160581; 
 Tue, 04 Apr 2023 06:32:40 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 h13-20020a1709066d8d00b009475bd8f441sm5996212ejt.60.2023.04.04.06.32.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Apr 2023 06:32:39 -0700 (PDT)
Message-ID: <3c9e06ce-3166-f7c4-cb56-6df123c145a2@redhat.com>
Date: Tue, 4 Apr 2023 15:32:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 03/10] kvm: dirty-ring: Fix race with vcpu creation
Content-Language: en-US
To: huangy81@chinatelecom.cn, qemu-devel <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eric Blake <eblake@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <cover.1676563222.git.huangy81@chinatelecom.cn>
 <1d14deb6684bcb7de1c9633c5bd21113988cc698.1676563222.git.huangy81@chinatelecom.cn>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <1d14deb6684bcb7de1c9633c5bd21113988cc698.1676563222.git.huangy81@chinatelecom.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.925, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2/16/23 17:18, huangy81@chinatelecom.cn wrote:
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index 9b26582655..47483cdfa0 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -685,6 +685,15 @@ static uint32_t kvm_dirty_ring_reap_one(KVMState *s, CPUState *cpu)
>       uint32_t ring_size = s->kvm_dirty_ring_size;
>       uint32_t count = 0, fetch = cpu->kvm_fetch_index;
>   
> +    /*
> +     * It's possible that we race with vcpu creation code where the vcpu is
> +     * put onto the vcpus list but not yet initialized the dirty ring
> +     * structures.  If so, skip it.
> +     */
> +    if (!cpu->created) {
> +        return 0;
> +    }
> +

Is there a lock that protects cpu->created?

If you don't want to use a lock you need to use qatomic_load_acquire
together with

diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index fed20ffb5dd2..15b64e7f4592 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -525,7 +525,7 @@ void qemu_cond_timedwait_iothread(QemuCond *cond, int ms)
  /* signal CPU creation */
  void cpu_thread_signal_created(CPUState *cpu)
  {
-    cpu->created = true;
+    qatomic_store_release(&cpu->created, true);
      qemu_cond_signal(&qemu_cpu_cond);
  }
  

Paolo


