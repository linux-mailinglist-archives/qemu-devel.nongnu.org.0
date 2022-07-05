Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9A55664E7
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 10:18:19 +0200 (CEST)
Received: from localhost ([::1]:42048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8dlC-0003g0-CJ
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 04:18:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o8daK-0000qE-SC
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 04:07:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36292)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o8daI-0008W1-Vl
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 04:07:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657008422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zqCyMRRu0ICOnRHyHLpKTlay1ixBP9NYye7bGrIhNvE=;
 b=Zp3M2sgVVkhZz9GFG6Off/AWQ4GbZn0Z8rToLgpyv1jeyeYmZqTo7E0VTkgU6s5chLIqVw
 6S//lrTSYIeMh5zbYSmRF/FDyL/T9t9uKLHBh2RfCh0sD+mYRiwP44cwPQUOk2IAwn3HJu
 JeMgT5yA13kExGTA1NlzB30u/33kLJM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-172-62oILPMWMw2ZY45pqQGAhw-1; Tue, 05 Jul 2022 04:07:00 -0400
X-MC-Unique: 62oILPMWMw2ZY45pqQGAhw-1
Received: by mail-wm1-f71.google.com with SMTP id
 o28-20020a05600c511c00b003a04f97f27aso6422713wms.9
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 01:07:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zqCyMRRu0ICOnRHyHLpKTlay1ixBP9NYye7bGrIhNvE=;
 b=n/b1da/WBUp4jrdMXMTKpjE0avNUnZfPqNMG5g2Npawip8ZURV57fv1pIF5WRVC53I
 5SvmQQ3JdXGVLAfeaL3g4FFXkMpPoJMp0DRQZON75xDVMqaBq50RPwqCBw7oZp717jEz
 o5a8xj+5r4k2XLQRzsgJ1W3BeOiMmrhjz3YaAa2otgKXDOP3wKw+488eykMU4KOgDMTq
 LzNRGKZwmAj7V/MsyJmFAhy3J0evCPYwHVy487ZghAnTS703BmQp/c0OMQdLNRUlFHXT
 9hGkCh7BmKGE+iKH6TuOyF8irn954WHldM9zMY3nDyB0bpUriOrRQ6A/Mx6/3nk17xL0
 EHpw==
X-Gm-Message-State: AJIora+3OR788lRnLvX8IAnx/JUoMPjZe3LjQxsSroQXeUKJdvulEWsA
 6Lo32vjjCpYAYB93J9/XBuvtIvHRaYt8oCeQjNDoQHZsPoMc4VdMq22xdRLdM6eBY5oLgI7hrqM
 jVZUbb0gfD2WVExw=
X-Received: by 2002:a05:6000:2a4:b0:21d:187c:c50 with SMTP id
 l4-20020a05600002a400b0021d187c0c50mr31687722wry.5.1657008419806; 
 Tue, 05 Jul 2022 01:06:59 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1se9loq3Bl6F2eF7XVN+Y7dgJ3/Ootkho1v1JDQsAyNRZD1j6CgGOjZqksCroGkue88+1RSlQ==
X-Received: by 2002:a05:6000:2a4:b0:21d:187c:c50 with SMTP id
 l4-20020a05600002a400b0021d187c0c50mr31687701wry.5.1657008419618; 
 Tue, 05 Jul 2022 01:06:59 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-21.web.vodafone.de.
 [109.43.176.21]) by smtp.gmail.com with ESMTPSA id
 q18-20020a5d5752000000b0021d6d18a9f8sm3876457wrw.76.2022.07.05.01.06.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jul 2022 01:06:59 -0700 (PDT)
Message-ID: <f1c2d5b1-ee5c-281b-acd4-71035f6753c9@redhat.com>
Date: Tue, 5 Jul 2022 10:06:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [RFC PATCH 5/5] tests: stop skipping migration test on s390x/ppc64
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Juan Quintela <quintela@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-s390x@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20220628105434.295905-1-berrange@redhat.com>
 <20220628105434.295905-6-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220628105434.295905-6-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 28/06/2022 12.54, Daniel P. Berrangé wrote:
> There have been checks put into the migration test which skip it in a
> few scenarios
> 
>   * ppc64 TCG
>   * ppc64 KVM with kvm-pr
>   * s390x TCG
> 
> In the original commits there are references to unexplained hangs in
> the test. There is no record of details of where it was hanging, but
> it is suspected that these were all a result of the max downtime limit
> being set at too low a value to guarantee convergance.
> 
> Since a previous commit bumped the value from 1 second to 30 seconds,
> it is believed that hangs due to non-convergance should be eliminated
> and thus worth trying to remove the skipped scenarios.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   tests/qtest/migration-test.c | 21 ---------------------
>   1 file changed, 21 deletions(-)

I just gave this a try, and it's failing on my x86 laptop with the ppc64 target:

/ppc64/migration/auto_converge: qemu-system-ppc64: warning: TCG doesn't 
support requested feature, cap-cfpc=workaround
qemu-system-ppc64: warning: TCG doesn't support requested feature, 
cap-sbbc=workaround
qemu-system-ppc64: warning: TCG doesn't support requested feature, 
cap-ibs=workaround
qemu-system-ppc64: warning: TCG doesn't support requested feature, 
cap-ccf-assist=on
qemu-system-ppc64: warning: TCG doesn't support requested feature, 
cap-cfpc=workaround
qemu-system-ppc64: warning: TCG doesn't support requested feature, 
cap-sbbc=workaround
qemu-system-ppc64: warning: TCG doesn't support requested feature, 
cap-ibs=workaround
qemu-system-ppc64: warning: TCG doesn't support requested feature, 
cap-ccf-assist=on
Memory content inconsistency at df6000 first_byte = 98 last_byte = 98 
current = 2 hit_edge = 0
Memory content inconsistency at 4e51000 first_byte = 98 last_byte = 97 
current = 96 hit_edge = 1
Memory content inconsistency at 4e52000 first_byte = 98 last_byte = 97 
current = 96 hit_edge = 1
Memory content inconsistency at 4e53000 first_byte = 98 last_byte = 97 
current = 96 hit_edge = 1
Memory content inconsistency at 4e54000 first_byte = 98 last_byte = 97 
current = 96 hit_edge = 1
Memory content inconsistency at 4e55000 first_byte = 98 last_byte = 97 
current = 96 hit_edge = 1
Memory content inconsistency at 4e56000 first_byte = 98 last_byte = 97 
current = 96 hit_edge = 1
Memory content inconsistency at 4e57000 first_byte = 98 last_byte = 97 
current = 96 hit_edge = 1
Memory content inconsistency at 4e58000 first_byte = 98 last_byte = 97 
current = 96 hit_edge = 1
Memory content inconsistency at 4e59000 first_byte = 98 last_byte = 97 
current = 96 hit_edge = 1
and in another 5542 pages**
ERROR:../../devel/qemu/tests/qtest/migration-test.c:280:check_guests_ram: 
assertion failed: (bad == 0)
Aborted (core dumped)

So I guess this workaround was about a different issue and we should drop 
this patch.

  Thomas


