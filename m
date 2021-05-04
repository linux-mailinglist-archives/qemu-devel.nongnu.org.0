Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C535372788
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 10:48:19 +0200 (CEST)
Received: from localhost ([::1]:36586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldqj4-00005X-8v
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 04:48:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ldqfk-0006kl-KP
 for qemu-devel@nongnu.org; Tue, 04 May 2021 04:44:52 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:33552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ldqfi-0000Ji-M5
 for qemu-devel@nongnu.org; Tue, 04 May 2021 04:44:52 -0400
Received: by mail-wr1-x42b.google.com with SMTP id n2so8464412wrm.0
 for <qemu-devel@nongnu.org>; Tue, 04 May 2021 01:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=FXVI+gui8oBx60LOJw15S4eEYD9NnSVM2Qx/zM6iBBY=;
 b=nw3f2EA7/lv3JgiS8d9shduo3XxKKxkwGPsu090fHsSMWn2kkAAMjqrThCkkpYrQEy
 wlOY1/ZpNw7g/zzfy1tFcdvDZZHeFGmMTl2Wd1/OQp+TEKZCQNbU2bzKAkb4+WX8csOn
 P0BEt2mTFsVdngtI+Dy6nHl4KSX+TkX64yK2CqvJpTQP083UNlc5CZty/7drrbt5/Fxz
 cFPNdc4p4PgBEoAsu6p5gf1id1ypRJ8d685sz8ArchLxXoyd3/uvbixzREg2ThSfgfB7
 PjtVUUQyrcc0B2lQMgZW3Ck7KmVJNcGpETZtLOZzAHhX4GLznArH2O3F98jPUaGvUfVS
 vcgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=FXVI+gui8oBx60LOJw15S4eEYD9NnSVM2Qx/zM6iBBY=;
 b=ChJ79Sq1/MusjJFVemtnONPMy8ay9ll4//NoCb2GCfjlMWnILRs4cAE6iJ0xzX5OIr
 f7DMX6CHr1ocLVYsrdWP8ZocqIJ76vRUM3OTZGK9TFwkjzQQxqNxYeFBMMimOjRuE241
 kownQB9hV8pnhP2Y+nBaf5rKIp6PFGzwFKvVapXMvJZBunsDGFyGeXC7HPNuzRWX3eAA
 rxjHtpwRxufCB5f4DtSAC5rNDVCOpHBrB5QyyuRS185tlijTLFIJHS45gNtdXfd8J5VV
 FFIv57cEFD2ysyMUbuXGPiIMqqLhwPNkLgrsoCnk3DyiMV0ea70KgOEnpgZLZYspNoen
 OtFw==
X-Gm-Message-State: AOAM530rN4qxdhSsGPAOnHElziqM4qmAWSTLveJhyyatsQ0KJnLEsJGQ
 HyYT0wI9kZHvRoI9xfstg3rTIQ==
X-Google-Smtp-Source: ABdhPJyRmxdknh0zqKCYRl08fJ6YsFTJUWUs+kF6OTBhYk9vUwGIy7KDsaaSHlYMwQki5oLq+LA8WQ==
X-Received: by 2002:adf:f14c:: with SMTP id y12mr31302034wro.382.1620117888521; 
 Tue, 04 May 2021 01:44:48 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o17sm16299724wrs.48.2021.05.04.01.44.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 01:44:46 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 140D41FF7E;
 Tue,  4 May 2021 09:44:46 +0100 (BST)
References: <20210503165525.26221-1-peter.maydell@linaro.org>
 <20210503165525.26221-2-peter.maydell@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 1/3] tests/qtest/tpm-util.c: Free memory with correct
 free function
Date: Tue, 04 May 2021 09:44:00 +0100
In-reply-to: <20210503165525.26221-2-peter.maydell@linaro.org>
Message-ID: <8735v2q45e.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Corey Minyard <minyard@acm.org>, Stefan Berger <stefanb@linux.vnet.ibm.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> tpm_util_migration_start_qemu() allocates memory with g_strdup_printf()
> but frees it with free() rather than g_free(), which provokes Coverity
> complaints (CID 1432379, 1432350). Use the correct free function.
>
> Fixes: Coverity CID 1432379, CID 1432350
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> With newer glib (2.46 and up) g_free() is guaranteed to be the same
> as free(), but matching things up is neater anyway.
> ---
>  tests/qtest/tpm-util.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tests/qtest/tpm-util.c b/tests/qtest/tpm-util.c
> index b70cc32d600..3a40ff3f96c 100644
> --- a/tests/qtest/tpm-util.c
> +++ b/tests/qtest/tpm-util.c
> @@ -289,6 +289,6 @@ void tpm_util_migration_start_qemu(QTestState **src_q=
emu,
>=20=20
>      *dst_qemu =3D qtest_init(dst_qemu_args);
>=20=20
> -    free(src_qemu_args);
> -    free(dst_qemu_args);
> +    g_free(src_qemu_args);
> +    g_free(dst_qemu_args);
>  }

The more modern approach would be to use g_autofree but this works given
we aren't dealing with multiple exits:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

