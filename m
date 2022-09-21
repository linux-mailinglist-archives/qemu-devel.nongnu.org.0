Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8007B5C0057
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 16:54:33 +0200 (CEST)
Received: from localhost ([::1]:49098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ob17P-0008OT-O1
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 10:54:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1ob0xY-0007l0-9p
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 10:44:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35089)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1ob0xV-0003Aq-BJ
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 10:44:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663771455;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v04EFwo3PR/FiV0rTr8ajaXAKxqOGdkaFZC7AE0ogik=;
 b=PdLCp1hVpAFCvA2H39dKLifypEFbkaWRjaEIVVAlJZzAIz208nTypjmvAZZsgP8iDKAiGT
 K1nSuPzTCM0Y/Perp/v6ry2Hnk5s+FWFdsY1IXUZA9p06ggOLMiHNwhYg6XZps/Q+Ec16x
 zHH93BOJgT2z82yRdj0NGoTtR+y0DXY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-440-Q92lwk95MfeWScJSFFKaWA-1; Wed, 21 Sep 2022 10:44:14 -0400
X-MC-Unique: Q92lwk95MfeWScJSFFKaWA-1
Received: by mail-wm1-f71.google.com with SMTP id
 k38-20020a05600c1ca600b003b49a809168so8023625wms.5
 for <qemu-devel@nongnu.org>; Wed, 21 Sep 2022 07:44:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=v04EFwo3PR/FiV0rTr8ajaXAKxqOGdkaFZC7AE0ogik=;
 b=rVt9IdZkL+GwRY73kwcW6oH+/S2c/6gJMFUBhVaVlZaIIGl4lRHCiSuM3Pt1bx1Uxv
 ROSNsf/1ORtCaCAQ6qRmLtH7SpmZMGrXwfCPuo4RQ7uG2SFbPb6SyKMGQFcqX/5L5bT7
 9Hbac/EyXjwnXgoigyd57W8XbzgpyNmlcRO0XJEuLFA76Y7D3S3TFXEhtN6ejhLaUdLr
 dC3xgXNX0X0qZAMgPsar0H4sDA2a9piryJBm5aTHI/+/V4CS/8c2JGNkmEV6UfVjP3Rb
 M23GgfDS450GNf9JOZaRewXdDkU2AoGhM0ycWVzIcA9TywUEDwTzGVa7FIYJi7Y6+ctv
 BBVg==
X-Gm-Message-State: ACrzQf2mclF/sv6JGyI5TvAxdFwzzt45HhgJMSiNXdWz0iwpjJytt3oC
 7IMYy8FMro/6q2KIN2AfCtRu8aWiPlz8Br0Os1CIPd2SgxZs7PbsbMDjXwbMGktQQXTFCQlqIGU
 FdVpp5TIj2KN1qLk=
X-Received: by 2002:a05:600c:4f01:b0:3b4:a8c8:2523 with SMTP id
 l1-20020a05600c4f0100b003b4a8c82523mr6047937wmq.199.1663771452894; 
 Wed, 21 Sep 2022 07:44:12 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5Po+n3nNcL18C6HTPHHdrmsCjmDkBI6ceC/qfflXD5j5w3pyhL5S6427+mki5O0iJrtdWdeQ==
X-Received: by 2002:a05:600c:4f01:b0:3b4:a8c8:2523 with SMTP id
 l1-20020a05600c4f0100b003b4a8c82523mr6047920wmq.199.1663771452696; 
 Wed, 21 Sep 2022 07:44:12 -0700 (PDT)
Received: from [10.34.246.11] (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 p12-20020a1c544c000000b003b4868eb71bsm3062644wmi.25.2022.09.21.07.44.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Sep 2022 07:44:11 -0700 (PDT)
Message-ID: <d17620c7-5d52-c41b-66f2-3055a2dc572a@redhat.com>
Date: Wed, 21 Sep 2022 16:44:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH RFC 0/7] hostmem: NUMA-aware memory preallocation using
 ThreadContext
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
Cc: Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Weil <sw@weilnetz.de>
References: <20220721120732.118133-1-david@redhat.com>
From: =?UTF-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>
In-Reply-To: <20220721120732.118133-1-david@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mprivozn@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -64
X-Spam_score: -6.5
X-Spam_bar: ------
X-Spam_report: (-6.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.702, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/21/22 14:07, David Hildenbrand wrote:
>

Ping? Is there any plan how to move forward? I have libvirt patches
ready to consume this and I'd like to prune my old local branches :-)

Michal


