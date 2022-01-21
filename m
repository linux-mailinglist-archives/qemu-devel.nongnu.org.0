Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9A5495EB0
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 12:57:47 +0100 (CET)
Received: from localhost ([::1]:49058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAsY6-0004Pg-Dm
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 06:57:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nAsMY-0007yf-KD
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 06:45:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nAsMU-0001qu-FM
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 06:45:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642765545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pPvj8xsEzBenLtxZN4TAutLYf7LsqWpm0leHZE3d//U=;
 b=X8T7vZguf/kJSugWL4iTR619ssRL4rlELBfFP5Xurb1P5vxdU/730XwXSvt6EKaQ6r35Qj
 4jfXYv0vXgzsueHcTwRL8BylZFAKAnUw1O/ANLUSBBn8oEs7boSY507lYt9U3WnRUu2RUo
 EkuFjSaaTD8b5CElSv9VgF1T4IKyqLI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-133-ZMfwK-bTPMSM0GCxAm1Lpg-1; Fri, 21 Jan 2022 06:45:39 -0500
X-MC-Unique: ZMfwK-bTPMSM0GCxAm1Lpg-1
Received: by mail-wm1-f71.google.com with SMTP id
 i26-20020a1c541a000000b0034dc8bd7078so4134375wmb.8
 for <qemu-devel@nongnu.org>; Fri, 21 Jan 2022 03:45:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pPvj8xsEzBenLtxZN4TAutLYf7LsqWpm0leHZE3d//U=;
 b=mFwoXQVIZ6fxDazRqIh37TsrEBI3UNjuiaqIgWlws6Ff+nV3NHM6LJU/bRpoeCAqvj
 6andB9fOmUkccPClzvxqnJq/gnu8ILBxEY859pIaNe+0GWJ2jaSgh7B61VblL9RU6UA0
 AgJ7szsdF9gVFxbc31WWoOv5Gey3cYYqdB8guJ5SKU5cQOl+My0DxFmkhBDxDHAAGCWG
 9hXar0YOB1fc4m4S3tgSx6L5UhzIrpKIKXmnE86FfDUHP6A2s3MuXr96HaGqUYVITwvN
 pb4TC+UlTolegjgCO/XoZ7ka89uSo8cTZK/WrSIcBI02Ml93qo/57hgzy9yGiAH0OiVk
 68qQ==
X-Gm-Message-State: AOAM532BDNrd0yVyZMwUm1uQ5E97kt7D0TbEXpg4TnjlvoUBY4B5iRD2
 9ta8o5uxoM5wtSSHHzZARl0jwJ/0Y6ityL0bhociAQISJ5+pcsXdcHh+xD+tzyg79TrHiEpnPFu
 mvVnrQvDXM2d5lxM=
X-Received: by 2002:a05:600c:3510:: with SMTP id
 h16mr386277wmq.162.1642765538220; 
 Fri, 21 Jan 2022 03:45:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw39zdCj8yT+tFbx9cMgwMBShdkbIHCIZLLjGiGIobgDqy97xS0r9PFx07rGQIsNm2ZqJvDrQ==
X-Received: by 2002:a05:600c:3510:: with SMTP id
 h16mr386257wmq.162.1642765537948; 
 Fri, 21 Jan 2022 03:45:37 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id m2sm5551766wrr.6.2022.01.21.03.45.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Jan 2022 03:45:37 -0800 (PST)
Message-ID: <12ca363f-5895-c7a5-db55-4f361c221dfc@redhat.com>
Date: Fri, 21 Jan 2022 12:45:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v4 6/8] drop libxml2 checks since libxml is not actually
 used (for parallels)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220121103623.288054-1-f4bug@amsat.org>
 <20220121103623.288054-7-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220121103623.288054-7-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Yonggang Luo <luoyonggang@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/01/2022 11.36, Philippe Mathieu-Daudé wrote:
> From: Michael Tokarev <mjt@tls.msk.ru>
> 
> For a long time, we assumed that libxml2 is necessary for parallels
> block format support (block/parallels*). However, this format actually
> does not use libxml [*]. Since this is the only user of libxml2 in
> whole QEMU tree, we can drop all libxml2 checks and dependencies too.
> 
> It is even more: --enable-parallels configure option was the only
> option which was silently ignored when it's (fake) dependency
> (libxml2) isn't installed.
> 
> Drop all mentions of libxml2.
> 
> [*] Actually the basis for libxml use were introduced in commit
>      ed279a06c53 ("configure: add dependency") but the implementation
>      was never merged:
>      https://lore.kernel.org/qemu-devel/70227bbd-a517-70e9-714f-e6e0ec431be9@openvz.org/
> 
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Message-Id: <20220119090423.149315-1-mjt@msgid.tls.msk.ru>
> Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> [PMD: Updated description and adapted to use lcitool]
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   meson.build                                     | 6 ------
>   block/meson.build                               | 3 +--
>   meson_options.txt                               | 2 --
>   scripts/checkpatch.pl                           | 1 -
>   scripts/ci/org.centos/stream/8/x86_64/configure | 1 -
>   scripts/coverity-scan/coverity-scan.docker      | 1 -
>   scripts/coverity-scan/run-coverity-scan         | 2 +-
>   7 files changed, 2 insertions(+), 14 deletions(-)

I think this should touch ./scripts/meson-buildoptions.sh , too?

If you also remove it from that file:

Reviewed-by: Thomas Huth <thuth@redhat.com>


