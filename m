Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D2F396E7C
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 10:05:36 +0200 (CEST)
Received: from localhost ([::1]:56568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnzP5-0001xl-El
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 04:05:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lnzNk-00016H-LG
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 04:04:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lnzNi-00047v-8k
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 04:04:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622534649;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qEKMdcRgAHOXZOXZjqFJaNgfDwrRNnICFKZA0rswVVI=;
 b=K3GcWW78iUb/Bctx6vKSysPoaY6E9bF9o/wU/4QqGHnXtVyYtFttBH83K5b3/CHgRu/TXt
 1rHmOPK0gVpnCvvF2Ca4xYIDyA1ZRpKYqyWn4BBUAHV8XqWPMlUbXscuuwZkx+rv0t025z
 hJwmU5XTPs3QjxXnkVZ2pkymMfQM9RQ=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-kFon-PRHOKmxqGspr6S_Vg-1; Tue, 01 Jun 2021 04:04:06 -0400
X-MC-Unique: kFon-PRHOKmxqGspr6S_Vg-1
Received: by mail-ej1-f72.google.com with SMTP id
 am5-20020a1709065685b02903eef334e563so1389568ejc.2
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 01:04:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qEKMdcRgAHOXZOXZjqFJaNgfDwrRNnICFKZA0rswVVI=;
 b=cuJeANfpuRIVPSGgCrYM8uiPdh/B3v7HFkQ/Td9E+mA/4Y4F6RoX5VtVp+cbtYk+cx
 FJf60s2wn4yhuUxzWq2Ryu+83NdZsGqklvgYXK3VEGIUSmcggXD0FL66oejhzDMKeMD3
 SPCl6OF6BCByRc1UlVua+NIBqg7TbWD5RzD7f93kfZsxt4yg2cMmPaurUMvnbdB9edTA
 AsSDBGVpd6sYHzVyBfEjwFujV6kQnih99rrsEdfWC/UGl3IMpe1DMzJE8vFOzWTqsyIz
 bpWQhbE9ftzyrxNpuWYzsIHzDBLMZ2ztzNguHFZhWLHo5HMF0HA5oFFMkd43FGNhxZ4E
 P58w==
X-Gm-Message-State: AOAM5314LqM/eZ/XCqfmNV/gHIo4Y8u7rqi3FW2YC4CGgCAJWtZ8JRUL
 1CYEIr0vBESgGFeQAhIhM19CqFOhGR+gE/F7Yb2bwkwO+X1hjFT+Scx1ioomievAPR1xVh0U7b2
 P0mc9uC41QCnCTRk=
X-Received: by 2002:a05:6402:1590:: with SMTP id
 c16mr22467061edv.7.1622534645438; 
 Tue, 01 Jun 2021 01:04:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzp7/Fhuaf7c7U73q93j9BYiBmCpA4K7X0Cn8OD9++7yahhPWfGFOLvgrfMexH7av8qbAe5yA==
X-Received: by 2002:a05:6402:1590:: with SMTP id
 c16mr22467026edv.7.1622534645167; 
 Tue, 01 Jun 2021 01:04:05 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id k21sm7586982edo.41.2021.06.01.01.04.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Jun 2021 01:04:04 -0700 (PDT)
Subject: Re: [RFC PATCH] configure: allow the overriding of default-config in
 the build
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210528163116.31902-1-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <679398ae-779b-0c59-4d37-981e5a1dc3f0@redhat.com>
Date: Tue, 1 Jun 2021 10:04:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210528163116.31902-1-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.591, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/28/21 6:31 PM, Alex Bennée wrote:
> While the default config works well enough it does end up enabling a
> lot of stuff. For more minimal builds we can pass a slimmed down list
> of devices and let Kconfig work out what we want. For example:
> 
>   ../../configure --without-default-features \
>     --target-list=arm-softmmu,aarch64-softmmu \
>     --with-devices-aarch64=(pwd)/../../configs/aarch64-softmmu/aarch64-softmmu-64bit-only.mak
> 
> will override the aarch64-softmmu default devices to one of our own
> choosing.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  configure                                        | 16 ++++++++++++++++
>  .../aarch64-softmmu-64bit-only.mak               | 10 ++++++++++
>  meson.build                                      |  3 ++-
>  3 files changed, 28 insertions(+), 1 deletion(-)
>  create mode 100644 configs/aarch64-softmmu/aarch64-softmmu-64bit-only.mak

Surprisingly simple :)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


