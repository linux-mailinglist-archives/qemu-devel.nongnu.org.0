Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2BA1F5C56
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Jun 2020 22:01:31 +0200 (CEST)
Received: from localhost ([::1]:40420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jj6uf-0001sU-T0
	for lists+qemu-devel@lfdr.de; Wed, 10 Jun 2020 16:01:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jj6tM-0001Iz-9U
 for qemu-devel@nongnu.org; Wed, 10 Jun 2020 16:00:08 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:39094)
 by eggs.gnu.org with esmtps (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jj6tL-00086P-Jo
 for qemu-devel@nongnu.org; Wed, 10 Jun 2020 16:00:07 -0400
Received: by mail-wm1-x342.google.com with SMTP id k26so2965707wmi.4
 for <qemu-devel@nongnu.org>; Wed, 10 Jun 2020 12:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=OoupYAzJUNuXRq91G6Yefx0DVVQU0YsD6jeC6Pz1iyw=;
 b=aU+ZO3+vb+FfR9ouZpsEfU6hj4JP4Y6EkqCBff6Qp3YzDlwxBWBqLZ2Gv+Q/LOWE0N
 DwWfa9JoOMmuZyJStGP1m8gtcS6uRXC+OwvD3D4thPDnIwJxtAe96CtZ08tG5pqGFIOQ
 cPn1ck4qw5XYmmNkeDNj3jtK9lcUwtq/WTIICd1KgK1HkkgcJx76S1iEZUoOKDIdR/5k
 YZPKuTIUFSJlXvbf/qqcRMD1bNp/v1ssPny/G7LPo33EjdC/2lq4p9/3O9xtcrSF21Df
 Vm2Hni9MHl1L3JVMooRiYIPpi9MYteshS+PxPveBY9JRyVAjjzp3lu+6bxpjKHA4Hn2q
 lB0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=OoupYAzJUNuXRq91G6Yefx0DVVQU0YsD6jeC6Pz1iyw=;
 b=mHHEoBBf0dAnYhOuI9/Gu6nAWeaAuNFzHiMhst+DoECZL5Vd57Cqrv+lBKek0QCcif
 Z2cn5flALvDSxkbWdMrKlYcxsxnX4GlPXBr7Y7mJmwx0kRzOUFTUVwu2UK6AWfCo5eN1
 qcmeKl6y3S4cnmKufWXrh3Y+ymjkgayTGIdK3lgYu8Toek53KLFUi++IyGWt5TtsXEie
 7HoDkyO4mPffDLmiErdxVwfADlxHp8StTVV8nxRPAEzY9OttziDWqw15a6j5t7HUxUlX
 WwEe08dFdNA6qtoPLFEixcjQPsE76D+JI3pSE2bUvKq3pNYI30YyS++cQhXWs+iaLHAK
 OYpQ==
X-Gm-Message-State: AOAM531oXbwzgm7crs3IyeRUnv687PZO3HgXDFyyH5xJUSASx9RYfr/8
 pnZL/IJ9NkEOL3wwui91dKaARt0aTbE=
X-Google-Smtp-Source: ABdhPJzUtSK1IUIWLBLttDS7cbfYOdDEydF6xRxL7w0XqCbLZ+675FsZtDXEbFrEHZeL11QvI5pcBw==
X-Received: by 2002:a1c:2002:: with SMTP id g2mr4502020wmg.132.1591819197161; 
 Wed, 10 Jun 2020 12:59:57 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q11sm1204815wrv.67.2020.06.10.12.59.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jun 2020 12:59:55 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B29671FF7E;
 Wed, 10 Jun 2020 20:59:54 +0100 (BST)
References: <20200608114049.4693-1-thuth@redhat.com>
User-agent: mu4e 1.5.2; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] travis.yml: Test also the other targets on s390x
In-reply-to: <20200608114049.4693-1-thuth@redhat.com>
Date: Wed, 10 Jun 2020 20:59:54 +0100
Message-ID: <87k10e4rph.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Laurent Vivier <lvivier@redhat.com>, qemu-s390x@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Thomas Huth <thuth@redhat.com> writes:

> s390x is our only big endian host in our CI, so building and testing QEMU
> there is quite valuable. Thus let's also test the other targets with
> additional jobs (also using different sets of pre-installed libraries to
> get a better coverage of the things that we test).
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e

