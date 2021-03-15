Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A2233B253
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 13:14:06 +0100 (CET)
Received: from localhost ([::1]:40152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLm6n-0001rg-69
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 08:14:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lLm3l-0000Be-JZ
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 08:10:58 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:41707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lLm3i-0002a7-Q2
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 08:10:57 -0400
Received: by mail-ed1-x535.google.com with SMTP id z1so17016762edb.8
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 05:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hCUDtjK4qoeLusdUgiyd/ZaHEzmVBIu/pZzmt2+5/2g=;
 b=C0j3YL0NGN8+M6uAjTYXYOp+v6lk/GyKNlVmT3VeJRf2e56fXxnidMGKttdhCLUei6
 +zsAmfUrRzTTRu2RouQc0ITxwQ+RboXt2rJyW7y2D9oXaHNM6RgK9F2N91Qe063OecMr
 dVouIVaY8bB8mz4nqD6u5/8Ih12GwrwNdfTPyMIowZ9OSE6YiRJTM/n5c09UarT13gSP
 Xyqt0Y5PKDfOPYTV64cugfK6PxNBFELcnZlRyxP12Wa+N+7S/iWr2mqJ/FQ56itk1nO6
 OEtSS3EgwGilHzEheLEtTNAHyEZgsOiw/Ob0E48mW4qx0smYuRjbjUR1o8z+2bSyA8II
 0SLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hCUDtjK4qoeLusdUgiyd/ZaHEzmVBIu/pZzmt2+5/2g=;
 b=WBflzb3JHpCM5dvauJEMDc66LsDD952c7bB2Ufx27Fst/cEWXx/gmRHp6WUZpQm/Z2
 BSgBha6YyOE5Ok4JzyjfZQstFnoCHqMyK/zsz15xDwa3QtRHIcZqa4QtvjTkTXTGmbhr
 /VMXxNZBM06oDj6qYhUSRX+Lsz6ZIWHPy6ivExJfzUIP0Q1iXfKODh1K92M5pFG6OVHT
 SiSaTmlZh8Wd0OOW40V0OqZznIQ8QxFBjFVPg847wnSoGkNR0rmbB4i1nPDm263UtCk6
 EikdrR9kCYp1ZNtEWSD3tY6CPbU4sx8trwZfEgVMDM1egWnoG6EQQxcMNt/vv7oXdO/9
 pU/A==
X-Gm-Message-State: AOAM530QS9hlWNx62OGETKdVwr7D4iIy03apmCsx4lPhiudQ/zHU2xnu
 psAanxJTOFGGjYsxsvvogWAqrfOf8tyXUss2JOVpfQ==
X-Google-Smtp-Source: ABdhPJyU59yZC+I8h1tOszTD0r30vaXkWhiAw5T7CCkeY4RrvHA93Z6y4hvX1C8tG2jQkOj86cVeF4DEbNf7UF3oXBo=
X-Received: by 2002:a05:6402:4244:: with SMTP id
 g4mr17987013edb.204.1615810253314; 
 Mon, 15 Mar 2021 05:10:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210311144811.313451-1-kwolf@redhat.com>
 <CAFEAcA-RkqptbD6Cie_iMr9RgXT-B0mCVcyTwh6NV41EfX+N1g@mail.gmail.com>
 <YE9OWLsICQe/UyKy@merkur.fritz.box>
In-Reply-To: <YE9OWLsICQe/UyKy@merkur.fritz.box>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Mar 2021 12:10:42 +0000
Message-ID: <CAFEAcA94T-2XnSopU=5Lzt0y8L-w65C48CAbt=g2-eKtwL3HvA@mail.gmail.com>
Subject: Re: [PULL 00/38] Block layer patches and object-add QAPIfication
To: Kevin Wolf <kwolf@redhat.com>
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 15 Mar 2021 at 12:09, Kevin Wolf <kwolf@redhat.com> wrote:
> Hm, okay. I guess this means we can't test that a deprecated option
> still works. I'll remove the test and resend.

You'd need a mechanism for "suppress the warning because
we expect it". (Often we do this in a kind of ad-hoc way by
having warnings be conditional on !qtest_enabled().)

-- PMM

