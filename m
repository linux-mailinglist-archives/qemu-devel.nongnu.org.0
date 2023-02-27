Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8A76A4EC2
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 23:38:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWm7e-00058y-Pf; Mon, 27 Feb 2023 17:37:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWm7d-00056R-51
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 17:37:29 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWm7b-0003ax-6V
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 17:37:28 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 j19-20020a05600c191300b003eb3e1eb0caso3637678wmq.1
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 14:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XbZY/52H+OQe213KrVzK2m5CvFGI5WcJswUlaAABqTY=;
 b=MCqTjlXMb34uhTnd+5pl6V84iwQCvs8yAXZrR4h5ejpPxe+Lie8RzJls0BuML2wjEj
 PgqvyhieSvhIW+iDN2OClvPtb3M+qWY3IOwwN6yKEYUueGOHBc0BTYURVU7Vc3T79wq3
 Dps1XFyJFINHO6DyfNRQGwo1G+PTWB9dKnOabzkj7wHCL7y28U0xj/AAHHZHci1W4nw2
 9fGB5pR/zI6Q0GTu5QX/UZKiOgCMeXwRLw3U/BeDRRCxTjmbt8ey6srpKFzjdOTqGd4i
 V7zlrTp6l6vcqN6ODdTo57kz8uNjNRJosaU5917JdRDrZ6oI1AF17zq1hP3EZDyP6kX8
 ntZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XbZY/52H+OQe213KrVzK2m5CvFGI5WcJswUlaAABqTY=;
 b=3kAROe6NfHlZidcv+B85qlrDAK9xKAdW3Sv+VRsUH29D34nEwc4runWG8W+Bo8SIeN
 hY7gmyw334c9wEVWVxSGwH3DfT+a9QLDATFU7kvR8j62r95SHo4GLufm6+rrWyRDZ8AD
 ypN2iD+1o3DujfydIrLolIuqtBtenC0XdZSez4lyYaWa816TvPI0zN2AhKtReA08q8EG
 XWGMVbjdZhrju7Fb1hKbIWDcwvR3yLl5amryTR54+qnrJ2h0ncBhSfB+LbiFWvSLCoAR
 A0dUUup7yyPuvBmri+FvnKuNSa2Hdgp8y5x9XmxZveoM1lhmCDLCoP4xallWXgC5wz+y
 9zow==
X-Gm-Message-State: AO0yUKXlPH1vm0QdQrilpYBX/BEcHXYC5sHz4XoKKWitvapK5gTrvupu
 N79itwmDnHgFz1fKYDZKQB8kgKuhll+92zTO
X-Google-Smtp-Source: AK7set8GsHEOrfcIuSKHoAR8XdiB44VSXze8oDOe2NHg9jevYgILI0jPC2lptF4MPYyhb35Qhk1tXg==
X-Received: by 2002:a05:600c:755:b0:3ea:e834:d0d1 with SMTP id
 j21-20020a05600c075500b003eae834d0d1mr502335wmn.36.1677537445719; 
 Mon, 27 Feb 2023 14:37:25 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 p15-20020a7bcdef000000b003e200d3b2d1sm10464603wmj.38.2023.02.27.14.37.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 14:37:25 -0800 (PST)
Message-ID: <d4fe14bd-7f4c-084e-5c01-3348b82ba10d@linaro.org>
Date: Mon, 27 Feb 2023 23:37:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH] tests/acceptance/virtio-gpu.py: update fedora URL
Content-Language: en-US
To: Erico Nunes <ernunes@redhat.com>, qemu-devel@nongnu.org
References: <20230227145222.360719-1-ernunes@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227145222.360719-1-ernunes@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 27/2/23 15:52, Erico Nunes wrote:
> The URL listed previously is no longer valid and that caused the test
> to skip.
> 
> Signed-off-by: Erico Nunes <ernunes@redhat.com>
> ---
>   tests/avocado/virtio-gpu.py | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/avocado/virtio-gpu.py b/tests/avocado/virtio-gpu.py
> index 2a249a3a2c..e3b58fe799 100644
> --- a/tests/avocado/virtio-gpu.py
> +++ b/tests/avocado/virtio-gpu.py
> @@ -36,13 +36,13 @@ class VirtioGPUx86(QemuSystemTest):
>   
>       KERNEL_COMMAND_LINE = "printk.time=0 console=ttyS0 rdinit=/bin/bash"
>       KERNEL_URL = (
> -        "https://archives.fedoraproject.org/pub/fedora"
> +        "https://archives.fedoraproject.org/pub/archive/fedora"
>           "/linux/releases/33/Everything/x86_64/os/images"
>           "/pxeboot/vmlinuz"
>       )
>       KERNEL_HASH = '1433cfe3f2ffaa44de4ecfb57ec25dc2399cdecf'
>       INITRD_URL = (
> -        "https://archives.fedoraproject.org/pub/fedora"
> +        "https://archives.fedoraproject.org/pub/archive/fedora"
>           "/linux/releases/33/Everything/x86_64/os/images"
>           "/pxeboot/initrd.img"
>       )

Another (unrelated) occurence in docs/system/device-url-syntax.rst.inc:

|qemu_system_x86| --drive 
media=cdrom,file.driver=http,file.url=http://archives.fedoraproject.org/pub/fedora/linux/releases/20/Live/x86_64/Fedora-Live-Desktop-x86_64-20-1.iso,readonly

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


