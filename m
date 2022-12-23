Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BC46552B1
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Dec 2022 17:20:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8kmC-0000AK-J6; Fri, 23 Dec 2022 11:20:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1p8klz-00009k-3y; Fri, 23 Dec 2022 11:19:51 -0500
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1p8klw-0004y5-UK; Fri, 23 Dec 2022 11:19:50 -0500
Received: by mail-oo1-xc35.google.com with SMTP id
 d2-20020a4ab202000000b004ae3035538bso842292ooo.12; 
 Fri, 23 Dec 2022 08:19:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CutwQDgVMACMb1f596AvbEtN979EI2CLR79jpkR3Wmg=;
 b=OGNlyhB+FvEOLxDtkwd/g1vMm3LVwpds/k3KiN1U5F7/E5NDedCb1kOIkmXFbm4JeD
 uAQskSYnqy46/UeYJxbpOOaohE9Z2FRix8GUxjBp+xHu/BmaZDiMUmXkjZafeGcgelxw
 67Qj8PXZhoEcHrCt8iVdYbmzvk8cFin7w4Qblp50iwHqYaArbJmU06J0FlGEyGE4Sk0I
 sbVg7P27OttPsMvW6wRwNq6laB/SErp3NelPMLbMn9dSVHSS/MDQjJ5/NDvIk4LKDWpV
 UXhsF8RYMAyNIZLzRuUMPDa9l2Y1Qd3bdUlN1qswoDhR0b8uLEn+pmageSTaYINZxk+1
 lzlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CutwQDgVMACMb1f596AvbEtN979EI2CLR79jpkR3Wmg=;
 b=3d9P92Pg3cehrX5Q7Dkclt7gQwFUC32qSXhg+CdHjtw8nIcUT11X8/dYGnBHalL2kb
 detxhZgMtsy/UJnmD4EoYNGf6f6SuZjW0cWi1VfE9izL9HtXSwYtG50osoi+IuQQQWnO
 4E/wUhdU36dcBOnmCHVgRLnlhsvkWF/YlANo0ocOFQOEeFEvWd1L7Najk8iPqOstIhCi
 2kgSdlyes7uTw7XYf3EPMeHPjFH6LbniZDAoz7nb88RBw+Nti/khkzktsvFq/pfIsuE0
 bB8gMriYDJrPVqzvF7+l5NMvDkFuQ13Ib6n2xAXByHrHsVKWf1AukuY2iqCC5ayoMcb4
 YXaw==
X-Gm-Message-State: AFqh2koh2hEejW0uGVWVToPNlWAH9CWk9XudTICm4b1AlRMpBNPO7LFG
 UplHPbr7a7gI5gfScYZnWjo=
X-Google-Smtp-Source: AMrXdXt8YJbyHn1uOgdxDR1xvQIanvc/1Rk0aXy9HoYRGeW4noLr5xS1/BY9R9i1fKvZLI+Mssqs9Q==
X-Received: by 2002:a4a:5891:0:b0:4a3:78f9:1cb1 with SMTP id
 f139-20020a4a5891000000b004a378f91cb1mr5422723oob.4.1671812387244; 
 Fri, 23 Dec 2022 08:19:47 -0800 (PST)
Received: from [192.168.68.107] (201-43-103-101.dsl.telesp.net.br.
 [201.43.103.101]) by smtp.gmail.com with ESMTPSA id
 q4-20020a4aa884000000b004a382acad85sm1470749oom.15.2022.12.23.08.19.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Dec 2022 08:19:47 -0800 (PST)
Message-ID: <d6bea113-6753-7b52-fd84-05edb8a134fd@gmail.com>
Date: Fri, 23 Dec 2022 13:19:43 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 2/2] tests/migration: add support for ppc64le for
 guestperf.py
Content-Language: en-US
To: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, mopsfelder@gmail.com,
 farosas@suse.de
References: <20220809002451.91541-1-muriloo@linux.ibm.com>
 <20220809002451.91541-3-muriloo@linux.ibm.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220809002451.91541-3-muriloo@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c35;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc35.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-1.148,
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



On 8/8/22 21:24, Murilo Opsfelder Araujo wrote:
> Add support for ppc64le for guestperf.py. On ppc, console is usually
> hvc0 and serial device for pseries machine is spapr-vty.
> 
> Signed-off-by: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   tests/migration/guestperf/engine.py | 28 +++++++++++++++++++++++++---
>   1 file changed, 25 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/migration/guestperf/engine.py b/tests/migration/guestperf/engine.py
> index 87a6ab2009..88da516899 100644
> --- a/tests/migration/guestperf/engine.py
> +++ b/tests/migration/guestperf/engine.py
> @@ -282,6 +282,26 @@ def _migrate(self, hardware, scenario, src, dst, connect_uri):
>                   resp = src.command("stop")
>                   paused = True
>   
> +    def _is_ppc64le(self):
> +        _, _, _, _, machine = os.uname()
> +        if machine == "ppc64le":
> +            return True
> +        return False
> +
> +    def _get_guest_console_args(self):
> +        if self._is_ppc64le():
> +            return "console=hvc0"
> +        else:
> +            return "console=ttyS0"
> +
> +    def _get_qemu_serial_args(self):
> +        if self._is_ppc64le():
> +            return ["-chardev", "stdio,id=cdev0",
> +                    "-device", "spapr-vty,chardev=cdev0"]
> +        else:
> +            return ["-chardev", "stdio,id=cdev0",
> +                    "-device", "isa-serial,chardev=cdev0"]
> +
>       def _get_common_args(self, hardware, tunnelled=False):
>           args = [
>               "noapic",
> @@ -290,8 +310,10 @@ def _get_common_args(self, hardware, tunnelled=False):
>               "noreplace-smp",
>               "cgroup_disable=memory",
>               "pci=noearly",
> -            "console=ttyS0",
>           ]
> +
> +        args.append(self._get_guest_console_args())
> +
>           if self._debug:
>               args.append("debug")
>           else:
> @@ -309,12 +331,12 @@ def _get_common_args(self, hardware, tunnelled=False):
>               "-kernel", self._kernel,
>               "-initrd", self._initrd,
>               "-append", cmdline,
> -            "-chardev", "stdio,id=cdev0",
> -            "-device", "isa-serial,chardev=cdev0",
>               "-m", str((hardware._mem * 1024) + 512),
>               "-smp", str(hardware._cpus),
>           ]
>   
> +        argv.extend(self._get_qemu_serial_args())
> +
>           if self._debug:
>               argv.extend(["-device", "sga"])
>   

