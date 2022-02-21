Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D104BDADB
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 17:37:09 +0100 (CET)
Received: from localhost ([::1]:53832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMBgR-0003mb-2S
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 11:37:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nMBNA-0005bi-JS
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 11:17:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33121)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nMBN8-0005jY-Nx
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 11:17:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645460230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zk+XERO+tUHzMI9hnV8he+HDZhD54Tu0NYaZJ+0jQRM=;
 b=RU0cIAFKlIej6dwftFZvqRJgRhC+prcJ7TxBti/Bi6HIv6bPWa9Wcs1cCic5HQnZWBvsCc
 iC2SSqYh+TJroCla82YNf913QNywsFOLE6xWsLifLxibm9x4sahsIkrzKM6wNjaNH36syH
 ZBKhQLh1bPeznzBWb5RpA5RBQMN9kIg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-553-T-upWWyZMjy7yQDUkzD9og-1; Mon, 21 Feb 2022 11:17:08 -0500
X-MC-Unique: T-upWWyZMjy7yQDUkzD9og-1
Received: by mail-wr1-f72.google.com with SMTP id
 q21-20020adfab15000000b001e57c9a342aso7608018wrc.6
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 08:17:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=zk+XERO+tUHzMI9hnV8he+HDZhD54Tu0NYaZJ+0jQRM=;
 b=7PBwCgd7PLC9XiIK9ny+LOtOo+N9Gobg3IFN9aL3p25jR4DwY8O0BnG4WHo66Vycb2
 QSWeumWejfI3TcC0rVwVzXiL53/xyfYDa9C9Yb4xoI7Bvlq1/P4WwIY9y6lX+Ll+syjH
 pAmaYlqd7TGIo7+QFCup2oG6q08hH4+ADuo1B/eXP8h6F51+P+xPk3jeVQRI72KapIlU
 iQNGt0hBpUj/jsd/hAgTKcIi8cjYXnmAAIHdmJ6Lsykjg5LIhlNTnYpL2rSNz082/mbn
 My9GirfTg2FC8+6FZR6HDZIOCPwkDV/bjwJc5Ylc4il8Ygg/mwq85mv7hJmSfY2Hm1yU
 VXpQ==
X-Gm-Message-State: AOAM530DVXJ7GFago1EQwDcRYkUlPtIr7C0RkjPKmX9TYF27dxBSubuq
 ED4QlqGphln/xZ29skh60gBdBx6EkyJrgLEjgdph+snwuzZlGq8Ru8YZ+289vUebWSpGdxr/0qr
 QCOSLv1+SGcp9nrI=
X-Received: by 2002:a7b:c1cd:0:b0:37b:f996:ff57 with SMTP id
 a13-20020a7bc1cd000000b0037bf996ff57mr22243336wmj.122.1645460227829; 
 Mon, 21 Feb 2022 08:17:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyPZ9RNOtgeATZ+lbld0ywXJrpLoYHiCrm0ZzqSOj0fdQBFm7K22kNFyabnRsTrvtsIck676A==
X-Received: by 2002:a7b:c1cd:0:b0:37b:f996:ff57 with SMTP id
 a13-20020a7bc1cd000000b0037bf996ff57mr22243321wmj.122.1645460227625; 
 Mon, 21 Feb 2022 08:17:07 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 t9-20020a05600c198900b0037c0342cb62sm9086872wmq.4.2022.02.21.08.17.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 08:17:07 -0800 (PST)
Date: Mon, 21 Feb 2022 16:17:05 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 12/20] migration: Export ram_load_postcopy()
Message-ID: <YhO7ARu/XD/61j91@work-vm>
References: <20220216062809.57179-1-peterx@redhat.com>
 <20220216062809.57179-13-peterx@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220216062809.57179-13-peterx@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Xu (peterx@redhat.com) wrote:
> Will be reused in postcopy fast load thread.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/ram.c | 2 +-
>  migration/ram.h | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/migration/ram.c b/migration/ram.c
> index 1ed70b17d7..f8bc3cd882 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -3644,7 +3644,7 @@ int ram_postcopy_incoming_init(MigrationIncomingState *mis)
>   *
>   * @f: QEMUFile where to send the data
>   */
> -static int ram_load_postcopy(QEMUFile *f)
> +int ram_load_postcopy(QEMUFile *f)
>  {
>      int flags = 0, ret = 0;
>      bool place_needed = false;
> diff --git a/migration/ram.h b/migration/ram.h
> index 2c6dc3675d..ded0a3a086 100644
> --- a/migration/ram.h
> +++ b/migration/ram.h
> @@ -61,6 +61,7 @@ void ram_postcopy_send_discard_bitmap(MigrationState *ms);
>  /* For incoming postcopy discard */
>  int ram_discard_range(const char *block_name, uint64_t start, size_t length);
>  int ram_postcopy_incoming_init(MigrationIncomingState *mis);
> +int ram_load_postcopy(QEMUFile *f);
>  
>  void ram_handle_compressed(void *host, uint8_t ch, uint64_t size);
>  
> -- 
> 2.32.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


