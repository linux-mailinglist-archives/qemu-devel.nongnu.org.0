Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 228C9493F30
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 18:42:21 +0100 (CET)
Received: from localhost ([::1]:54234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAEyS-0006Cm-6a
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 12:42:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAEu8-0002JT-DH
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 12:37:52 -0500
Received: from [2a00:1450:4864:20::330] (port=56195
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAEu3-0004IK-64
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 12:37:52 -0500
Received: by mail-wm1-x330.google.com with SMTP id c66so6578090wma.5
 for <qemu-devel@nongnu.org>; Wed, 19 Jan 2022 09:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vq9LkofsOmu9ov9mAWdDInrzG+Hqb92pGFOH9eq7msM=;
 b=TC1OwBTCfgOpsfG/hIgkqBqQ1PIb++iGO/ue629y2DW3NxiIYI4x1jeH2W1IOogXyF
 BdN0hwBAj2GOO45A198qw+KqhFVvSZkd0dve5KxoffOcnwj+7inZ3iDC6FB/xp8DCkTW
 TWq1niI1wFzPN05myg0cv/EJRy9CcuDtKkI6U8jwilGyp++2vjgv2io8mOoZ0KG8uQDK
 Bl/iYMnqXcAmevbvSYRUtxpzUZqFuQ8YCTv++yFNprcbCcrVjz6tmyKpi0qzlxIPaQFy
 MrNGemwWw2KcClyU0VVRxFKrWygyj9H5bMo9AvGWEOgNDVZlun4kmXH+lXbs4ANs+TUG
 E6wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vq9LkofsOmu9ov9mAWdDInrzG+Hqb92pGFOH9eq7msM=;
 b=lCYGIk51A45iooPTREKW5Xgo9/ldgkXts/0dTqp4EA534MponR4MybwTtSkSDTd25G
 43AzCan4survKXdW6Xvcfsb5zd+j761dU3751YCa3lxkLVd1GyY8cQfBWtf6Go6qOGWK
 ZzH8Bgp2DiMpFCv//mmoCRJRXrovj7AG+GM09ckm43/V39ej6+JGafF6uzONAXtEJZeF
 44w1Xs5X7MhDK086TOdNZaO19oaN9PoQR3VGEEJxSDpKsLgC5Ra3LAtbpEIsZvm3Gdu7
 m7D/W73P+q1stv68I5pB3FRi12xbnAGLSsi0CWNSyIg1yeEO64ut9pciUVy9XwM01NOq
 2nQA==
X-Gm-Message-State: AOAM532oUF4sAPLlcWGFZkkBwcczyBFAlDaI2c3kQHDgInIk5Y3BroXI
 V+MzM7STT6KprcSZlDvK6KPrKwSM72s=
X-Google-Smtp-Source: ABdhPJwma2t69YG34RNK6EPLsvwgOHa9DtGVPVqpvHSslgwbbPPOi6NsEw+FewmFiG6bwZABzLjBtg==
X-Received: by 2002:a5d:464e:: with SMTP id j14mr24015640wrs.252.1642613865426; 
 Wed, 19 Jan 2022 09:37:45 -0800 (PST)
Received: from [192.168.1.40] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id z5sm7609079wmp.10.2022.01.19.09.37.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jan 2022 09:37:45 -0800 (PST)
Message-ID: <86a5e201-27fc-c649-fbde-4e4018bff9d3@amsat.org>
Date: Wed, 19 Jan 2022 18:37:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 2/2] tests: Refresh lcitool submodule
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20220110124638.610145-1-f4bug@amsat.org>
 <20220110124638.610145-3-f4bug@amsat.org> <YehLgVvAW5SFIZli@redhat.com>
In-Reply-To: <YehLgVvAW5SFIZli@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 1/19/22 18:33, Daniel P. Berrangé wrote:
> On Mon, Jan 10, 2022 at 01:46:38PM +0100, Philippe Mathieu-Daudé wrote:
>> Refresh lcitool submodule and the generated files by running:
>>
>>   $ make lcitool-refresh
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  tests/docker/dockerfiles/alpine.docker        | 3 ++-
>>  tests/docker/dockerfiles/centos8.docker       | 3 +--
>>  tests/docker/dockerfiles/fedora.docker        | 3 +--
>>  tests/docker/dockerfiles/opensuse-leap.docker | 2 +-
>>  tests/docker/dockerfiles/ubuntu1804.docker    | 2 +-
>>  tests/docker/dockerfiles/ubuntu2004.docker    | 2 +-
>>  tests/lcitool/libvirt-ci                      | 2 +-
>>  7 files changed, 8 insertions(+), 9 deletions(-)

>> diff --git a/tests/lcitool/libvirt-ci b/tests/lcitool/libvirt-ci
>> index 29cec2153b9..8f48e54238d 160000
>> --- a/tests/lcitool/libvirt-ci
>> +++ b/tests/lcitool/libvirt-ci
>> @@ -1 +1 @@
>> -Subproject commit 29cec2153b9a4dbb2e66f1cbc9866a4eff519cfd
>> +Subproject commit 8f48e54238d28d7a427a541d6dbe56432e3c4660
> 
> If you update that further you'll get the commit you added to
> support macos-12.

This in done in the "Add support for macOS 12 build on Cirrus-CI"
patch:

https://lore.kernel.org/qemu-devel/20220110131001.614319-8-f4bug@amsat.org/

> regardless
> 
>   Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

Thanks!

