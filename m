Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D9F5B9F3A
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Sep 2022 17:56:20 +0200 (CEST)
Received: from localhost ([::1]:44096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYrDv-0007Hr-L0
	for lists+qemu-devel@lfdr.de; Thu, 15 Sep 2022 11:56:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oYrC6-0005eh-Id
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 11:54:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oYrC3-0001Tp-NS
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 11:54:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663257261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5BHU+TRHjfSuhw2fnLchRb13tJmvJCirK2ZnwkvHRCM=;
 b=NIUg7jNIdgVjVE7m46Ut6w4ty8el7GMbzGKLNPBaLLLbJ8Zgvkvvsi1FIF+QZI2403+0PQ
 9dpf/VvLkKbNvQzcQnk0kxVo4xwZwW80HThh4kV+JHACRugYcDqOCuPqpgATyteAcKyHo1
 CWxlRdgSK5Nxib+fgPgLvmCAnIgC1ng=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-341-7Rnfu0yLO12Pxsv9ptl9Mw-1; Thu, 15 Sep 2022 11:54:20 -0400
X-MC-Unique: 7Rnfu0yLO12Pxsv9ptl9Mw-1
Received: by mail-wr1-f71.google.com with SMTP id
 i27-20020adfaadb000000b0022a48b6436dso4379430wrc.23
 for <qemu-devel@nongnu.org>; Thu, 15 Sep 2022 08:54:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=5BHU+TRHjfSuhw2fnLchRb13tJmvJCirK2ZnwkvHRCM=;
 b=bg+5pgH5zpQ85LssX7n5wtt60VGl3s1/iXV1dWzjGrYzL7uTmM66hqFyYyeq+LRzp2
 dEOSCziV48VR9wIKIhKOPnScXdGekzW2gsn/LAOVZGKa24d3lO4ZM2L2EfbtRB1mRsLM
 yvFuiN5T1g4SzgyRWkjR70g4JO9XTAKLbhq1DHU8WJTTfqmgBj1NfUV9DculzD66fWaV
 9BIX8J3Hqfww3URYmtFGlliTp9qzV70njnoD41Ns7xNbSczZQpkLVSF0OwPxyjZMBpG1
 DQvexRtiNX16FU42sSzk1OALU6AYF+UdaHkjMx9a73AU7LcVBf06Owb/5bB93qAHFYzp
 2gBw==
X-Gm-Message-State: ACrzQf38rkJAnsMXR9Ys1yIltEQxmXgWHq9sD4ZFW9gOfIubNDEuGiSJ
 gaeWMZjEwi/YjaUGciLBdklKuHzNLkKNHy5a1WkXvV61cLvIox+5hrZlmiJe1w9Z6qMnLy5nNdt
 8yYrsh0CXJ3UPSgU=
X-Received: by 2002:a5d:47aa:0:b0:226:dbf6:680c with SMTP id
 10-20020a5d47aa000000b00226dbf6680cmr197018wrb.581.1663257259353; 
 Thu, 15 Sep 2022 08:54:19 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6m31tqElu5YTc8sT7UtCigRxznbh8rmPBuMGYOXVJjOzUHZb7qmP9TCZMqgiibrGCGNij99w==
X-Received: by 2002:a5d:47aa:0:b0:226:dbf6:680c with SMTP id
 10-20020a5d47aa000000b00226dbf6680cmr197003wrb.581.1663257259146; 
 Thu, 15 Sep 2022 08:54:19 -0700 (PDT)
Received: from [172.20.194.41] ([79.140.208.123])
 by smtp.gmail.com with ESMTPSA id
 l4-20020a05600c47c400b003b483000583sm2958571wmo.48.2022.09.15.08.54.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Sep 2022 08:54:18 -0700 (PDT)
Message-ID: <29bfc681-0e37-e799-85fa-bf8ed0d096eb@redhat.com>
Date: Thu, 15 Sep 2022 16:54:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 1/4] scripts/ci/setup: ninja missing from
 build-environment
Content-Language: en-US
To: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org, Cleber Rosa <crosa@redhat.com>
Cc: =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
References: <20220914124153.61017-1-lucas.araujo@eldorado.org.br>
 <20220914124153.61017-2-lucas.araujo@eldorado.org.br>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220914124153.61017-2-lucas.araujo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.816, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On 14/09/2022 13.41, Lucas Mateus Castro(alqotel) wrote:
> From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
> 
> ninja-build is missing from the RHEL environment, so a system prepared
> with that script would still fail to compile QEMU.
> Tested on a Fedora 36
> 
> Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
> ---
>   scripts/ci/setup/build-environment.yml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/scripts/ci/setup/build-environment.yml b/scripts/ci/setup/build-environment.yml
> index 232525b91d..6df3e61d94 100644
> --- a/scripts/ci/setup/build-environment.yml
> +++ b/scripts/ci/setup/build-environment.yml
> @@ -150,6 +150,7 @@
>             - libepoxy-devel
>             - libgcrypt-devel
>             - lzo-devel
> +          - ninja-build
>             - make
>             - mesa-libEGL-devel
>             - nettle-devel

Looks like the list used to be sorted alphabetically, so maybe you should 
sort it in some lines later?

And I wonder why this hasn't been noticed before ... Cleber, was this in use 
after all?

  Thomas


