Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4003366D6D0
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 08:23:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHgJ4-0005wK-8M; Tue, 17 Jan 2023 02:22:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pHgJ2-0005uk-04
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 02:22:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pHgJ0-0002Dl-JA
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 02:22:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673940169;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pzn7dTDGTrlOkRWCaQu/SbyexaizuE+jqg3HyX8FiWc=;
 b=VxGwfHbYCo8Mvim/+Hpx+5oXLXVSyjHWqpyUXJg5U8SMTSNfMRdn2MUSwrV1xvr0ZG0As4
 tRfhGHu4CmqJarMgWtYhBHlR6Gzp7y6hsGdmKFIb3DliK8sHjrlQ2xsIpuKdUStF4J03nM
 TecZkomzcha/q0ZDPMYH1KgMDzNcIbo=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-169-W04vDLnAO5iCjLJRUQrkkQ-1; Tue, 17 Jan 2023 02:22:43 -0500
X-MC-Unique: W04vDLnAO5iCjLJRUQrkkQ-1
Received: by mail-qv1-f71.google.com with SMTP id
 o95-20020a0c9068000000b005320eb4e959so15651068qvo.16
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 23:22:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pzn7dTDGTrlOkRWCaQu/SbyexaizuE+jqg3HyX8FiWc=;
 b=rvMn+QwD1L2AP+hDwNoYfaFs4RFfFc8ihZj9LYCH08WkzNW1ARho67R98/i9NuL0qv
 BUXhwUmhjG4RciVjxY531UQ90kz7YqW6iip76d4cqUqUMDw4M6HpQlB3vI7FG0U6T/SX
 nIf2oMDHTs1hfSmf0MgJ2d2N1TDxL46c5EdzGbQg+lnarJw3UA/n5VdRipIyegqW1EtK
 2YfR5a5WkC+7UG8XmBgLTZ+mSOdcF9gcn8z6yxfJmX3mtj7EI8GQJuY0tIciuF9AiX/y
 RuLjg2XslpWhgHeHEdrNpJOxW0J+C1mLutvBjv/EShZ1GWd0vJGSZhN8vHk9I7lAlJz9
 Ycnw==
X-Gm-Message-State: AFqh2kpeuoDUvbN86Ib1iHvjk/acD+fSWYwJtw8uU9LKFt2aNzz7QFhD
 UeKR387Fxm0C29iLvAuKxiIkknQsy0ZbjUsydCssAkGIsZkMVElE5jZaC9kEXRvxVr/Z1/vyl06
 rDz28+0H82RERCTY=
X-Received: by 2002:a05:6214:3019:b0:532:33e4:2d70 with SMTP id
 ke25-20020a056214301900b0053233e42d70mr4922920qvb.12.1673940163479; 
 Mon, 16 Jan 2023 23:22:43 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtnf8FrLDzX0dpt0O9w5aA9IBszjZhcPKD6+z07UWfqY2tgs2Lbj6uGeEQY508aZ5l1FOMZAA==
X-Received: by 2002:a05:6214:3019:b0:532:33e4:2d70 with SMTP id
 ke25-20020a056214301900b0053233e42d70mr4922890qvb.12.1673940163244; 
 Mon, 16 Jan 2023 23:22:43 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-26.web.vodafone.de.
 [109.43.177.26]) by smtp.gmail.com with ESMTPSA id
 v1-20020a05620a0f0100b006faf76e7c9asm19976616qkl.115.2023.01.16.23.22.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 23:22:42 -0800 (PST)
Message-ID: <870effa2-4e98-2b1a-fd24-35247b04394b@redhat.com>
Date: Tue, 17 Jan 2023 08:22:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v14 01/11] s390x/cpu topology: adding s390 specificities
 to CPU topology
Content-Language: en-US
To: Pierre Morel <pmorel@linux.ibm.com>,
 Nina Schoetterl-Glausch <nsg@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, cohuck@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, eblake@redhat.com,
 armbru@redhat.com, seiden@linux.ibm.com, nrb@linux.ibm.com,
 frankja@linux.ibm.com, berrange@redhat.com, clg@kaod.org
References: <20230105145313.168489-1-pmorel@linux.ibm.com>
 <20230105145313.168489-2-pmorel@linux.ibm.com>
 <87039aeec020afbd28be77ad5f8d022126aba7bf.camel@linux.ibm.com>
 <31bc88bc-d0c2-f172-939a-c7a42adb466d@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <31bc88bc-d0c2-f172-939a-c7a42adb466d@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.097, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 16/01/2023 18.28, Pierre Morel wrote:
> 
> 
> On 1/13/23 17:58, Nina Schoetterl-Glausch wrote:
>> On Thu, 2023-01-05 at 15:53 +0100, Pierre Morel wrote:
>>> S390 adds two new SMP levels, drawers and books to the CPU
>>> topology.
>>> The S390 CPU have specific toplogy features like dedication
>>> and polarity to give to the guest indications on the host
>>> vCPUs scheduling and help the guest take the best decisions
>>> on the scheduling of threads on the vCPUs.
>>>
>>> Let us provide the SMP properties with books and drawers levels
>>> and S390 CPU with dedication and polarity,
>>>
>>> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
>>> ---
...
> PTF([01]) are no performance bottle neck and the number of CPU is likely to 
> be small, even a maximum of 248 is possible KVM warns above 16 CPU so the 
> loop for setting all CPU inside PTF interception is not very problematic I 
> think.

KVM warns if you try to use more than the number of physical CPUs that you 
have, not at hard-coded 16 CPUs. So if you've got an LPAR with 248 CPUs, 
it's perfectly fine to use also 248 CPUs for your guest.

  Thomas


