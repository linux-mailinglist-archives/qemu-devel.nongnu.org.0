Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E65C5AF4DB
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 21:54:48 +0200 (CEST)
Received: from localhost ([::1]:45122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVeeh-0007iE-QO
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 15:54:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oVecx-00064W-P7; Tue, 06 Sep 2022 15:52:55 -0400
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35]:40911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oVecw-0000SR-01; Tue, 06 Sep 2022 15:52:55 -0400
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-1278a61bd57so12310070fac.7; 
 Tue, 06 Sep 2022 12:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=N5wuiv0P9HbXSVszGS4Ytxq2rLkc7Am8sIQ0eHY6+Tc=;
 b=VLpWS13J6SyAJ83m83PEQjjSSBiU6g7xDWvK7VJPyfzNi5b3NfUVXsPxVkTKPEP76S
 TBfVoMZJg3bS/VZ74jT6nZYCsntWbQvC8LzS4IABwQWjJCcSGh/yhfVqyQQdccDLP5BD
 8K3+NOibP2iibpgX/lOqkn1MW38VDSfthlJkUXOFjBigMldL4sSd8Lk+1PR4QZD5RXCr
 8LdFoQAu5c5WXOYASzyNkzCUAwMqXaGp6bqeNJ2jB5WZMJC8eCwZDU23R3yRqH+QEQMQ
 VJ6rGSv9+YkruRlUBmRo0lyWJEkCFyQTKMNAF5421I2YYAf9rt/+jbwm4Edhb1wFjXp3
 /gOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=N5wuiv0P9HbXSVszGS4Ytxq2rLkc7Am8sIQ0eHY6+Tc=;
 b=dDRWvvmSopvNYaeCzFIl5cLQJp58t26GrAv3W9A5mJUJupN/sE+kM7vbHpwihXpDcH
 0xb+ppDdw8BVf7p1cmR/jCv1ymUAysTUpHuSp8sjA0aD3t376kYW+h7CCnFd2EsDpBDi
 b2nL5zelFAr14t2IlGud6v/WXNQ0TQ3qKOTglsAz9dqoYhXslcwdvVIlXJDG3hVaHmQC
 ZoBgX+l5XCFWAmFa9LcYgz0XUFXFTltqnE3Nwu+5YaERnUJ+xUtstELBxamDmc+77edU
 s7OMCB6eXg4KLIuVCcu5CbVQ6mmGD1PPCS3bxRzoEQNicgS4IDfwbPq2EGZPBcCQ4myT
 OGIA==
X-Gm-Message-State: ACgBeo2rvCYJ/t6653nWyRrgQ5AUgyhy1bSObjYUTnWetCiE3o01+0d6
 k9e/zbii46/b6I8Ahdu3ri8=
X-Google-Smtp-Source: AA6agR6QxpJqxIBjLICuQcjbhynn064cXeML/agbk7SPcxD233WoqzVZBycOvQx/C+5d36kLCjjHCg==
X-Received: by 2002:a05:6870:2112:b0:127:76f4:83c4 with SMTP id
 f18-20020a056870211200b0012776f483c4mr5053942oae.171.1662493972060; 
 Tue, 06 Sep 2022 12:52:52 -0700 (PDT)
Received: from [192.168.10.102] (200-207-147-180.dsl.telesp.net.br.
 [200.207.147.180]) by smtp.gmail.com with ESMTPSA id
 q6-20020a0568080ec600b00342ece494ffsm5743373oiv.46.2022.09.06.12.52.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Sep 2022 12:52:51 -0700 (PDT)
Message-ID: <e8609bda-865f-42c8-9234-75b082ca9df0@gmail.com>
Date: Tue, 6 Sep 2022 16:52:48 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 0/8] Patch series to set up a ppc64le CI
Content-Language: en-US
To: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220727163632.59806-1-lucas.araujo@eldorado.org.br>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220727163632.59806-1-lucas.araujo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::35;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x35.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-1.752,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Lucas,

If you're still interested, patches 1-4 are worth re-sending in separate.
You'll need to address Daniel's comments on patch 1. The other 3 patches
LGTM.

Patches 5-8 can wait. We're not certain about Unicamp's Minicloud
availability in the future, so there's no point in setting up our CI
based on Minicloud's specifics.


Thanks,

Daniel

On 7/27/22 13:36, Lucas Mateus Castro(alqotel) wrote:
> This patch series aim to make easier to set up a compilation and CI
> environment in PPC64 and PPC64LE machines.
> 
> The first 2 patches is a fix not related to ppc64.
> Patch 3 and 4 also affect some other architectures.
> Patches 5 to 7 are adding Power specific additions.
> 
> Patch 8 is a RFC for a current way to run the docker tests in PPC64LE.
> 
> Lucas Mateus Castro(alqotel) (8):
>    tests/docker: Fix alpine dockerfile
>    scripts/ci/setup: ninja missing from build-environment
>    scripts/ci/setup: Fix libxen requirements
>    scripts/ci/setup: spice-server only on x86 aarch64
>    scripts/ci/setup: Add ppc64le to vars.yml template
>    scripts/ci/setup: Add Fedora to build-environment.yml
>    scripts/ci/setup: Added debian to build-environment.yml
>    tests/docker: Selective line reading by python script
> 
>   scripts/ci/setup/build-environment.yml | 54 +++++++++++++++++++++-----
>   scripts/ci/setup/vars.yml.template     |  1 +
>   tests/docker/docker.py                 | 15 +++++--
>   tests/docker/dockerfiles/alpine.docker |  3 ++
>   4 files changed, 61 insertions(+), 12 deletions(-)
> 

