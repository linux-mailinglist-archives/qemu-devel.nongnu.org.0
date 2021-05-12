Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC6637BC16
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 13:55:20 +0200 (CEST)
Received: from localhost ([::1]:60580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgnSR-0007li-Jt
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 07:55:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lgnRB-0006RE-Fj
 for qemu-devel@nongnu.org; Wed, 12 May 2021 07:54:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lgnR9-0008UK-VX
 for qemu-devel@nongnu.org; Wed, 12 May 2021 07:54:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620820439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P8UFc5Lg/oBgRZ97cuZ+j729n731PdZeIxVf1IQvK2s=;
 b=KfsPFHyPLYtz1bQQBrFId4Q9kZp7w22P6kSHly2leRFH61enhLJiebdIbR/odqh1+X2idV
 SIJZacn5jLd59dOw1fPx2RuSTPfakK+MrjK2A78Hyghmj8suesEHJfQkMTfFJ1cfQ5CfK2
 Lx96e2LzsZVYnpRsJ7XP8XzjgxwN4Vc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-514-1tJARhyBO4KgZxqqpKnsvA-1; Wed, 12 May 2021 07:53:58 -0400
X-MC-Unique: 1tJARhyBO4KgZxqqpKnsvA-1
Received: by mail-wr1-f72.google.com with SMTP id
 v5-20020adf9e450000b029010e708f05b3so5738527wre.6
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 04:53:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=P8UFc5Lg/oBgRZ97cuZ+j729n731PdZeIxVf1IQvK2s=;
 b=aNJHdlBjM0YbmF0xaLgGSS5aZWDtYcCFFC8h4N1qg/IE/LaUurEJkA/g+ipHiMbly5
 SqvgHvefEhbeI4O/qGH/VFcH+NCzmR6+QdmOIe7kOxZaRO6ETYqysV6IrTytDKtaMU9q
 JG1A9UeRgcDrYcHTTg/YO3G91cmm75MbZP6vspA1qEX4vCSFrnjOUWt3bhZg+U36lZ6D
 /Ra+Afo2Vz2QXNfPGFAKsUswShXcPHaHSQb7fQ2oHb3/BCKOKKGlMYOwMkrYYzOjR0oR
 AbR8d/UDtbFIE1/fPfITt0GR/FxeCSPV53JyCZAob42OrL1z/z80tNg7lgWRJJ8i3HbV
 V0/Q==
X-Gm-Message-State: AOAM532cVA1kgZPAs91ZCoTRFSExK64p4gGTjK1oSLbR+DwujbPAS8x6
 APXpsz8gY0ntetuPNojHppG2iRb8wdkTitBb129PuP5NvqkjSjhziQXuYkaScRysBmURmT/k3z5
 764VoqyMBjdHc7CE=
X-Received: by 2002:a1c:23c9:: with SMTP id j192mr5846504wmj.131.1620820436877; 
 Wed, 12 May 2021 04:53:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwn6QMaElGaWkHvhvv2kI3gTnVaI2569GhDnLVa5i+4NNz8rvA7xsLY2iRH8zX+HvlaQzCFwg==
X-Received: by 2002:a1c:23c9:: with SMTP id j192mr5846488wmj.131.1620820436686; 
 Wed, 12 May 2021 04:53:56 -0700 (PDT)
Received: from thuth.remote.csb (pd9e835ac.dip0.t-ipconnect.de.
 [217.232.53.172])
 by smtp.gmail.com with ESMTPSA id l18sm30627988wrt.97.2021.05.12.04.53.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 May 2021 04:53:56 -0700 (PDT)
Subject: non-x86 runners in the Gitlab-CI (was: Re: [PATCH 12/12] configure:
 bump min required CLang to 7.0.0 / XCode 10.2)
To: qemu-devel@nongnu.org, Cleber Rosa <crosa@redhat.com>
References: <20210511132641.1022161-1-berrange@redhat.com>
 <20210511132641.1022161-13-berrange@redhat.com>
 <fcb6b808-c1de-d5f3-064c-1725c49999e0@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <5b582933-6004-3549-b5fe-208c182d5efe@redhat.com>
Date: Wed, 12 May 2021 13:53:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <fcb6b808-c1de-d5f3-064c-1725c49999e0@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Richard Henderson <richard.henderson@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Ademar Reis Jr <areis@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/05/2021 13.44, Philippe Mathieu-Daudé wrote:
> On 5/11/21 3:26 PM, Daniel P. Berrangé wrote:
>> Several distros have been dropped since the last time we bumped the
>> minimum required CLang version.
>>
>> Per repology, currently shipping versions are:
>>
>>               RHEL-8: 10.0.1
>>       Debian Stretch: 7.0.1
>>        Debian Buster: 7.0.1
>>   openSUSE Leap 15.2: 9.0.1
>>     Ubuntu LTS 18.04: 10.0.0
>>     Ubuntu LTS 20.04: 11.0.0
>>           FreeBSD 12: 8.0.1
>>            Fedora 33: 11.0.0
>>            Fedora 34: 11.1.0
>>
>> With this list Debian Stretch is the constraint at 7.0.1
>>
>> An LLVM version of 7.0.1 corresponds to macOS XCode version of 10.2
>> which dates from March 2019.
> 
> But we still rely on Travis-CI (Ubuntu Bionic 18.04 LTS)
> for non-x86 targets until we have figured out who is willing
> to share/maintain such non-x86 native runners on Gitlab.

  Hi Cleber,

by the way, what's the status of your patch series to get the dedicated CI 
machines (s390x, aarch64, ...) running in our Gitlab-CI? AFAIK the last 
iteration of your patches has been weeks ago, so I wonder whether you could 
finally send a new version with the requested fixes included? ... this topic 
slowly gets more and more urgent now that our Travis-CI is in process of 
dying...

  Thomas


