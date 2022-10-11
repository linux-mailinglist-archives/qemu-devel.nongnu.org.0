Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E97195FB2F0
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 15:12:25 +0200 (CEST)
Received: from localhost ([::1]:34038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiF3Y-0001Jg-VG
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 09:12:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oiDqW-0007OY-Dk
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 07:55:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25115)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oiDqR-0000P8-Pv
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 07:54:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665489286;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6/UL1Qd9nYArb7VrtNBqTjFDDQm/UF8pHFziYK7Uug8=;
 b=dwWSPa4NLALz+1/E11EBlMd6poHsPCk2LsT3UJPEn4+T891isJLZlZsv3nXPdMAGrl8nxN
 gVWgUmRG4onCu+XK8YxLo0VWT6ZvI0ir1N9mMgGyMcjIQluDhWwK29X2sUbalFoFR0yYZF
 lrC/inEANPB+osCGMGVlHb5HCFg2650=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-649-qlkNmw-5PfuWc98HDPBB0w-1; Tue, 11 Oct 2022 07:54:45 -0400
X-MC-Unique: qlkNmw-5PfuWc98HDPBB0w-1
Received: by mail-wr1-f70.google.com with SMTP id
 g27-20020adfa49b000000b0022cd5476cc7so3762419wrb.17
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 04:54:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6/UL1Qd9nYArb7VrtNBqTjFDDQm/UF8pHFziYK7Uug8=;
 b=cDZXSPNXNus39x2t1P/L3rOsWtiK9vSravxUsIFUdxX8A7F2/s+3R23b346rnFwhB8
 qZ+/9eGnO2CEi20Cy031IcBPawJz9rnot8EVOFiwuvgAw9w3bnr1IPrh4Ula9FAU9kPf
 8voOeqPR/iT2YM1f80pFf2f4Qk+rJAa05vl/jDfN333A03Qn/EE/xu1JkXxsLld+5i0d
 WZLIslLi1y//C6omc5ePG1h7VrUqCmVkBuBVYtRF3W1xasfj9VpV6r03tHvn+b/EEWOB
 G3mHwZE4ufRKqiWEN2qui+MLf08Tgc70Jc9VUS1gP+3KCT5I8VWAU0TrCsI35M9FaytO
 SM7A==
X-Gm-Message-State: ACrzQf1zW4n/hXpajHupNU/978elIe8IXSlJwNj3Wgr6yFfXbqE4axXP
 XKzj9IZ2Oki+x4WrJ/ORUMx8OOgpwZ9o4LZ1GCdHwzJgLBR+avSB4zWEjOqGhE6LkkyK/T3jSVC
 xZFvuoETqEBu5fQY=
X-Received: by 2002:a05:6000:186d:b0:22a:f6ce:72d9 with SMTP id
 d13-20020a056000186d00b0022af6ce72d9mr14518873wri.426.1665489284658; 
 Tue, 11 Oct 2022 04:54:44 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5nSis/tffw3voNgqwl9Lm7lSrQ4kNrDVEptFQJVRnpSpepEkkh3DMge6PeuSStv5jgGEPFzw==
X-Received: by 2002:a05:6000:186d:b0:22a:f6ce:72d9 with SMTP id
 d13-20020a056000186d00b0022af6ce72d9mr14518815wri.426.1665489283445; 
 Tue, 11 Oct 2022 04:54:43 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-11.web.vodafone.de.
 [109.43.176.11]) by smtp.gmail.com with ESMTPSA id
 bj4-20020a0560001e0400b0022e0580b7a9sm4143925wrb.17.2022.10.11.04.54.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Oct 2022 04:54:42 -0700 (PDT)
Message-ID: <4a75e047-ba6f-382e-47c2-75c42c59fc26@redhat.com>
Date: Tue, 11 Oct 2022 13:54:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v5 9/9] tests/x86: Add 'q35' machine type to ivshmem-test
Content-Language: en-US
To: Michael Labiuk <michael.labiuk@virtuozzo.com>, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, den@virtuozzo.com
References: <20220929223547.1429580-1-michael.labiuk@virtuozzo.com>
 <20220929223547.1429580-10-michael.labiuk@virtuozzo.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220929223547.1429580-10-michael.labiuk@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.934, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 30/09/2022 00.35, Michael Labiuk via wrote:
> Configure pci bridge setting to test ivshmem on 'q35'.
> 
> Signed-off-by: Michael Labiuk <michael.labiuk@virtuozzo.com>
> ---
>   tests/qtest/ivshmem-test.c | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)

Reviewed-by: Thomas Huth <thuth@redhat.com>


