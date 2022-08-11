Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 276F458F905
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 10:27:19 +0200 (CEST)
Received: from localhost ([::1]:47030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oM3XC-0001Q0-2f
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 04:27:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1oM3Hg-0008RL-7D
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 04:11:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1oM3He-0000HZ-Ga
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 04:11:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660205473;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zcKxC6jMkXTYF9X+QlCRYkaEyYYJRLf3+7hVLmK8PE4=;
 b=D5xY3ViG+zZTHIBzVjo4pUWAZcNfMyT+5t4jiLh5QjX3hb9AwqkAYfnwy9U6sh/LdZTM1f
 ZjerWzT2a/QIrqMyroJ+wOMEHt7F5hqrUD2RmEyVd5aoIgN45/eqcu5nbR5Tm6QUeKslyn
 kaLLZI3t52wZ8QqmZs5iFiGZqTGYOVY=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-605-B_MBrwmdOryBc2M1VXabIw-1; Thu, 11 Aug 2022 04:11:12 -0400
X-MC-Unique: B_MBrwmdOryBc2M1VXabIw-1
Received: by mail-vk1-f198.google.com with SMTP id
 q8-20020a1ff208000000b003778301f499so4926705vkh.3
 for <qemu-devel@nongnu.org>; Thu, 11 Aug 2022 01:11:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc;
 bh=zcKxC6jMkXTYF9X+QlCRYkaEyYYJRLf3+7hVLmK8PE4=;
 b=Er+Tzee5kQ6vX8QBNgGbE6fuQuKiCDYxJk7IgPS54BItqXOFNWM9XTmohDry0Wvo78
 1G/AdUJ4mRIW9j7t7GWEHdItJy+WlZQB4zlN2z0oP5ICZZFJB3AsYD6Uo0l2ls4tuZtb
 Ym40x7gZoCiS29jKrzOHHvz3bWtxbQvXmhxW4VxCz+ca+ZVk5avMMjHxyemfeKS9sPFJ
 ynwQ0we0mP8pHeXBwRZgydaMPPNzmYiCteQgUk6zVjs8RtcBydB3WIHjLul+JfCijpNG
 6u6Fme4i7m2CIY/KR8VcDdZsN9Yz8OAhvXh25vMsa/afAnaOXRLBixuH2+1w6NgeiwEC
 jB2g==
X-Gm-Message-State: ACgBeo3jw7ifk91oqMT0dAA1NRWqbJpIUvWxrqM+8LJqfeVLT1L2xMsY
 T3M2DJCGY0gfInnkGGME5xJFGT7A1faclFbhouCXe9BsyJsOmV5H3A8z9DHdhtIOEXRnIyvcMwC
 XXKvzBDflosakCBI=
X-Received: by 2002:a05:6102:214d:b0:388:977e:730 with SMTP id
 h13-20020a056102214d00b00388977e0730mr9779389vsg.7.1660205472332; 
 Thu, 11 Aug 2022 01:11:12 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6homizvGU1CEc6+z+UWu7frxoT/QkOdFkdq9TIdw7NbEeN7fyD5K8BzB2HwKBmwLWVZT5TKQ==
X-Received: by 2002:a05:6102:214d:b0:388:977e:730 with SMTP id
 h13-20020a056102214d00b00388977e0730mr9779378vsg.7.1660205472177; 
 Thu, 11 Aug 2022 01:11:12 -0700 (PDT)
Received: from ?IPv6:2804:1b3:a800:5713:6880:fd74:a3e5:2086?
 ([2804:1b3:a800:5713:6880:fd74:a3e5:2086])
 by smtp.gmail.com with ESMTPSA id
 o17-20020a0561023f9100b00388a5cd72bdsm1206398vsv.29.2022.08.11.01.11.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Aug 2022 01:11:11 -0700 (PDT)
Message-ID: <fce3323a5d903bc62c64e8e60184b20a2bcafac5.camel@redhat.com>
Subject: Re: [PATCH v7 03/12] migration: Export ram_transferred_ram()
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras@redhat.com>
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>, Eric Blake
 <eblake@redhat.com>, Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?=
 <f4bug@amsat.org>,  Yanan Wang <wangyanan55@huawei.com>, Markus Armbruster
 <armbru@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, David Edmondson
 <david.edmondson@oracle.com>
Date: Thu, 11 Aug 2022 05:11:08 -0300
In-Reply-To: <20220802063907.18882-4-quintela@redhat.com>
References: <20220802063907.18882-1-quintela@redhat.com>
 <20220802063907.18882-4-quintela@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.3 
MIME-Version: 1.0
Received-SPF: pass client-ip=170.10.129.124; envelope-from=leobras@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2022-08-02 at 08:38 +0200, Juan Quintela wrote:
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Reviewed-by: David Edmondson <david.edmondson@oracle.com>
> Signed-off-by: Juan Quintela <quintela@redhat.com>

Is this doubled Signed-off-by intentional?

> ---
>  migration/ram.h | 2 ++
>  migration/ram.c | 2 +-
>  2 files changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/migration/ram.h b/migration/ram.h
> index c7af65ac74..e844966f69 100644
> --- a/migration/ram.h
> +++ b/migration/ram.h
> @@ -65,6 +65,8 @@ int ram_load_postcopy(QEMUFile *f, int channel);
> =20
>  void ram_handle_compressed(void *host, uint8_t ch, uint64_t size);
> =20
> +void ram_transferred_add(uint64_t bytes);
> +
>  int ramblock_recv_bitmap_test(RAMBlock *rb, void *host_addr);
>  bool ramblock_recv_bitmap_test_byte_offset(RAMBlock *rb, uint64_t byte_o=
ffset);
>  void ramblock_recv_bitmap_set(RAMBlock *rb, void *host_addr);
> diff --git a/migration/ram.c b/migration/ram.c
> index b94669ba5d..85d89d61ac 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -422,7 +422,7 @@ uint64_t ram_bytes_remaining(void)
> =20
>  MigrationStats ram_counters;
> =20
> -static void ram_transferred_add(uint64_t bytes)
> +void ram_transferred_add(uint64_t bytes)
>  {
>      if (runstate_is_running()) {
>          ram_counters.precopy_bytes +=3D bytes;

Other than that, FWIW:=20
Reviewed-by: Leonardo Bras <leobras@redhat.com>


Best regards,=20
Leo


