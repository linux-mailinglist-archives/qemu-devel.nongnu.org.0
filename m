Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F8C3BE72D
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 13:32:24 +0200 (CEST)
Received: from localhost ([::1]:39940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m15my-00081m-0a
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 07:32:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m15m4-0007LM-GG
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 07:31:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m15m2-0005uo-G2
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 07:31:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625657485;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KHjxTaLjmE7gKdThOi8euB3rLRGHQsqJ8toz4pWvAOw=;
 b=e60krM03jHathu+ajIi5xI7oaHctXlXYY3g0XhqqjEElUk36JNIeFc3qkw+BbAtX+2PnCe
 Kswi/iwgkv17ZRFM75qe9Aeqs2KII6YR4etm/NpKFTKiBvI+yCeAWW/6luNiRqKG8MxjI+
 c47Ha+kat9309ifz9F4/wfQBBEun1Xk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-260-H2n9RRVvOZKbqxmTD_fELA-1; Wed, 07 Jul 2021 07:31:22 -0400
X-MC-Unique: H2n9RRVvOZKbqxmTD_fELA-1
Received: by mail-wr1-f71.google.com with SMTP id
 p4-20020a5d63840000b0290126f2836a61so679803wru.6
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 04:31:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KHjxTaLjmE7gKdThOi8euB3rLRGHQsqJ8toz4pWvAOw=;
 b=bIbpg2plicnza+48lmTTuidvby+4Oy7xjobZuIl59OkRLPVFafjPaODAoFBxFwqZNp
 E+8v93eFdTh6gcUHsB27qUi0uJ29zUEB4+5NDrrwUue7WtZKsAj2CcH4bSgAJ1ZNnDH9
 4ce6CmbqPsfOuya1ByBgkC5XPN2bfTNpmorJAWeSrYJlL/q0g0o1iW3hT0SNGAgUt84K
 8l8y5w7yJXiKEHko4DLUmSJEcgKS6okVbrPn9bFeZ8hcTw9YEIYZdknOIAIim3S+1t5w
 glKM4YQYlJoZJSBpR7k1jZfH6bRo7GXZ//zjiRNXpPw4wwMXtsEYhfarzXq2zkQmFuxK
 5Z5w==
X-Gm-Message-State: AOAM531aZBtYaTsEtoUIhpKPuZOBSpNBmbOyNYqNRAi+XoT/ye5CDQKr
 daawymQxOB2H3kAYLgceKLOf56NTV/mRyjLKlnr1O1M/mQ51WMBq7gy7T4MsdC6/HTHgLpK3JkW
 Hcfai799EsXhnftA=
X-Received: by 2002:a05:600c:19d1:: with SMTP id
 u17mr25876897wmq.177.1625657481225; 
 Wed, 07 Jul 2021 04:31:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyactWI/p4FHlGXLauPYtpMeuWANgAFMdS7n7B0g/er4762o+scSS77wR2usUd97traAPzjKw==
X-Received: by 2002:a05:600c:19d1:: with SMTP id
 u17mr25876876wmq.177.1625657481094; 
 Wed, 07 Jul 2021 04:31:21 -0700 (PDT)
Received: from thuth.remote.csb (pd9575ead.dip0.t-ipconnect.de.
 [217.87.94.173])
 by smtp.gmail.com with ESMTPSA id z4sm18896583wrp.46.2021.07.07.04.31.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jul 2021 04:31:20 -0700 (PDT)
Subject: Re: [PATCH v7 06/14] target/s390x: rename internal.h to
 s390x-internal.h
To: "Cho, Yu-Chen" <acho@suse.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org
References: <20210707105324.23400-1-acho@suse.com>
 <20210707105324.23400-7-acho@suse.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <cee10c79-da47-1729-98e1-a51451942517@redhat.com>
Date: Wed, 7 Jul 2021 13:31:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210707105324.23400-7-acho@suse.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Cornelia Huck <cohuck@redhat.com>, cfontana@suse.com,
 David Hildenbrand <david@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 jose.ziviani@suse.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/07/2021 12.53, Cho, Yu-Chen wrote:
> The internal.h file is renamed to s390x-internal.h, because of the
> risk of collision with other files with the same name.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Signed-off-by: Cho, Yu-Chen <acho@suse.com>
> Acked-by: David Hildenbrand <david@redhat.com>
> Acked-by: Cornelia Huck <cohuck@redhat.com>
> ---
>   target/s390x/arch_dump.c                      | 2 +-
>   target/s390x/cc_helper.c                      | 2 +-
>   target/s390x/cpu.c                            | 2 +-
>   target/s390x/cpu_models.c                     | 2 +-
>   target/s390x/crypto_helper.c                  | 2 +-
>   target/s390x/diag.c                           | 2 +-
>   target/s390x/excp_helper.c                    | 2 +-
>   target/s390x/fpu_helper.c                     | 2 +-
>   target/s390x/gdbstub.c                        | 2 +-
>   target/s390x/helper.c                         | 2 +-
>   target/s390x/int_helper.c                     | 2 +-
>   target/s390x/interrupt.c                      | 2 +-
>   target/s390x/ioinst.c                         | 2 +-
>   target/s390x/kvm.c                            | 2 +-
>   target/s390x/machine.c                        | 2 +-
>   target/s390x/mem_helper.c                     | 2 +-
>   target/s390x/misc_helper.c                    | 2 +-
>   target/s390x/mmu_helper.c                     | 2 +-
>   target/s390x/{internal.h => s390x-internal.h} | 0
>   target/s390x/sigp.c                           | 2 +-
>   target/s390x/translate.c                      | 2 +-
>   target/s390x/vec_fpu_helper.c                 | 2 +-
>   target/s390x/vec_helper.c                     | 2 +-
>   target/s390x/vec_string_helper.c              | 2 +-
>   24 files changed, 23 insertions(+), 23 deletions(-)
>   rename target/s390x/{internal.h => s390x-internal.h} (100%)

Reviewed-by: Thomas Huth <thuth@redhat.com>


