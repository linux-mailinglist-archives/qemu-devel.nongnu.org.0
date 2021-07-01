Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A11E23B90A9
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 12:52:44 +0200 (CEST)
Received: from localhost ([::1]:37456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyuJH-0002LM-6N
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 06:52:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lyuHl-0001aN-J7
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 06:51:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lyuHj-0004OZ-JJ
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 06:51:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625136665;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0b10wturtNazHVZ0EmwGk4re9ZU9w+O9bCANbjVTNdc=;
 b=ha3ArFHGxclDYBiJA1Z25pN7WlUmPzKuWEJcVw/FovaQs4kN8NvL00s93vw1keneu1kisd
 aB3fXM6KcM3r0/TAFHZ7eMy3/D7TZV+JUw/KD6sB5WYl9bCjqwXrDhldcSKwU3hXWTDCXH
 2tIFPeTfj73Ef3v5oWj3xBxzAvZX9dY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-iHW1AD2pNeiuruIKcEcOVw-1; Thu, 01 Jul 2021 06:51:04 -0400
X-MC-Unique: iHW1AD2pNeiuruIKcEcOVw-1
Received: by mail-wr1-f69.google.com with SMTP id
 r2-20020a5d6c620000b029011a8a299a4dso2377475wrz.17
 for <qemu-devel@nongnu.org>; Thu, 01 Jul 2021 03:51:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0b10wturtNazHVZ0EmwGk4re9ZU9w+O9bCANbjVTNdc=;
 b=KN4ivsx4jFBmK3N6eLf3jStpqYcPX7dvhEKXFqiTtbzmcSrfyr9LYF4LNlvNzHZFJA
 wb/T2nZqfd2j8+5p6hzGOq2GeFu3gsiz97LIWmfTKmxVlMDco2KPGftqihlhJVxc8ftH
 xwDjwrWLfu4Zj4waKWFfeSleByRf+zlJ6VEn4K/YJVErVJFpRRW05TfO+JwsZB7QdUJo
 E3RetgHY911iU6/UshMhnIDGSDQHRDNKQhMe6WX0R9d34VtrSPOY2g+SS2yqxWwKThOs
 69PW9ziYavFiG9iyOiZNk4TaZ3I34UaI7zBt4OLyqGyglyFGmk+AyBkB67lksbugLaov
 VbIg==
X-Gm-Message-State: AOAM532vMl+w89d46xk4RzJvi4WShlsnxGM3Zfuh4+GD63GA+17U1GMf
 6YkSczT7jeEC9UsA3JDWRqyiNMJghnG5PcYizDx9owP0tfOynZhApfCVqVUEJWbhQcUM2QDgIYa
 wHN8bUD7gX+BJtlE=
X-Received: by 2002:a05:600c:26d1:: with SMTP id
 17mr19546103wmv.1.1625136663517; 
 Thu, 01 Jul 2021 03:51:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyuXn0Cgow0WL9h639xhLfg5KljljziPqrthAml9YVfyfS5lLLATRfJQe8bad74nG9yIbMhlQ==
X-Received: by 2002:a05:600c:26d1:: with SMTP id
 17mr19546068wmv.1.1625136663254; 
 Thu, 01 Jul 2021 03:51:03 -0700 (PDT)
Received: from thuth.remote.csb (pd9575bc6.dip0.t-ipconnect.de.
 [217.87.91.198])
 by smtp.gmail.com with ESMTPSA id c16sm4205930wru.24.2021.07.01.03.51.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Jul 2021 03:51:02 -0700 (PDT)
Subject: Re: [RFC v6 06/13] target/s390x: start moving TCG-only code to tcg/
To: "Cho, Yu-Chen" <acho@suse.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org
References: <20210629141931.4489-1-acho@suse.com>
 <20210629141931.4489-7-acho@suse.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <9595a82d-b4a2-8aa7-a733-939bba4e5f34@redhat.com>
Date: Thu, 1 Jul 2021 12:51:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210629141931.4489-7-acho@suse.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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
Cc: Cornelia Huck <cohuck@redhat.com>, cfontana@suse.com,
 David Hildenbrand <david@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 jose.ziviani@suse.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29/06/2021 16.19, Cho, Yu-Chen wrote:
> move everything related to translate, as well as HELPER code in tcg/
> 
> mmu_helper.c stays put for now, as it contains both TCG and KVM code.
> 
> The internal.h file is renamed to s390x-internal.h, because of the
> risk of collision with other files with the same name.

IMHO the renaming from internal.h to s390x-internal.h should be done in a 
separate patch, since it's not directly related to the movement of the other 
files.

[...]
> diff --git a/target/s390x/internal.h b/target/s390x/s390x-internal.h
> similarity index 98%
> rename from target/s390x/internal.h
> rename to target/s390x/s390x-internal.h
> index 9256275376..17edd4d13b 100644
> --- a/target/s390x/internal.h
> +++ b/target/s390x/s390x-internal.h
> @@ -240,6 +240,12 @@ uint32_t calc_cc(CPUS390XState *env, uint32_t cc_op, uint64_t src, uint64_t dst,
>   #ifndef CONFIG_USER_ONLY
>   unsigned int s390_cpu_halt(S390CPU *cpu);
>   void s390_cpu_unhalt(S390CPU *cpu);
> +void s390_cpu_init_sysemu(Object *obj);
> +bool s390_cpu_realize_sysemu(DeviceState *dev, Error **errp);
> +void s390_cpu_finalize(Object *obj);
> +void s390_cpu_class_init_sysemu(CPUClass *cc);
> +void s390_cpu_machine_reset_cb(void *opaque);

This hunk rather belongs into the next patch instead.

  Thomas


