Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D535A2AB7
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 17:13:45 +0200 (CEST)
Received: from localhost ([::1]:33766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRb1j-0007uR-Ln
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 11:13:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oRaZF-0000qL-90
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 10:44:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49296)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oRaZ9-0000qv-CU
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 10:44:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661525050;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HVp4JGBIXQpSm3kQ4cm6KMRIYGQ5gLwGRVip8fUB6E8=;
 b=GoHpNVx7mdLy9ThRLpkSwS/uSGPuwlL2AQvwg+Pji1Ub2r85UqWC6rkroSVwLcdxGORwrG
 T8QtrXKQu8PhC8S2XVdpSdlJDwsALOCVS1wWoGf4jaUSCtQfrsskG/9NXt3IQcRCfKIZ+h
 N9VBw6esQ5iLWD+Nl0BAAg5ZsqObe4c=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-391-YXDO6NuMMaKTISe6LCL71g-1; Fri, 26 Aug 2022 10:44:09 -0400
X-MC-Unique: YXDO6NuMMaKTISe6LCL71g-1
Received: by mail-wm1-f71.google.com with SMTP id
 f7-20020a1c6a07000000b003a60ede816cso591607wmc.0
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 07:44:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc;
 bh=HVp4JGBIXQpSm3kQ4cm6KMRIYGQ5gLwGRVip8fUB6E8=;
 b=AJi0/TstUPgDKK49bcoKNw6ynAGRfbdAqWWTOnnDUq6RX2gw+bYCiwjN859A5LkzKT
 wrClePg6KxuVq2LgMWu0eLTI7hbQVo9b66yKTHA0FdZPxlkgVmAiAZC4lgeGXGRSILk+
 KdBFMwmq5IO8gtdaSPTnU2n+eIE7j89vJTswrlJS7q5/l2eauG8nJ0/7pmLSt4sTIVSO
 hbur8X63uFjkeYuSEGnOV/OoWLJb/VnJVgQ6gHaezZ2oIFo5P/yuN/iFDhkiZzGo7d18
 lTpJ/nMDjsi9pSDah2g69klq3kD7pcjr906Yt3llBEIJs6fb1vTaUPospZFZNcT3QR4+
 y8tg==
X-Gm-Message-State: ACgBeo34EZ+Zq5hm/t9BA53MV9VEHbIo4PFX1NwNdNIACXNai51bKWrN
 yKBgYdjEwwlQeHvsMWKnE1bsCJcIa87gMjzXL95AipuDBgf8Qvbx2x2xM7nGXGtiKdAA5cEgEDd
 TOcpMvD2YBQo57+o=
X-Received: by 2002:a05:600c:19d0:b0:3a6:2eb1:cfa5 with SMTP id
 u16-20020a05600c19d000b003a62eb1cfa5mr11395398wmq.37.1661525048165; 
 Fri, 26 Aug 2022 07:44:08 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4xM2jiGQdFFne/iBakDZMTEjwBdHcVQtdLe6W3ZAC7kwXp6gfwTYPKGS38y+6gnIPv2vq6ww==
X-Received: by 2002:a05:600c:19d0:b0:3a6:2eb1:cfa5 with SMTP id
 u16-20020a05600c19d000b003a62eb1cfa5mr11395380wmq.37.1661525047899; 
 Fri, 26 Aug 2022 07:44:07 -0700 (PDT)
Received: from ?IPV6:2003:cb:c708:f600:abad:360:c840:33fa?
 (p200300cbc708f600abad0360c84033fa.dip0.t-ipconnect.de.
 [2003:cb:c708:f600:abad:360:c840:33fa])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a5d4307000000b002205a5de337sm1964576wrq.102.2022.08.26.07.44.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Aug 2022 07:44:07 -0700 (PDT)
Message-ID: <e0a5f20c-32a5-b57d-0b32-3b1256243b02@redhat.com>
Date: Fri, 26 Aug 2022 16:44:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [RFC PATCH 2/2] kvm/kvm-all.c: listener should delay kvm_vm_ioctl
 to the commit phase
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Xu <peterx@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Maxim Levitsky <mlevitsk@redhat.com>, kvm@vger.kernel.org
References: <20220816101250.1715523-1-eesposit@redhat.com>
 <20220816101250.1715523-3-eesposit@redhat.com>
 <6cb75197-1d9e-babd-349a-3e56b3482620@redhat.com>
 <c1e0a91e-5c95-8c10-e578-39e41de79f6a@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <c1e0a91e-5c95-8c10-e578-39e41de79f6a@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

On 26.08.22 16:32, Emanuele Giuseppe Esposito wrote:
> 
> 
> Am 26/08/2022 um 16:15 schrieb David Hildenbrand:
>> On 16.08.22 12:12, Emanuele Giuseppe Esposito wrote:
>>> Instead of sending a single ioctl every time ->region_* or ->log_*
>>> callbacks are called, "queue" all memory regions in a list that will
>>> be emptied only when committing.
>>>
>>
>> Out of interest, how many such regions does the ioctl support? As many
>> as KVM theoretically supports? (32k IIRC)
>>
> 
> I assume you mean for the new ioctl, but yes that's a good question.
> 
> The problem here is that we could have more than a single update per
> memory region. So we are not limited anymore to the number of regions,
> but the number of operations * number of region.
> 
> I was thinking, maybe when pre-processing QEMU could divide a single
> transaction into multiple atomic operations (ie operations on the same
> memory region)? That way avoid sending a single ioctl with 32k *
> #operation elements. Is that what you mean?

Oh, so we're effectively collecting slot updates and not the complete
"slot" view, got it. Was the kernel series already sent so I can have a
look?

Note that there are some possible slot updates (like a split, or a
merge) that involve multiple slots and that would have to be part of the
same "transaction" to be atomic.


-- 
Thanks,

David / dhildenb


