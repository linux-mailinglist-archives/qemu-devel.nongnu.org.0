Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2096E3F4B99
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 15:20:38 +0200 (CEST)
Received: from localhost ([::1]:34516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mI9sT-0006Hr-6j
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 09:20:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mI9rD-0004kK-Dx
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 09:19:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mI9rB-00051L-U9
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 09:19:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629724757;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ejn7nEbMnT4gPmDkqtfibXrepzaJyR5ptP5kPlkZ0l0=;
 b=ha65Caq04PJ/3QhiYcamDOEK21NbmSWSC13FYB1hS0AnpkHvjqOqP0G2ByBk2egmSKh9a0
 Xn9/w3w1kFvsMiuceKDnG5kXOol+v6cPYITsYNL5xP/JNi1GPa+1O2III5LwSN1qwjN4yu
 DHcIBmxKkopvTeFYeznLE7tmDEPLJDs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-tF_VlP_1PNiqGQ6C7Hpb0Q-1; Mon, 23 Aug 2021 09:19:12 -0400
X-MC-Unique: tF_VlP_1PNiqGQ6C7Hpb0Q-1
Received: by mail-wr1-f70.google.com with SMTP id
 v6-20020adfe4c6000000b001574f9d8336so1044415wrm.15
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 06:19:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ejn7nEbMnT4gPmDkqtfibXrepzaJyR5ptP5kPlkZ0l0=;
 b=gbGT48q2RXzIaMbyXDCOK2fwbZCungMNJvAsuS7dSYoV7tlTyL7ApYxx7hisjSXtjP
 N7cd2b8/BNAGIREbd+FULeGhrx7ad5KcFhjrQw3sxIo5eBjtotTbGED//QU5J2rrdOoe
 KYnFKkBFCA8NCMv2mmzRDfJeNMdQo8IMVTggjiI4jdtP2SW1afeLZGgAu3yzC1EPC94E
 HJsS/ZAESsu+sGDu278bs7YKOWIhDMZDAMmpMO3n3EC/lTt4WJXmxP6VkKfvrEaLa47y
 3KRsnoiqbCNzy/6JwhvkYn8xq+ws/qRyZHfvVnEIlQvTK7/0xXGQ/WBbhGtS/3k0x9Oo
 Ghhg==
X-Gm-Message-State: AOAM530W5k09tkMPhjfOPkzvqYyiQrvZB26IXqBKAnTjJAAGoCNiaaj0
 ijXV61sRoVgyrrx3wRusVYrBTzMw1IUPN0OwI1nQA3U3OolAsvJfi2Bj9kMif8DPdkHVPwMASnS
 KBqvDV+2sEF+G2Dw=
X-Received: by 2002:a05:600c:2297:: with SMTP id
 23mr16581385wmf.64.1629724751571; 
 Mon, 23 Aug 2021 06:19:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxUtGQsagVK8KqHjhtif/rrgfO07ooYGCnM0la52dzb5fE5R3iXVSR19cZWyWeGhBzlaZhEdQ==
X-Received: by 2002:a05:600c:2297:: with SMTP id
 23mr16581343wmf.64.1629724751361; 
 Mon, 23 Aug 2021 06:19:11 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id c190sm13274217wma.21.2021.08.23.06.19.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Aug 2021 06:19:10 -0700 (PDT)
Subject: Re: [PATCH v7 10/15] machine: Make smp_parse generic enough for all
 arches
To: Yanan Wang <wangyanan55@huawei.com>, qemu-devel@nongnu.org
References: <20210823122804.7692-1-wangyanan55@huawei.com>
 <20210823122804.7692-11-wangyanan55@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <f0d070b9-767f-66fb-8b97-0a758e34f183@redhat.com>
Date: Mon, 23 Aug 2021 15:19:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210823122804.7692-11-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.023, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Halil Pasic <pasic@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, Thomas Huth <thuth@redhat.com>,
 wanghaibin.wang@huawei.com, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/23/21 2:27 PM, Yanan Wang wrote:
> Currently the only difference between smp_parse and pc_smp_parse
> is the support of dies parameter and the related error reporting.
> With some arch compat variables like "bool dies_supported", we can
> make smp_parse generic enough for all arches and the PC specific
> one can be removed.

Ah, this is the opposite argument to my reply to your patch #5.

> Making smp_parse() generic enough can reduce code duplication and
> ease the code maintenance, and also allows extending the topology
> with more arch specific members (e.g., clusters) in the future.
> 
> Suggested-by: Andrew Jones <drjones@redhat.com>
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> Reviewed-by: Andrew Jones <drjones@redhat.com>
> ---
>  hw/core/machine.c   | 110 ++++++++++++++++++++++++++++++++++++--------
>  hw/i386/pc.c        |  84 +--------------------------------
>  include/hw/boards.h |   9 ++++
>  3 files changed, 100 insertions(+), 103 deletions(-)


