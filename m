Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A79E251B870
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 09:08:44 +0200 (CEST)
Received: from localhost ([::1]:35936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmVbP-0003ZF-Jt
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 03:08:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nmVPm-0004Uf-G6
 for qemu-devel@nongnu.org; Thu, 05 May 2022 02:56:43 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.129.74]:54354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nmVPk-0005Mc-Ro
 for qemu-devel@nongnu.org; Thu, 05 May 2022 02:56:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651733799;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O3gJ2L5ecpdJV09maCrz1/uh+HXMXxoEjkX6YhLRsi8=;
 b=DiuUN2XYYyqOfh9Ao3OqI4pPCuf3SXHMfjkbirOzJ4B70XySVIfmRlEO3l97+aKCbJvsEa
 C1ZzAAczkrBhx/nOK5G2AEBcu/5TErTPH5AzlXazlsLOI+UMftH6b+Xb66tmB212ThzRcM
 Umaa/47kCAZymZvlDEwH0BOar/V9x7M=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-67-3n7w9F21OHG7jISQGJQnsw-1; Thu, 05 May 2022 02:56:38 -0400
X-MC-Unique: 3n7w9F21OHG7jISQGJQnsw-1
Received: by mail-ej1-f72.google.com with SMTP id
 mp18-20020a1709071b1200b006e7f314ecb3so2095141ejc.23
 for <qemu-devel@nongnu.org>; Wed, 04 May 2022 23:56:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=O3gJ2L5ecpdJV09maCrz1/uh+HXMXxoEjkX6YhLRsi8=;
 b=S2bMWp54zIGr0nzIj0fBq/bH9i+JXP4joTV9QtlI0JebKhvA8GSRkoMHZBhhcVI//j
 S8D2u8/RwAAYymUjnb/K9w+bE38v3FLcBxmfaSI9HbXUTodXv0JFP6rcGFf3TNMCMQcK
 dgIbr6p0bbp9QAqm9Er9keAN2hcffrPg/xBK7baf8lr7RIYPlJej3Nnehv+5L+UbuwVB
 p5oeCTAZh91xCyC4/ZnnDQ9f6tNH5cEcqx4g/ONddT6vsYeJxmBgu/MEEh+DJLMHj3fB
 TiDWT5z1k7wX034IwoNDNBXn3AwRyTVedILdHFooyPSVy8kBYhlGsrfW6RsZZuDKNcWc
 0B/w==
X-Gm-Message-State: AOAM533HHxUIWs12iS6PcAno2gaHX5/x8E9ba8MPAo/+laHVeDIF5DYo
 2X7oInPpNte1Cc5XkRkXhLpHC3vTZIc7iD/Dmw8Da4vyj7hjLpWrU8p7HGSstj8mok9oWIDeQvx
 0+dvTdU1pkIHM7yk=
X-Received: by 2002:a05:6402:26d3:b0:427:c590:ae2 with SMTP id
 x19-20020a05640226d300b00427c5900ae2mr20362540edd.242.1651733797298; 
 Wed, 04 May 2022 23:56:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw86ZdSb4hsZhvSJQKqfQWZkJ3k1H5m9yw9Xk2lquy+HXG8mwWRdT0Du/+RQdvFV7HlAB9Ecw==
X-Received: by 2002:a05:6402:26d3:b0:427:c590:ae2 with SMTP id
 x19-20020a05640226d300b00427c5900ae2mr20362518edd.242.1651733797051; 
 Wed, 04 May 2022 23:56:37 -0700 (PDT)
Received: from [127.0.0.1] (93-55-53-207.ip262.fastwebnet.it. [93.55.53.207])
 by smtp.gmail.com with ESMTPSA id
 ze15-20020a170906ef8f00b006f3ef214e67sm379476ejb.205.2022.05.04.23.56.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 04 May 2022 23:56:36 -0700 (PDT)
Date: Thu, 05 May 2022 08:56:28 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
CC: Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Laurent Vivier <lvivier@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-block@nongnu.org, Konstantin Kostiuk <kkostiuk@redhat.com>,
 Bandan Das <bsd@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Darren Kenny <darren.kenny@oracle.com>, Alexander Bulekov <alxndr@bu.edu>,
 =?ISO-8859-1?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>
Subject: Re: [PATCH 00/16] Misc cleanups
In-Reply-To: <20220504173025.650167-1-marcandre.lureau@redhat.com>
References: <20220504173025.650167-1-marcandre.lureau@redhat.com>
Message-ID: <3D974386-475F-49FA-928C-A0D1A29532C6@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.74; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
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

Looks good apart from the two patches I comment on=2E

Paolo

Il 4 maggio 2022 19:30:09 CEST, marcandre=2Elureau@redhat=2Ecom ha scritto=
:
>From: Marc-Andr=C3=A9 Lureau <marcandre=2Elureau@redhat=2Ecom>
>
>Hi,
>
>Perhaps the last series of preliminary patches before I propose a longer =
series
>to add qemu-common & qga meson subprojects=2E That's why they are mostly
>QGA-related cleanups=2E
>
>Thanks for the reviews!
>
>Marc-Andr=C3=A9 Lureau (16):
>  include: move qemu_*_exec_dir() to cutils
>  util/win32: simplify qemu_get_local_state_dir()
>  tests: make libqmp buildable for win32
>  compiler=2Eh: add QEMU_{BEGIN,END}_IGNORE_INITIALIZER_OVERRIDES
>  qobject/json-lexer: disable -Winitializer-overrides warnings
>  include: adjust header guards after renaming
>  qga: flatten safe_open_or_create()
>  osdep: export qemu_open_cloexec()
>  qga: use qemu_open_cloexec() for safe_open_or_create()
>  qapi/error: add g_autoptr(Error) support
>  qga: replace qemu_open_old() with qemu_open_cloexec()
>  test/qga: use G_TEST_DIR to locate os-release test file
>  qga/wixl: prefer variables over environment
>  qga/wixl: require Mingw_bin
>  qga/wixl: simplify some pre-processing
>  qga/wixl: replace QEMU_GA_MSI_MINGW_BIN_PATH with glib bindir
>
> configure                            |   9 +-
> meson=2Ebuild                          |   5 +-
> include/qapi/error=2Eh                 |   2 +
> include/qemu/compiler=2Eh              |  11 ++
> include/qemu/cutils=2Eh                |   7 ++
> include/qemu/help-texts=2Eh            |   4 +-
> include/qemu/osdep=2Eh                 |   9 +-
> tests/qtest/libqmp=2Eh                 |   2 +
> qemu-io=2Ec                            |   1 +
> qga/channel-posix=2Ec                  |  18 ++--
> qga/commands-posix=2Ec                 | 146 +++++++++++++--------------
> qobject/json-lexer=2Ec                 |   4 +
> storage-daemon/qemu-storage-daemon=2Ec |   1 +
> tests/qtest/fuzz/fuzz=2Ec              |   1 +
> tests/qtest/libqmp=2Ec                 |  35 +++++--
> tests/unit/test-qga=2Ec                |  11 +-
> util/cutils=2Ec                        | 108 ++++++++++++++++++++
> util/osdep=2Ec                         |  10 +-
> util/oslib-posix=2Ec                   |  81 ---------------
> util/oslib-win32=2Ec                   |  53 +---------
> qga/installer/qemu-ga=2Ewxs            |  83 +++++----------
> qga/meson=2Ebuild                      |  11 +-
> 22 files changed, 313 insertions(+), 299 deletions(-)
>


