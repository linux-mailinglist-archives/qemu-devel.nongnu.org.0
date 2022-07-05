Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA07567399
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 17:56:18 +0200 (CEST)
Received: from localhost ([::1]:37264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8kuO-0001AE-Gh
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 11:56:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8ksb-0000CD-R7
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 11:54:25 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136]:41768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8ksa-00029L-5n
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 11:54:25 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-31c8bb90d09so59614537b3.8
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 08:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K9Yy9QyHdswOzpkSnUq6N4Exr47zR53mYi3PASyOFxs=;
 b=BKn6rwBhpubvSHAD/PXkqYx1jDrNUwFVCrDxZao4+MNZIxHm3/z3HSwNs22vc9Bi81
 9yoFZn6LN0kV6Mfxi9nnl4FmODszPhGzSi5J4lxEGFjiYHawRFoICPg2aW1fUGuAJmvw
 5FkCFduo+NBniapBHFSaYmWEa4p9tTOQc1dDEVkRhdmtWU85bKbjzTgDpIoMdbWk5Yu8
 efACel9Q/qDguB9spHxb10wchiO5j6+I2Xn/nDj2TgUOYaLTbOQ4pavxogm7idTTs2tB
 z6xwdUlAA/DPNKav/yEqJ10I3pYDGxagiECM5z445p+FNIO6f/X2Mhlqc7Q1wFZMM61P
 YMDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K9Yy9QyHdswOzpkSnUq6N4Exr47zR53mYi3PASyOFxs=;
 b=IhroF7H1MCbysfHWrPCtWD+Qj+mI8OaYF241Ea1ryDY6D45WZRQd17gcgSzao5SfeV
 uSQv6NrggTeOj78j9ZCoelVgY66Vaajm2IXekNZnXuPKhJ+BPw6nHax4JFjO7A3RV9ZP
 I1JThAKgQXbMnotM2Pa+5mnps3nN7PrRLqswGclujBDDLalVItJfa0f+U7lnCzNd2QoZ
 Z2STjmRrGrbafCPsZttGiXDd8WNyF5d+LwRkmSGJBvr1kE/wQ8sjPqRqkjM/MhDpNrDy
 vzv/y1ip/5MX611QHQtoutW7N9XEIGNMQ/zn2+X2GNhKZNq6XANOkLKcGRXuU7gpgMOE
 zOLg==
X-Gm-Message-State: AJIora+tpwIt6jsGWWJErOCqOCssr0eEipPg0XdybGQoyVAyX4nIYEDb
 wWfOm3HSU/+r2bTnyN7DwO0YwoelwbzEMxHsoLa1lQ==
X-Google-Smtp-Source: AGRyM1ukU7boJRY4GkPraGCJyJX/B8LZOMqshOeACHO31MA83v8n/TsWc8WmTHPC7V7hAg1aUcjdCftRecBZR0cnb8w=
X-Received: by 2002:a81:6a85:0:b0:31c:8624:b065 with SMTP id
 f127-20020a816a85000000b0031c8624b065mr18499982ywc.64.1657036463110; Tue, 05
 Jul 2022 08:54:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220705151030.662140-1-thuth@redhat.com>
In-Reply-To: <20220705151030.662140-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 5 Jul 2022 16:53:44 +0100
Message-ID: <CAFEAcA99=bjEzS8=aF7GrHezWwK9BsQACSy73DV_104fvMaV1g@mail.gmail.com>
Subject: Re: [PATCH] target/ppc/cpu-models: Remove the "default" CPU alias
To: Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org, 
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Tue, 5 Jul 2022 at 16:13, Thomas Huth <thuth@redhat.com> wrote:
>
> QEMU emulates a *lot* of PowerPC-based machines - having a CPU
> that is named "default" and cannot be used with most of those
> machines sounds just wrong. Thus let's remove this old and confusing
> alias now.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  target/ppc/cpu-models.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Do we need to document this in removed-features.rst ?

-- PMM

