Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C295EFAA6
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 18:32:53 +0200 (CEST)
Received: from localhost ([::1]:60850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odwSz-0006AT-0K
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 12:32:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oduFQ-0007ND-Fr
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 10:10:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oduFN-0002Lu-QZ
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 10:10:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664460640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GdyzSzZurKHU6wIjIDBkLhS08GdEvBxCYy6YIeX+on0=;
 b=RqzzXUTfAo6o3RwLVOS6hII4iXFwKYeztBj3OgGr1D1Dxdh2TtAL9d2dCQuRfhv3bSAt9+
 y91yLHiGlprbk582jpiKaVpZ81hl9dEBF7v3J0ooa1p87MHQ5utheyLeWQ6iB73YmZ3UqH
 YUCE4uzNG4gyyjKi2JDWbfM5EsG5I2c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-621-2a2XZxNLPGGCLk9X6TjjWQ-1; Thu, 29 Sep 2022 10:10:37 -0400
X-MC-Unique: 2a2XZxNLPGGCLk9X6TjjWQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E3586101A528;
 Thu, 29 Sep 2022 14:10:36 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.0])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 352467AE5;
 Thu, 29 Sep 2022 14:10:35 +0000 (UTC)
Date: Thu, 29 Sep 2022 16:10:32 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>
Cc: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 1/2] vvfat: allow some writes to bootsector
Message-ID: <YzWnWMRKhdzxkdT1@redhat.com>
References: <20220903162302.3176003-1-hpoussin@reactos.org>
 <20220903162302.3176003-2-hpoussin@reactos.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220903162302.3176003-2-hpoussin@reactos.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.08,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Am 03.09.2022 um 18:23 hat Hervé Poussineau geschrieben:
> 'reserved1' field in bootsector is used to mark volume dirty, or need to verify.
> Allow writes to bootsector which only changes the 'reserved1' field.
> 
> This fixes I/O errors on Windows guests.
> 
> Resolves: https://bugs.launchpad.net/qemu/+bug/1889421
> Signed-off-by: Hervé Poussineau <hpoussin@reactos.org>
> ---
>  block/vvfat.c | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/block/vvfat.c b/block/vvfat.c
> index d6dd919683d..35057a51c67 100644
> --- a/block/vvfat.c
> +++ b/block/vvfat.c
> @@ -2993,11 +2993,27 @@ DLOG(checkpoint());
>  
>      vvfat_close_current_file(s);
>  
> +    if (sector_num == s->offset_to_bootsector && nb_sectors == 1) {
> +        /*
> +         * Write on bootsector. Allow only changing the reserved1 field,
> +         * used to mark volume dirtiness
> +         */
> +        const unsigned char *initial = s->first_sectors
> +                                       + s->offset_to_bootsector * 0x200;
> +        for (i = 0; i < 0x200; i++) {
> +            if (i != offsetof(bootsector_t, u.fat16.reserved1) &&

I think you need to check the FAT version (s->fat_type) before accessing
u.fat16. For FAT32, the "reserved" field is at a different offset (but
seems to have the same meaning).

> +                initial[i] != buf[i]) {
> +                fprintf(stderr, "Tried to write to protected bootsector\n");
> +                return -1;
> +            }
> +        }
> +        return 0;
> +    }

Should we update s->first_sectors with the new value so that the guest
would actually read back what it wrote instead of having the change
disappear magically?

>      /*
>       * Some sanity checks:
>       * - do not allow writing to the boot sector
>       */
> -
>      if (sector_num < s->offset_to_fat)
>          return -1;

Kevin


