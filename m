Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5A6436064
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 13:37:54 +0200 (CEST)
Received: from localhost ([::1]:48600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdWOP-0000bR-3R
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 07:37:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mdWN1-0007Px-NT
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 07:36:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mdWN0-0001Yt-8X
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 07:36:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634816185;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/rOX/Y/wJmZVOPNQ2ZsgK2XjFsZYzK0IXRDvvSkTHUg=;
 b=Bzt+jSOxSEXAxqspMOe+XyEwNCkLBVwsJGPON7qCdZNZbrzdeTgcobuKpnCPucnpOkLKdn
 prJ6xgzKqEhijXXdaqILpCPQskj1U0eaQIqJd0e6XBR8PTQerd6JFN09x+Qn3D9EzsU6iI
 yU3yi5xn3lMO38tPMTB7Ht6a/Ye7f7Y=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-119-xsx6GcDDN_mto4BzHS_kwA-1; Thu, 21 Oct 2021 07:36:21 -0400
X-MC-Unique: xsx6GcDDN_mto4BzHS_kwA-1
Received: by mail-wr1-f71.google.com with SMTP id
 d13-20020adf9b8d000000b00160a94c235aso94956wrc.2
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 04:36:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/rOX/Y/wJmZVOPNQ2ZsgK2XjFsZYzK0IXRDvvSkTHUg=;
 b=DTfvagwH7qAHlySlxS9xXCdx4XGI7hWxMAzrRM5ZSjuE24RlEXRTQz4vvHmtKgp5MX
 O5FDF9uyTGSFQbfZE/EMznuzv9vh/D4D9bygu82bboEiLTyAa13bBxtUL/g+IgpCOFPj
 BWIVaLtRBbQpg3fBF56M8U26MsA8Nl9SZtQjTuJFTsu3q/1aLN7EGbKtKFgAURMEWCOY
 x25g3JBQXix6k32+zEMK76u6UAjtYGUpEYML73mgeGKXBAJtf7579qmhxyAChz41SE6P
 2RhmMJY+sSrJfjhoJtSGRhQ2Grl6y7I7PbDwXbkVinlFrHiaI/TtpxnRwIjkAoEbpac3
 cTZw==
X-Gm-Message-State: AOAM530ZJ/rgKrtrP+z/MVo18YzuQeA7ht0H0JUnX/VNbsQhOjGPNXMj
 GqGV/uVjAspuNKd7xWWikccSOnSrXzdwFr2GZRAal2HGr840+n75GprPFeLYS9p1qgRaLqm+mmE
 zI8MEUbtaSYST7OU=
X-Received: by 2002:adf:ee8b:: with SMTP id b11mr6433691wro.349.1634816180797; 
 Thu, 21 Oct 2021 04:36:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCixX6KqUPCjFoCnDCNRh7OK3NiqYIZ7Hz5rvCP5hnH9ut908a07nKq/n33IkiP4TBi2AXMA==
X-Received: by 2002:adf:ee8b:: with SMTP id b11mr6433654wro.349.1634816180571; 
 Thu, 21 Oct 2021 04:36:20 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id r4sm6045495wrz.58.2021.10.21.04.36.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Oct 2021 04:36:20 -0700 (PDT)
Message-ID: <4cea05a0-afb0-3420-0571-e939ac194dd4@redhat.com>
Date: Thu, 21 Oct 2021 13:36:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 1/8] pci: Define pci_bus_dev_fn type
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
References: <20211021104259.57754-1-peterx@redhat.com>
 <20211021104259.57754-2-peterx@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211021104259.57754-2-peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.867, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 Jason Wang <jasowang@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/21/21 12:42, Peter Xu wrote:
> It's used in quite a few places of pci.c and also in the rest of the code base.
> Define such a hook so that it doesn't need to be defined all over the places.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  hw/pci/pci.c         | 14 ++++----------
>  include/hw/pci/pci.h |  7 ++++---
>  2 files changed, 8 insertions(+), 13 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


