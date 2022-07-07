Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5881656A0D5
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 13:06:05 +0200 (CEST)
Received: from localhost ([::1]:52968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9PKd-0000AF-RX
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 07:06:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9PI6-0006zq-Bz
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 07:03:26 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:43764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9PI4-0002el-Gy
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 07:03:26 -0400
Received: by mail-pg1-x536.google.com with SMTP id 73so2417471pgb.10
 for <qemu-devel@nongnu.org>; Thu, 07 Jul 2022 04:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=BzTeCVGses3LC10W0yTEitv12gWNf8Zi+ab3tcU2txE=;
 b=dSD2T9tiJrL2txAsePrQnRQ3Xqhe+zDJD8v0TKgyXJMSvGOlE0JnaiLyo0JvfRSk6C
 unGnXDA15zrPDLfI49cVLLcq09393ulCaOFOtbtPR7kq2AjKNJZSguKUTNsZSS/bolvy
 k+frOXXMsn3OgPorg6Sk+YdCfg+bDuZdjodvqYbMNotFSKlh86FMX25+OdbQ2/vjbxmg
 Ic4wNj89wduiCTz6VckH7ay5e9ZCjMNacXB1yDzc026agEGi+/HgpHDHcahkUAwhixAq
 yL3oqDiLbeV7+cA2RYfWB8q04PfLTPMMDF+4/XOMyqv1IpnbsOhYEpD9+wkZ3CdCrlP8
 KqcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BzTeCVGses3LC10W0yTEitv12gWNf8Zi+ab3tcU2txE=;
 b=voIKTJ+f8G8rMfRPv1ylSv8L5juzeJcIojpDZP0Gp3c0bnSGGTKY+asHlBNh6NABMQ
 LwIPIT16XxKaxXFtRSaSHveFwacT9yYx6P62NCyD1/7/bS9vh//rb3Q3NwTPNeSrNxqO
 na9vxOZbkhDbLYV213O6PKuM39CQ7DIifq6FeFCXmpx1WBnVCOMaQOf0JBlxLtyugFK8
 NkRnaoa8MIZioeZLBEZlsiv9DsD4ToQn0ZfVteVE6hDgeN4q6Nvs1dRbUfgk+IrWhk+V
 5ogeL8LSheqV5UhRsu/6DnAMeKENPcmI5WHKD2aHhLKtCzRPXiJo7+sZ7Y0iHC5OGKw3
 2dfQ==
X-Gm-Message-State: AJIora9LV9//3JDp255jcAmnutIJbiX65W6+HoQbHEUUFyox8/OVUBH2
 1g+r7nqbcYo/jP6W3I1evjU1hw==
X-Google-Smtp-Source: AGRyM1vfvANWvr4UyBs2Z5OdrDlRdADvqDiM5oJaLtiNPv9Y3HMmjAcC76dE9gRIuYJ83NPZj/uIlA==
X-Received: by 2002:a05:6a00:179c:b0:525:6823:2972 with SMTP id
 s28-20020a056a00179c00b0052568232972mr52706330pfg.60.1657191803004; 
 Thu, 07 Jul 2022 04:03:23 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 q5-20020a170902a3c500b0016beceac441sm7008760plb.195.2022.07.07.04.03.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Jul 2022 04:03:22 -0700 (PDT)
Message-ID: <86edd6d4-63bf-888b-78c8-096ea07f888d@linaro.org>
Date: Thu, 7 Jul 2022 16:33:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3 05/13] tests/vm: update sha256sum for ubuntu.aarch64
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Daniel Berrange <berrange@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Michael Roth <michael.roth@amd.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <20220707040310.4163682-1-jsnow@redhat.com>
 <20220707040310.4163682-6-jsnow@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220707040310.4163682-6-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 7/7/22 09:33, John Snow wrote:
> This checksum changes weekly; use a fixed point image and update the
> checksum so we don't have to re-download it quite so much.
> 
> Note: Just like the centos.aarch64 test, this test currently seems very
> flaky when run as a TCG test.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   tests/vm/ubuntu.aarch64 | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/vm/ubuntu.aarch64 b/tests/vm/ubuntu.aarch64
> index b291945a7e9..fc9c2ce22ff 100755
> --- a/tests/vm/ubuntu.aarch64
> +++ b/tests/vm/ubuntu.aarch64
> @@ -32,9 +32,13 @@ DEFAULT_CONFIG = {
>   class UbuntuAarch64VM(ubuntuvm.UbuntuVM):
>       name = "ubuntu.aarch64"
>       arch = "aarch64"
> +    # NOTE: The Ubuntu 18.04 cloud images are updated weekly. The
> +    # release below has been chosen as the latest at time of writing.
> +    # Using the rolling latest release means the SHA will be wrong
> +    # within a week.

Isn't 18.04 unsupported now?  Surely bumping to 20.04 or 22.04 would be better.


r~

>       image_name = "ubuntu-18.04-server-cloudimg-arm64.img"
> -    image_link = "https://cloud-images.ubuntu.com/releases/18.04/release/" + image_name
> -    image_sha256="0fdcba761965735a8a903d8b88df8e47f156f48715c00508e4315c506d7d3cb1"
> +    image_link = "https://cloud-images.ubuntu.com/releases/bionic/release-20220610/" + image_name
> +    image_sha256="0eacc5142238788365576b15f1d0b6f23dda6d3e545ee22f5306af7bd6ec47bd"
>       BUILD_SCRIPT = """
>           set -e;
>           cd $(mktemp -d);


