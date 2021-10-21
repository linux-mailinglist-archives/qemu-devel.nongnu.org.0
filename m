Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 674D0435FCF
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 12:57:47 +0200 (CEST)
Received: from localhost ([::1]:35740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdVla-0003vR-FO
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 06:57:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mdViM-0000yy-C6
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 06:54:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mdViK-0004Wj-Iz
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 06:54:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634813664;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wOjHxfimuM1Sxx/sSuTd3lct+rJSAx+JHVlDU/yrpd8=;
 b=bmjEzUJaMlfmF0bJAnuqZqe1DVdQgglKABeAXHNtOzlTK3Y66IAAXRBPx7L7wCMWdJ8yRg
 9xrhltT5UAmQNUsHTzna7lIh4jMvglwEkM9V0t+SXdp69H/kiQspX7opZMGrd8wDj57QX4
 DQrDDWWuD0xGvcwF8stNEteJRoMDtdg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-393-PjU3Dl7IOGCXKZ9tpxZoFA-1; Thu, 21 Oct 2021 06:54:22 -0400
X-MC-Unique: PjU3Dl7IOGCXKZ9tpxZoFA-1
Received: by mail-wm1-f71.google.com with SMTP id
 o140-20020a1ca592000000b0030d66991388so1566738wme.7
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 03:54:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=wOjHxfimuM1Sxx/sSuTd3lct+rJSAx+JHVlDU/yrpd8=;
 b=MLala6zng0o/Hlsxp98eUADD3R125iL8UhBjPMBmBS1W8Yq1yYRBk55Uc4sG4QTrpx
 UwuE/K3zE6dlj2cUKw6clSOnm0NjVuDHK2Etz4yd1RfrLPGOJ3jMj1bpsp2oJU8xDZmt
 Mh5UUQzk1kgi5OVtHLAA3qU3nNo5eDD2ou4LDbxvhEJnj69Gq0VjmP9avRwmT0b71msb
 vTlBsPibgK7zuZfvWr3WunjtDjd0miIS7s7lu6BHq4CJa7honhJ0yWr47wbtLCnqDGuW
 w3KnxfKo5Pbgo2gD5aGJRpR5mZlFD7HaDn0eWt9mMJ8TAn8QwCuxMk/2wMiL/XchWqJB
 V+Pw==
X-Gm-Message-State: AOAM530Y0ZckuSoqlO/hIYq2m+v0hJ+h79LMyCHOcrMPwjkSDbOkP+st
 ghVxxS9SiQVNJ/J88sDw7+PmkJ0cjEkxtloYr0z4txbERlc5zaQQNAnxk5TR4p9ssjcoE7JCruV
 DVT99X1LuRayOFlE=
X-Received: by 2002:a7b:c149:: with SMTP id z9mr20616332wmi.180.1634813661724; 
 Thu, 21 Oct 2021 03:54:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2Lq6BqNpEDtAAlB9Kagb/wp/LIOfUMe9gm4b1RtPy4IGxxLtQMihQ9/rxzKJQc22/YkdPaQ==
X-Received: by 2002:a7b:c149:: with SMTP id z9mr20616305wmi.180.1634813661554; 
 Thu, 21 Oct 2021 03:54:21 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23aba.dip0.t-ipconnect.de. [79.242.58.186])
 by smtp.gmail.com with ESMTPSA id v3sm4763997wrg.23.2021.10.21.03.54.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Oct 2021 03:54:20 -0700 (PDT)
Message-ID: <09fc205c-ea99-4c20-3062-97816cebded2@redhat.com>
Date: Thu, 21 Oct 2021 12:54:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 2/8] pci: Export pci_for_each_device_under_bus*()
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
References: <20211021104259.57754-1-peterx@redhat.com>
 <20211021104259.57754-3-peterx@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20211021104259.57754-3-peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.267, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21.10.21 12:42, Peter Xu wrote:
> They're actually more commonly used than the helper without _under_bus, because
> most callers do have the pci bus on hand.  After exporting we can switch a lot
> of the call sites to use these two helpers.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  hw/pci/pci.c         | 10 +++++-----
>  include/hw/pci/pci.h |  5 +++++
>  2 files changed, 10 insertions(+), 5 deletions(-)
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


