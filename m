Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6054E6D670B
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 17:19:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjiQi-0008LG-1f; Tue, 04 Apr 2023 11:18:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pjiQd-0008KT-RH
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 11:18:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pjiQc-0006MN-Ed
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 11:18:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680621513;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+wVaaP97MqOwYV71KCPK0drARH1Q+r7kTZfMWxeT8oQ=;
 b=YGtpAsjvMQ0zVYfjE53PPToZqZKPd39/ZcGxHf0ftLuf9aj1ebRJO+25CohwNyi7bwCANR
 UP9j2VVqIenH2qFnqA6VPthieqNtJe9Hs6SRCzSGphLxdniFCL5XxeSEikRcXs8MqFJFgo
 7l86qC1zlVsTIOtKMEC355+Jav/vOGI=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-136-Anv01u2QN9eXsRDUh7MAyA-1; Tue, 04 Apr 2023 11:18:31 -0400
X-MC-Unique: Anv01u2QN9eXsRDUh7MAyA-1
Received: by mail-qv1-f72.google.com with SMTP id
 m3-20020a0cbf03000000b005de7233ca79so12498181qvi.3
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 08:18:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680621501;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+wVaaP97MqOwYV71KCPK0drARH1Q+r7kTZfMWxeT8oQ=;
 b=sM3dvsGSkPPY0LzKFfJ+XL4xzedkn0ORtQjZz/YtqTx4bsd6C+ZoQqzg5muS9Cs9uK
 usvcnyInTK3QqyIncPZqlTHbnnFnXgdYk74/M0nXu+DsB9PInwy04yeT06H90YlHgA6H
 10XP8xK883VxBcgTg/h1D8SQEh+hf6/SOpvsGloW5aB1cCcKPFBFlFB6fISRLwAU2rTT
 GNyClDqBax64oZ/iY/4AOTXyM2CMp5FY5aYgJpvXJHWw0XtlpL2xCVLxXgP9VN+vr8Qp
 Z+0098eZ4GcHyRgfRF3CnlMP4sfRACuShlPJQWqN3CrKFGR1lmiyiZ3f0XgdZ/ASY28x
 gKnQ==
X-Gm-Message-State: AAQBX9cqg5e16XcOzyBd0Vk8r4HfZtzvV9BzqIrhMMRPTP6H0YPeduj/
 j95UU/pwnSlDdyi3ncwrPe3lCuClrf+gbiNzH3AwQ3DUKRuHyXnvDPcAzMdw4haejTMJUuIH6tB
 eDRYzDnNSa4+tDCopl0PwcZk9S5eMiNGQEFVs3JhTdwppTdwAuw43XGf/J/MUdZqEhgWhWSwSQg
 ==
X-Received: by 2002:a05:622a:110c:b0:3e6:3650:2e33 with SMTP id
 e12-20020a05622a110c00b003e636502e33mr4224612qty.14.1680621501375; 
 Tue, 04 Apr 2023 08:18:21 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZYxtZphgK8mBng2PYj5ozDGjgbznIU4ElObvPsDw3EHW+W9Rxy1uN7EnhIG2/c7cXRCl6KaA==
X-Received: by 2002:a05:622a:110c:b0:3e6:3650:2e33 with SMTP id
 e12-20020a05622a110c00b003e636502e33mr4224539qty.14.1680621500969; 
 Tue, 04 Apr 2023 08:18:20 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-178-74.web.vodafone.de.
 [109.43.178.74]) by smtp.gmail.com with ESMTPSA id
 s188-20020ae9dec5000000b006fcb77f3bd6sm2311115qkf.98.2023.04.04.08.18.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Apr 2023 08:18:20 -0700 (PDT)
Message-ID: <d9e51f4a-b028-df57-114f-42e51c1989d7@redhat.com>
Date: Tue, 4 Apr 2023 17:18:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: s390x TCG migration failure
Content-Language: en-US
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Nina Schoetterl-Glausch <nsg@linux.ibm.com>
Cc: qemu-block@nongnu.org, Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 John Snow <jsnow@redhat.com>, David Hildenbrand <david@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Coiby Xu
 <Coiby.Xu@gmail.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Eduardo Habkost <eduardo@habkost.net>, Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, Eric Blake
 <eblake@redhat.com>, Eric Farman <farman@linux.ibm.com>
References: <20230207005650.1810-4-quintela@redhat.com>
 <20230324184129.3119575-1-nsg@linux.ibm.com>
 <84eebff9-54b8-9354-5b48-822937af0405@redhat.com>
 <07464c8f08535b5c6611135ffeda66c8b26ec46c.camel@linux.ibm.com>
 <88923929-1a75-2dbd-d7d9-406d620c71e7@redhat.com>
In-Reply-To: <88923929-1a75-2dbd-d7d9-406d620c71e7@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.925, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 29/03/2023 08.36, Thomas Huth wrote:
> On 29/03/2023 00.21, Nina Schoetterl-Glausch wrote:
>> On Tue, 2023-03-28 at 15:01 +0200, Thomas Huth wrote:
>>> On 24/03/2023 19.41, Nina Schoetterl-Glausch wrote:
>>>> Hi,
>>>>
>>>> We're seeing failures running s390x migration kvm-unit-tests tests with 
>>>> TCG.
>>>> Some initial findings:
>>>> What seems to be happening is that after migration a control block 
>>>> header accessed by the test code is all zeros which causes an unexpected 
>>>> exception.
>>>> I did a bisection which points to c8df4a7aef ("migration: Split 
>>>> save_live_pending() into state_pending_*") as the culprit.
>>>> The migration issue persists after applying the fix e264705012 
>>>> ("migration: I messed state_pending_exact/estimate") on top of c8df4a7aef.
>>>
>>>    Hi Nina,
>>>
>>> could you please open a ticket in the QEMU bug tracker and add the "8.0"
>>> label there, so that it correctly shows up in the list of things that should
>>> be fixed before the 8.0 release?
>>
>> https://gitlab.com/qemu-project/qemu/-/issues/1565 
> 
> Thanks!

Ping!

Juan, did you have a chance to look at this issue yet? ... we're getting 
quite close to the 8.0 release, and IMHO this sounds like a critical bug?

  Thomas


