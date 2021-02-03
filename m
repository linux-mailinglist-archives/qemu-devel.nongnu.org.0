Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB83630D8AE
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 12:30:56 +0100 (CET)
Received: from localhost ([::1]:58694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7GN5-0008QV-JN
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 06:30:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l7GLY-00080M-Fl
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 06:29:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44175)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l7GLV-0003CS-Qg
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 06:29:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612351756;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MXAfMVUHEm8rgFbWX95z0sGtW69EQPPlNKCDIxtXqd0=;
 b=UTWkss0z2Cskgh8e3Ir67aJb64QL54eX66jQyqACjBMWfJkJvGeYlOm46u91zVj06NrOe4
 623BEXrZ1t3Z0bmF8PdPwPaLRuoml9iivWkx0cmWs90W4vO6BcxKdhV9b00RRRwQN6k7qk
 M9dyoY2LYVv0r6zAfeTU5ZjLNGlhZ9Y=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-325-dM1JxU3nNOKfDUbh4W6EqQ-1; Wed, 03 Feb 2021 06:29:14 -0500
X-MC-Unique: dM1JxU3nNOKfDUbh4W6EqQ-1
Received: by mail-ej1-f71.google.com with SMTP id ia14so4082468ejc.8
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 03:29:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MXAfMVUHEm8rgFbWX95z0sGtW69EQPPlNKCDIxtXqd0=;
 b=DXEGn9WZVX1fv16CmU8S1/yN+qPJ+bfj4GoHouIExPO7929LW9TBO/00wS3fYZ46vf
 EVEvOlSOi/baOCP5Dpbr9f3r3UZHpR2BRKi+aFVy8iju9pt6g9U15h+oZuBVC8XGgooc
 /qvrKM0WQ44W8rQ1slg0GPatJ230km3JaNSybHo5MDJ1uoTeKC7bwCLYDosFgWdVAMEw
 cu5N3Dhx0N8DeTIBR8/AOF15pfHICehH3WJSALP3m7sMB56eI0VCynF1Gn5AWvtBxShW
 PFDtp+Kd1Z3USsC5iM0Bn8XyYfQQZiMUCXbwREmjcr58ENrOZ3tCO+TNUFwWsfOd2FhV
 rR/g==
X-Gm-Message-State: AOAM530bMUgeaFSTLWbsidMC0nnEP3EHG2gbnf9I2VXA0dAkDabcFgeX
 Qxc1GdQUgQAeI1pVNnq3hOwVMUWu0b9q6sfSGAxxZt4WuYtTo0EalzaHeCqf68/qB+W73QAArAS
 0MnsBT3Nps3dLX9fYOvyZ92r9F9twJLO6IUqt5nHSHbUr5RxJZ06yaIPz2Y3MJqGk
X-Received: by 2002:a17:906:3101:: with SMTP id
 1mr2754246ejx.115.1612351753077; 
 Wed, 03 Feb 2021 03:29:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy8Sywuwy0DXN7AWjpbDrZZYfxYctcZ6qGKqU3DU4Xsy+sGk6S3lAQgZD8HrIKyW1WgAmdwOg==
X-Received: by 2002:a17:906:3101:: with SMTP id
 1mr2754230ejx.115.1612351752786; 
 Wed, 03 Feb 2021 03:29:12 -0800 (PST)
Received: from [192.168.1.36] (107.red-83-59-163.dynamicip.rima-tde.net.
 [83.59.163.107])
 by smtp.gmail.com with ESMTPSA id gz14sm861903ejc.105.2021.02.03.03.29.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Feb 2021 03:29:11 -0800 (PST)
Subject: Re: [PULL v2 00/21] target-arm queue
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210203101715.9229-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <33cd7e2e-2947-f127-17af-8fc9e917ffbb@redhat.com>
Date: Wed, 3 Feb 2021 12:29:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210203101715.9229-1-peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.155, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/3/21 11:17 AM, Peter Maydell wrote:
> no changes to v1, except adding the CVE identifier to one of the commit
> messages.

Thank you Peter for taking the time to do this change.

> 
> -- PMM
> 
> The following changes since commit cf7ca7d5b9faca13f1f8e3ea92cfb2f741eb0c0e:
> 
>   Merge remote-tracking branch 'remotes/stefanha-gitlab/tags/tracing-pull-request' into staging (2021-02-01 16:28:00 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20210203
> 
> for you to fetch changes up to fd8f71b95da86f530aae3d02a14b0ccd9e024772:
> 
>   hw/arm: Display CPU type in machine description (2021-02-03 10:15:51 +0000)
> 
> ----------------------------------------------------------------
> target-arm queue:
>  * hw/intc/arm_gic: Allow to use QTest without crashing
>  * hw/char/exynos4210_uart: Fix buffer size reporting with FIFO disabled
>  * hw/char/exynos4210_uart: Fix missing call to report ready for input
>  * hw/arm/smmuv3: Fix addr_mask for range-based invalidation
>  * hw/ssi/imx_spi: Fix various minor bugs
>  * hw/intc/arm_gic: Fix interrupt ID in GICD_SGIR register
>  * hw/arm: Add missing Kconfig dependencies
>  * hw/arm: Display CPU type in machine description
> 
> ----------------------------------------------------------------


