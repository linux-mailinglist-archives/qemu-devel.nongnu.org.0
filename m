Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B025328A4
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 13:18:30 +0200 (CEST)
Received: from localhost ([::1]:46310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntSYS-0007K6-S4
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 07:18:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ntSFw-0004CT-QO
 for qemu-devel@nongnu.org; Tue, 24 May 2022 06:59:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24166)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ntSFu-0002iZ-AQ
 for qemu-devel@nongnu.org; Tue, 24 May 2022 06:59:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653389953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iNIHolXOtba/KfroUvm6+nuHO3iQXM82ADLznV2LFSw=;
 b=YI1Oz5NFqR2b7lEBmOzbJvc2n7nkCyE5aZdiJWrvSC8IhHT33EqkZduW2AyzzC0Uq7/IkA
 rbMn+Va/tttHL1umS2fXSZYqyXZXRTEtbbxmyiv34DdaHkLGBIUg7hilGhnTMWdyBp07Dl
 4+9P6QpdIcGHCJ8nLYZZcpv23ZnfzFg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-618-f0PMH7t7MKKZPRFX_YImkw-1; Tue, 24 May 2022 06:59:12 -0400
X-MC-Unique: f0PMH7t7MKKZPRFX_YImkw-1
Received: by mail-wr1-f71.google.com with SMTP id
 s18-20020a5d6a92000000b0020ffa2781beso92581wru.20
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 03:59:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=iNIHolXOtba/KfroUvm6+nuHO3iQXM82ADLznV2LFSw=;
 b=oNl8d2F/9o0maFkwt6yXOWjcWnCkk5fZl5E/qrlIgThm4HItCAh0jhHro41IwXt7N9
 /htdInMiM+PvKD8nQU/1D7egA7ubDYyGP777KRxyhGpTr6i0ArRjXb1eLzHIfgwfIiSc
 K/RvrhbDlbrz7lYZF2WM+BlnD7LSKA9s5hHVV6eHCsG7z/wRQQuScolG51nfRSeYE10y
 k5S4oDtO/x8USI1CInn6ulpw9WVZJlVaBtosmVfA0na4yoP4Ywd/CrIBdgyrQBCW+CCg
 iPXPHAKIjEiAGLz6mJ6AWDZmjnm0gYEKVljQ+bSqrjzmV2j7FtbqlcvpOsVW1YhYPi7W
 EkPQ==
X-Gm-Message-State: AOAM532pVFRFz6Qcv0t+do1efEfQlpbJ1KNgJH6apEc53auDoSqhKxso
 8cDh+g84DruB+k+C01WIiJmxplbwa45KiyCMvKFipafoI+c5ScmY2BMPYuA9xDhT+f0vxJUKRu4
 /EBw2T+DILY/Sbzg=
X-Received: by 2002:a1c:f207:0:b0:397:450f:f247 with SMTP id
 s7-20020a1cf207000000b00397450ff247mr3285621wmc.145.1653389950916; 
 Tue, 24 May 2022 03:59:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw9ey+Wqex4qtAgv2ZF8qzeJqk1XGx+dUVsSADF4mHmLgu5sfKwPjaFxIOECu+x1Qg4oYdiWA==
X-Received: by 2002:a1c:f207:0:b0:397:450f:f247 with SMTP id
 s7-20020a1cf207000000b00397450ff247mr3285587wmc.145.1653389950662; 
 Tue, 24 May 2022 03:59:10 -0700 (PDT)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 v2-20020adfc5c2000000b0020fcd1704a4sm8734363wrg.61.2022.05.24.03.59.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 May 2022 03:59:09 -0700 (PDT)
Message-ID: <6e426ed7-d3a6-2ae8-badc-80fc7a31c3ea@redhat.com>
Date: Tue, 24 May 2022 12:59:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, cohuck@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, philmd@redhat.com,
 eblake@redhat.com, armbru@redhat.com, seiden@linux.ibm.com,
 nrb@linux.ibm.com, frankja@linux.ibm.com
References: <20220420115745.13696-1-pmorel@linux.ibm.com>
 <20220420115745.13696-5-pmorel@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v7 04/13] s390x: topology: implementating Store Topology
 System Information
In-Reply-To: <20220420115745.13696-5-pmorel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On 20/04/2022 13.57, Pierre Morel wrote:
> The handling of STSI is enhanced with the interception of the
> function code 15 for storing CPU topology.
> 
> Using the objects built during the pluging of CPU, we build the

s/pluging/plugging/

> SYSIB 15_1_x structures.
> 
> With this patch the maximum MNEST level is 2, this is also
> the only level allowed and only SYSIB 15_1_2 will be built.
> 
> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> ---
...
> diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
> index f6969b76c5..a617c943ff 100644
> --- a/target/s390x/cpu.h
> +++ b/target/s390x/cpu.h
> @@ -889,4 +889,5 @@ S390CPU *s390_cpu_addr2state(uint16_t cpu_addr);
>   
>   #include "exec/cpu-all.h"
>   
> +void insert_stsi_15_1_x(S390CPU *cpu, int sel2, __u64 addr, uint8_t ar);
>   #endif

Please keep an empty line before the #endif

> diff --git a/target/s390x/cpu_topology.c b/target/s390x/cpu_topology.c
> new file mode 100644
> index 0000000000..7f6db18829
> --- /dev/null
> +++ b/target/s390x/cpu_topology.c
> @@ -0,0 +1,112 @@
> +/*
> + * QEMU S390x CPU Topology
> + *
> + * Copyright IBM Corp. 2021

2022 ?

> + * Author(s): Pierre Morel <pmorel@linux.ibm.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or (at
> + * your option) any later version. See the COPYING file in the top-level
> + * directory.
> + */
...
> +void insert_stsi_15_1_x(S390CPU *cpu, int sel2, __u64 addr, uint8_t ar)
> +{
> +    const MachineState *machine = MACHINE(qdev_get_machine());
> +    void *p;
> +    int ret, cc;
> +
> +    /*
> +     * Until the SCLP STSI Facility reporting the MNEST value is used,
> +     * a sel2 value of 2 is the only value allowed in STSI 15.1.x.
> +     */
> +    if (sel2 != 2) {
> +        setcc(cpu, 3);
> +        return;
> +    }
> +
> +    p = g_malloc0(TARGET_PAGE_SIZE);
> +
> +    setup_stsi(machine, p, 2);
> +
> +    if (s390_is_pv()) {
> +        ret = s390_cpu_pv_mem_write(cpu, 0, p, TARGET_PAGE_SIZE);
> +    } else {
> +        ret = s390_cpu_virt_mem_write(cpu, addr, ar, p, TARGET_PAGE_SIZE);
> +    }
> +    cc = ret ? 3 : 0;
> +    setcc(cpu, cc);

Just a matter of taste (i.e. keep it if you like) - but you could scratch 
the cc variable in this function by just doing:

     setcc(cpu, ret ? 3 : 0);

> +    g_free(p);
> +}
> +

  Thomas


