Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0692C5F45
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 05:38:03 +0100 (CET)
Received: from localhost ([::1]:45126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiVWE-0002mw-64
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 23:38:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kiVVC-000228-2R
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 23:36:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36231)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kiVVA-0007gQ-E5
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 23:36:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606451815;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AXAD6SWRh0q+LLnFzOGoVNLSV0BTzEET515+k833TqY=;
 b=NF7Advs07L3CJKCOGSWZqUa57e+DYksqHv1LOecwzPS3fJeHpAN8sLkPRM9onJU33TIknk
 u79mcekq+RWvMGXni53M9JKpUuC90PhxoCvCoyvUW7Ca68V1tl+KmeQwW77R2s+S5dCeD1
 6RAeDM10Lj4GuHcAzTk6LOzqei+0UGs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-248-ofa4KbQhN1GBkMb8OKMUOw-1; Thu, 26 Nov 2020 23:36:51 -0500
X-MC-Unique: ofa4KbQhN1GBkMb8OKMUOw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 102408049C3;
 Fri, 27 Nov 2020 04:36:50 +0000 (UTC)
Received: from [10.72.13.168] (ovpn-13-168.pek2.redhat.com [10.72.13.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7A14F5D9C6;
 Fri, 27 Nov 2020 04:36:42 +0000 (UTC)
Subject: Re: [RFC PATCH v2 5/5] docs: Added eBPF documentation.
To: Yuri Benditovich <yuri.benditovich@daynix.com>
References: <20201119111305.485202-1-andrew@daynix.com>
 <20201119111305.485202-6-andrew@daynix.com>
 <41b81b86-225f-8d5a-3acc-0cae799c11d3@redhat.com>
 <CAOEp5Of2hGzfvx1UmJrp1QczsvpjaMGue6tdYWwwwjs-gwWY4w@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <a7274146-f93f-5d3c-63e6-503395fdacf7@redhat.com>
Date: Fri, 27 Nov 2020 12:36:41 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAOEp5Of2hGzfvx1UmJrp1QczsvpjaMGue6tdYWwwwjs-gwWY4w@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Yan Vugenfirer <yan@daynix.com>, Andrew Melnychenko <andrew@daynix.com>,
 qemu-devel@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2020/11/26 下午9:00, Yuri Benditovich wrote:
>
>
>
>     This reminds me that we probably need to probe this ability via
>     configure script.
>
>
> I'm not sure. One can boot with an older kernel, build qemu and run it 
> with a newer kernel, correct?


Yes, so we should depend on verifier instead of the probe here.

Thanks


>     Thanks
>


