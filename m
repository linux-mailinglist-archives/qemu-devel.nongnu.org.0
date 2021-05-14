Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB7B3810B7
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 21:27:05 +0200 (CEST)
Received: from localhost ([::1]:44934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhdSi-0000LT-MU
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 15:27:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lhdPd-0006Rv-VU
 for qemu-devel@nongnu.org; Fri, 14 May 2021 15:23:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45267)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lhdPX-00025d-Hd
 for qemu-devel@nongnu.org; Fri, 14 May 2021 15:23:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621020227;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q6CIMhJCeRxKQS+uKXIpRZEH5AJ0vJXO71vrU17/vdM=;
 b=fhwQEPeWtrNwoX1pzJqXy61D+v3NAxsGrwNHdz44ijWPuU7ErUUrRRObQaeacScXZePKPe
 xIFf12eF6qhUj6mZP2TwpQCSKWwH3KqFIXfz1wIrVfuQr3OqU8UmSCfJ3XrVVm6ACnCFZr
 bB0tN8mv9gYJvKeh9xD8sLYbJxG6r9U=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499-qz_LeBuUN-yz0zUlSiBWGw-1; Fri, 14 May 2021 15:23:43 -0400
X-MC-Unique: qz_LeBuUN-yz0zUlSiBWGw-1
Received: by mail-wr1-f72.google.com with SMTP id
 f1-20020adf9f410000b029010e8048a0e3so143372wrg.4
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 12:23:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=q6CIMhJCeRxKQS+uKXIpRZEH5AJ0vJXO71vrU17/vdM=;
 b=diaNmvE9ytVX1wDP0LqEMHv47xkqPNwBg1OKKMqI1FaEoSmNIZfQzD1d253U/U3B9d
 lhAnGsrLGgkvUI6x18R8D/O+XbQlYzrZpT+GRKyy716DSXKNH7luIkvhlpYv+FRq9Amn
 GTmCoYxGByB91iNFKlClonizZ14/XJxeJzvfxl0XKd5exkM8er17Wo9m/7FngN9Zpi5D
 FXPObYGr5VsMBcBuaVBR8Gs9t+lDTczK781xpTSk0nzpCYDxtsfXDbhdxFVCCEdDiCWD
 Dx0LXBvZmB59ISHAZ1jD9fmJ9ySD0PYepk4kf6oNuVWQPu96N4ix1NqkJGe+sjhwnUki
 roSQ==
X-Gm-Message-State: AOAM531CQC8us2WrLazrbYha2WJxs0ESqWKJX2JIh6YiSHXSCaCHd6t/
 dvEHymbxCEKQ4JStF+TZoQwFMng35ovZ5tgMqVIEgypmLyk0ho6+ZiZGwvgTn8yfzBphtub56F+
 YNBvCdVy2etNGz4w=
X-Received: by 2002:adf:dc81:: with SMTP id r1mr706474wrj.319.1621020222245;
 Fri, 14 May 2021 12:23:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx8nqcVvJmcqy6OdQTooLfLKZ/ijbp2Mb6IkQzZBA7rqdhDjbzdD84ccIxo2CYOJC9w0BZpUw==
X-Received: by 2002:adf:dc81:: with SMTP id r1mr706456wrj.319.1621020221986;
 Fri, 14 May 2021 12:23:41 -0700 (PDT)
Received: from thuth.remote.csb (pd9575ef1.dip0.t-ipconnect.de.
 [217.87.94.241])
 by smtp.gmail.com with ESMTPSA id b8sm7649377wrx.15.2021.05.14.12.23.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 May 2021 12:23:41 -0700 (PDT)
Subject: Re: [PATCH] fdc: check drive block device before usage
 (CVE-2021-20196)
To: P J P <ppandit@redhat.com>, John Snow <jsnow@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>
References: <20210123100345.642933-1-ppandit@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <6881ef3c-99a1-1f5f-cca5-0850ec2bd6cf@redhat.com>
Date: Fri, 14 May 2021 21:23:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210123100345.642933-1-ppandit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-stable@nongnu.org, Gaoning Pan <pgn@zju.edu.cn>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Prasad J Pandit <pjp@fedoraproject.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/01/2021 11.03, P J P wrote:
> From: Prasad J Pandit <pjp@fedoraproject.org>
> 
> While processing ioport command in 'fdctrl_write_dor', device
> controller may select a drive which is not initialised with a
> block device. This may result in a NULL pointer dereference.
> Add checks to avoid it.
> 
> Fixes: CVE-2021-20196
> Reported-by: Gaoning Pan <pgn@zju.edu.cn>
> Buglink: https://bugs.launchpad.net/qemu/+bug/1912780
> Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
> ---
>   hw/block/fdc.c | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/block/fdc.c b/hw/block/fdc.c
> index 3636874432..13a9470d19 100644
> --- a/hw/block/fdc.c
> +++ b/hw/block/fdc.c
> @@ -1429,7 +1429,9 @@ static void fdctrl_write_dor(FDCtrl *fdctrl, uint32_t value)
>           }
>       }
>       /* Selected drive */
> -    fdctrl->cur_drv = value & FD_DOR_SELMASK;
> +    if (fdctrl->drives[value & FD_DOR_SELMASK].blk) {
> +        fdctrl->cur_drv = value & FD_DOR_SELMASK;
> +    }
>   
>       fdctrl->dor = value;
>   }
> @@ -1894,6 +1896,10 @@ static uint32_t fdctrl_read_data(FDCtrl *fdctrl)
>       uint32_t pos;
>   
>       cur_drv = get_cur_drv(fdctrl);
> +    if (!cur_drv->blk) {
> +        FLOPPY_DPRINTF("No drive connected\n");
> +        return 0;
> +    }
>       fdctrl->dsr &= ~FD_DSR_PWRDOWN;
>       if (!(fdctrl->msr & FD_MSR_RQM) || !(fdctrl->msr & FD_MSR_DIO)) {
>           FLOPPY_DPRINTF("error: controller not ready for reading\n");
> @@ -2420,7 +2426,8 @@ static void fdctrl_write_data(FDCtrl *fdctrl, uint32_t value)
>           if (pos == FD_SECTOR_LEN - 1 ||
>               fdctrl->data_pos == fdctrl->data_len) {
>               cur_drv = get_cur_drv(fdctrl);
> -            if (blk_pwrite(cur_drv->blk, fd_offset(cur_drv), fdctrl->fifo,
> +            if (cur_drv->blk == NULL
> +                || blk_pwrite(cur_drv->blk, fd_offset(cur_drv), fdctrl->fifo,
>                              BDRV_SECTOR_SIZE, 0) < 0) {
>                   FLOPPY_DPRINTF("error writing sector %d\n",
>                                  fd_sector(cur_drv));
> 

Ping again!

Could anybody review / pick this up?

  Thomas


