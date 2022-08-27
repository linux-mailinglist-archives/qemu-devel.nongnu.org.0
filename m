Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3BF55A34F1
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Aug 2022 07:58:24 +0200 (CEST)
Received: from localhost ([::1]:55042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRopq-0001Cd-So
	for lists+qemu-devel@lfdr.de; Sat, 27 Aug 2022 01:58:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRohF-0004Q0-0X
 for qemu-devel@nongnu.org; Sat, 27 Aug 2022 01:49:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRohD-0004nX-DC
 for qemu-devel@nongnu.org; Sat, 27 Aug 2022 01:49:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661579366;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kYIqgu97qpSn8NIJo69c8EDKp6oBR7lSFqizTHSFDBE=;
 b=MeRO2MtprImx/RVyWqXxiN4101t/PjC91tJuGJUer9I/bCdfzDOhsJ97UZ7Km8yZg3uUbc
 pFgnKCbSoE8sgY4pg5W0/Y0wakZ5Elp2fnQryGnPVJLjb7BGybrZaSeckTayFIBpgb+jnm
 6c3HoW4TBHCyLovyIgxqg/IunqNY2sE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-658-VqOOI-vXOom3x48PIqAvMA-1; Sat, 27 Aug 2022 01:49:24 -0400
X-MC-Unique: VqOOI-vXOom3x48PIqAvMA-1
Received: by mail-wm1-f71.google.com with SMTP id
 a17-20020a05600c349100b003a545125f6eso5081026wmq.4
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 22:49:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=kYIqgu97qpSn8NIJo69c8EDKp6oBR7lSFqizTHSFDBE=;
 b=qclXlFO5yVLPh2N8Oxv+K4e7xvKoUbxoaLooV0mu3nz3XtUfWX4xzJH80rJ3F4yZ/O
 gfZjOxNqQ/KkqLZb5ziYRfYXA12fk7MQU1VXG3hI08b2mdEeOAUidDYnECQpeeOYs/n6
 YowAfftr5fNLyiWPNZpD54y7i9iHZBKIDfT9HZEeUSs+fnRI5junsqv5YEmcAl+zhQKt
 8eyJe+V14prvET3lEG4MQB1H9ZwcihX0DEYBSjDfSr4AOA5ztEZpR/+LdqPrnT8tf9Zc
 WLOPiT+uSLCciQXkOnRAk4WrpBqm77RZa8nC3UMOjqCjVDKX0K2g+CzEIActCMKPzwLs
 X1Ug==
X-Gm-Message-State: ACgBeo2yFH+74XVV7dAbOCwES23gOD1jFvNluTgotloChmKeJI1oK/62
 UaaSZRe5kgrvN4jMyKRRJ49sXulKJmFFXxMEEYeO9ZsdRdf8OBeVqh6BEJ9ZTReWVhKHUZ0ax9Q
 SsPce3WkbsKitbI8=
X-Received: by 2002:a05:600c:19d0:b0:3a6:2eb1:cfa5 with SMTP id
 u16-20020a05600c19d000b003a62eb1cfa5mr1382136wmq.37.1661579363728; 
 Fri, 26 Aug 2022 22:49:23 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5Mw6KRizpwWfSRGm3552Xkh3tJ7GTccHgSdI5oQ0ttbiITnoQWwVTI1Zl3VFp037IHGyZkGA==
X-Received: by 2002:a05:600c:19d0:b0:3a6:2eb1:cfa5 with SMTP id
 u16-20020a05600c19d000b003a62eb1cfa5mr1382114wmq.37.1661579363452; 
 Fri, 26 Aug 2022 22:49:23 -0700 (PDT)
Received: from [192.168.8.101] (tmo-097-69.customers.d1-online.com.
 [80.187.97.69]) by smtp.gmail.com with ESMTPSA id
 l9-20020a7bc349000000b003a5fa79007fsm1583328wmj.7.2022.08.26.22.49.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Aug 2022 22:49:22 -0700 (PDT)
Message-ID: <56e39641-b520-de94-1968-2ba41a58e846@redhat.com>
Date: Sat, 27 Aug 2022 07:49:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v1 22/25] tests/docker: update and flatten debian-toolchain
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20220826172128.353798-1-alex.bennee@linaro.org>
 <20220826172128.353798-23-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220826172128.353798-23-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

On 26/08/2022 19.21, Alex Bennée wrote:
> Update to the latest stable Debian. While we are at it flatten into a
> single dockerfile as we do not need anything from the base image to
> build the toolchain. This is used to build both the nios and
> microblaze toolchains.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/docker/Makefile.include                    | 4 ----
>   tests/docker/dockerfiles/debian-toolchain.docker | 5 +++--
>   2 files changed, 3 insertions(+), 6 deletions(-)

I was a little bit surprised that we do not expose these containers in the 
gitlab-CI (and thus that there are no modifications to the yml files here), 
but seems like we're fine.

Reviewed-by: Thomas Huth <thuth@redhat.com>



