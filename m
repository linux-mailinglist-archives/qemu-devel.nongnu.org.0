Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D38EE3744B4
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 19:48:36 +0200 (CEST)
Received: from localhost ([::1]:59816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leLdT-0008CI-Uz
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 13:48:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1leLZe-00060t-Dv; Wed, 05 May 2021 13:44:38 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:52047)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1leLZX-0004xs-SZ; Wed, 05 May 2021 13:44:37 -0400
Received: by mail-wm1-x330.google.com with SMTP id n205so1933499wmf.1;
 Wed, 05 May 2021 10:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:subject:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ojVaaEUcq5yFWfKGP37S9IFum4ExwHTnU4DANKZUVC0=;
 b=F09lbqS2Jp9Mk94IzrycRvHhuUtDpQvmXn4KhrImDMIDNiSHov9ij6EwzeRyN1lgcn
 jAq5QqmOOuAc62s6ORKq9D/oujZaaYIwEVzedas63clK3twA1mhcLhzWuEFCmWAQUo5U
 Q7QyzJZVLxL7DcDbxREEeHRGz0V5FxBJOrO/MWWUv78ipZheqCE8qzmuaBBx9K0zPpyZ
 fQaZ4o1cGL9ivwi2/oFqGFsnYIWFy2Oyw946ZjLm0x0QA2Z21FkjpcMDtIwCoVVkR8Os
 J6fI7XREPbQe4GnIb9MeK0VeYGNoXwK5itvvTdPV9MfXF2/19mOEJkbTtbxS+VEbioXt
 sUEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:subject:to:cc:references
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=ojVaaEUcq5yFWfKGP37S9IFum4ExwHTnU4DANKZUVC0=;
 b=IxJ17xNlPDF8Jd5cM2BC0HtbSolQqlAyFDfUR2IN+bhlQkHg8TakidtkNo8BvavX6B
 1Y8IFeOu+lvFEeN79V4XkMZ5xyXFeryyVGTPY0i48hEzlQoaYaQBKxwTWJQsJZvE5CUZ
 yb2Kz+hRJTndbz4GYD0Y8Dg2Q5yWNXukTpG+Tq7es6wP1hvG55PmD3sqVe1qCWAefwJ6
 QEcThsPag/FhrngcJjJz/EsTbKICjgrts3xHYCLGNvkvploGumSbx9hGRDn4WM7mu8/R
 qv8y8ClTKFJgDVAd8OOZ2Sb5SAu+qq/o0Qls9PxfLt33oriI7Maqco08TuaOODpQ7O6y
 avOQ==
X-Gm-Message-State: AOAM5331bFZ3SUEUrxhAWPXrM3WxfLeuDJUuW+elUTnb4SFV0sfL9llG
 MlGdc7N5BIBUXZSdGd8FDdOexZ6yTHA=
X-Google-Smtp-Source: ABdhPJyD4Xmy2bYWbn2ga0q7SPczJa65W03cnti5XHp4QguJjivbml8Wn45eEAn/1KgXS4ug/r7a9Q==
X-Received: by 2002:a1c:6606:: with SMTP id a6mr10938884wmc.160.1620236669808; 
 Wed, 05 May 2021 10:44:29 -0700 (PDT)
Received: from [192.168.1.186]
 (host86-180-176-157.range86-180.btcentralplus.com. [86.180.176.157])
 by smtp.gmail.com with ESMTPSA id f6sm24181718wru.72.2021.05.05.10.44.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 May 2021 10:44:29 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Subject: Re: [PATCH] xen-block: Use specific blockdev driver
To: Anthony PERARD <anthony.perard@citrix.com>, qemu-devel@nongnu.org
References: <20210430163432.468894-1-anthony.perard@citrix.com>
Message-ID: <05554fc3-e900-e5b2-eef7-3155f8c9b4b4@xen.org>
Date: Wed, 5 May 2021 18:44:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210430163432.468894-1-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reply-To: paul@xen.org
Cc: Kevin Wolf <kwolf@redhat.com>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30/04/2021 17:34, Anthony PERARD wrote:
> From: Anthony PERARD <anthony.perard@citrix.com>
> 
> ... when a xen-block backend instance is created via xenstore.
> 
> Following 8d17adf34f50 ("block: remove support for using "file" driver
> with block/char devices"), using the "file" blockdev driver for
> everything doesn't work anymore, we need to use the "host_device"
> driver when the disk image is a block device and "file" driver when it
> is a regular file.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Acked-by: Paul Durrant <paul@xen.org>

> ---
>   hw/block/xen-block.c | 14 +++++++++++++-
>   1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/block/xen-block.c b/hw/block/xen-block.c
> index 83754a434481..674953f1adee 100644
> --- a/hw/block/xen-block.c
> +++ b/hw/block/xen-block.c
> @@ -728,6 +728,8 @@ static XenBlockDrive *xen_block_drive_create(const char *id,
>       XenBlockDrive *drive = NULL;
>       QDict *file_layer;
>       QDict *driver_layer;
> +    struct stat st;
> +    int rc;
>   
>       if (params) {
>           char **v = g_strsplit(params, ":", 2);
> @@ -761,7 +763,17 @@ static XenBlockDrive *xen_block_drive_create(const char *id,
>       file_layer = qdict_new();
>       driver_layer = qdict_new();
>   
> -    qdict_put_str(file_layer, "driver", "file");
> +    rc = stat(filename, &st);
> +    if (rc) {
> +        error_setg_errno(errp, errno, "Could not stat file '%s'", filename);
> +        goto done;
> +    }
> +    if (S_ISBLK(st.st_mode)) {
> +        qdict_put_str(file_layer, "driver", "host_device");
> +    } else {
> +        qdict_put_str(file_layer, "driver", "file");
> +    }
> +
>       qdict_put_str(file_layer, "filename", filename);
>       g_free(filename);
>   
> 


