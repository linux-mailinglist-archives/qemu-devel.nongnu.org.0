Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E661F0B38
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Jun 2020 15:02:31 +0200 (CEST)
Received: from localhost ([::1]:45778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jhuwW-00055H-4b
	for lists+qemu-devel@lfdr.de; Sun, 07 Jun 2020 09:02:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jhuvH-0004bz-Pq
 for qemu-devel@nongnu.org; Sun, 07 Jun 2020 09:01:13 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:56424
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jhuvF-0005vo-Qn
 for qemu-devel@nongnu.org; Sun, 07 Jun 2020 09:01:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591534867;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LPXLLXDLdzWHcbPoAjkdydBbdP4cr2Gkyf5yChYkkWA=;
 b=GnTKAPBdOaOqcMqwW/Eu+snckXwJ81z5t73biw4LOr1CCUve//4QgNsKxGL6eoFv66ShHZ
 In+jl3D3RjasaN6aR/EvYmmuYX82GizE93tI+PRn25mPh3HpQQPnwOzVpXZjEi649H2nPO
 A86IEq53guNL+vr0O6Rf4B1Zb38BMtw=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-223-EsERH0RKNzmLmkdU_pIxuw-1; Sun, 07 Jun 2020 09:01:05 -0400
X-MC-Unique: EsERH0RKNzmLmkdU_pIxuw-1
Received: by mail-oi1-f200.google.com with SMTP id s9so7409884oih.20
 for <qemu-devel@nongnu.org>; Sun, 07 Jun 2020 06:01:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LPXLLXDLdzWHcbPoAjkdydBbdP4cr2Gkyf5yChYkkWA=;
 b=p4/Fs/88iPR2u+oLfverQFoX/66oVdeYNxp6QccXPnpQnvOyKI4JNFbXIamvYdwp5x
 mE0hYfQj81zphjdwBZsr4633gSmQHjdVkUrPWm7vauPqWqHYk4oqvfnZDo6FACoLHhS7
 Dhg4Ipb4+jA+3tsDEG/gxqzkjrSmWt5/6xwUQobAq1Pr++CRTTzEAkU0nNrzT/xsCCBp
 BEY6Bk/0ac3QQy5k4lZt0dlFjp14tQwH7FVray3s6meLgxB1GRLOUu4Q5t3SRyE+iXOs
 zDCqbUDc9mWPmB8yEBLf3BgTQzDcm0Iqb+Lbm5IxYpd53ltMxjvJm0D+Fkmm6A+g0p0T
 0+iQ==
X-Gm-Message-State: AOAM532t0EJ5pEkKBjaafBrhE8UTJwpvlzVwAhscap1+vYi9GbCa0aEP
 wEBq9Wq1iPdoSEVmbqQV/2nhICWWwVOvc/EWZaSovSTWmNOJ8+AU7LUfeiQxMn2lf2m4MvT/SUI
 7kiZmjnBvv5i++pgJywbhAV+o3yoYjSU=
X-Received: by 2002:a05:6830:14c4:: with SMTP id
 t4mr14626668otq.79.1591534865237; 
 Sun, 07 Jun 2020 06:01:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyy2X3ycKhG6GyEDQOFCRz9tqk4YvT5uyw6V9/FytAA/l5Mx70oPcWjm0WuhAdgut/VC8h0zHjgfGZSeiZ8SWc=
X-Received: by 2002:a05:6830:14c4:: with SMTP id
 t4mr14626648otq.79.1591534865020; 
 Sun, 07 Jun 2020 06:01:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200607052022.12222-1-thuth@redhat.com>
In-Reply-To: <20200607052022.12222-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Date: Sun, 7 Jun 2020 15:00:53 +0200
Message-ID: <CAP+75-UyT9b-wOb-LUViFx-N_wJmdO+t0TwhRKt2U+GTCZ0_ig@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Fix the classification of
 bios-tables-test-allowed-diff.h
To: Thomas Huth <thuth@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/07 08:00:47
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Laurent Vivier <lvivier@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Jun 7, 2020 at 7:21 AM Thomas Huth <thuth@redhat.com> wrote:
>
> The file tests/qtest/bios-tables-test-allowed-diff.h is currently only
> assigned to the qtest section according MAINTAINERS. However, this file
> normally only gets updated when the ACPI tables changed - something the
> qtest maintainers don't have much clue of. Thus this file should rather
> be assigned to the ACPI maintainers instead.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

> ---
>  MAINTAINERS | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6e7890ce82..0c5ed09ad5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1531,7 +1531,7 @@ F: hw/acpi/*
>  F: hw/smbios/*
>  F: hw/i386/acpi-build.[hc]
>  F: hw/arm/virt-acpi-build.c
> -F: tests/qtest/bios-tables-test.c
> +F: tests/qtest/bios-tables-test*
>  F: tests/qtest/acpi-utils.[hc]
>  F: tests/data/acpi/
>
> @@ -2321,6 +2321,7 @@ S: Maintained
>  F: qtest.c
>  F: accel/qtest.c
>  F: tests/qtest/
> +X: tests/qtest/bios-tables-test-allowed-diff.h
>
>  Device Fuzzing
>  M: Alexander Bulekov <alxndr@bu.edu>
> --
> 2.18.1
>
>


