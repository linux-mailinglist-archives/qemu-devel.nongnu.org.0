Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A1B35763C
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 22:42:28 +0200 (CEST)
Received: from localhost ([::1]:47126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUF0N-0000el-MH
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 16:42:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lUEyd-0008RN-0N
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 16:40:39 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:47097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lUEya-0006aL-NV
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 16:40:38 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 q6-20020a17090a4306b02900c42a012202so119827pjg.5
 for <qemu-devel@nongnu.org>; Wed, 07 Apr 2021 13:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Z+lepyBu06/G+jZBNMFOzAhCDgL8Tu4oHzkuCLgR3tM=;
 b=E/8ayHkniJIJgZ1e1vj7r3csuvbXyJLnnoBh+x+yp0VTrbSBpuB6BqUyRXJavmaPmJ
 4qkaFVnH5W6zMAfezN143Fgsqo+TUPBaScEvaZeqGneS7qZFqf0VWrDJtMXi+4FQWcMg
 gx4hzelGeOr+0pcTrstNPkfUejoaa1XdZL/U2sr8tVG7S/dMslgU/wsBrm2+u54ZyS3N
 fsSVFrHHJGSM5Eb3v1ZITt8FXjvSZcLheT/2VIz8Bu9cjyKSZT5SuuwblfRHdeNCyz7g
 CV/TRer3MET1JJ04laLXcfYs/Akuuw3SayVZ6nVDBf+tI8NWCPVGJ69ofAtpiww+uAwG
 iAww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Z+lepyBu06/G+jZBNMFOzAhCDgL8Tu4oHzkuCLgR3tM=;
 b=MWAiraamQlnlymCWLNw0acuxyk3Eb6oylhg3pXeuBlH79EbYBPSfz6SznCg1B9YSKm
 8Z0xJ9OUVz4D21t/dqw23FSruZtYkXMuedaY4yVSgOBDoY5FyOJENO2Jn1Sk/mRut6XU
 t08sr38PbJu1YV11IIyA+VgnPHVlq9dFnh92zvGmJ+MzfuE5y4zoFvoR6uc+5I7gtzM7
 m9h1gvYCPGH/BX9eMWX7AF4q8SCjNqHYFvfR9ROuXF0993V86BVpEY50WmLL7tcrCE+m
 iBudvs2JKIPd3YtywXIOfhxyb9dzQg+TcEOdv7stHccsai7ok2OvpuXuS9wGhAsa9bbl
 4RYA==
X-Gm-Message-State: AOAM533lvpITqBXK/Gr52+TondOO7t6fv4CMZoR8SzM3mI/cR0kUPWX6
 ePrD+bic5up07usOhyNe7FCLSA==
X-Google-Smtp-Source: ABdhPJwzbJTFb6LJQWh1QqHe/wWLu2gwIn+O7v0FgiDz4Ji+aMb7GjANktpzV4ifGUbUQ3BdluMfEg==
X-Received: by 2002:a17:902:d507:b029:e7:370d:b3c2 with SMTP id
 b7-20020a170902d507b02900e7370db3c2mr4688247plg.73.1617828035421; 
 Wed, 07 Apr 2021 13:40:35 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id g21sm6262988pjl.28.2021.04.07.13.40.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Apr 2021 13:40:34 -0700 (PDT)
Subject: Re: [PATCH 16/27] tests/acceptance: ARC: Add linux boot testing.
To: cupertinomiranda@gmail.com, qemu-devel@nongnu.org
References: <20210405143138.17016-1-cupertinomiranda@gmail.com>
 <20210405143138.17016-17-cupertinomiranda@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <de3647cd-e50c-818f-e968-54c5b253ff56@linaro.org>
Date: Wed, 7 Apr 2021 13:40:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210405143138.17016-17-cupertinomiranda@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: shahab@synopsys.com, linux-snps-arc@lists.infradead.org,
 claziss@synopsys.com, cmiranda@synopsys.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/5/21 7:31 AM, cupertinomiranda@gmail.com wrote:
> From: Cupertino Miranda <cmiranda@synopsys.com>
> 
> Just an acceptance test with ARC Linux booting.
> 
> Signed-off-by: Cupertino Miranda <cmiranda@synopsys.com>
> ---
>   tests/acceptance/boot_linux_console.py | 55 ++++++++++++++++++++++++++
>   1 file changed, 55 insertions(+)
> 
> diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
> index 1ca32ecf25..b5a781b6b4 100644
> --- a/tests/acceptance/boot_linux_console.py
> +++ b/tests/acceptance/boot_linux_console.py
> @@ -138,6 +138,26 @@ def test_mips_malta(self):
>           console_pattern = 'Kernel command line: %s' % kernel_command_line
>           self.wait_for_console_pattern(console_pattern)
>   
> +    def test_mips_malta(self):
> +        """
> +        :avocado: tags=arch:arc
> +        """
> +        deb_url = ('http://snapshot.debian.org/archive/debian/'
> +                   '20130217T032700Z/pool/main/l/linux-2.6/'
> +                   'linux-image-2.6.32-5-4kc-malta_2.6.32-48_mips.deb')
> +        deb_hash = 'a8cfc28ad8f45f54811fc6cf74fc43ffcfe0ba04'
> +        deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
> +        kernel_path = self.extract_from_deb(deb_path,
> +                                            '/boot/vmlinux-archs')
> +
> +        self.vm.set_console()
> +        kernel_command_line = self.KERNEL_COMMON_COMMAND_LINE + 'console=ttyS0'
> +        self.vm.add_args('-kernel', kernel_path,
> +                         '-append', kernel_command_line)
> +        self.vm.launch()
> +        console_pattern = 'Kernel command line: %s' % kernel_command_line
> +        self.wait_for_console_pattern(console_pattern)
> +

Careful with your rebasing.  This is obviously not what you wanted.


r~

