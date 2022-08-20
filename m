Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F2759AAAC
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Aug 2022 04:22:15 +0200 (CEST)
Received: from localhost ([::1]:42324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oPE7q-00053g-40
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 22:22:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john@john-millikin.com>)
 id 1oPE66-0003bc-Mu
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 22:20:26 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:42613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <john@john-millikin.com>)
 id 1oPE63-0005Jk-V6
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 22:20:26 -0400
Received: by mail-pl1-x633.google.com with SMTP id v23so221333plo.9
 for <qemu-devel@nongnu.org>; Fri, 19 Aug 2022 19:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=john-millikin.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=xeZr75Jq/eRMeNLP/GVrOXG3gmzZtqwdmraQIAYdbkk=;
 b=umufCW/Qc7Cm9uaVVWFrxd/p/wZAUjALQmBaL13aC3ispnFi7uEpK4TMpHpbiaDfdw
 0jb/hWOsSrpC6DtPkcC1TECTx1aoSSocpldoz2DFYFastPIiXwgiFaKo4ADQOT9p+b5j
 zoKDx4JuQx1XfXbo70QH8xdGQ0CrBU9am13sjWbn6pWtWwgKMWPU79777eeLDY4lq7dF
 VqPVQebYhQT2jLQ6x7aoB4M5qgO3GRgHxol5LcY547h/+8HOgY461Nrk1N2l9wSlDLSA
 WutYSS1UUZNhVlyqFe3R5OC17cvZGinoKR0qV3cklANQ5tTDD8fmoAI73X7AHSHmbbz1
 JWAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=xeZr75Jq/eRMeNLP/GVrOXG3gmzZtqwdmraQIAYdbkk=;
 b=fyhljvmGk3lDTPIn9FOsM8s94UWTX9/rHgUruLXrxrIHY1uC1EGMWklKkVenlayUa+
 AzszCwf677mSx0UCB4y6KY2ti/wK4TiEiF9N3vGatF6ALlz9I3ZuEC4fT1pOPSiJNUZ1
 b7Qq7S5zanZHrczTchU7xRHCPYU+OdnSOnCYwOdyYLZJiEu1jKyja8ORv13T94im0glr
 7mHPQcBXNrAFgjJKMl8YDurHYBsCt0qxKywU6qcE+UqVx97eHzfHlrJnO2SD4Kk9xZuo
 Y+MdCwuKoru8xZyDlCysfAJbiG7sADHZrM06dhnStusHznwfjg6bJCGkyt1VlQKkCAQc
 DKSA==
X-Gm-Message-State: ACgBeo1XafymiJQnEMX7y4mws2la0qe5kFkbCZ6pzxlmElpRoQbXpqCA
 7IqRbDmSrgMt0PKC8arZX5Pt4QJFjqkpPFPB
X-Google-Smtp-Source: AA6agR6JUKHAijBlIF3jDNRWy/y183O9hNRUOqdXRZmADMhsv2IBsM2jXBl4LjJF5oeRWEPUQn3Y1A==
X-Received: by 2002:a17:90b:3ec7:b0:1fa:cdc1:f66 with SMTP id
 rm7-20020a17090b3ec700b001facdc10f66mr10781434pjb.167.1660962022736; 
 Fri, 19 Aug 2022 19:20:22 -0700 (PDT)
Received: from john-millikin.com ([2405:6580:98c0:1200:e418:76b4:96e0:cf28])
 by smtp.gmail.com with ESMTPSA id
 a207-20020a621ad8000000b0052bae7b2af8sm4035319pfa.201.2022.08.19.19.20.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 19:20:22 -0700 (PDT)
Date: Sat, 20 Aug 2022 11:20:18 +0900
From: John Millikin <john@john-millikin.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH v2] scsi-disk: support setting CD-ROM block size via
 device options
Message-ID: <YwBE4nhpQonnS5x2@john-millikin.com>
References: <20220804122950.1577012-1-john@john-millikin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220804122950.1577012-1-john@john-millikin.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=john@john-millikin.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Gentle ping

On Thu, Aug 04, 2022 at 09:29:51PM +0900, John Millikin wrote:
> SunOS expects CD-ROM devices to have a block size of 512, and will
> fail to mount or install using QEMU's default block size of 2048.
> 
> When initializing the SCSI device, allow the `physical_block_size'
> block device option to override the default block size.
> 
> Signed-off-by: John Millikin <john@john-millikin.com>
> ---
>  hw/scsi/scsi-disk.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> This is the same diff as sent to qemu-devel@ about a week ago. That
> first email seems to have been eaten by a grue, but replying to it
> worked, so maybe the grue is gone now.
> 
> See https://gitlab.com/qemu-project/qemu/-/issues/1127 for some
> related discussion about SunOS CD-ROM compatibility.
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

