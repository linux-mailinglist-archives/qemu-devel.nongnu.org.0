Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A80AC3E89ED
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Aug 2021 07:54:55 +0200 (CEST)
Received: from localhost ([::1]:41322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDhCY-0000U2-6E
	for lists+qemu-devel@lfdr.de; Wed, 11 Aug 2021 01:54:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mDhBf-00081z-9a
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 01:53:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mDhBa-0008AC-5F
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 01:53:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628661232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rDBXC2sfwDcS6hnusKwTLKV3As4FpJ+9vBQFeX1UrFg=;
 b=Ebqm4sCAFHExLnf+jlOJyoJGNjFpPuaUpL5WY+AuYefH/3/sbmUrOu3sY1pQ2YzxFvTO/s
 0odqFbt22VxDtJu4YpYl83FE6FxZIlbCVMNmgHIZnRsvhr+ZfHuyoEfYJ1Rg2AllQtksJ4
 xW99xS3jMe37XE8CyXxjnw4Z0pmrscM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-601-oQBX9B8GN-K-bInGihIb7Q-1; Wed, 11 Aug 2021 01:53:48 -0400
X-MC-Unique: oQBX9B8GN-K-bInGihIb7Q-1
Received: by mail-wr1-f70.google.com with SMTP id
 m5-20020a5d6a050000b0290154e83dce73so317910wru.19
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 22:53:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rDBXC2sfwDcS6hnusKwTLKV3As4FpJ+9vBQFeX1UrFg=;
 b=Ubu8mqAL0keMMf36itY61I3AUDBU3K2hxCMiiHNZhf0UzVkAyJddFNGEVl0Q/mXSUZ
 er+ax31IHn5tzErE5QN89m8Y3Iwugqv3uFlJEiAh29QotosLqcarqZUMS6UCbSAncilg
 HdPWLj2V8Ikt6whuHFzTjybl9kiMQ5iY6H0mMH75HcNuh7+0zTXVp/VCRKURTbfJSoJB
 mteHZaiC8JL0XCY6tm59QgeoorTLXL8JL5Z4mnAVQ4SkEK7FKwgfFY2/IYBZo8MB2aOS
 /w7SmPDp5ezz1dzqR2/DxHpGP3jXGY5bE/NqxFKicR4lULry+8uioReGMlXs5Gac8J8t
 pX6A==
X-Gm-Message-State: AOAM533t6HX8+F5420hQopOSprco9cf1Nou8YAI9vONcn7WEFhvSYwP4
 ZlY//rF2EPQqWBed0HbbuQOi0ks8HOp6uYKcUw3B7kjVZtLzcViOsgr5X6PLDf1DNBEiAs5nYDZ
 vWi7XSfBq3WuHECY=
X-Received: by 2002:a05:600c:1c89:: with SMTP id
 k9mr25778149wms.78.1628661227454; 
 Tue, 10 Aug 2021 22:53:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzs5n/8ZLlbZNMP3SrNsQ4EdBqJaQSwRJK+3XKIzecTbIP/7+XB0+K/Q8ohihBYgD0y/wt+vw==
X-Received: by 2002:a05:600c:1c89:: with SMTP id
 k9mr25778133wms.78.1628661227266; 
 Tue, 10 Aug 2021 22:53:47 -0700 (PDT)
Received: from thuth.remote.csb (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id l9sm25353684wro.92.2021.08.10.22.53.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 22:53:46 -0700 (PDT)
Subject: Re: [PATCH 0/2] gitlab: avoid timeouts in windows cross builds
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210810140653.3969823-1-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <7dd14df7-8dea-93b1-3f3a-6b93b527ed2d@redhat.com>
Date: Wed, 11 Aug 2021 07:53:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210810140653.3969823-1-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.704,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/08/2021 16.06, Daniel P. Berrangé wrote:
> The win64 cross build is quite often hitting the job timeout, despite
> having an elevated timeout of 80 minutes. A typical time is 75-78
> minutes in my tests, which leaves little headroom.
> 
> I'm not inclined to increase the timeout beyond 80 minutes as this is
> already unreasonably long.
> 
> Interestingly the win32 job doesn't timeout in the same way. In local
> tests I've found the mingw32 gcc is as much as 50% faster than
> mingw64 gcc in building QEMU. This explains at least why we only see
> win64 gitlab builds timeout normally.

I've had similar experiences in the past, and once even already sent a patch:

 
https://patchwork.ozlabs.org/project/qemu-devel/patch/20210414081907.871437-4-thuth@redhat.com/

But your apprach is looking way nicer, indeed!

Queued to my testing-next branch now:

  https://gitlab.com/thuth/qemu/-/commits/testing-next/

Thanks,
  Thomas


