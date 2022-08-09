Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 369EC58D851
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 13:42:40 +0200 (CEST)
Received: from localhost ([::1]:52614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLNd6-0007mZ-Pf
	for lists+qemu-devel@lfdr.de; Tue, 09 Aug 2022 07:42:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oLNb7-00068x-GC
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 07:40:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oLNb4-0006R5-1p
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 07:40:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660045229;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8WzLndhgvsXgzOiayH/ZwCUNE7LbD3ULRIobYBTze1c=;
 b=iepN28ZnvRBBuRKeFONiMs9jlGKR3qTzM4KE3LlCLfR1yl0CdKk4GS7uUfqrb8iPkep6cg
 il08BLyk3MIbUXGJ+IOZx+DEvNsmQE0YPLCML3sijmuyJ2GO0EJBV9MHrLaFXO/K9LRZdf
 rORnT9NL52lR4uk67WcZQjyFWvTpFTE=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-466-_x2J_PvaPfOf0nWu6v4kPg-1; Tue, 09 Aug 2022 07:40:28 -0400
X-MC-Unique: _x2J_PvaPfOf0nWu6v4kPg-1
Received: by mail-ej1-f69.google.com with SMTP id
 oz39-20020a1709077da700b007313bf43f0dso1789806ejc.0
 for <qemu-devel@nongnu.org>; Tue, 09 Aug 2022 04:40:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=8WzLndhgvsXgzOiayH/ZwCUNE7LbD3ULRIobYBTze1c=;
 b=Et2LQ+mEw8+Qw0fU4aDN72jqyoLJAoaYl5PNyR9zd6+6+2MjUTW/CSaEFlKSviXgxd
 gUuxnDDIt6/ScOCzwvSpS/KyPVwzOVfV0MgVILOvCJPGltfwlnsJ+ZVCFDMXPhWwCVZ/
 bVzkvRebtG+HPuHzCdYQaN8PVxAGCNSdiV7zzwhXFUbYMA9/l/EtoFM5zvMTMZIqQfIY
 NzdmhTD6OnmUBKplBejXYbSyayC3BZdE9IeZlkw7BnJGKjRV/dzuh3DXj3gHzvhS2EHz
 YGn73urds+4AVRx7Wr5rmw3v/mtkOTMnikC1BxoMDIGlIhREgm+YlyVAbDStQoxYh8bG
 YB9g==
X-Gm-Message-State: ACgBeo0/UurdbtblxMjhJhOhBmKkbwxcga50qmee0E9EPYitXVwHyVTP
 M6OmVtFw2vAbLmnCY1tNUxXSUhooo31e3BBxdIGfrucnzZJEDlNxphTXAu030jN2E3njgBx7/lP
 Px/odGEPkx2q65chszXCFPgA8HwmxLP7xkBIM6P0U+BIkhpqTG2o6+EzTaa2PO9oRqcY=
X-Received: by 2002:a05:6402:538a:b0:43a:298e:bc2b with SMTP id
 ew10-20020a056402538a00b0043a298ebc2bmr21541648edb.125.1660045226689; 
 Tue, 09 Aug 2022 04:40:26 -0700 (PDT)
X-Google-Smtp-Source: AA6agR647TfYdQvWclER6gwyMg+OEbAFmcf6Ow2+u24pixpRBLJzzAvONPHeqQiP3ehlmUl07W6UcQ==
X-Received: by 2002:a05:6402:538a:b0:43a:298e:bc2b with SMTP id
 ew10-20020a056402538a00b0043a298ebc2bmr21541623edb.125.1660045226424; 
 Tue, 09 Aug 2022 04:40:26 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 i26-20020a17090685da00b0073087140945sm1012126ejy.123.2022.08.09.04.40.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Aug 2022 04:40:25 -0700 (PDT)
Date: Tue, 9 Aug 2022 13:40:24 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, peter.maydell@linaro.org, ani@anisinha.ca,
 berrange@redhat.com
Subject: Re: [PATCH for-7.1] tests: acpi: silence applesmc warning about
 invalid key
Message-ID: <20220809134024.3c6cc534@redhat.com>
In-Reply-To: <20220728133713.1369596-1-imammedo@redhat.com>
References: <20220728133713.1369596-1-imammedo@redhat.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
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

On Thu, 28 Jul 2022 09:37:13 -0400
Igor Mammedov <imammedo@redhat.com> wrote:

> OSK value is irrelevant for ACPI test case.
> Supply fake OSK explicitly to prevent QEMU complaining about
> invalid key when it fallbacks to default_osk.
>=20
> Suggested-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>

Michael,
 can you pick it up?

> ---
>  tests/qtest/bios-tables-test.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-tes=
t.c
> index 359916c228..7c5f736b51 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -1632,7 +1632,9 @@ static void test_acpi_q35_applesmc(void)
>          .variant =3D ".applesmc",
>      };
> =20
> -    test_acpi_one("-device isa-applesmc", &data);
> +    /* supply fake 64-byte OSK to silence missing key warning */
> +    test_acpi_one("-device isa-applesmc,osk=3Dany64characterfakeoskiseno=
ugh"
> +                  "topreventinvalidkeywarningsonstderr", &data);
>      free_test_data(&data);
>  }
> =20


