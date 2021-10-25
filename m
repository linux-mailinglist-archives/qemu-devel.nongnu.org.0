Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 297B2439615
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 14:21:37 +0200 (CEST)
Received: from localhost ([::1]:34512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meyyu-0004mD-8B
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 08:21:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1meyvl-0001cc-Ib
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 08:18:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1meyvj-0007bZ-D8
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 08:18:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635164298;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=heCKosV8QhrgPpHwzPk8rggh98/ST1OKU9uRpArpPYQ=;
 b=hzP2n4f8ZrCvXHNH9y48f7+DQQZNoplQcrmrTLkvayJKkWnHibWyUzb+pDMmZSthUMF236
 HiLEKnK/JNHNl4BIO2Ca9HATgw0xbfk+EmpjOhQie53o6sJ6NwQaTnWN6uLMYU0SRJEDOw
 HddPBlR0Jfv0FlgJUbenl++WReyh/ws=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-ApYbTeW0NvCkj6ZzmfWnZQ-1; Mon, 25 Oct 2021 08:18:14 -0400
X-MC-Unique: ApYbTeW0NvCkj6ZzmfWnZQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 205-20020a1c01d6000000b0032ca8044e20so2286722wmb.6
 for <qemu-devel@nongnu.org>; Mon, 25 Oct 2021 05:18:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=heCKosV8QhrgPpHwzPk8rggh98/ST1OKU9uRpArpPYQ=;
 b=EZNBdaS+DK/ng47fSmH8i6L/G9JtjpcZpr/7ItAr2AA6b66d4g4WAGNHtirjgdTd/d
 ndWWg00zLp5ov2WabCKiLWHwwsfB3nskyW2q9A2qjTodM8jCOcrEeshWf+VovGRDy0k8
 kmsZ9qNVwX9jZEM9NQftFOa6SETCI8QRIgdS/prXhVO/Dy47MswgBw+V9sZqWWRWT0yZ
 qvqAEcT2ohayWDEE7vbzAf7nB5M6agrfYl1H3efvbsx9Oa0NGoipS6FyjfcvCkdIMU+y
 xi1NUHcL1DKM8N5wQs/ySBHuxIS1zZEI9tl+pZsAZ7bH4JQqPFTO2Bq3Z/+r4asxa4Rf
 K07A==
X-Gm-Message-State: AOAM532kAUD+H6XX/CC3bhHbQaeoQ5SnIVLBwhrN9iE+qeedhIrVnR5v
 b0lAJHru3tKRkA20tUGBBv5Jb02bKCcs6t4qqGegUNdprgHyOP43Cy6K28NqpUDUhfIa8cASWg3
 JGddju9s+cNOIxR0=
X-Received: by 2002:a05:600c:4f04:: with SMTP id
 l4mr1025933wmq.25.1635164293651; 
 Mon, 25 Oct 2021 05:18:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4MC4smdRT0MLdLnjqyk6tP+iqtjJEkP+eDeLDXm1dX4JbunMjgjUnuv009D9XaiaROpkXYA==
X-Received: by 2002:a05:600c:4f04:: with SMTP id
 l4mr1025895wmq.25.1635164293425; 
 Mon, 25 Oct 2021 05:18:13 -0700 (PDT)
Received: from [192.168.50.34] (static-180-27-86-188.ipcom.comunitel.net.
 [188.86.27.180])
 by smtp.gmail.com with ESMTPSA id e18sm7514609wrv.44.2021.10.25.05.18.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 05:18:13 -0700 (PDT)
Message-ID: <aebf5bba-64f3-4939-356c-521f04d98215@redhat.com>
Date: Mon, 25 Oct 2021 14:18:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 1/9] qapi: New special feature flag "unstable"
To: Kashyap Chamarthy <kchamart@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20211025052532.3859634-1-armbru@redhat.com>
 <20211025052532.3859634-2-armbru@redhat.com> <YXadbMF3lj5I4+Cd@paraplu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <YXadbMF3lj5I4+Cd@paraplu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.846, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, pkrempa@redhat.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, quintela@redhat.com,
 libvir-list@redhat.com, qemu-devel@nongnu.org, mdroth@linux.vnet.ibm.com,
 dgilbert@redhat.com, pbonzini@redhat.com, marcandre.lureau@redhat.com,
 eblake@redhat.com, libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/25/21 14:05, Kashyap Chamarthy wrote:
> On Mon, Oct 25, 2021 at 07:25:24AM +0200, Markus Armbruster wrote:
>> By convention, names starting with "x-" are experimental.  The parts
>> of external interfaces so named may be withdrawn or changed
>> incompatibly in future releases.
>>
>> Drawback: promoting something from experimental to stable involves a
>> name change.  Client code needs to be updated.
>>
>> Moreover, the convention is not universally observed:
>>
>> * QOM type "input-barrier" has properties "x-origin", "y-origin".
>>   Looks accidental, but it's ABI since 4.2.
>>
>> * QOM types "memory-backend-file", "memory-backend-memfd",
>>   "memory-backend-ram", and "memory-backend-epc" have a property
>>   "x-use-canonical-path-for-ramblock-id" that is documented to be
>>   stable despite its name.
> 
> Looks like there's another stable property with an "x-" prefix:
> "x-remote-object", part of QOM type @RemoteObjectProperties.

IIRC "x-remote-object" and RemoteObjectProperties are not stable.


