Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 356B6289BA8
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Oct 2020 00:14:46 +0200 (CEST)
Received: from localhost ([::1]:40616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kR0ey-0005z5-MY
	for lists+qemu-devel@lfdr.de; Fri, 09 Oct 2020 18:14:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kR0de-000548-Ov; Fri, 09 Oct 2020 18:13:22 -0400
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42]:32894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kR0dd-0005GG-A0; Fri, 09 Oct 2020 18:13:22 -0400
Received: by mail-io1-xd42.google.com with SMTP id r4so4177812ioh.0;
 Fri, 09 Oct 2020 15:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yLTMTm4pMOnCg4lmMf90/RRrLNpMObFiVfKrT8fuLCY=;
 b=Yf8+qdRzyQQs0+rHahMji1CeFM9HlPVGpg6nFonpm/EZz5RH75YOZoarnaNBOeu28+
 IcmhvjU7aUvBxkDE0osgdG/BPUx9HnPCjid3J4UtOx3MbNbSJrhgoKs4+zbyY8h21FbZ
 sEeKWf7a2bKg7xaLVPq7YadDXYkdfTbx38Wv9wQcyBF/6vJbftQS7VJ+0nUY2DvVLVZ5
 qps3u0S9cGn0TkzuCT2lHDX6zYOzqeIQTuFXLjzn6+wr7Pey5V89Te+GqIJnbYivRMOR
 K+1tlzkie5sPAShrI1OGBkOib/9WxKn32pDSb37xEUtlM7sG7+WE56AGF8YfP4cY82hi
 shNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yLTMTm4pMOnCg4lmMf90/RRrLNpMObFiVfKrT8fuLCY=;
 b=r7QjETGyxFiBZxEhsI4TILi1AtPuCg+kv4ZNxY4AyC4zxfWN47dMgdMl8ep3IQNZyp
 dfJKx3ajlDESYEzyRTFZsag5s7cdkOLNRurKu6dHF6hprQWnjOcs38FlUxNVxyAC7BtJ
 A+57V0G8Df9HFbKzORoQvTf9OUluHG24njYNMVTRSdMTVFMeA92cyN0rQcJTs5o/V1tv
 2Ep1UGKDfyD2f34Zfry+ULotRmfuEwV+0X/kQ1h3iIavlYuPb4DzieDqPY0Tu7oV0uQ0
 CcYRWPcptsnBxDF/rRLrwMjFi202pVZL8K3bPnDUifWfKCUKAyFXe5+EvE0JojwZgFeD
 jX9A==
X-Gm-Message-State: AOAM531NTSvtbPKUxgrBecmbTFXHAqyngpTkEdbO8klQG3MaJIMj7QFO
 CdmUg19G6ipFcoV4gfijc6tHFNRiPJpFg2SwnwM=
X-Google-Smtp-Source: ABdhPJxLzXdpG1k+gjxpFck4OJXiYUVTArq+nP6jIqhMlR9nsXIECmUjLhPalVkgf+HYfXFyFhRcoYQOEjSV6xhJDwA=
X-Received: by 2002:a6b:8ec7:: with SMTP id q190mr1419196iod.42.1602281599198; 
 Fri, 09 Oct 2020 15:13:19 -0700 (PDT)
MIME-Version: 1.0
References: <20201009113843.60995-1-lvivier@redhat.com>
In-Reply-To: <20201009113843.60995-1-lvivier@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 9 Oct 2020 15:01:45 -0700
Message-ID: <CAKmqyKOo5KXUH7N=1DmJvO2_1y4Az5HNwBcXOx9VhgFzhS_4xg@mail.gmail.com>
Subject: Re: [PATCH 1/2] hw/char/serial: remove duplicate .class_init in
 serial_mm_info
To: Laurent Vivier <lvivier@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d42;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd42.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>,
 Anup Patel <anup.patel@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 9, 2020 at 4:39 AM Laurent Vivier <lvivier@redhat.com> wrote:
>
> .class_init is already set to serial_mm_class_init.
>
> Remove the duplicate entry.
>
> Fixes: 17fd1a6490b1 ("serial-mm: add "regshift" property")
> Cc: marcandre.lureau@redhat.com
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/char/serial.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/hw/char/serial.c b/hw/char/serial.c
> index 4386adabd466..97f71879ff2a 100644
> --- a/hw/char/serial.c
> +++ b/hw/char/serial.c
> @@ -1120,7 +1120,6 @@ static const TypeInfo serial_mm_info = {
>      .class_init = serial_mm_class_init,
>      .instance_init = serial_mm_instance_init,
>      .instance_size = sizeof(SerialMM),
> -    .class_init = serial_mm_class_init,
>  };
>
>  static void serial_register_types(void)
> --
> 2.26.2
>
>

