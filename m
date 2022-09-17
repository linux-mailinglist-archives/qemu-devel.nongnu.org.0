Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD065BBAAA
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Sep 2022 23:22:14 +0200 (CEST)
Received: from localhost ([::1]:36228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZfGP-00014n-Kw
	for lists+qemu-devel@lfdr.de; Sat, 17 Sep 2022 17:22:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oZfEi-00079f-Up
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 17:20:29 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:33375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oZfEh-0005wy-BO
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 17:20:28 -0400
Received: by mail-wr1-x435.google.com with SMTP id k9so41397430wri.0
 for <qemu-devel@nongnu.org>; Sat, 17 Sep 2022 14:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=IoZR9NAgcwTFrqDa80EE8teDbIOmZ9sHSGdh4iVC5ac=;
 b=k3ksG1a+lFJtYhvNuufJI2gxqVPk//jh9ZHcNPG0WBEpReIhpGx8hRUeLxyIRIFvFb
 oJIdOjwQejfvsFgcQmeCr3bWU/ICU2432g/YE1CNPiYoDoAl4wMGF+rkAhBGiuuPbNa9
 YCZ7IWs0bfF1Fxhtfj6T/mlw6g61aetc4kr/tghzkLxVmLhiM00QVa7YLhUtxnr4xdvB
 d8dui/cZk6bQ2LoW3GZ7C7/zorLNZa9alEhD9ttPSLZxX4B5YolVXXIIntuZb57/A03Z
 LgQdjPFt14NZMzm8AIww/y9ifewB5IkZhHyMhu6LhfPMKZz19K3njM4s85bLMG5IiAca
 a/5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=IoZR9NAgcwTFrqDa80EE8teDbIOmZ9sHSGdh4iVC5ac=;
 b=tG1YEjIgmXSpNgAkohHEgHnh0R8+DN7FsKOjgcRtzqbb+zzdfOhQgNWNsJBhWiAcOh
 ZP8EwC+kax7WMg6u+41OGGRoKYHkC2ODMREB1fu6Dm9xucsaVZGqs85VX+rwh970SF0K
 4KOEovZ4/5gsmW3h27ExVJCcSfIPj9kGvmhPoMI7xOmyuzvr8jJL3LznnPSIwyo5FJeg
 At7WeityGdnVPkrUZyrEAOrsa7hyEhJ37xx0lQWlDSA0gebqwbf8rWfue0ZDLfj7df1d
 x+qy8YxqEOlqjSaey56tPCgDaIUdpgKk6pc/2eG5nrPguC1wUnT0l2qLebEDTpK42sbh
 yHSQ==
X-Gm-Message-State: ACrzQf32OoxMUvDLHUrHUCW6VSb6Q5Ih/4blN8fiCtEA8K6nIt8YyYg6
 OcSftSla/OrT3sggepTHv6QNam0gth0=
X-Google-Smtp-Source: AMsMyM7Nx3HiV05g9JUbjcHbo1GCYWu1MJo/etsKkL7zTLuqtBiSSA8ajMmaLdZ9bWad672hXilM7Q==
X-Received: by 2002:a5d:522f:0:b0:228:dc7f:b9a8 with SMTP id
 i15-20020a5d522f000000b00228dc7fb9a8mr6795814wra.617.1663449625896; 
 Sat, 17 Sep 2022 14:20:25 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 25-20020a05600c021900b003b332a7b898sm7022097wmi.45.2022.09.17.14.20.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Sep 2022 14:20:25 -0700 (PDT)
Message-ID: <24cd05bb-854c-0637-77c5-6d34df100d27@amsat.org>
Date: Sat, 17 Sep 2022 23:20:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH 2/7] scripts/nsis.py: Fix destination directory name when
 invoked on Windows
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
References: <20220908132817.1831008-1-bmeng.cn@gmail.com>
 <20220908132817.1831008-3-bmeng.cn@gmail.com>
In-Reply-To: <20220908132817.1831008-3-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-3.529,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 8/9/22 15:28, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> "make installer" on Windows fails with the following message:
> 
>    Traceback (most recent call last):
>      File "G:\msys64\home\foo\git\qemu\scripts\nsis.py", line 89, in <module>
>        main()
>      File "G:\msys64\home\foo\git\qemu\scripts\nsis.py", line 34, in main
>        with open(
>    OSError: [Errno 22] Invalid argument:
>    'R:/Temp/tmpw83xhjquG:/msys64/qemu/system-emulations.nsh'
>    ninja: build stopped: subcommand failed.
> 
> Use os.path.splitdrive() to form a canonical path without the drive
> letter on Windows. This works with cross-build on Linux too.
> 
> Fixes: 8adfeba953e0 ("meson: add NSIS building")
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
>   scripts/nsis.py | 12 +++++++-----
>   1 file changed, 7 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

