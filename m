Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0A82FB64F
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 14:21:07 +0100 (CET)
Received: from localhost ([::1]:39186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1qwU-0008Gm-Lm
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 08:21:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1qsN-0006rA-7C
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 08:16:58 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:39382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1qsD-0008Cv-6P
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 08:16:48 -0500
Received: by mail-ed1-x535.google.com with SMTP id b21so12626595edy.6
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 05:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/KIw7f/90xq25WCJvikFt7mDgcn+iPwX6qrwOJCkBpU=;
 b=hbMnnQHxJQwy+ulxnT4lo0roykR6ukuR5EbxxSVVpqPyir4u0+qVOyP7SKx2b89au8
 9TbcO03dsQmwX6ZDKgXYSvBgftsTY8a5ECP03G4AT/ofgGUWfROI6zqa83SkVZusHxCI
 Gzz7HFcVX0kmmhHLkrY4Q27OXm9+fkIiavy9TAUeQ8OsNZfQxVZxGOLGNr1Ed42NaUHY
 LgEgYbaA/P5QsUmtDLEipzk2BhTbeKkY6zMvqhR4hVjyyOB/+3HUSQDLao9n437qFpV+
 nFv6WLlxT/BirMtuCq8haJeJB00gLUW1eFUa5Dd6W9VV2SH932wexU1jjWG6eKYwPh6h
 lyYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/KIw7f/90xq25WCJvikFt7mDgcn+iPwX6qrwOJCkBpU=;
 b=mEl0aKB45azZwYqnxKvUsMwF62tUv1uVFveKmbH8NXp7ZEj1aWR18grqHAG3OXu0Cf
 qbGEjSafGCfi5XlhFM5uAqYT1EznCHjQwT1W4NvCQloKWf4FNmLo2bAB2iuXMeuumeqZ
 b8SLvlGJdXcHbmGtXsfY6EMxagwBe8SstMTrDOAlH9++rq8M1bQlCN7cRqRu3fuED9kh
 QpH4x+Luib0apujbEbPr/FxtrzU1UO+rJH5RnVtsZWr6QHeHi9ar5hp99afZJeffphTs
 dzHjrk84JeupW5CDIhYY/l0VS+2l4LOdUORTQrwOrdA0W4WqcUeFP4VH3i3kr+wIuZTQ
 2AmQ==
X-Gm-Message-State: AOAM531+Lk7sNFBqwCJawZ+3haijYJoJXD+NXTlkSS0+jWTGo+td+l56
 E4NVenBstGK+kVza+83Iaz2hsz1Rv59tFpEetA3pfg==
X-Google-Smtp-Source: ABdhPJxLZFpGF2vl8ggPFuQtp6JFZX7RYghz2gGK6bOL+ahCcy/ipM8hIGu3FDj/QtnbZy79Zd+jC8Mk78zGvYZi8GU=
X-Received: by 2002:a05:6402:1a55:: with SMTP id
 bf21mr3477447edb.146.1611062199378; 
 Tue, 19 Jan 2021 05:16:39 -0800 (PST)
MIME-Version: 1.0
References: <1610735646-13313-1-git-send-email-mihai.carabas@oracle.com>
 <1610735646-13313-5-git-send-email-mihai.carabas@oracle.com>
In-Reply-To: <1610735646-13313-5-git-send-email-mihai.carabas@oracle.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jan 2021 13:16:28 +0000
Message-ID: <CAFEAcA_LL3XmPGqAUf_OR0ng+KWUvRVzGzQkuz8w1cCUkKS-Ag@mail.gmail.com>
Subject: Re: [PATCH 4/4] tests/qtest: add a test case for pvpanic-pci
To: Mihai Carabas <mihai.carabas@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 15 Jan 2021 at 19:23, Mihai Carabas <mihai.carabas@oracle.com> wrote:
>
> Add a test case for pvpanic-pci device. The scenario is the same as pvpapnic

"pvpanic"

> ISA device, but is using the PCI bus.
>
> Signed-off-by: Mihai Carabas <mihai.carabas@oracle.com>

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

