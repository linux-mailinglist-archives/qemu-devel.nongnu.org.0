Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B5C387568
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 11:43:25 +0200 (CEST)
Received: from localhost ([::1]:43634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liwG4-0005c9-7N
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 05:43:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1livvK-0007aq-07
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:21:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1livvI-0004Wh-DV
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:21:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621329715;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MJHu3494NkF11+nS7V+dw7YmH6+Q8THlDpCf8lejzdU=;
 b=ScQ12L2FeHxbW49yu6u3WEu9FnXuZ1k7gNnbkkElxQy/18+Mk/MCuNPqM8BAPpCa+0NCAL
 87eGhnu024JeDNjBm8g6O4XPe/vh8FUk0Du9qRMPtFzgtH/KbkXPT+SzkS/rQUtPhIKe1a
 WtQrtIBVNBv7SFlApvh/Zvxbdwowoz8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-422-O77SKORGMB24Feg2Us7PrA-1; Tue, 18 May 2021 05:21:54 -0400
X-MC-Unique: O77SKORGMB24Feg2Us7PrA-1
Received: by mail-wm1-f72.google.com with SMTP id
 g17-20020a05600c0011b029014399f816a3so209662wmc.7
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 02:21:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MJHu3494NkF11+nS7V+dw7YmH6+Q8THlDpCf8lejzdU=;
 b=nnshtUaZ4OpSOfbSJj8hpZJBl3SY77nTicMZktLk4illgZd5+/g9cKvDa4y6KmqhGU
 WxxXk7rvUKaKHmd6K3hxYIBwvRJ2OllNbveFMrQjOLzfnuNCMfWdRqMcI13jwmx7PHha
 AgwiBJoKKIB/zgEM+t0A2u9VA2fu63QsMj7XpmkDpPu8bcSZacCM5Fzo3xMQ85MJpU9i
 poJL6AB9z568U5sQ8tZFMGo1/jSg+mHhRglcmVXogwYsG/O8sePuf1adhGjgqqGuY92j
 IpqlPF+jZmhBfLmxdLvF70nK4kFTtfAtz+bRSkNHxe70WS/6ql80hvK/ICFIaZ0LzKsA
 H4Qg==
X-Gm-Message-State: AOAM532ziAynp54s9sBPyfGf4nsrRAug8gLFYzdaHONMUOTFPAwpTCJ2
 Xy8stMIT7rgckkKWLBSl9TQ7G+Hv9cbsw4Xk76/PxnDdDTZQxUO9rm1KZpqrmxTqDlXFw1e0hvj
 a0f97p0FkZIvFfOA=
X-Received: by 2002:a1c:2b05:: with SMTP id r5mr342667wmr.66.1621329713004;
 Tue, 18 May 2021 02:21:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwuIYcuorcPTBVvwTMfn1092l9VOZJoiY7ffPD3x+Swb+kvJXfoxHSRJ+o7mUnke9XL7Iip/w==
X-Received: by 2002:a1c:2b05:: with SMTP id r5mr342655wmr.66.1621329712866;
 Tue, 18 May 2021 02:21:52 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id f20sm19660868wmh.41.2021.05.18.02.21.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 02:21:52 -0700 (PDT)
Subject: Re: [PATCH v2 13/50] target/i386: Assert LMA for x86_64 user-only
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210514151342.384376-1-richard.henderson@linaro.org>
 <20210514151342.384376-14-richard.henderson@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <deaaa631-2a6f-b34c-c7b6-780a8ab15a38@redhat.com>
Date: Tue, 18 May 2021 11:21:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210514151342.384376-14-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: cfontana@suse.de, f4bug@amsat.org, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/05/21 17:13, Richard Henderson wrote:
> LMA is a pre-requisite for CODE64, so there is no way to disable it
> for x86_64-linux-user, and there is no way to enable it for i386.
> 
> Since we're adding an accessor macro, pull the value directly out
> of flags when we're not assuming a constant.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/i386/tcg/translate.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


