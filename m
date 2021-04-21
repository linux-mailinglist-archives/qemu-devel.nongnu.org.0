Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4AB9366B3B
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 14:52:07 +0200 (CEST)
Received: from localhost ([::1]:41728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZCKs-0001qV-W0
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 08:52:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lZC72-0004Bl-Nn
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 08:37:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lZC6w-0006bs-I8
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 08:37:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619008661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DhQO+JC+qvPK3SJ8UHy7yYpKWqe81yWQYd1+RJib0hs=;
 b=FFOPDStzqUB9fDo2qdCgosZ8oENZ+TUy101XnlQR88FQRh286QxqItj3T1Uo1uaaBhyofe
 diaLGlq1dgLYPmrw9Q9VY9QKci27RE5bWCBbQ9MJ/aF5pDtFu4HQqpriFWu/MfbaQilPYZ
 ri3S1Z+pafoQfzdEaDG60xEXXFpgWLw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-q7ygzHyBOzSe9rz1DZUkgQ-1; Wed, 21 Apr 2021 08:37:38 -0400
X-MC-Unique: q7ygzHyBOzSe9rz1DZUkgQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 v5-20020a05600c2145b029012bdd9ddcb7so243936wml.1
 for <qemu-devel@nongnu.org>; Wed, 21 Apr 2021 05:37:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DhQO+JC+qvPK3SJ8UHy7yYpKWqe81yWQYd1+RJib0hs=;
 b=Ao+f8Kb5BhOqM52depzDbb6WLKruCIOdostFnqX66HhqkNOFeLsXGKqQTEGmmV2wMc
 tT52uYyHeuFNXJhXlFPieE4wUZ6ssplKd25RetOzjxCJ3yvB7WGJZDU0fOU5eLgkpni4
 xm+1MXaqBvLMpTis2TNf23nUlt65cQDZVvkDzhytFGSctVICg6l2UYu2TgRL8dur9bas
 sQD2y+8Sxjtc8QiUlx1KceKOV811n5SENfag9lllw+t1Tdqcvm4inpGNb+YgxbTstV78
 tRO9BkC2pJKbhjcuJOTg/x6HYFjgh6xwieMhexM1n+XkHOM/GOek+WsIcbG8HG52yinq
 PS0Q==
X-Gm-Message-State: AOAM533e0s+K4I8B5hoJZDLpdPquqSKJRLoyjRzCUpVlikzORhUt4Gnd
 QzQFjasIW2SclVmNJkT/iXTp5zfZg65jG2q0QnhGX+AVaP9VGXuLyYkLnLx/DfZB3kdKqOdst1h
 5/48zFUrSRPfjXj4=
X-Received: by 2002:a1c:2786:: with SMTP id n128mr9875403wmn.82.1619008657154; 
 Wed, 21 Apr 2021 05:37:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwnt1Pgv0pWk0WRN+ukJXjWyC2HuAuSYBFEhjcV9uKzNms+rt9fxB8Q9r//AXqzBSekflNwOw==
X-Received: by 2002:a1c:2786:: with SMTP id n128mr9875391wmn.82.1619008657015; 
 Wed, 21 Apr 2021 05:37:37 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id e33sm2108813wmp.43.2021.04.21.05.37.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Apr 2021 05:37:36 -0700 (PDT)
Subject: Re: [PATCH v6 07/15] util/mmap-alloc: Pass flags instead of separate
 bools to qemu_ram_mmap()
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210421122624.12292-1-david@redhat.com>
 <20210421122624.12292-8-david@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <5c36ad7e-6170-962f-3e37-5a15b0de3484@redhat.com>
Date: Wed, 21 Apr 2021 14:37:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210421122624.12292-8-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Marcel Apfelbaum <mapfelba@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Greg Kurz <groug@kaod.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/21/21 2:26 PM, David Hildenbrand wrote:
> Let's pass flags instead of bools to prepare for passing other flags and
> update the documentation of qemu_ram_mmap(). Introduce new QEMU_MAP_
> flags that abstract the mmap() PROT_ and MAP_ flag handling and simplify
> it.
> 
> We expose only flags that are currently supported by qemu_ram_mmap().
> Maybe, we'll see qemu_mmap() in the future as well that can implement these
> flags.
> 
> Note: We don't use MAP_ flags as some flags (e.g., MAP_SYNC) are only
> defined for some systems and we want to always be able to identify
> these flags reliably inside qemu_ram_mmap() -- for example, to properly
> warn when some future flags are not available or effective on a system.
> Also, this way we can simplify PROT_ handling as well.
> 
> Reviewed-by: Peter Xu <peterx@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  include/qemu/mmap-alloc.h | 16 +++++++++-------
>  include/qemu/osdep.h      | 18 ++++++++++++++++++
>  softmmu/physmem.c         |  8 +++++---
>  util/mmap-alloc.c         | 15 ++++++++-------
>  util/oslib-posix.c        |  3 ++-
>  5 files changed, 42 insertions(+), 18 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


