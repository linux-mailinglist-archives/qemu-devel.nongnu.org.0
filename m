Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B563EEFE1
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 17:57:37 +0200 (CEST)
Received: from localhost ([::1]:60152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mG1T6-0002eF-HW
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 11:57:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mG1SH-0001kv-Ow
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 11:56:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mG1SE-0006F8-3W
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 11:56:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629215800;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lUxsX8sFCcoiKVNhFbsM/KjrmyDLpNDZ3NJsRBIYU2c=;
 b=gCGFmUAZexj57h9nGOxU2wwYyUD4vXknW+Nsa3s9Ys8KXpVuMw3Fq7tAbTMKcZcGZvdkN+
 1HBSclcz66RMcv2YgxGDe+SeG/46EB3vy2Dk0uzkD2ONcKDZo+CMcxW4hPy0hM0sDmUgEd
 fcYQHVOeuW3ckhcf5QEyRjASCJYW9X4=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-ZmLuP4XBM2qZB_KEWt5UCQ-1; Tue, 17 Aug 2021 11:56:36 -0400
X-MC-Unique: ZmLuP4XBM2qZB_KEWt5UCQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 o7-20020a170906288700b005bb05cb6e25so3221298ejd.23
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 08:56:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lUxsX8sFCcoiKVNhFbsM/KjrmyDLpNDZ3NJsRBIYU2c=;
 b=lPcD2hc7Za03+2f3KAsdpGxigJI8DlRChZTp2aF+rvBCejaDg3GRgzHxYqUvumtD/P
 pV9qh8FXdShCYgF9Or5E2xCuePdOH35jR4dd68kcjWnKaw+FJbiuPbwhzlpFWb2LIPlh
 NkoVrXvz5hcva8fEhsv+YOsa0tcPRbT98xbVGwamJrw5hOlGrIlK9wsMbzb2G1UBZP4Q
 3fGAdeGBTqS5wskr2lb6DaL/a5WcPnX3FepHK6UZ6GXO6e7tCV+QfAv5gogaZO0WdFHa
 /vN27RCMyfX190cM5mLzvnATECMHS7Ko6FFIbX51kPhbY7xMKdZ08ikViyVtNToLk0Fc
 SxdA==
X-Gm-Message-State: AOAM533GLMdecxJeuONKsKKS4qbWI77cNkaOl1qRulL39ECS3oSiRVjj
 Rv4N+0M7GEwk4991j4bC1Ig6xkxbi8PcpXEHjRy2kCgAgewrWOYKjwY9EVixSYPDe4NT63OrR9H
 EEj5yOPJaDmKlIIDiOAID/mLq5tCkPo2zzKySxIImKbYyXOv3tw3QbBWgTz+/UjVZPgQ=
X-Received: by 2002:a05:6402:1606:: with SMTP id
 f6mr4831289edv.111.1629215795164; 
 Tue, 17 Aug 2021 08:56:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzTOlWdFCyHefymZowqK/70V3HUA1pG2VIKbUxVTDzgUfQZXpCLIB5rp68YM0X6givDAn1RZQ==
X-Received: by 2002:a05:6402:1606:: with SMTP id
 f6mr4831266edv.111.1629215794893; 
 Tue, 17 Aug 2021 08:56:34 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id p5sm935292ejl.73.2021.08.17.08.56.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Aug 2021 08:56:34 -0700 (PDT)
Subject: Re: Bootloading within QEMU?
To: Kenneth Adam Miller <kennethadammiller@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <CAK7rcp9HQ+uoPqu5vwCD8sCca99N5bV+aqD9Oea=VpTVT7Mb+A@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <30c3d9c2-08c3-6159-103d-d61ed41efb01@redhat.com>
Date: Tue, 17 Aug 2021 17:56:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAK7rcp9HQ+uoPqu5vwCD8sCca99N5bV+aqD9Oea=VpTVT7Mb+A@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.961, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/08/21 16:31, Kenneth Adam Miller wrote:
> 
> 
> I am trying to discover how to schedule QEMU to begin actual emulation 
> as currently my target correctly starts QEMU but only shows the shell, 
> and not even boot loading occurs within QEMU. I'm trying to learn from 
> example, and so will focus my questions only on X86. I can see the 
> MachineClass and MachineState types, and I have tried to follow QEMU 
> with the debugger and found where QEMU calls qemu_init and 
> qemu_main_loop under qemu/softmmu/main.c, and even tried to follow 
> through from init to main loop to see where it would begin booting, but 
> I cannot see where the bootloader is scheduled or specified or started 
> from within the target occurs.

There are two possibilities:

1) QEMU loads a fixed firmware file, usually at a fixed address in 
memory so that the reset vector of the CPU is inside the firmware.  This 
is what happens for example on x86.  The firmware ultimately boots the 
machine (e.g. on x86 you have BIOS->GRUB->Linux or something like that).

2) QEMU loads a binary specified on the command line---typically with 
-kernel, which is stored in current_machine->kernel_filename---and 
somehow arranges for the guest to execute that file when it starts.  For 
example one possibility is to write a jump instruction at the CPU reset 
vector (see riscv_setup_rom_reset_vec for an example).  The functions 
you want to look at for the loading part are load_elf_ram*, and 
load_uimage_as and load_image_targphys_as.

Note that on platforms that use a fixed firmware file there's still the 
possibility of using -kernel.  In that case, the firmware initializes 
the system, then places the binary in memory and jumps to it.  qboot 
(https://github.com/qemu/qboot) is a very small x86 firmware that is 
able to boot a Linux or multiboot kernel.

Paolo


