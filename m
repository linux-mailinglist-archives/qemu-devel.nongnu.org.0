Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCA33F2795
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 09:24:32 +0200 (CEST)
Received: from localhost ([::1]:35282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGytD-0006R2-Nb
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 03:24:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGysN-0005WI-GK
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 03:23:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGysL-0005Ra-ID
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 03:23:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629444216;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=50sGrbJd6XGQVO0HKh6bMdHGz64TX+P+faGhdL6ZRQQ=;
 b=iuFAxhdk9MQZCGcOXS58oYD1l8CsSZ2RtJTvNsLUU3QEpUERhTLBhF52xwwWbTmdwItEJK
 Tv1crYx7FPBOwVv7fTAJvlf06tZbRWB3Yhoz0/ktBIXg5YkUekuHC4LMKzFaPgfvY2/rai
 bRhu+YkUSFpIJ4/w6Y53ntajEpGoW/k=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-GjxY9RQ3MyShg7mRX40gXQ-1; Fri, 20 Aug 2021 03:23:35 -0400
X-MC-Unique: GjxY9RQ3MyShg7mRX40gXQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 u14-20020a7bcb0e0000b0290248831d46e4so2165106wmj.6
 for <qemu-devel@nongnu.org>; Fri, 20 Aug 2021 00:23:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=50sGrbJd6XGQVO0HKh6bMdHGz64TX+P+faGhdL6ZRQQ=;
 b=CWhG47QeHXIijW4wXjdJaSni5Mp91O3Y50fhObIAvVW8PLv8HEUdNCs1UuTePj8nAO
 v2h6mtnKHFrq/6LOT4CLLmkjzJZGGFUkIM2Hn1TNHzHlS8Yxw4DemAB6fJ7CcrdMR0za
 jq9NrU07fsjIjuhya1Dy3AiIBv2thdKyJW7a+VNRj5imIYiaq6DSf+Tob5c6408Ov7rD
 HwJSC3a7QD5Hp9JPx7g/MIb+SRTMulveRiRexlFQCVZPYICWPWtvnz65JZleia4ZUaAw
 6Rh4DAb/1pJIxRt6p0OmhSASbJzACLQYwafAa5vxjPOhG1tvW6G+uM3YfmBO+lUo4soz
 X1Dg==
X-Gm-Message-State: AOAM532HBYDSqqYgo7cc6dYHyfIkRwzCJrYEfRxgOy/LQYspofVSaMgZ
 0QwogoL6Q0lubeXg5/eGM0VkPtTRIPW5ovNwagNYMJJ0QO0fZBTudY+QH9/ReOguQ5eO6CXHS+O
 9hGOj91gP5PZeC4U=
X-Received: by 2002:a5d:4043:: with SMTP id w3mr1013093wrp.15.1629444214219;
 Fri, 20 Aug 2021 00:23:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJydq0p4i2jG42fl0PmvDuI0ibvKEJJ3KqH+PLhPU6+LKFcDiNZ5lXMQ+ZZtSCRT6Fjo5TIwmA==
X-Received: by 2002:a5d:4043:: with SMTP id w3mr1013074wrp.15.1629444214011;
 Fri, 20 Aug 2021 00:23:34 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id k20sm878166wrc.33.2021.08.20.00.23.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Aug 2021 00:23:33 -0700 (PDT)
Subject: Re: [PATCH 3/4] target/arm/cpu64: Replace kvm_supported with
 sve_vq_supported
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <20210819193758.149660-1-drjones@redhat.com>
 <20210819193758.149660-4-drjones@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <018e12b5-ac0b-3f13-fc10-9f90191db106@redhat.com>
Date: Fri, 20 Aug 2021 09:23:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210819193758.149660-4-drjones@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.591, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 ishii.shuuichir@fujitsu.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/19/21 9:37 PM, Andrew Jones wrote:
> Now that we have an ARMCPU member sve_vq_supported we no longer
> need the local kvm_supported bitmap for KVM's supported vector
> lengths.
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  target/arm/cpu64.c | 19 +++++++++++--------
>  1 file changed, 11 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


