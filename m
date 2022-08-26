Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E90055A2A0D
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 16:53:09 +0200 (CEST)
Received: from localhost ([::1]:58946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRaho-0004Je-Ta
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 10:53:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oRaNw-0003Kp-MQ
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 10:32:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oRaNo-00075u-J4
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 10:32:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661524347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QGZw/B06Xt7uHBwCcLTIzdIO1MiFBujJ32paM0Irz6g=;
 b=dzfg94gRFZdJFSQ/3xzWi0llHw449/95Ninhhgmy4uMGlN/4n4XqJ2q0FRsbGnXtRZ6CPk
 XpV+/9AzkdHp2LRFYbxAWaTAE8E71ffULYI4hztbEeBWL05HSm8iXvG4Ces3trj0S9be65
 NrZ0mpHiIE27w9QPuaQBRiThoE10TEk=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-28-f6SvoNrxPoO4sH7jMOhPRw-1; Fri, 26 Aug 2022 10:32:18 -0400
X-MC-Unique: f6SvoNrxPoO4sH7jMOhPRw-1
Received: by mail-qt1-f200.google.com with SMTP id
 bz20-20020a05622a1e9400b003436a76c6e6so1412334qtb.1
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 07:32:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=QGZw/B06Xt7uHBwCcLTIzdIO1MiFBujJ32paM0Irz6g=;
 b=YARcJUBl3RQC1bBZELZwqbTuCbGmw/KqyDqedIqfY9iiK4Dl8tWq+n4cxmDrWY+Hi9
 BnEfcieJoJ9q5Nfje4SXtfmo8I1FLF4OwH8MtCrbiLY+zwQ4K65/5sHljLJG02g3RK/e
 PceLltC+dA9Qp3rGq4PDSbZVEt1JlTJnksJ5K5odP02rGm08mS7Hy8rxCFRC2t7b66FD
 eSDgaE12HoKpstBP5s6iMb6GafsdVofHFHyDgriZ+VWmaiggJj3x9y0hen9L+PNbGZjl
 OXyw1g5FgTZ0J/AKEEWeRb5aqPiQAUS1I1SO3AP0/9M5bwrBthxYjJLy9jJnVZ3WloeV
 9S7A==
X-Gm-Message-State: ACgBeo0jycn9K3BChZUOaIN7znDQqkNGkNHAyVyHJBVJgKxtLc5o8OlA
 bpYqLsclOP27Rpo74xjUKBox0BhCV0mz2/MeSZZVt+HLrys1LKa4DXVsL7nvInLph4VGIPH0gAE
 DwQbxm13wgcb/D7A=
X-Received: by 2002:a05:6214:c82:b0:496:d33e:7ac4 with SMTP id
 r2-20020a0562140c8200b00496d33e7ac4mr8498764qvr.32.1661524338328; 
 Fri, 26 Aug 2022 07:32:18 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7oZCzHp9cR+Q31GCLnS19UTQV/Eu8SuRgWfQdKCRpwYzUEUhpOGoY9m6chiMCNKXPz6PLD0Q==
X-Received: by 2002:a05:6214:c82:b0:496:d33e:7ac4 with SMTP id
 r2-20020a0562140c8200b00496d33e7ac4mr8498739qvr.32.1661524338133; 
 Fri, 26 Aug 2022 07:32:18 -0700 (PDT)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 bq7-20020a05622a1c0700b00344cb66b860sm1265238qtb.38.2022.08.26.07.32.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Aug 2022 07:32:17 -0700 (PDT)
Message-ID: <c1e0a91e-5c95-8c10-e578-39e41de79f6a@redhat.com>
Date: Fri, 26 Aug 2022 16:32:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC PATCH 2/2] kvm/kvm-all.c: listener should delay kvm_vm_ioctl
 to the commit phase
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Xu <peterx@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Maxim Levitsky <mlevitsk@redhat.com>, kvm@vger.kernel.org
References: <20220816101250.1715523-1-eesposit@redhat.com>
 <20220816101250.1715523-3-eesposit@redhat.com>
 <6cb75197-1d9e-babd-349a-3e56b3482620@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <6cb75197-1d9e-babd-349a-3e56b3482620@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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



Am 26/08/2022 um 16:15 schrieb David Hildenbrand:
> On 16.08.22 12:12, Emanuele Giuseppe Esposito wrote:
>> Instead of sending a single ioctl every time ->region_* or ->log_*
>> callbacks are called, "queue" all memory regions in a list that will
>> be emptied only when committing.
>>
> 
> Out of interest, how many such regions does the ioctl support? As many
> as KVM theoretically supports? (32k IIRC)
> 

I assume you mean for the new ioctl, but yes that's a good question.

The problem here is that we could have more than a single update per
memory region. So we are not limited anymore to the number of regions,
but the number of operations * number of region.

I was thinking, maybe when pre-processing QEMU could divide a single
transaction into multiple atomic operations (ie operations on the same
memory region)? That way avoid sending a single ioctl with 32k *
#operation elements. Is that what you mean?

Emanuele


