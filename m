Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7882C605E3D
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 12:54:36 +0200 (CEST)
Received: from localhost ([::1]:56086 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olTC6-0000Fc-FQ
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 06:54:34 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olT68-0000Md-MJ
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 06:48:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1olSkj-0006XG-J1
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 06:26:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1olSkS-0007T9-B5
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 06:26:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666261559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vmxbLN2R6MuATvg+iV+vlhNDZTX19j1xJBbJ37bB+Es=;
 b=YVWkNPtGPaaAg5rL8eWhwg66+ccVUPNbTJo2OTpMlYlpAlavHGetWJ6D1/+pKvbgmaPZ/4
 tv0wM7jRKvm3Y09qyRqt0Mj89seNJh/hSTk3KumbQCSmsdvIJZ40Utd1cm67shdG4Ee3ls
 /csZaJFl2conPgaWvdsxoZij40NprCc=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-573-O2_ckS1SNGKzWoZHV8VOCQ-1; Thu, 20 Oct 2022 06:25:58 -0400
X-MC-Unique: O2_ckS1SNGKzWoZHV8VOCQ-1
Received: by mail-qt1-f199.google.com with SMTP id
 k12-20020ac8474c000000b0039cdd680ccaso10800071qtp.1
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 03:25:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vmxbLN2R6MuATvg+iV+vlhNDZTX19j1xJBbJ37bB+Es=;
 b=UZ1J3L8bA5UJZzAkCbsjrmEhLaCgHwb8+Id9TFvqciLIohGa+FxsaSi5xR6oPUSpNO
 E3ybfmy1x/PmxwqpC6v0L77c3ZuQGUuQmK6orL86IhPA0Ma5BCEswjF9JXP6MQ9W5MmC
 kqadZ0U2I95vo28At5BL5vW26AV3NUi3EKt87pdpEOe03itwA0G+Iby7Vr0MMeop7gRY
 TcBS4DHyiKN903bklcM5IjbXXMaqBnkov4qS2987AzmBy792aJlzWKPlLZnQR1BcRtkJ
 n1OX2KV0TdeNYWLL6wheupPRfOhQhMcpmV/yGhkkrio6qpDSVpdMRL+KCXbtMx0CKhaN
 qbqA==
X-Gm-Message-State: ACrzQf1+KRjOKrPx/XMqG28bvGWY/uiGJwBXlD4QUVEWyYj4hUaHlyND
 LhHOT5lp6yinvg3qkcRVWT4iPBkwVWqcY93yBlWuygvvAAQmiDq09J3ejJzJUUhTqoAI6HCXCUr
 UbDYW+BdpGzNrl9A=
X-Received: by 2002:a05:622a:1052:b0:39c:da70:3204 with SMTP id
 f18-20020a05622a105200b0039cda703204mr10048871qte.689.1666261557923; 
 Thu, 20 Oct 2022 03:25:57 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6IcWL9ZoNzlWlImfHH/wV/uHY/ZKthKBdtTaytM7XnWab9ebdLO+D8ZrC6wuUaOizHE+lBAA==
X-Received: by 2002:a05:622a:1052:b0:39c:da70:3204 with SMTP id
 f18-20020a05622a105200b0039cda703204mr10048858qte.689.1666261557679; 
 Thu, 20 Oct 2022 03:25:57 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-177-247.web.vodafone.de.
 [109.43.177.247]) by smtp.gmail.com with ESMTPSA id
 l12-20020a37f90c000000b006cbc6e1478csm7004392qkj.57.2022.10.20.03.25.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Oct 2022 03:25:57 -0700 (PDT)
Message-ID: <070bd0b4-f04c-0eb9-6a84-d031db28c4b0@redhat.com>
Date: Thu, 20 Oct 2022 12:25:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] tests/avocado: raspi2_initrd: Wait for guest shutdown
 message before stopping
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>
References: <20221020102012.3015662-1-peter.maydell@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20221020102012.3015662-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 20/10/2022 12.20, Peter Maydell wrote:
> The avocado test
>   tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_raspi2_initrd
> finishes wiith
> 
>      exec_command(self, 'halt')
>      # Wait for VM to shut down gracefully
>      self.vm.wait()
> 
> In theory this should be fine. In practice it runs into two bugs:
> 
>   * when the test calls self.vm.wait() Avocado closes the socket
>     connection to the guest serial console immediately, so the
>     avocado logs don't have the last part of the guest output:
>     https://gitlab.com/qemu-project/qemu/-/issues/1265
>   * when the socket is closed, a bug in the QEMU socket chardev
>     means that it loses any data that the guest UART has not
>     yet consumed. This means that the guest doesn't always read
>     the full 'halt' command string, so the test intermittently
>     fails with a timeout:
>     https://gitlab.com/qemu-project/qemu/-/issues/1264
> 
> Work around both of these by waiting for the guest to print the
> string that means it has completed the shutdown process.  This fixes
> a very long standing intermittent failure in this test.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/636
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   tests/avocado/boot_linux_console.py | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
> index ca9d09b0d7c..eed4b49e6e4 100644
> --- a/tests/avocado/boot_linux_console.py
> +++ b/tests/avocado/boot_linux_console.py
> @@ -489,7 +489,7 @@ def test_arm_raspi2_initrd(self):
>                                                   'BCM2835')
>           exec_command_and_wait_for_pattern(self, 'cat /proc/iomem',
>                                                   '/soc/cprman@7e101000')
> -        exec_command(self, 'halt')
> +        exec_command_and_wait_for_pattern(self, 'halt', 'reboot: System halted')
>           # Wait for VM to shut down gracefully
>           self.vm.wait()
>   

Reviewed-by: Thomas Huth <thuth@redhat.com>


