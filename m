Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D0F4CD4A4
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 14:02:31 +0100 (CET)
Received: from localhost ([::1]:33908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ7Zm-000716-2b
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 08:02:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQ7Wm-0004fl-4r; Fri, 04 Mar 2022 07:59:24 -0500
Received: from [2a00:1450:4864:20::334] (port=46684
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQ7Wk-0000vU-Kq; Fri, 04 Mar 2022 07:59:23 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 p184-20020a1c29c1000000b0037f76d8b484so5049277wmp.5; 
 Fri, 04 Mar 2022 04:59:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Rxwkn4q1BNppVlJ4U32DS2QftuCtXsvzv2Yq0pOHFSg=;
 b=EpP/5jHA6AauR8ESpfYQDSXzrFqozETqNtLsKGlPWn7ovbQBFk30Ii5m4qyzmzAgJ/
 XG1fRrFlHwGJf43uzKDoruDMOtZg54em2oJ1BOLxrbdger2/5Mj7PmYuT5uN8lxuI7DG
 nhQ9SXJ5y/zrdJv/oKyM8f4PgnaXy4H9PxfSxtt64akFwkA3bsngauBMIyw5O1XnJ2MX
 kOYd09HZQ8wdE9IAkDiS1sFnXP9nPoQQeQAgkxjjE9kq/OzVp4Ga6XUamy5kNaaMdnSp
 g0h2pqhjFCV7sSt1bn+OAF5v5h5AKcn2+BZSpQBYr0q3xcWFFUpZhYTcYiehJMepuUXz
 CFAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Rxwkn4q1BNppVlJ4U32DS2QftuCtXsvzv2Yq0pOHFSg=;
 b=fek7SDGPu4+Uubg8FZfBc1+t4lQ7ec2LbhXMYLcvL+//tYYliDqY28eCcMSEjkAsgX
 fI7oVK9gkGUgfSoF5Qr22Ulynj4kgikgFVK8rVJ/fyRmbU79Ky4Ue0idfs+4fPqEREJh
 m6kwAqjorAT84OfN1Nr2jOq75YgA5wWLcTfM+a5wwRyJvUI+pJgIJFfTgTnkK2HBs9as
 8gs5R8sRWvIGNBngW6Kh2L89nIZtkvQviB6Z25/3SldyjG1I9y1+LKNU/sNXgJkVoCMh
 gSq0DBPCrnwOI9rvvxBgvvdKzN/wVD2GWqrj9sKGwbMxurdLqH9mpUN+INaYtN6x8FkT
 1B3w==
X-Gm-Message-State: AOAM530XSwmzY7i6wLTs41gbjZPK/VYAAG6NjiK5dYiW1UxIHWa5dG4h
 8vfZT3muvg2U+sC3ji773kg=
X-Google-Smtp-Source: ABdhPJyt1Z0jGxDTVKHK9gcp5avvDUJWc/wVqsySowrQlvk4duuPEAeC3e/vKAuf+aVX8budwYmvKA==
X-Received: by 2002:a05:600c:418a:b0:384:224e:1817 with SMTP id
 p10-20020a05600c418a00b00384224e1817mr7445904wmh.123.1646398760463; 
 Fri, 04 Mar 2022 04:59:20 -0800 (PST)
Received: from [192.168.68.175] (108.red-88-28-25.dynamicip.rima-tde.net.
 [88.28.25.108]) by smtp.gmail.com with ESMTPSA id
 z2-20020a056000110200b001e7140ddb44sm4526662wrw.49.2022.03.04.04.59.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Mar 2022 04:59:20 -0800 (PST)
Message-ID: <92aaf32c-566a-acc7-1c7c-2531975358b2@gmail.com>
Date: Fri, 4 Mar 2022 13:23:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH 3/5] avocado/boot_linux_console.py: check for tcg in
 test_ppc_powernv8/9
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
References: <20220303153517.168943-1-danielhb413@gmail.com>
 <20220303153517.168943-4-danielhb413@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220303153517.168943-4-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: thuth@redhat.com, david@gibson.dropbear.id.au, qemu-ppc@nongnu.org,
 clg@kaod.org, crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/3/22 16:35, Daniel Henrique Barboza wrote:
> The PowerNV8/9 machines does not work with KVM acceleration, meaning
> that boot_linux_console.py:BootLinuxConsole.test_ppc_powernv8/9 tests
> will always fail when QEMU is compiled with --disable-tcg:
> 
> ERROR 1-tests/avocado/boot_linux_console.py:BootLinuxConsole.test_ppc_powernv8
> -> VMLaunchFailure: ConnectError: Failed to establish session:
> [Errno 104] Connection reset by peer
>          Exit code: 1
>          Command: ./qemu-system-ppc64 -display none -vga none -chardev socket,id=mon,path=/var/tmp/avo_qemu_sock_no19zg0m/qemu-1936936-7fffa77cff98-monitor.sock -mon chardev=mon,mode=control -machine powernv8 -chardev socket,id=console,path=/var/tmp/avo_qemu_sock_no19zg0m/qemu-1936936-7fffa77cff98-console.sock,server=on,wait=off -serial chardev:console -kernel /home/danielhb/avocado/data/cache/by_location/4514304e2c4ee84c5f0b5c8bacedda783891df68/zImage.epapr -append console=tty0 console=hvc0 -device pcie-pci-bridge,id=bridge1,bus=pcie.1,addr=0x0 -device nvme,bus=pcie.2,addr=0x0,serial=1234 -device e1000e,bus=bridge1,addr=0x3 -device nec-usb-xhci,bus=bridge1,addr=0x2
>          Output: qemu-system-ppc64: The powernv machine does not work with KVM acceleration
> 
> Let's add the TCG accel requirement in both tests to skip them if we
> don't have TCG support available.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>   tests/avocado/boot_linux_console.py | 3 +++
>   1 file changed, 3 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

