Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DD251B7CE
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 08:13:38 +0200 (CEST)
Received: from localhost ([::1]:42074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmUk5-0002yV-Ej
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 02:13:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1nmUeI-0000vH-8s; Thu, 05 May 2022 02:07:38 -0400
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735]:33617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1nmUeG-0007oI-7G; Thu, 05 May 2022 02:07:37 -0400
Received: by mail-qk1-x735.google.com with SMTP id s4so2551529qkh.0;
 Wed, 04 May 2022 23:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5jtnt+IVnQvyRp5Wq1ihtH/HrpmnY7EK24TNB/Y1cig=;
 b=b/64HrsqtFtWGrNumCuyUqaua/dSQ8SyQ5rSWJvW+OxbbMatSw0vCbY8moOq3AY8NQ
 5vkKP8GmAJDYTYDAX8FVgJqZ1zEltLf21bn+xeX6LX2jKyxMWbhUJ/F3igU+OnNDbUYO
 3/DimYC3KEoAPJ2DuEXIA7+N9LXjV528isExI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5jtnt+IVnQvyRp5Wq1ihtH/HrpmnY7EK24TNB/Y1cig=;
 b=tZg8o+shHds66ZRf6BK2muLFJcwLwKxKjH4R4i2sLOWXsRdapC++8wVrRzOY/kH4dF
 yoqblxPoYJ01DdajXdGb42UaokpWgYL8uSv/9NJTEveuEfQ308O+QX0RLj7oWDTTNhVX
 PxFqjAmwZOa4F6qmVoTG1T0UINQGH76yMfzSC0dblWko+XYFUOjjBgaBfbCph0ZezPl7
 djGBKxa1B3MAL+l6ZtSG0L5aTmAYOlgviVyDT9verHGmHNLOdUiJm6myYxOecA3TnHRb
 hiTxjW94t6x8UbqGBfD1zIBmLuvpha1Q8EWVzog2H7hnQJKX1plBUOXcTfvTBECMqRaP
 7otQ==
X-Gm-Message-State: AOAM530gK3XGUkoV3ZLLlUCkpJA5uiikcR/HXqWsjkogaoq7ctPkl/En
 5f/xkHxXj2aYeZmJuisx3z1JFdc197x2gkvE9qc=
X-Google-Smtp-Source: ABdhPJyH7HQW9pqImg8ojxak0+tekSqZ9gVdW8fK0hFGefNxSnFnT4dmgND8wzVZgKA/PmAIVECfPMFdy4M3st5X6po=
X-Received: by 2002:a05:620a:859:b0:6a0:15d6:60ca with SMTP id
 u25-20020a05620a085900b006a015d660camr4809576qku.350.1651730854883; Wed, 04
 May 2022 23:07:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220427064204.373027-1-joel@jms.id.au>
 <e29248b7-1a61-87db-dc81-5c9db844b7cf@gmail.com>
In-Reply-To: <e29248b7-1a61-87db-dc81-5c9db844b7cf@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 5 May 2022 06:07:22 +0000
Message-ID: <CACPK8Xf7pRBy48yGRVjUvvbp+wBjfjDtTYXTqjtsg1EnCEb-5A@mail.gmail.com>
Subject: Re: [PATCH] linux-user: Add PowerPC ISA 3.1 and MMA to hwcap
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: Laurent Vivier <laurent@vivier.eu>, 
 "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>,
 Michael Ellerman <mpe@ellerman.id.au>, qemu-ppc@nongnu.org, 
 QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::735;
 envelope-from=joel.stan@gmail.com; helo=mail-qk1-x735.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On Wed, 27 Apr 2022 at 20:51, Daniel Henrique Barboza
<danielhb413@gmail.com> wrote:
>
>
>
> On 4/27/22 03:42, Joel Stanley wrote:
> > These are new hwcap bits added for power10.
> >
> > Signed-off-by: Joel Stanley <joel@jms.id.au>
> > ---
> > MMA support for TCG is on the list so I think it makes sense for this to
> > land after those are merged.
>
> I believe you mean this series:
>
>
> [RFC PATCH 0/7] VSX MMA Implementation
>
>
> In that case I'll queue this patch together with it.

That's the one, thanks.

Cheers,

Joel

