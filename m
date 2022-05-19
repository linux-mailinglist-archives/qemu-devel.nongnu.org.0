Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A9752CBEE
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 08:31:17 +0200 (CEST)
Received: from localhost ([::1]:34236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrZgp-0005TT-Ez
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 02:31:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nrZex-0004mN-Fi
 for qemu-devel@nongnu.org; Thu, 19 May 2022 02:29:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nrZeu-0006m0-42
 for qemu-devel@nongnu.org; Thu, 19 May 2022 02:29:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652941754;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nPPcyDvM0NSdz5I8XxJuLbB7Ke3sHJTPlGMW8G7HcsU=;
 b=TNIFan3sgiz+bZBpmiov7hX72v5YijZHVWfWr5CGz4iE0//7YwcjYWCaf4ghGqX8ttclP1
 eumwbW7q3UzJW5S45Lg6Ge+SQ0dt+Kay9R8un06ZyfdoWKzn/v2kuwgcc0o3EUaANaKT0X
 KU7YaZ8yuXTtOgeqtSlrvD58JNbPqCs=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-473-M4gqUQrQPfuCzEvzswmOGw-1; Thu, 19 May 2022 02:29:12 -0400
X-MC-Unique: M4gqUQrQPfuCzEvzswmOGw-1
Received: by mail-ed1-f71.google.com with SMTP id
 n9-20020aa7d049000000b0042aab725949so2981401edo.23
 for <qemu-devel@nongnu.org>; Wed, 18 May 2022 23:29:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=nPPcyDvM0NSdz5I8XxJuLbB7Ke3sHJTPlGMW8G7HcsU=;
 b=tKS+fguBuNLGiDFYhQMMNCwClLFGujeMjm4DFChKd5X9jEbXYmdyIzsdduM16fsSyt
 9JCB32Mcv7UOzbJia/hK64fynqZEMmWAYgFKppWUZASK1uwk1jTFeqetZN7d2V7qgV42
 2MVtL62lTyZ6f1gT82TddkSEloFFBFbCpLKXRrZo2u9/nw9YCvX98ejA6TfkciGQk8Ko
 0b0s4xhfz4mKKWmOAF4v7VYmzfU3YD49GyusWgzhnl3P54ifmWxPyOsB0LWxmFqLVD9o
 rWdxo8xxoaGPBAoo8ZouS1plUpr4EiSJ2O151/PaXIMBz+MNyWlQpLb5eiwdyTHwIRhK
 HkeA==
X-Gm-Message-State: AOAM531M7kV43JFbWoxwA97NfRkmT4TIulKpoWARfAaP1zYAv7qWWGzM
 hXq6Mm7uj29C/SBdLUMjZeqGYwPz4T9wiNT+CmR73Ph94h/MgUKWTs7Xxjde/M9mwhXoLvl80Eb
 aB+QdKXGrDCyY8po=
X-Received: by 2002:a17:907:7815:b0:6ce:5242:1280 with SMTP id
 la21-20020a170907781500b006ce52421280mr2783922ejc.217.1652941751394; 
 Wed, 18 May 2022 23:29:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzu12dH1x2h71kmWXV8nmsja/MzIUCfWGJoXvguPVvcUr39YjKc4EvFGhozrX/CrFk8X7lt9g==
X-Received: by 2002:a17:907:7815:b0:6ce:5242:1280 with SMTP id
 la21-20020a170907781500b006ce52421280mr2783905ejc.217.1652941751141; 
 Wed, 18 May 2022 23:29:11 -0700 (PDT)
Received: from [192.168.0.2] (ip-109-43-176-97.web.vodafone.de.
 [109.43.176.97]) by smtp.gmail.com with ESMTPSA id
 v2-20020a17090651c200b006f3ef214e20sm1784368ejk.134.2022.05.18.23.29.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 May 2022 23:29:10 -0700 (PDT)
Message-ID: <47c757d4-5576-cb24-6f90-027892a30720@redhat.com>
Date: Thu, 19 May 2022 08:29:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
References: <20220518090438.158475-1-thuth@redhat.com>
 <c3fdc5fa-9bb1-dfb8-d763-1a0946f15aa5@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PULL 0/8] Misc patches (Gitlab-CI, qtest, Capstone, ...)
In-Reply-To: <c3fdc5fa-9bb1-dfb8-d763-1a0946f15aa5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On 18/05/2022 18.12, Richard Henderson wrote:
> On 5/18/22 02:04, Thomas Huth wrote:
>>   Hi Richard!
>>
>> The following changes since commit eec398119fc6911d99412c37af06a6bc27871f85:
>>
>>    Merge tag 'for_upstream' of 
>> git://git.kernel.org/pub/scm/virt/kvm/mst/qemu into staging (2022-05-16 
>> 16:31:01 -0700)
>>
>> are available in the Git repository at:
>>
>>    https://gitlab.com/thuth/qemu.git tags/pull-request-2022-05-18
>>
>> for you to fetch changes up to 83602083b4ada6ceb86bfb327e83556ebab120fc:
>>
>>    capstone: Remove the capstone submodule (2022-05-18 08:54:22 +0200)
>>
>> ----------------------------------------------------------------
>> * Remove Ubuntu 18.04 containers (not supported anymore)
>> * Improve the cleanup of the QEMU binary in case of failing qtests
>> * Update the Windows support statement
>> * Remove the capstone submodule (and rely on Capstone of the distros instead)
> 
> Fails centos-stream-8-x86_64 test,
> 
> Run-time dependency capstone found: NO (tried pkgconfig)
> ../meson.build:2539:2: ERROR: Dependency "capstone" not found, tried pkgconfig
> 
> https://gitlab.com/qemu-project/qemu/-/jobs/2473935684

That's a custom runner ... who has access to that one? Cleber? Stefan? I 
didn't spot an entry for it on https://wiki.qemu.org/AdminContacts ...

Anyway, somebody needs to install "capstone-devel" on that machine - or we 
need to disable capstone in scripts/ci/org.centos/stream/8/x86_64/configure 
now if the machine can't be changed...

  Thomas


