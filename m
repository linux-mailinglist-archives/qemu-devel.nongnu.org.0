Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C020A532A58
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 14:29:33 +0200 (CEST)
Received: from localhost ([::1]:35422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntTfI-00053L-Sz
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 08:29:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ntSm5-0004hT-Uz
 for qemu-devel@nongnu.org; Tue, 24 May 2022 07:32:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ntSm4-0000gf-9s
 for qemu-devel@nongnu.org; Tue, 24 May 2022 07:32:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653391947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8UkRKYgvR5N7mLPjjPEcjbxrGaS1UyWcr5Nl7D8zmwQ=;
 b=L8gn9ZaDhRxY9QatBR74wh41dmCnDvLuudCCYbpE2XALAPCbViN7bxzo4Q5s/r81M0wXx7
 NUVKAInNi99ivSID5pYEW4afYH6VyZZwZXg/hhHTiCZ1qtUhxYOPj9U7yCwVsfDdFvuVXN
 g3F6zCRQMeuGzY5KJGsuceCyuzR2D9s=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-569-OM1fSOsXPnSwBQ_3SQm-dA-1; Tue, 24 May 2022 07:32:26 -0400
X-MC-Unique: OM1fSOsXPnSwBQ_3SQm-dA-1
Received: by mail-wm1-f70.google.com with SMTP id
 k5-20020a05600c1c8500b003974c5d636dso1174271wms.1
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 04:32:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8UkRKYgvR5N7mLPjjPEcjbxrGaS1UyWcr5Nl7D8zmwQ=;
 b=sBBQdRjq5Ox7XywlNO48osUfekoMt4UIKc8idRaozCBSbaJC18gzaCxWezeP/6kuI9
 jAMkmfcymVtORZAiGgkXGpTRTkEax8zaJTJF8tfeka1roG339/d9QyzrmEITNUj0HZkb
 SDn32ofVcL+gBg4KgXCf3p8Lj3yJJ3CapGpviCd6sWQf9GChGKtPZICtXuUYRLqVWg+0
 vP/rZ1tjicAgQ4fx8IYbwLmVlmZ9DmyGZ9+/UAo2JuAw7UcCmMIpINIC5MlQQWZT5DKo
 mTSHLeau63yR2Scikr+NJUquToa/58IGPehaHbiPf2HH+/xi+UfECATwJL7sYJeaAvdt
 9lmg==
X-Gm-Message-State: AOAM533JoKBm+O9+b6E7YeL1M5MsEZ94ChYRhS2EBTzoOHvMH6yAw69g
 Aitz0gTgchK9rUEfEpqOz+fUK96TH+MJk5fdXRceB2N49ZP2U4LaTpzBrtsbCmGn7/CBf70QgDy
 vPBr3k4A8Ng3yTpw=
X-Received: by 2002:adf:fd0e:0:b0:20d:110b:5c52 with SMTP id
 e14-20020adffd0e000000b0020d110b5c52mr24089139wrr.82.1653391944656; 
 Tue, 24 May 2022 04:32:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy5LF5PkCk5l/pqnDPSExPww/J7WMai8gIUo4yCKyd1IGl+Zob3/ctwrcZohtPUt0Gbwub3Bw==
X-Received: by 2002:adf:fd0e:0:b0:20d:110b:5c52 with SMTP id
 e14-20020adffd0e000000b0020d110b5c52mr24089124wrr.82.1653391944481; 
 Tue, 24 May 2022 04:32:24 -0700 (PDT)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 l4-20020adfbd84000000b0020e5d2a9d0bsm15030262wrh.54.2022.05.24.04.32.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 May 2022 04:32:23 -0700 (PDT)
Message-ID: <3d9badda-6939-9ea0-5554-ba15c0c0cb02@redhat.com>
Date: Tue, 24 May 2022 13:32:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v7 12/13] s390x: CPU topology: CPU topology migration
Content-Language: en-US
To: Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, cohuck@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, eblake@redhat.com,
 armbru@redhat.com, seiden@linux.ibm.com, nrb@linux.ibm.com,
 frankja@linux.ibm.com
References: <20220420115745.13696-1-pmorel@linux.ibm.com>
 <20220420115745.13696-13-pmorel@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220420115745.13696-13-pmorel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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
> To migrate the Multiple Topology Change report, MTCR, we
> get it from KVM and save its state in the topology VM State
> Description during the presave and restore it to KVM on the
> destination during the postload.
> 
> The migration state is needed whenever the CPU topology
> feature is activated.
> 
> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> ---
...
> @@ -2592,22 +2594,57 @@ static void kvm_s390_set_mtr(uint64_t attr)
>           .group = KVM_S390_VM_CPU_TOPOLOGY,
>           .attr  = attr,
>       };
> +    int ret;
>   
> -    int ret = kvm_vm_ioctl(kvm_state, KVM_SET_DEVICE_ATTR, &attribute);
> -
> +    ret = kvm_vm_ioctl(kvm_state, KVM_SET_DEVICE_ATTR, &attribute);

Nit: Unnecessary code churn.

  Thomas


