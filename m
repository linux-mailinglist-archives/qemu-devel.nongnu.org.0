Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E5D586B95
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 15:10:26 +0200 (CEST)
Received: from localhost ([::1]:54866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIVBh-0002mr-2r
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 09:10:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john@john-millikin.com>)
 id 1oITHM-0004Qg-BT
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 07:08:24 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:36752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <john@john-millikin.com>)
 id 1oITHK-0001ju-GA
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 07:08:08 -0400
Received: by mail-pl1-x636.google.com with SMTP id x10so9434192plb.3
 for <qemu-devel@nongnu.org>; Mon, 01 Aug 2022 04:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=john-millikin.com; s=google;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=AEsKeXGpA69Jg4A3K+PqrJbbeViWqFNZ/PmT02rClco=;
 b=YHure94raKFNPwfgputhRggNOBM8EExkaB9N77B6dWOO3rSyuyrb3AMEKf9asXnFAv
 61zYpQn1mfM869jGY3RdCa2u8fwe0pEXTAHoLmIIlbUpgQngtwEA8IShETYO8THMGRuW
 NETXARElAq4irtipMvOAY/ZwgYWIEl6/X3YyKM1aakBB3EvXQqy/UUdsoR6RInR1LOl0
 5F5cji6TiZk/A0+OVdg/et2GmsB1JuTEMlm8URd/4yBHR1+qitbki5itz/pzjNsv6bWx
 KuX18nwbSvLSMwtmfAm/Kc4ZSz/RlHKFLOfZgISZuwM8Q3tF0K+BBufr2dtkXEbBIKHK
 pl+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=AEsKeXGpA69Jg4A3K+PqrJbbeViWqFNZ/PmT02rClco=;
 b=NUfamU8/DhyAPNinqCh1ygYNT4JiyQPD8jHo+P4IMOWgZQghw6vKXZyN1gSupXvNck
 CHMOI5j67AcrrmCt+QrDQNCIg/9SDlTcPAABnaJ48sDCsTdJWdCWLGGRDU9+uY4FF0Pn
 ImGzB5Ij/7f8coXzuYwp+Vlh2Fc2FD7wGwHatPYAl10gAJrFOXVZdmLN9M0Royy6Se41
 vZg9SsKBAtKl7lu8nWKTzpgAeSJxl66LUJO69W6eZ96botcPEUDfXQdfr3tzrm0lI7Xm
 u5u4hAY6fe3LY2FopfQ6sJTgm44kL5ELKJ2mdnb6pe3+B1TTAxJmbsektYLb+hZ6/r3c
 ohJg==
X-Gm-Message-State: ACgBeo1oP8h2GptlaCulj6RNQQGyXOriPNGNwnQdzcXIf37M4rHHYRNV
 U+IVx2eJ26d4v8tZSSpW1Ia7u3VrSNLLMtZm
X-Google-Smtp-Source: AA6agR5XOXfC03SCZD5idqGfmy2jP7D7uBSRxHz0x8GnK5i7KoT5l78KiWU0oNGrCB7an6lVHtAL7w==
X-Received: by 2002:a17:90a:7aca:b0:1f1:ff59:fe7e with SMTP id
 b10-20020a17090a7aca00b001f1ff59fe7emr18737758pjl.11.1659352084540; 
 Mon, 01 Aug 2022 04:08:04 -0700 (PDT)
Received: from john-millikin.com ([2405:6580:98c0:1200:559c:e59b:1e1e:a89b])
 by smtp.gmail.com with ESMTPSA id
 u12-20020a62790c000000b005252a06750esm4034524pfc.182.2022.08.01.04.08.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Aug 2022 04:08:04 -0700 (PDT)
Date: Mon, 1 Aug 2022 20:08:00 +0900
From: John Millikin <john@john-millikin.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>
Subject: Re: [PATCH] scsi-disk: support setting CD-ROM block size via device
 options.
Message-ID: <Yue0EG3h5SSpuzjJ@john-millikin.com>
References: <20220726034206.515097-1-john@john-millikin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220726034206.515097-1-john@john-millikin.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=john@john-millikin.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 01 Aug 2022 09:08:00 -0400
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
Reply-To: John Millikin <john@john-millikin.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Gentle ping -- this is my first time sending a patch for QEMU and it
hasn't shown up in the qemu-devel mailing list web UI yet, so I can't
tell whether the mail is being sent/received successfully.

On Tue, Jul 26, 2022 at 12:42:06PM +0900, John Millikin wrote:
> SunOS expects CD-ROM devices to have a block size of 512, and will
> fail to mount or install using QEMU's default block size of 2048.
> 
> When initializing the SCSI device, allow the `physical_block_device'
> block device option to override the default block size.
> 
> Signed-off-by: John Millikin <john@john-millikin.com>
> ---
>  hw/scsi/scsi-disk.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
> index f5cdb9ad4b..acdf8dc05c 100644
> --- a/hw/scsi/scsi-disk.c
> +++ b/hw/scsi/scsi-disk.c
> @@ -2533,6 +2533,7 @@ static void scsi_cd_realize(SCSIDevice *dev, Error **errp)
>      SCSIDiskState *s = DO_UPCAST(SCSIDiskState, qdev, dev);
>      AioContext *ctx;
>      int ret;
> +    uint32_t blocksize = 2048;
>  
>      if (!dev->conf.blk) {
>          /* Anonymous BlockBackend for an empty drive. As we put it into
> @@ -2542,9 +2543,13 @@ static void scsi_cd_realize(SCSIDevice *dev, Error **errp)
>          assert(ret == 0);
>      }
>  
> +    if (dev->conf.physical_block_size != 0) {
> +        blocksize = dev->conf.physical_block_size;
> +    }
> +
>      ctx = blk_get_aio_context(dev->conf.blk);
>      aio_context_acquire(ctx);
> -    s->qdev.blocksize = 2048;
> +    s->qdev.blocksize = blocksize;
>      s->qdev.type = TYPE_ROM;
>      s->features |= 1 << SCSI_DISK_F_REMOVABLE;
>      if (!s->product) {
> -- 
> 2.25.1
> 

