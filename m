Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CEA6A46BF
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 17:08:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWg2v-0004SG-SK; Mon, 27 Feb 2023 11:08:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pWg2t-0004G8-I8
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 11:08:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pWg2s-0008Vi-1G
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 11:08:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677514088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W8UKKtblNQex7SBNhLhoN2JkWACMBc9dITR3yeEr7jE=;
 b=DXZjs9TjzqAodyW2lvM+QavCwuzYtQdWWHNevP109+0fPq2ZiYeXr8w5w/FE70btbZctu5
 B4zvzoyHrXTqhehWYf4pbKC/mpBCX+ssv/hcV/7lmVQAcA7QT58OvV2kU7yErQPmrHXa+R
 e3qFY7OePZjhKRCPnsDTuD6wwrBGjr0=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-274-_BjI3cGuMeC3rIIHJcAsQg-1; Mon, 27 Feb 2023 11:08:03 -0500
X-MC-Unique: _BjI3cGuMeC3rIIHJcAsQg-1
Received: by mail-qt1-f197.google.com with SMTP id
 bb31-20020a05622a1b1f00b003bfc3311816so3025002qtb.4
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 08:08:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W8UKKtblNQex7SBNhLhoN2JkWACMBc9dITR3yeEr7jE=;
 b=YkW7LeUZklZno0XhZFKuMpTf3xn3Y26rSBrVmoHxds11poFOGT3U+4eRq6feUoPsFC
 e1tUaLCbZxPP1eBmXGOrLC7jGi1CkTD4hqe9iqqB9/YXFxdDGG/qzD8PQTfiIqbO2uXY
 GBzFZgc8ANoPu9gTD8hZUBm0SeN2GrgFwJFEBBVdTo/BKbjDv4cYPcVURB/CnWLhzsY1
 yo5TYx1JLtlX3p4LitXeMRq9gwwIfmMHtp91g36c3BleDRhVib8ZuMcIrUEFGlVW2XjJ
 m8eKHyqiLUpTHG3Q8DrJtJuQiPo695GabknBi2SMiJDn33mTQKwwllRvTPUJRdHFrQNR
 Ef9Q==
X-Gm-Message-State: AO0yUKVqUrL11u3l/mteu9vF8YzsYD8uYZNPH+4fAaPqHOKMr+bi7/+d
 ItxWn+UtH/h/1UTXQmPi9SV16A3vJyAhyfD+oPF40onG56PJl2HDNO/25WEio7qYqpwjzaG16Dv
 FvsNAnHTAgY0U1nw=
X-Received: by 2002:a05:6214:1d08:b0:570:ee5c:2953 with SMTP id
 e8-20020a0562141d0800b00570ee5c2953mr16330743qvd.11.1677514083414; 
 Mon, 27 Feb 2023 08:08:03 -0800 (PST)
X-Google-Smtp-Source: AK7set+L8Dt/P/Wula5PEOYLeyvL/dY7d0/aVKgf/USAxprDSIBUdfAENZ6LarAgJ57IflQIPMsD6A==
X-Received: by 2002:a05:6214:1d08:b0:570:ee5c:2953 with SMTP id
 e8-20020a0562141d0800b00570ee5c2953mr16330693qvd.11.1677514083005; 
 Mon, 27 Feb 2023 08:08:03 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com ([185.140.112.229])
 by smtp.gmail.com with ESMTPSA id
 q190-20020a3743c7000000b00742a23cada8sm2859928qka.131.2023.02.27.08.08.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 08:08:01 -0800 (PST)
Date: Mon, 27 Feb 2023 17:07:59 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Bui Quang Minh <minhquangbui99@gmail.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Richard
 Henderson <richard.henderson@linaro.org>, Eduardo Habkost
 <eduardo@habkost.net>, "Michael S . Tsirkin" <mst@redhat.com>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH 1/4] apic: add support for x2APIC mode
Message-ID: <20230227170759.12297901@imammedo.users.ipa.redhat.com>
In-Reply-To: <ee3d42c1-9e52-57f9-eba8-a5dc3a45d14f@gmail.com>
References: <20230221160500.30336-1-minhquangbui99@gmail.com>
 <20230221160500.30336-2-minhquangbui99@gmail.com>
 <20230224152932.1de436cb@imammedo.users.ipa.redhat.com>
 <ee3d42c1-9e52-57f9-eba8-a5dc3a45d14f@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sat, 25 Feb 2023 17:15:17 +0700
Bui Quang Minh <minhquangbui99@gmail.com> wrote:

> On 2/24/23 21:29, Igor Mammedov wrote:
> > On Tue, 21 Feb 2023 23:04:57 +0700
> > Bui Quang Minh <minhquangbui99@gmail.com> wrote:
> >   
> >> This commit refactors APIC registers read/write function to support both
> >> MMIO read/write in xAPIC mode and MSR read/write in x2APIC mode. Also,
> >> support larger APIC ID, self IPI, new IPI destination determination in
> >> x2APIC mode.
> >>
> >> Signed-off-by: Bui Quang Minh <minhquangbui99@gmail.com>
> >> ---
> >>   hw/intc/apic.c                  | 211 +++++++++++++++++++++++++-------
> >>   hw/intc/apic_common.c           |   2 +-
> >>   include/hw/i386/apic.h          |   5 +-
> >>   include/hw/i386/apic_internal.h |   2 +-
> >>   4 files changed, 172 insertions(+), 48 deletions(-)
> >>
> >> diff --git a/hw/intc/apic.c b/hw/intc/apic.c
> >> index 2d3e55f4e2..205d5923ec 100644
> >> --- a/hw/intc/apic.c
> >> +++ b/hw/intc/apic.c
> >> @@ -30,6 +30,7 @@
> >>   #include "hw/i386/apic-msidef.h"
> >>   #include "qapi/error.h"
> >>   #include "qom/object.h"
> >> +#include "tcg/helper-tcg.h"
> >>   
> >>   #define MAX_APICS 255  
> > 
> > I'm curious how does it work without increasing ^^^?  
> 
> Hmm, my commit message is not entirely correct. In this series, some 
> operations (send IPI, IPI destination determination) have been updated 
> to support x2APIC mode. However, the emulated APIC still doesn't support 
> APIC ID larger than 255 because currently, we use a fixed length (255 + 
> 1) array to manage local APICs. So to support larger APIC ID, I think we 
> need to find any way to manage those, as the possible allocated APIC ID 
> range is large and maybe the allocated APIC ID is sparse which makes 
> fixed length array so wasteful.
how much sparse it is? 

benefits of simple static array is simplicity in management and O(1) access time.
QEMU does know in advance max apic id so we can size array by dynamically
allocating it when 1st apic is created. Or if IDs are too sparse
switch to another structure to keep mapping.


> 
> Thanks,
> Quang Minh.
> 


