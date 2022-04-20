Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78553508B0B
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 16:46:59 +0200 (CEST)
Received: from localhost ([::1]:54672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhBbe-0000AD-Ix
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 10:46:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nhB2n-00052U-2H
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 10:11:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nhB2k-0003o1-Nf
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 10:10:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650463852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gql9bZuDr8p8FlnovhjKjlrrvj5G73cVkf4LIqFJv80=;
 b=RwzbxK782IfTmls+27f1njvBYEecf7oCmTeTsj7Cdp1T15hzd260pqQTMzth8/UBtMQR5s
 TF0wo8/OouaB7I6a5CHDuXUdrh+6g+TbqP1Q8UZYq/D6eyfz+UCdbQY7n+h+tlNGxzJZJD
 HKh+58g6ZR2C5i3ARDIQY0j7ipfeunU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-7-ojlXzqNbOW3BZ7ecJiJg-1; Wed, 20 Apr 2022 10:10:50 -0400
X-MC-Unique: 7-ojlXzqNbOW3BZ7ecJiJg-1
Received: by mail-wm1-f69.google.com with SMTP id
 d13-20020a05600c3acd00b0038ff865c043so2999728wms.3
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 07:10:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=Gql9bZuDr8p8FlnovhjKjlrrvj5G73cVkf4LIqFJv80=;
 b=kAss55VcCevMJjPafzaa/r1BTSvr0wI1OhUf+HQOAQm4I7albE00rX65ePLE3P9Yjb
 Wavv4oxeAULNvmLeGb5aCBQ0kgr/sXWSkZY/O55D23ZyUTDz2bNTtqm5RMe5bEXaXmlj
 fdwbp7y4m+VAztU8u+t0N9vQ4Wytt81MWmKSV+6wdGWr+Y+2qDwVKRJUlT6aMJyyn/J2
 3LIGmLzAbuBcYj31LtNVFe3tbn7YflQfZsJKgRikJ/qLKNQndMDTq0W8try7IegTjGtI
 8fU2YLSlizwspQHZMxKBVZBjR89ZKe2os1A7ONTFbhng1H8YsELL3WNEqOSZUqtDnwz8
 Ofvg==
X-Gm-Message-State: AOAM533xtkdOCCG69ZbIENbEKK76tSi0XzotdPsuxZPCxqkOZwz2xgCl
 Ljtra0mSBsP3bTpXcXYqyqCisouOH7+V26b7J+5yIbwLnnEDXBbS6NLrkMMORzd/ukKBhIQqcFD
 0QocRfwUQBeXrFf4=
X-Received: by 2002:adf:dccb:0:b0:207:bc3a:aad2 with SMTP id
 x11-20020adfdccb000000b00207bc3aaad2mr15521485wrm.174.1650463849488; 
 Wed, 20 Apr 2022 07:10:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy8vsX6XyNYbHwK6pHFaoQHvcHAipRoC0qgUldahLEXfE1aXuSSaETU2atPNre7OrmGLkRFVw==
X-Received: by 2002:adf:dccb:0:b0:207:bc3a:aad2 with SMTP id
 x11-20020adfdccb000000b00207bc3aaad2mr15521476wrm.174.1650463849300; 
 Wed, 20 Apr 2022 07:10:49 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 f14-20020a5d568e000000b00207ae498882sm758wrv.32.2022.04.20.07.10.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 07:10:48 -0700 (PDT)
Date: Wed, 20 Apr 2022 15:10:46 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH 40/41] migration/ram: fix clang warning
Message-ID: <YmAUZliTH500sHvh@work-vm>
References: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
 <20220420132624.2439741-41-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220420132624.2439741-41-marcandre.lureau@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* marcandre.lureau@redhat.com (marcandre.lureau@redhat.com) wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> ../migration/ram.c:1292:31: warning: use of bitwise '&' with boolean operands [-Wbitwise-instead-of-logical]
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>

Yeh that's the same as:
https://lists.gnu.org/archive/html/qemu-devel/2022-04/msg00640.html

Dave

> ---
>  migration/ram.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/migration/ram.c b/migration/ram.c
> index 3532f64ecb98..0ef4bd63ebd5 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -1289,7 +1289,7 @@ static int save_normal_page(RAMState *rs, RAMBlock *block, ram_addr_t offset,
>                                           offset | RAM_SAVE_FLAG_PAGE));
>      if (async) {
>          qemu_put_buffer_async(rs->f, buf, TARGET_PAGE_SIZE,
> -                              migrate_release_ram() &
> +                              migrate_release_ram() &&
>                                migration_in_postcopy());
>      } else {
>          qemu_put_buffer(rs->f, buf, TARGET_PAGE_SIZE);
> -- 
> 2.35.1.693.g805e0a68082a
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


