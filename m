Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3F4361941
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 07:27:08 +0200 (CEST)
Received: from localhost ([::1]:38328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXH0V-0006rp-AI
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 01:27:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lXGzc-0006Qf-7I; Fri, 16 Apr 2021 01:26:12 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:34448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lXGza-0007qU-Ma; Fri, 16 Apr 2021 01:26:11 -0400
Received: by mail-wr1-x434.google.com with SMTP id r7so13417282wrm.1;
 Thu, 15 Apr 2021 22:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7RGxv0M+Iq6bTjaG9UwTkoJp/FfxU6ethYRu5HZpzsA=;
 b=bkwPU5/VoS2+4XNg+BAEethVUSyrLGUB+E9+c7KPqiBXKfTfPMin5XKPsERdnItyfo
 60JE7alJTdRzLjFd3aSO6srEHaYAnvyXa7YDG7WaOrZn/TNToDmufy8VIKUD5OXDRH/j
 S2gIipk5ObfLLWjdeldGMGaYnArWawyf3RswCVbRs4k3DK8bwWv3l+oeafIoKBjc2OsP
 GkuokvUV6RESYNcvel+6TU//8NFvekCgztLKKeBmUH0GQR2owZ0ufac2CBpxvq1z4N95
 ds3z5V7BX5z4cs92nL7jsUdTHiQIyo2onLdmM5v0g1wpKGbqwJ89Ik8wJLQe/Mhl+Jj4
 HjJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7RGxv0M+Iq6bTjaG9UwTkoJp/FfxU6ethYRu5HZpzsA=;
 b=WaGm+Kmq49/fMk8pyBqJd9Nxp3oFji4YiiJU9QaIrdG2fT3OoC6OJ3bzvuh53EeY5M
 m5TFqg6yzYhlY8yVDU7RzA+UbVXUhyWgki8mdRn6Ctd1fhIS90ZE6hgu/HhxtoEpquPq
 6yO3vfbSdYsKPWu1VU3SbsuFu52l/4blwzGJPCY5zuewUoO3IR56m2401/G21RiQdlKT
 ifD0Fhs1ZfJ5N3DDZvG7tZ1entBwDYpaDHNs2151GcZssv4wXvKxNrB0R+ltWnLgw/DJ
 Rcnamj+KgYTKYow5pCeIMu8nsDcKdi97lWaVacYEtM8p+LAVJ39eHufFj8l7tIk5xeXf
 3XwA==
X-Gm-Message-State: AOAM531Xd1dK1gaxfpvoRPgYxu7FbFgqTsvfY2aMMNFmst26ENzEdEFC
 FnoUpN4ujrni3zmax0AS2Qs=
X-Google-Smtp-Source: ABdhPJwH65pec26nfn/vp6arRfS3eGuxf7krTegynkQ4Iukt+PMiaNad/F2VsikfY77WGlgdoyeFzw==
X-Received: by 2002:a5d:6d0c:: with SMTP id e12mr5984747wrq.321.1618550768424; 
 Thu, 15 Apr 2021 22:26:08 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id y17sm8304037wrq.76.2021.04.15.22.26.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Apr 2021 22:26:07 -0700 (PDT)
Subject: Re: [PATCH 3/8] tests/acceptance/linux_ssh_mips_malta.py: drop
 identical setUp
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
References: <20210415215141.1865467-1-crosa@redhat.com>
 <20210415215141.1865467-4-crosa@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <229a10ef-b912-2191-c670-a2c74a0870a4@amsat.org>
Date: Fri, 16 Apr 2021 07:26:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210415215141.1865467-4-crosa@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Beraldo Leal <bleal@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Auger Eric <eric.auger@redhat.com>,
 qemu-s390x@nongnu.org, Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/15/21 11:51 PM, Cleber Rosa wrote:
> These tests' setUp do not do anything beyong what their base class do.
> And while they do decorate the setUp() we can decorate the classes
> instead, so no functionality is lost here.

This is what I did first when adding this test, but it was not working,
so I had to duplicate it to each method. Did something change so now
this is possible?

> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  tests/acceptance/linux_ssh_mips_malta.py | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/acceptance/linux_ssh_mips_malta.py b/tests/acceptance/linux_ssh_mips_malta.py
> index 6dbd02d49d..e309a1105c 100644
> --- a/tests/acceptance/linux_ssh_mips_malta.py
> +++ b/tests/acceptance/linux_ssh_mips_malta.py
> @@ -19,6 +19,8 @@
>  from avocado.utils import ssh
>  
>  
> +@skipUnless(os.getenv('AVOCADO_TIMEOUT_EXPECTED'), 'Test might timeout')
> +@skipUnless(ssh.SSH_CLIENT_BINARY, 'No SSH client available')
>  class LinuxSSH(Test):
>  
>      timeout = 150 # Not for 'configure --enable-debug --enable-debug-tcg'
> @@ -65,11 +67,6 @@ def get_kernel_info(self, endianess, wordsize):
>          kernel_hash = self.IMAGE_INFO[endianess]['kernel_hash'][wordsize]
>          return kernel_url, kernel_hash
>  
> -    @skipUnless(ssh.SSH_CLIENT_BINARY, 'No SSH client available')
> -    @skipUnless(os.getenv('AVOCADO_TIMEOUT_EXPECTED'), 'Test might timeout')
> -    def setUp(self):
> -        super(LinuxSSH, self).setUp()
> -
>      def get_portfwd(self):
>          res = self.vm.command('human-monitor-command',
>                                command_line='info usernet')
> 


