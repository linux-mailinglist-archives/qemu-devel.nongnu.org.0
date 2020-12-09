Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56EA72D3EA0
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 10:27:35 +0100 (CET)
Received: from localhost ([::1]:60662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmvl0-0002UN-De
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 04:27:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1kmvha-0000II-T6
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 04:24:02 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:34743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1kmvhY-00070x-Nn
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 04:24:02 -0500
Received: by mail-wr1-x442.google.com with SMTP id k14so938142wrn.1
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 01:23:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dme-org.20150623.gappssmtp.com; s=20150623;
 h=to:cc:subject:in-reply-to:references:from:date:message-id
 :mime-version; bh=p9g+6gT15QTK6PPTX2sTdEXPf5RHe7jRwVR0qGugXhU=;
 b=k5FBjc6WWseZKTCd0cCJ15w3GHubrsNKEzGksuLNSrDSw2PqG7chDYvEJfcpWFyaI2
 esVL85wJoDNVn94apZcv6+x74HGJPTik1ia0RM/tyInYU0PLVv1iQeRdZSQxAk0YIkur
 S6IZQn8lnjdFOfkxozBMsBj7OF2JdSezj3gT8fpwbkTI9INw3dkj2pIvAVtXiLQWN2Z1
 cTI/X14UqeNmEa5tI+67RgqnTo3XntsrP5qMOD61OrZWlZZnuCIqya3haH2yxxROClo8
 POnoIvt1naapC13bjPOoyDfModwuOvHR3u9hHEskueLTKd3JMmiISm6MpxtZ1VUCVQ6w
 uOcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:subject:in-reply-to:references:from:date
 :message-id:mime-version;
 bh=p9g+6gT15QTK6PPTX2sTdEXPf5RHe7jRwVR0qGugXhU=;
 b=YMUlu4/qxLycotZN+rp2msYTaT3kdbZ2ssKz67tiC6ZtvBkUk7OsYsMuTal1nzEV2W
 hQ+3Hy8Nbz5mF1iFJ/55CO2FeGQRMMp9BMMKcfFsiEaYoiCpf9aMN7aZ7j7/WzSEY0ml
 dUvOpdpqeZo3UkOCPaUC9iNVIT/ALwXXoj3Mmml8ab8SyvCYSZtP3+elkFrwK7gDpFED
 51ArfVatiGPsLmxZ8f7stHFQSxT7x8ln5im5JXMHh5Jpzab8Ar/+rxDORyX7lulwy+Av
 3MaHVts9zp/raQdG5k2s5TJxct6vQGOh8GbDcT+iu+tCVNzENPTaJqzx/I1Ic9PF6lgT
 aU+Q==
X-Gm-Message-State: AOAM533cX6E4FiiyzDEVXzM7C6Cj+L3yxdT7qqap4rt85qkT9vFxyEMZ
 qFaD6MBZ3egYZUOQp5/4NuQp6Q==
X-Google-Smtp-Source: ABdhPJyKXipLleX85vBmNqZ9jzcZMI2iDyCMoe8dU1jgdVwnSEKaQwOysagR+iE1yY/AYGpAGYqlqQ==
X-Received: by 2002:adf:efc4:: with SMTP id i4mr1514588wrp.323.1607505838586; 
 Wed, 09 Dec 2020 01:23:58 -0800 (PST)
Received: from disaster-area.hh.sledj.net (disaster-area.hh.sledj.net.
 [2001:8b0:bb71:7140:64::1])
 by smtp.gmail.com with ESMTPSA id d187sm2337772wmd.8.2020.12.09.01.23.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 01:23:57 -0800 (PST)
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id f8906d0a;
 Wed, 9 Dec 2020 09:23:56 +0000 (UTC)
To: Li Zhang <zhlcindy@gmail.com>, qemu-devel@nongnu.org,
 quintela@redhat.com, dgilbert@redhat.com
Subject: Re: [PATCH 1/1] Avoid migration if guest is in postmigrated status
In-Reply-To: <20201209072029.2338351-1-li.zhang@cloud.ionos.com>
References: <20201209072029.2338351-1-li.zhang@cloud.ionos.com>
X-HGTTG: zarquon
From: David Edmondson <dme@dme.org>
Date: Wed, 09 Dec 2020 09:23:56 +0000
Message-ID: <cunim9bs577.fsf@zarquon.hh.sledj.net>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: neutral client-ip=2a00:1450:4864:20::442;
 envelope-from=dme@dme.org; helo=mail-wr1-x442.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779, UNPARSEABLE_RELAY=0.001 autolearn=no autolearn_force=no
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
Cc: Li Zhang <li.zhang@cloud.ionos.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wednesday, 2020-12-09 at 07:20:29 GMT, Li Zhang wrote:

> This patch is to avoid executing migrations twice, which causes
> coredump. After the migration has been completed, guest is in postmigrated
> status on source host and the block device is inactive. If executing 
> migration again, it will cause coredump and a block error. For exmaple, 
> executing #migrate "exec:cat>file" twice on source host, block error:
> bdrv_inactivate_recurse: Assertion `!(bs->open_flags & BDRV_O_INACTIVE)' failed
>
> Signed-off-by: Li Zhang <li.zhang@cloud.ionos.com>

There is an existing proposal for this (the same approach) in
https://lore.kernel.org/r/6b704294ad2e405781c38fb38d68c744@h3c.com.

> ---
>  migration/migration.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/migration/migration.c b/migration/migration.c
> index 87a9b59f83..113f7e1e41 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -2115,6 +2115,11 @@ static bool migrate_prepare(MigrationState *s, bool blk, bool blk_inc,
>          return false;
>      }
>  
> +    if (runstate_check(RUN_STATE_POSTMIGRATE)) {
> +        error_setg(errp, "Unable to migrate, guest has been migrated");
> +        return false;
> +    }
> +
>      if (migration_is_blocked(errp)) {
>          return false;
>      }
> -- 
> 2.18.4

dme.
-- 
Ah, oh your hair is beautiful.

