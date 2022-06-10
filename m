Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E1A546E95
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 22:42:22 +0200 (CEST)
Received: from localhost ([::1]:47882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzlSX-00016V-9e
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 16:42:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1nzlQv-0007vE-CV
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 16:40:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1nzlQs-0007X6-9G
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 16:40:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654893636;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=imQtSutlv2T4FRJs3wX0riAEQ8dDpDNZLaDj9MeOMHo=;
 b=GZEFbW7bk/64HnzFKW1VQz/CMHI+ySbT14T7RzWt5PUTPZbgrGMSv2VjHpXTOrcjMTilrT
 gjeFsBkTr3dZ/MnsDkzOzNKDNrXbd8mukMg/bQ2vMQeTsCVKE+ozED2VeY0WsuseOzHOFx
 MRrHBTChQLiNLQI+2Kcf0OfeKNnYHtI=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-257-3v_-hXOgMRKwjayGzo31hA-1; Fri, 10 Jun 2022 16:40:35 -0400
X-MC-Unique: 3v_-hXOgMRKwjayGzo31hA-1
Received: by mail-qt1-f198.google.com with SMTP id
 a16-20020a05622a02d000b00304eb488a71so193986qtx.1
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 13:40:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=imQtSutlv2T4FRJs3wX0riAEQ8dDpDNZLaDj9MeOMHo=;
 b=ROLIKP1eF8s4edGs+nedYdYLgdPOvMcEs2lay8pb4rkbcKXxv3P9gLHhb2fk1cAJwQ
 8BTSNwlrHoIcSDFULmsWWQHT4d7ZTaDMLHL/cwVArneDTXcBfHxMGC7iheAfqtEfSsKS
 1fx0dom5w9kpTbyxaH5aINwJqiqvMC2raHCB7e0GJqjNts8TBT0i1ZJlt5YtPpSuO//D
 tBmn6qyHg16Tm/d5JMQMxyTuB8pZuN1u/mHXGLTdiWALuANUb+q0S7xJMVWxDDT6TdXZ
 5QVK6RGBFX6Zv84FVy7yRhplkbhfRrROjFIQceZCaIdDV3AarFotq3jBCAD5uSQeeNml
 IOsQ==
X-Gm-Message-State: AOAM533WOjIvz0Ie/EXdM6p1+qk+UjknLF+Gws8N+P2kF1pAqE3opaVQ
 OpZv2ccBfGg/uTOk6Xq37WAuYv8mXFWfADa+9IQ1Q9Blf9+dNdo9CyhKCcJsz0tziT7f7MpQCrG
 F8a2LV8ztr6ooMig=
X-Received: by 2002:a37:42d5:0:b0:6a7:361:e583 with SMTP id
 p204-20020a3742d5000000b006a70361e583mr10230184qka.514.1654893634396; 
 Fri, 10 Jun 2022 13:40:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyvla18giycZ4zPi/6qxLDu9O4h+mrD/tTC42NkufoVZPTXQ4Z8EMEceHMrKqxdxJGrexWC9w==
X-Received: by 2002:a37:42d5:0:b0:6a7:361:e583 with SMTP id
 p204-20020a3742d5000000b006a70361e583mr10230163qka.514.1654893634003; 
 Fri, 10 Jun 2022 13:40:34 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 u21-20020ac858d5000000b00304e8938800sm57230qta.96.2022.06.10.13.40.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jun 2022 13:40:33 -0700 (PDT)
Message-ID: <4bb7b5e4-ceb4-d2d8-e03a-f7059e5158d6@redhat.com>
Date: Fri, 10 Jun 2022 22:40:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH RFC 0/2] arm: enable MTE for QEMU + kvm
Content-Language: en-US
To: Cornelia Huck <cohuck@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, kvm@vger.kernel.org
References: <20220512131146.78457-1-cohuck@redhat.com>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <20220512131146.78457-1-cohuck@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hi Connie,

On 5/12/22 15:11, Cornelia Huck wrote:
> This series enables MTE for kvm guests, if the kernel supports it.
> Lightly tested while running under the simulator (the arm64/mte/
> kselftests pass... if you wait patiently :)
> 
> A new cpu property "mte" (defaulting to on if possible) is introduced;
> for tcg, you still need to enable mte at the machine as well.
isn't the property set to off by default when kvm is enabled (because of
the migration blocker).

Eric
> 
> I've hacked up some very basic qtests; not entirely sure if I'm going
> about it the right way.
> 
> Some things to look out for:
> - Migration is not (yet) supported. I added a migration blocker if we
>   enable mte in the kvm case. AFAIK, there isn't any hardware available
>   yet that allows mte + kvm to be used (I think the latest Gravitons
>   implement mte, but no bare metal instances seem to be available), so
>   that should not have any impact on real world usage.
> - I'm not at all sure about the interaction between the virt machine 'mte'
>   prop and the cpu 'mte' prop. To keep things working with tcg as before,
>   a not-specified mte for the cpu should simply give us a guest without
>   mte if it wasn't specified for the machine. However, mte on the cpu
>   without mte on the machine should probably generate an error, but I'm not
>   sure how to detect that without breaking the silent downgrade to preserve
>   existing behaviour.
> - As I'm still new to arm, please don't assume that I know what I'm doing :)
> 
> 
> Cornelia Huck (2):
>   arm/kvm: enable MTE if available
>   qtests/arm: add some mte tests
> 
>  target/arm/cpu.c               | 18 +++-----
>  target/arm/cpu.h               |  4 ++
>  target/arm/cpu64.c             | 78 ++++++++++++++++++++++++++++++++++
>  target/arm/kvm64.c             |  5 +++
>  target/arm/kvm_arm.h           | 12 ++++++
>  target/arm/monitor.c           |  1 +
>  tests/qtest/arm-cpu-features.c | 31 ++++++++++++++
>  7 files changed, 137 insertions(+), 12 deletions(-)
> 


