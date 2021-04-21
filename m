Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A86D1366AFA
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 14:40:12 +0200 (CEST)
Received: from localhost ([::1]:40942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZC9L-0006Ib-Nq
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 08:40:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lZC3T-0001oq-2u
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 08:34:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lZC3R-0004r1-IH
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 08:34:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619008442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0TgLR9FIBrJmGC0jhYsBwz/mUc1ET4QQ7KyF/L/i8E4=;
 b=h/6rfid+wtWGpnRT6cIz/8MEuvn/3Agl3XQ7eXs+RfZg26cvUkRpuc2R9odVxwnJEnEmTT
 irEA9AfXJUWIAkTGVVTfkK00ysQYbBKdBWTbdy3tVvozKkqhDFMB3JFtNPgTC3d4Dwio76
 xBtd+BwZeyWbcmenScd04yrEkDequXs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-451-6lAwDYJCNrizwM-HQ-4qNQ-1; Wed, 21 Apr 2021 08:34:00 -0400
X-MC-Unique: 6lAwDYJCNrizwM-HQ-4qNQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 o18-20020a1ca5120000b02901333a56d46eso325804wme.8
 for <qemu-devel@nongnu.org>; Wed, 21 Apr 2021 05:33:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0TgLR9FIBrJmGC0jhYsBwz/mUc1ET4QQ7KyF/L/i8E4=;
 b=gpZ82hvxa4Lml/WPwLzOSIy5Wvlus3RSf7SO2AhDitPJlt5dJoWlAIQMw8iUWybjsh
 sy200qUmzv12cvRm2FMPjeDkTTG/mPD1IveqO179ecKA8TZOFx6FjMTgWx1IxFoIuK2p
 KjacCAp2efSKtJFJWUhumrnVpgpG1SflNCkQ8SbprnjW1Gn0f8kT8EIvqANMCYg+p/HN
 4/zAfKGoSGdRqIKdmJQQZlK6lXrbq3Pikgbp+TC0WD38BLZhsE+SOmhuSyhSUXSBbchZ
 6EM2rvAxFQddjjcTOcW2a6QbLckTh4qTKEgqVEjcz+fXhgpcQjUv8txszrVF20VY52VB
 7qfg==
X-Gm-Message-State: AOAM532+bpjpTGDqr+BbaoolO+Ccb4rZvH/J+nAiH1v/z5Fzq/kW6InY
 gErudnFbMGz18qM98EYP5pigVMHwT8bhxJ+tcBGi5esdRO1v23xAxVT7VM++xsPXP6vMlEsIVKy
 Bt6VxApEkY1zuGHw=
X-Received: by 2002:adf:b344:: with SMTP id k4mr27126405wrd.205.1619008438987; 
 Wed, 21 Apr 2021 05:33:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy+NQrBPmqCTvim/Vh2BnFetdke3nWXY4YavncuTerGU8XuVFsZWyZ0Ja2AQe0KgDHcLHHVAA==
X-Received: by 2002:adf:b344:: with SMTP id k4mr27126371wrd.205.1619008438772; 
 Wed, 21 Apr 2021 05:33:58 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id z15sm2812403wrv.39.2021.04.21.05.33.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Apr 2021 05:33:58 -0700 (PDT)
Subject: Re: [PATCH v6 05/15] softmmu/memory: Pass ram_flags to
 memory_region_init_ram_shared_nomigrate()
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210421122624.12292-1-david@redhat.com>
 <20210421122624.12292-6-david@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <423e8d43-8270-1625-31ba-eafcb0e58ee6@redhat.com>
Date: Wed, 21 Apr 2021 14:33:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210421122624.12292-6-david@redhat.com>
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
> Let's forward ram_flags instead, renaming
> memory_region_init_ram_shared_nomigrate() into
> memory_region_init_ram_flags_nomigrate().
> 
> Reviewed-by: Peter Xu <peterx@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  backends/hostmem-ram.c                        |  6 +++--
>  hw/m68k/next-cube.c                           |  4 ++--
>  include/exec/memory.h                         | 24 +++++++++----------
>  .../memory-region-housekeeping.cocci          |  8 +++----
>  softmmu/memory.c                              | 18 +++++++-------
>  5 files changed, 31 insertions(+), 29 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


