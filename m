Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6833EC101
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Aug 2021 08:53:06 +0200 (CEST)
Received: from localhost ([::1]:34008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEnXV-0007Of-JS
	for lists+qemu-devel@lfdr.de; Sat, 14 Aug 2021 02:53:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mEnWa-0006kM-K3
 for qemu-devel@nongnu.org; Sat, 14 Aug 2021 02:52:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mEnWY-0006Yk-OM
 for qemu-devel@nongnu.org; Sat, 14 Aug 2021 02:52:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628923925;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s6OFlKtI3pdqFzRyK5MAAD9k6Agy9E2NOHota+D6SUA=;
 b=IfqSgPjQ1GFdX6fVcseolRO+Lxd0QZvuJAS9n3bIsIemHpwt3gShuSrMy14fg6DTcw7aK6
 DxbmpwBFcPyJfGe2iB6HNJDDztAeiWrKAUB0lrVh4oy/kN3EgBjV9MK9KHUQ5rjN60tjwf
 HKs4brYPBf0gx1KbPhxkLZcBca/ieQU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-152-LOV3hDyTMKuo03lun8VbcA-1; Sat, 14 Aug 2021 02:52:03 -0400
X-MC-Unique: LOV3hDyTMKuo03lun8VbcA-1
Received: by mail-wr1-f69.google.com with SMTP id
 t15-20020a5d42cf000000b001565f9c9ee8so1333912wrr.2
 for <qemu-devel@nongnu.org>; Fri, 13 Aug 2021 23:52:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=s6OFlKtI3pdqFzRyK5MAAD9k6Agy9E2NOHota+D6SUA=;
 b=KuwdF/FBG8avQeXco0TmmcF2FF+xfaqoUIaC5ii4v4PlChqQ2vzWyZDjShbaOsW8yy
 xy9SsShPXG5XqAjnLZrfPWQK0JlZyN8dH52Fsv9XzruL5lN9blnVEIBo+j0Oet4aYER8
 iyhMEoBmEyKOU4p5xdvo569cQfNGJxtNK+ngn+cILv4QfTDvUXBlfjQfl71l0JX78AuV
 DVBuQEb6ceukBxsfZCNoVpToZ5Zd5+k6BRLvgF4zZZJ1DDLgt38aa+wcKNef+oRnSzOZ
 77swWCGOfHOlKpV8HhSVlYceLrTmzLy85WCLgQ/RlLu2KH1JwbIkQgL34JfpSETTUQYq
 l0xA==
X-Gm-Message-State: AOAM530KWoogW7g3zpBmRi1lswzonnpfCNp4zYzuWr0pfL7qFH6Yi3ho
 rzGzOShha0IKuJU8gqSak0e0+8DIERLiqaWYPuKSm5BuH50FDeORiiFC2/n1515BHqejrJVsZrp
 XhtIH5Yefqradd7U=
X-Received: by 2002:adf:f292:: with SMTP id k18mr6902147wro.249.1628923922706; 
 Fri, 13 Aug 2021 23:52:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw17cFM7i+Hhpwl5FKUZ34tsfkd6sqb+oEATX+osXDoIvRhzHl6H/48mhMDqqRtKM0pvQvD0w==
X-Received: by 2002:adf:f292:: with SMTP id k18mr6902139wro.249.1628923922532; 
 Fri, 13 Aug 2021 23:52:02 -0700 (PDT)
Received: from thuth.remote.csb (pd95757ea.dip0.t-ipconnect.de.
 [217.87.87.234])
 by smtp.gmail.com with ESMTPSA id y3sm3804997wma.32.2021.08.13.23.52.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Aug 2021 23:52:01 -0700 (PDT)
Subject: Re: [PATCH] vga: don't abort when adding a duplicate isa-vga device
To: "Jose R. Ziviani" <jziviani@suse.de>, qemu-devel@nongnu.org
References: <20210813233619.32178-1-jziviani@suse.de>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <9dd25d6d-b9ba-0000-96a0-451fd1b28c56@redhat.com>
Date: Sat, 14 Aug 2021 08:52:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210813233619.32178-1-jziviani@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/08/2021 01.36, Jose R. Ziviani wrote:
> If users try to add an isa-vga device that was already registered,
> still in command line, qemu will crash:
> 
> $ qemu-system-mips64el -M pica61 -device isa-vga
> RAMBlock "vga.vram" already registered, abort!
> Aborted (core dumped)
> 
> That particular board registers such device automaticaly, so it's
> not obvious that a VGA device already exists. This patch changes
> this behavior by displaying a message and ignoring that device,
> starting qemu normally.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/44
> Signed-off-by: Jose R. Ziviani <jziviani@suse.de>
> ---
>   hw/display/vga-isa.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/hw/display/vga-isa.c b/hw/display/vga-isa.c
> index 90851e730b..69db502dde 100644
> --- a/hw/display/vga-isa.c
> +++ b/hw/display/vga-isa.c
> @@ -61,6 +61,15 @@ static void vga_isa_realizefn(DeviceState *dev, Error **errp)
>       MemoryRegion *vga_io_memory;
>       const MemoryRegionPortio *vga_ports, *vbe_ports;
>   
> +    /*
> +     * some machines register VGA by default, so instead of aborting
> +     * it, show a message and ignore this device.
> +     */
> +    if (qemu_ram_block_by_name("vga.vram")) {
> +        error_report("vga.vram is already registered, ignoring this device");
> +        return;
> +    }

I think we should not ignore the error, but rather turn this into a proper 
error (instead of aborting).

So if you replace error_report(...) with error_setg(errp, ...), the patch 
should be fine.

  Thomas


