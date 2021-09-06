Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 751794018C4
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 11:26:16 +0200 (CEST)
Received: from localhost ([::1]:47116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNAtL-0006Nn-Fx
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 05:26:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mNArJ-0005Pf-AO
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 05:24:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mNArG-0005Yz-Ck
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 05:24:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630920245;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HCTfRdoA1/2ESm787MYesYN/kburFpXZuEEaKqC7/OQ=;
 b=L+O2vTzP3zHAkbGKu7VIsmzfFLIkXmR8YMeijc6EuYPKfAwSQ1VwwCYKy4mHcGDTOBPDi/
 rz5u1r5QPwGhqA3S0ogygjsphaezZZKw28/57bZNx7oCIDSjouRkdsGx3ucOy3imdjc53h
 XxgHR1jLcdRTjXFYyWZizbyl0y+zV3o=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-367-x0yXzS6nNqWyeHFlNjVsAA-1; Mon, 06 Sep 2021 05:24:04 -0400
X-MC-Unique: x0yXzS6nNqWyeHFlNjVsAA-1
Received: by mail-wm1-f70.google.com with SMTP id
 w25-20020a1cf6190000b0290252505ddd56so2112793wmc.3
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 02:24:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HCTfRdoA1/2ESm787MYesYN/kburFpXZuEEaKqC7/OQ=;
 b=Uu9FvleuQ+Yqza6RAokiWZ66JD4lZ0QqJdFO0QK7I54M1hNUn2D6KMfEhNQIBMNsWb
 jHLyFvgWGyjBVeXl1Jv+Cv5tZ/tw5KCd/kT1I/AAQPLRr+WcaV7zdL2ESU/h0af9IvvE
 NlaE6iPoK/CwLCsqmvfTQ+2ul6hp1SeYLE8iq70A17vmyAJVwawBDak22G5t6NqeQq5R
 9UNw0ppmy4BKG5KRlpSbpsIxzf0x1tRWNkkD9hCQ+rdO0/yleumknnOGwaGAS9iRpP3V
 L5GES0M785nlGBnY/Um6iuFCtwUjHZH1WYIH5vU3tV47jmlXRO0c4Di362/fv0XAK38B
 1mdA==
X-Gm-Message-State: AOAM5338AHvUKoHNDUOBu95q0H5o5e2fXMeN+rM/HKHuqWU2882g3iAf
 gXX6QGAqAJQFOz+krlGb0enXEYLHdHc5q3dI2LZRqyC8NAcExFxp+KDckbCTt+Vc75nCGiooa8x
 aHmjyO0+DrXu7EQU=
X-Received: by 2002:a05:600c:a44:: with SMTP id
 c4mr10484246wmq.83.1630920243160; 
 Mon, 06 Sep 2021 02:24:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw4Ne92xT/EN7KNgzXfiSwS+aK4j4tV5JcxlcLdUdbpcWk8raApryZ29tsK+ff6I3pkXT1qJw==
X-Received: by 2002:a05:600c:a44:: with SMTP id
 c4mr10484240wmq.83.1630920242943; 
 Mon, 06 Sep 2021 02:24:02 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id y15sm8148969wmi.18.2021.09.06.02.24.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Sep 2021 02:24:02 -0700 (PDT)
Subject: Re: [PATCH] usb-storage: tag usb_msd_csw as packed struct
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20210906045523.1259629-1-kraxel@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <45538e19-8d9b-c91c-0a02-cd0f7df8e175@redhat.com>
Date: Mon, 6 Sep 2021 11:24:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210906045523.1259629-1-kraxel@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) DKIMWL_WL_HIGH=-0.391, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.832,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: vintagepc404@protonmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/6/21 6:55 AM, Gerd Hoffmann wrote:
> Without this the struct has the wrong size: sizeof() evaluates
> to 16 instead of 13.  In most cases the bug is hidden by the
> fact that guests submits a buffer which is exactly 13 bytes
> long, so the padding added by the compiler is simply ignored.
> 
> But sometimes guests submit a larger buffer and expect a short
> transfer, which does not work properly with the wrong struct
> size.
> 
> Cc: vintagepc404@protonmail.com

Fixes: a917d384ac0 ("SCSI TCQ support.")

15 years old bug, nice =)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  include/hw/usb/msd.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)


