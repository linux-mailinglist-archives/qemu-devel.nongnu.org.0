Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B71103E92F5
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Aug 2021 15:46:39 +0200 (CEST)
Received: from localhost ([::1]:56748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDoZ4-0008LN-8f
	for lists+qemu-devel@lfdr.de; Wed, 11 Aug 2021 09:46:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mDoWl-0007Ms-EY
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 09:44:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mDoWj-0000yH-JK
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 09:44:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628689452;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hmopy3H4HvEde9n0nmsQQj/cbkeiJGdAmXdPWIvCP0I=;
 b=GWcvpe/ndDp0MdGUxqwCBJXiudKAHsT1DmJaQOISHVsic9XZcLZpGSCnZFlTdvcUWx55hr
 +oJrAPtvhSPwQJxPmdV/cv4WHb2sJMrHrXad4qJvVLr9AkBQ2RxQliI8v9hFa/DKoA0UJU
 xaIRr+DeVXLTQNxpr/Lq0isqEdAXGTU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-594-7inIMq8TMhmmqFDO_vylhA-1; Wed, 11 Aug 2021 09:44:09 -0400
X-MC-Unique: 7inIMq8TMhmmqFDO_vylhA-1
Received: by mail-wm1-f71.google.com with SMTP id
 c2-20020a7bc8420000b0290238db573ab7so2121656wml.5
 for <qemu-devel@nongnu.org>; Wed, 11 Aug 2021 06:44:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hmopy3H4HvEde9n0nmsQQj/cbkeiJGdAmXdPWIvCP0I=;
 b=hT5CPZ3Czj+pABczmpXjbVhB6sxoWCVm4AOOvZAD/XgTN0eeScO9+EGH3x5D8QD88w
 yUalDw4SI/oiz+s4M+ISz+xJ5qo5iV8HVg2f9XIaaARNpDSREDOafAoQa+PVCYu4h6oe
 os7pcy7dCiu9iGRwOoYI1PLzgkns7p8VYsDCtR3Ii28tJ217eNxwf8tuOEkdeDD1Zd8f
 qkCpFQJ1oiBMtDI3S4ZN6UeA/QATYc2mnJxl/GyT16LOS/K35Jm/wiGkB4iPLDcytEHj
 M7PK1LnByNzQmw2mYcFeHeK++2kCTI/eC+uxyPjZxbHGToxfx5+xwKc7fHyyzbIi4k7K
 zypw==
X-Gm-Message-State: AOAM530JJAHBEb6829AKMKYUdG/p0zhKwoCZVUl3RYkfy0/R8z6X64V0
 AGYVhOc+rBWSu3ddlTQNYFSn2dan8tvNFUz8G7NRZxrLUALFtqAkh/o1K+/TaxSdya8AR8b5rDe
 S6iY7erYFpH2yruU=
X-Received: by 2002:a7b:c351:: with SMTP id l17mr27846577wmj.120.1628689448124; 
 Wed, 11 Aug 2021 06:44:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwjVf7dNam3Hv+bCxIXIfmKoWZ6b9ZeOA8O+47JJPxIz/oOX7tKz4j7KMqww6iXSoPKacYkAg==
X-Received: by 2002:a7b:c351:: with SMTP id l17mr27846551wmj.120.1628689447908; 
 Wed, 11 Aug 2021 06:44:07 -0700 (PDT)
Received: from thuth.remote.csb (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id e3sm13307995wro.15.2021.08.11.06.44.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Aug 2021 06:44:07 -0700 (PDT)
Subject: Re: [PATCH v12] qapi: introduce 'query-x86-cpuid' QMP command.
To: Eduardo Habkost <ehabkost@redhat.com>
References: <20210728125402.2496-1-valeriy.vdovin@virtuozzo.com>
 <87eeb59vwt.fsf@dusky.pond.sub.org>
 <20210810185644.iyqt3iao2qdqd5jk@habkost.net>
 <2191952f-6989-771a-1f0a-ece58262d141@redhat.com>
 <CAOpTY_qbsqh9Tf8LB3EOOi_gkREotdpUyuF3-d_sBFsof3-9KQ@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <97ce9800-ff69-46cd-b6ab-c7645ee10d2c@redhat.com>
Date: Wed, 11 Aug 2021 15:44:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAOpTY_qbsqh9Tf8LB3EOOi_gkREotdpUyuF3-d_sBFsof3-9KQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, kvm@vger.kernel.org,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>,
 Valeriy Vdovin <valeriy.vdovin@virtuozzo.com>, Denis Lunev <den@openvz.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/08/2021 15.40, Eduardo Habkost wrote:
> On Wed, Aug 11, 2021 at 2:10 AM Thomas Huth <thuth@redhat.com> wrote:
>>
>> On 10/08/2021 20.56, Eduardo Habkost wrote:
>>> On Sat, Aug 07, 2021 at 04:22:42PM +0200, Markus Armbruster wrote:
>>>> Is this intended to be a stable interface?  Interfaces intended just for
>>>> debugging usually aren't.
>>>
>>> I don't think we need to make it a stable interface, but I won't
>>> mind if we declare it stable.
>>
>> If we don't feel 100% certain yet, it's maybe better to introduce this with
>> a "x-" prefix first, isn't it? I.e. "x-query-x86-cpuid" ... then it's clear
>> that this is only experimental/debugging/not-stable yet. Just my 0.02 €.
> 
> That would be my expectation. Is this a documented policy?
> 

According to docs/interop/qmp-spec.txt :

  Any command or member name beginning with "x-" is deemed
  experimental, and may be withdrawn or changed in an incompatible
  manner in a future release.

  Thomas


