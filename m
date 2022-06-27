Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C13D055BA7A
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 16:25:47 +0200 (CEST)
Received: from localhost ([::1]:36520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5pgO-0004uK-Uh
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 10:25:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o5pdg-0003LS-NE
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 10:22:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37293)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o5pdd-0001TP-BP
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 10:22:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656339772;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+RXT75b1Vgv8c1lhA1TsnwoRCMYfskvTRpaH+PCLfLo=;
 b=DKOEL+tAe9CgpufCoTDcnZkmk0+vkosPh8BYa8uFmISBF5muH/VitKcC1vkxTcZ7IofmBH
 NdGipDszkLDr8L50kHalKh1UUsAKe8yOIk71+CdfRG8yGoVnLeA5yUyPdJ95gRXM8vwLTi
 SAANcFjqYOGYX1J+8CFN2plJlDOcTvc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-664-XQ8H9dZsNASN148SOh6KHw-1; Mon, 27 Jun 2022 10:22:50 -0400
X-MC-Unique: XQ8H9dZsNASN148SOh6KHw-1
Received: by mail-wr1-f71.google.com with SMTP id
 j14-20020adfa54e000000b0021b8c8204easo1227819wrb.0
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 07:22:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=+RXT75b1Vgv8c1lhA1TsnwoRCMYfskvTRpaH+PCLfLo=;
 b=4bfXMAU2Zlos1H/iXy++nDGXcrh91BxeEW9SDTQoE4Isd9bCcbA4XXJFwQ2Ft4FOU0
 hs+eTrEe/T43l1PSt69zYDKAfXZPfdmD6xyNGBxUc2zLhe5j6WpYTz4uUmD2st+uIdlD
 akJBsecAF9KyQW6wmLd6KiWL6A2vmU9qPDeIjdpwBOlsawbCPPW0Hpu4TH7xFnD2kw9c
 EXoWEB1DEzmOO3lQN94DAl+W5NZFD1P3CP6Ol3cGteM0OBSZg0qXccYVUQBybXgSqiaC
 fSQJa2bGO5AuV+YLKzJH9wUgsAEG0LAczsaB2U32QloP7+AKs30pDet0kq0lba6yD+j2
 xLQQ==
X-Gm-Message-State: AJIora+L2VFhzK08GQ6o18K+vxfngPMwWECssMptin0BaOY3Si7i5R/p
 YVCXUQ6j2cAcaCcios6mHwxaCbduRjxcwvCgKfUu3PdXRghkSAyWDz1Pjw7IxQxAWywecBUnCsq
 RzzJV9a41AYi+H18=
X-Received: by 2002:a05:6000:83:b0:21b:a7bd:e388 with SMTP id
 m3-20020a056000008300b0021ba7bde388mr12410527wrx.41.1656339769346; 
 Mon, 27 Jun 2022 07:22:49 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vvL+dP84OBvf/DIiVhjnq8CAk7rkYjLi0ywKTAjqxdNyfPbIo/Uo1Qf4arS7N/WR9xkniCIg==
X-Received: by 2002:a05:6000:83:b0:21b:a7bd:e388 with SMTP id
 m3-20020a056000008300b0021ba7bde388mr12410512wrx.41.1656339769170; 
 Mon, 27 Jun 2022 07:22:49 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 c130-20020a1c3588000000b0039c454067ddsm13456964wma.15.2022.06.27.07.22.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 07:22:48 -0700 (PDT)
Date: Mon, 27 Jun 2022 15:22:46 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH] migration: remove unreachable code after reading data
Message-ID: <Yrm9NsPN3RQUmZ6j@work-vm>
References: <20220627135318.156121-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220627135318.156121-1-berrange@redhat.com>
User-Agent: Mutt/2.2.5 (2022-05-16)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

* Daniel P. Berrangé (berrange@redhat.com) wrote:
> The code calls qio_channel_read() in a loop when it reports
> QIO_CHANNEL_ERR_BLOCK. This code is reported when errno==EAGAIN.
> 
> As such the later block of code will always hit the 'errno != EAGAIN'
> condition, making the final 'else' unreachable.
> 
> Fixes: Coverity CID 1490203
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/qemu-file.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/migration/qemu-file.c b/migration/qemu-file.c
> index 1e80d496b7..1615c48b7e 100644
> --- a/migration/qemu-file.c
> +++ b/migration/qemu-file.c
> @@ -384,10 +384,8 @@ static ssize_t qemu_fill_buffer(QEMUFile *f)
>          f->total_transferred += len;
>      } else if (len == 0) {
>          qemu_file_set_error_obj(f, -EIO, local_error);
> -    } else if (len != -EAGAIN) {
> -        qemu_file_set_error_obj(f, len, local_error);
>      } else {
> -        error_free(local_error);
> +        qemu_file_set_error_obj(f, len, local_error);
>      }
>  
>      return len;
> -- 
> 2.36.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


