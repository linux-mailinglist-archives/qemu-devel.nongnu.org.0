Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 208D43B3DD7
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 09:43:37 +0200 (CEST)
Received: from localhost ([::1]:45930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwgUy-0003lN-7c
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 03:43:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lwgTb-0002tv-NI
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 03:42:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lwgTY-0005Lq-QV
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 03:42:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624606927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lr0KgUZxKhntqopNIIg+uKQ5Ko91hfTBvUBON2pXXeQ=;
 b=fwgm/oz/fcOL0lpenVXrPicmUZcRQKRdPrZaPeqq+uSo8F/TQXmvlNxFz61RryTRQ8Bt8u
 co1xBuvG0N9mxZNfY2Q/YAyvZ96oxGnCNPgwQt5qlspncWj3kN8O6ZWsDlqWtc9R/q+VBy
 /6WCD0q7yE+4hKR0axwyXktPXgQgOVc=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-jaEo547xPrmKfWGD00s0WQ-1; Fri, 25 Jun 2021 03:42:06 -0400
X-MC-Unique: jaEo547xPrmKfWGD00s0WQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 da21-20020a0564021775b0290395165c6cefso1447938edb.1
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 00:42:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=lr0KgUZxKhntqopNIIg+uKQ5Ko91hfTBvUBON2pXXeQ=;
 b=FeO0LNTv05UxYAyboG6qOn0QmxOYZg3CuVK2kHyeICG3V1x+ArxSZYrcwTuo76fLVf
 Ea8fets49caSOABHkB+sjO1Ld06WvTKj/OxTbkVrg8qlsC4SpiAgXyculAdFV1y3hMu9
 BJj9ONkkaJCC/5FGTaUsqwuYKJsKdXeY7cK1byney0MAaopw7RouAcmDIbcFaaPtWe6o
 kIZXC2BCdoWgIvAHGnIUxq1Y9lNZ7dtVgzEFjJ1ik7D4vQXG18WfFikr7vAsXZ9D+gd0
 DIVHV/D9e0w7baczCfpq25kkdDkNu1N8Z8RPDr6sK0JSr9FuWQ4XJn+I4r5uqNeUADY8
 VKEg==
X-Gm-Message-State: AOAM532g8InilPoXHvBoLgmSG2Vekg3OnfO8BmThkdYKRYyOlT/PMIKG
 smzVRBaR7uVYZN7mblWQsK366F0Ohkh93ofwb9T4dytzD6r1DHbUETwm4O2KmT77uLOBg+0EVYa
 RuP29Bdmbtq0w+/g=
X-Received: by 2002:a05:6402:1a:: with SMTP id
 d26mr12813326edu.105.1624606925156; 
 Fri, 25 Jun 2021 00:42:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz1JwDwYaFIcEBFShvRx2+67s0oJWBMhdFKYwaND1ZAMPkAJi0LHOrYPeAqCGAbFFpnAR7THA==
X-Received: by 2002:a05:6402:1a:: with SMTP id
 d26mr12813308edu.105.1624606924940; 
 Fri, 25 Jun 2021 00:42:04 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 cn10sm3522212edb.38.2021.06.25.00.42.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Jun 2021 00:42:04 -0700 (PDT)
Subject: Re: [PATCH 03/11] osdep: provide ROUND_DOWN macro
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210624180423.1322165-1-pbonzini@redhat.com>
 <20210624180423.1322165-4-pbonzini@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <e119192f-9377-b971-f98d-2f67d87cce81@redhat.com>
Date: Fri, 25 Jun 2021 09:42:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210624180423.1322165-4-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
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
Cc: qemu-block@nongnu.org, mlevitsk@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24.06.21 20:04, Paolo Bonzini wrote:
> osdep.h provides a ROUND_UP macro to hide bitwise operations for the
> purpose of rounding a number up to a power of two; add a ROUND_DOWN
> macro that does the same with truncation towards zero.
>
> While at it, change the formatting of some comments.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   include/qemu/osdep.h | 28 ++++++++++++++++++++++------
>   1 file changed, 22 insertions(+), 6 deletions(-)

What a nice thing to have.

Reviewed-by: Max Reitz <mreitz@redhat.com>


