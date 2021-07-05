Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B21F3BBCA7
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 14:07:59 +0200 (CEST)
Received: from localhost ([::1]:53162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0NOI-0006TF-Cm
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 08:07:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0NMr-00058y-4v
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 08:06:30 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:46795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0NMo-0003nc-Ej
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 08:06:28 -0400
Received: by mail-wr1-x436.google.com with SMTP id n9so4470732wrs.13
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 05:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=S5vSVKorm4Nl8X32GeCJ7ZW79azUuFhc9rrjOrszC+g=;
 b=JemSFLJmIVe1pxNzaQ6f0tDSlQePEzow7lzNtKImr/9qduHkT1IDdcRW93lgrlHimE
 RcV+fgabCOf86XOjS2kvwqPA2MgAG8joedaoT6d8j0BURFcuGp1Xd9MF3A/ufJooRlSE
 3dmVyCGleyu4dcig9XVNIfV40eVVYQ9jGi4xC6c84WPG3UkCP+7mEnzTpW+pVxcfssik
 1dNpqEp+mD3TruG/8onEEGnkJgHy5MOdPItllFzcuzORNRWnM8s+gjJr/mjKVj2LIzJx
 CUenyHYRuvpi7R985ekhGpCAiIlaXpSWpmixhe+7M9F51vVevX8sKcTLqAMZFOU+n2yO
 J/tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=S5vSVKorm4Nl8X32GeCJ7ZW79azUuFhc9rrjOrszC+g=;
 b=j+BE1cwHJBEaWMVAJJlrORlyBvR7j5F/bcf4HFltiytQkQ7BA1s9+F/taJVZsntYf+
 a6SYPro2iVUwso7SeOF7rm3R4A7M5dTeVinQy4BxqkayEqxVx44QuVBQn2eeFuSj3Zua
 kRYsQ+yJKd+4znRDUlYEIdj9E4jmWLJerfWkzBVhSmM89YkNRb7BvXyqCio6wZ1mS50+
 i+j8dRY6GZLgimOPxGsjLO/8z1/xrB5NzXfX2KaJdPMB0XGbwXOP209fpn+PzWD2JM0Q
 eSsGwZKDMESauH2bnGXpU9N5fTdqzRxDgSRwuIZcYOnr/tL1Dp5xa6KqDO3tZuxS3yBS
 k+kA==
X-Gm-Message-State: AOAM533Q0i5OX5r5bb6YPDtK0sQdwDQvpq0tbZj24mOElKQCFkzCgIu9
 +Neym8ZQX3ZdEsvvtLpCM46Evg==
X-Google-Smtp-Source: ABdhPJyQBaxP38vmGwLz2Lg26JfdwdxZE+1K4IYE/nk0Aewz/JSYZNPtu5kb7x5j8sGxekBE+papMg==
X-Received: by 2002:a5d:64c2:: with SMTP id f2mr3589563wri.158.1625486784336; 
 Mon, 05 Jul 2021 05:06:24 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q1sm9022153wma.27.2021.07.05.05.06.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 05:06:23 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8BEC81FF7E;
 Mon,  5 Jul 2021 13:06:22 +0100 (BST)
References: <20210625172211.451010-1-berrange@redhat.com>
 <20210625172211.451010-2-berrange@redhat.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH 1/3] build: validate that system capstone works before
 using it
Date: Mon, 05 Jul 2021 13:06:17 +0100
In-reply-to: <20210625172211.451010-2-berrange@redhat.com>
Message-ID: <874kd955j5.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, Ed Maste <emaste@freebsd.org>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> Some versions of capstone have shipped a broken pkg-config file which
> puts the -I path without the trailing '/capstone' suffix. This breaks
> the ability to "#include <capstone.h>". Upstream and most distros have
> fixed this, but a few stragglers remain, notably FreeBSD.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

