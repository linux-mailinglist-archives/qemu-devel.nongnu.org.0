Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4883044B275
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 19:07:28 +0100 (CET)
Received: from localhost ([::1]:36838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkVWp-0007yP-47
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 13:07:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mkVTd-0005nk-Ah
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 13:04:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mkVTb-0002d5-Kz
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 13:04:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636481047;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RFJ7le1IU7tWQfNPBynK0GPugih5EJpV4mUHZFiyqsM=;
 b=GlmmcmfsMc+kpZ2Zrp8d+D/NWV52gKmAhWJucc1Mw+CeQlSGzvRoOgpTzeTXkYHd9n/a4u
 z74B6MPZLITyhA9nQD+cl9XRSBg8NkSuNB829sgQQegIkhcWkT7SSuGC1Uyc9xIc1ia79E
 Zj2EnzebHUB8GieiHJRQ9gZK1gBsr/Q=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-137-MpOs72-DN7yNaIUTJgOlZQ-1; Tue, 09 Nov 2021 13:04:05 -0500
X-MC-Unique: MpOs72-DN7yNaIUTJgOlZQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 o15-20020a056402438f00b003e32b274b24so8146114edc.21
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 10:04:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RFJ7le1IU7tWQfNPBynK0GPugih5EJpV4mUHZFiyqsM=;
 b=3vVcWwNg+BLJsI+PFUrxVaLpQjQndLD2aWrFPdIkVxH5i2cgkfvOx2/Aw76kxpZrkZ
 O65v+o5ckbg4KYR4e9VXof8pnKO8l4QagcmZ6tZfyzLEQ/rQyUZTXoCe0HzHN0oM+Vzd
 JHTuccXAwC7VpqV0g2hBn4XaSPE5yjgYqR7aN5u8vGrFVp7H6kHWKk089yNHrqkmDYt7
 NCCYjy09qpx5jjxN1y72t1anfVsi6z5HpnBl0qLwFfMoB0wAPesjwlOnd+J8lmPWvkJL
 L6JtSlV63b4O63WE37MkzzihQ+LHT57DkBuPNKGkV6Sdw0/6BePSutZsGuUM/hwLQmKs
 FLvw==
X-Gm-Message-State: AOAM533g66GtlCzlFiGJeg0nRQxmFV19+3gVitd5VOPXHebZkzrX4cBD
 OMzonsSnWDrrBO+1cFGP7m1ahKTDmGlnHjLwmgKSK50rHlk8S55qZDFAVt4Hwr2YAxYnbbtei/V
 OXyWbvlQMfTuvmfw=
X-Received: by 2002:a17:906:2f97:: with SMTP id
 w23mr12115316eji.31.1636481044661; 
 Tue, 09 Nov 2021 10:04:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx5zMIeK5Upzi8vxmLGQS7vMiI9OGtxkWXi1zLzN6y9Pw7cymxbg54Go2UNzJ/q9IImUUzNDg==
X-Received: by 2002:a17:906:2f97:: with SMTP id
 w23mr12115276eji.31.1636481044383; 
 Tue, 09 Nov 2021 10:04:04 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id g21sm11614103edw.86.2021.11.09.10.04.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Nov 2021 10:04:03 -0800 (PST)
Message-ID: <86f1fea3-9fc4-b61b-ff0e-4cf5e7374675@redhat.com>
Date: Tue, 9 Nov 2021 19:03:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3 2/2] accel/tcg: Register a force_rcu notifier
To: Greg Kurz <groug@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20211108113353.133462-1-groug@kaod.org>
 <20211108113353.133462-3-groug@kaod.org>
 <5892d9dd-5f0c-d745-6a0a-84485e0e29c3@linaro.org>
 <8a184041-39ad-1207-f32b-673e2b8da0f2@linaro.org>
 <20211109182407.75f623f8@bahia>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211109182407.75f623f8@bahia>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.364, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-stable@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/9/21 18:24, Greg Kurz wrote:> Anyway, it seems more explicit to use rr_current_cpu.
> 
>> Alternately, no async_run_on_cpu at all, just rr_kick_next_cpu().
>>
> 
> Heh, this looks even better ! I'll try this right away.

Once you've tested it I can queue the series with just a

--- a/accel/tcg/tcg-accel-ops-rr.c
+++ b/accel/tcg/tcg-accel-ops-rr.c
@@ -141,10 +141,10 @@ static void do_nothing(CPUState *cpu, run_on_cpu_data d)
  static void rr_force_rcu(Notifier *notify, void *data)
  {
      /*
-     * Called with rcu_registry_lock held, using async_run_on_cpu() ensures
-     * that there are no deadlocks.
+     * Called with rcu_registry_lock held.  rr_kick_next_cpu() is
+     * asynchronous, so there cannot be deadlocks.
       */
-    async_run_on_cpu(first_cpu, do_nothing, RUN_ON_CPU_NULL);
+    rr_kick_next_cpu();
  }
  
  /*

squashed in.

Paolo


