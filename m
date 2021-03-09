Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81688331DD7
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 05:22:02 +0100 (CET)
Received: from localhost ([::1]:60606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJTsf-0000zE-1v
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 23:22:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lJTrI-0000Eo-1f
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 23:20:36 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:33000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lJTrF-0000cI-Js
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 23:20:35 -0500
Received: by mail-ed1-x533.google.com with SMTP id x9so17966592edd.0
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 20:20:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Gbw+QeSCNgheaK9bBLrk580QPYS70O6kECamW6thIEo=;
 b=dTHioCFYtkd4w933FXtRXrme385Ju7LBg2khQhYJvYu6SmZutL4zsiB7p4wJcNietc
 8U8k5N3/n7el97sqYn9TIkc0UTOrIsikfYVokHPP4AR0uevR6AcKXRXrpxHy65V1xQeL
 1O8ikbyIreH0nfKurOdgAcstlM5ivS99+rTZmj0aQRe+6e4MC6LAaTYKGa9EV51c23uh
 3caIiEEMvVw+RLhoH+JClEh72Q9ms6D3yahicwgs/Qnr62mb3eiVwPfyhKx8j7yJiCCJ
 53PS8eoMN7jiufXgy27ZoO05V6twR6H+U+a5iItuOvQD6BIqXCeo7zK9iMGSaJGNP5bs
 Lbhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Gbw+QeSCNgheaK9bBLrk580QPYS70O6kECamW6thIEo=;
 b=J0eaYVfmnfqQErFEWHXwkBnPuvthsHYvtU+BRCg22BvmSIpM87+RPyOG2uSLfwwE3W
 ZevxRSYF11qHKNP/XjfH8XOSbX6fAX7NTNT33s7navCGIteDQQ0W44YpN2EAvhV0StDb
 EGV3P9WLlWwY94sC2iDNqgjtIr7HIpu315h0MzOr6axGXDmXnO9mzje/Hl/FZZN/iZ1f
 VOVjX+9AGZyp7YBmibmfJ7LNPFskgEzDiNh6W8g3+pOlWa/Ae4fnsUsMN3rRJIsr2Vlm
 tiKNawsIkQOyjRqApF2U/mWwt39AKL/kpmdxBEq1iMa8aAyUvt2OFO6OPlPb0uwD74V1
 Xzfg==
X-Gm-Message-State: AOAM530AECohfSXW7VbOaNXmqcNgSqT0Fvd/dkPQjlelC+eFkiPFFfgB
 DGFQadf2TgyG8v/qEszolyoFRQIn0g97l5Z77cI=
X-Google-Smtp-Source: ABdhPJyQ0stx7/kudkjegDG3kpm/g+oWTmlV17ZjshnMoiuRGvxW6d/BA8r1U583+V9v1S/igyXHqXG+BrW0Ti0vadY=
X-Received: by 2002:a50:fa42:: with SMTP id c2mr1925746edq.159.1615263630609; 
 Mon, 08 Mar 2021 20:20:30 -0800 (PST)
MIME-Version: 1.0
References: <E1lIzWX-0003qN-Me@lizzy.crudebyte.com>
 <CAMVc7JVK0FuBuyVvH3ai7V2HxQeiy8dMPHDYB-c7w7ARQL7nMw@mail.gmail.com>
 <2f4c50c9-930f-b820-b507-d9e43da20093@redhat.com> <2232725.kIh4fn7MiB@silver>
In-Reply-To: <2232725.kIh4fn7MiB@silver>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Tue, 9 Mar 2021 13:20:19 +0900
Message-ID: <CAMVc7JU9=02VC0j_bku+R6hBK-apWD2hcKJezSZnh7Kvqw9tKA@mail.gmail.com>
Subject: Re: [PATCH] ui/gtk: fix NULL pointer dereference
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

2021=E5=B9=B43=E6=9C=888=E6=97=A5(=E6=9C=88) 23:58 Christian Schoenebeck <q=
emu_oss@crudebyte.com>:
>
> Yes, but the optimizer part could be disabled with
> -fno-delete-null-pointer-checks which would render it a pure diagnostic
> feature:
>
> https://gcc.gnu.org/onlinedocs/gcc/Common-Function-Attributes.html#index-=
nonnull-function-attribute
>
> Is there an example where the compiler failed to detect a NULL user case?
>
> Best regards,
> Christian Schoenebeck
>
>

-fno-delete-null-pointer-checks also prevents the compiler to infer
that a pointer is never NULL with the fact it is dereferenced
somewhere else. It also disables
-fisolate-erroneous-paths-dereference, which turns code paths with
NULL pointer dereferences into traps. I suspect these side effects are
too important to ignore.

Perhaps we may define QEMU_NONNULL as once it was, and document that
it affects runtime behaviors and should not be blindly added to
functions that already exist. We may also be able to enable
-fisolate-erroneous-paths-attribute, which turns code paths with NULL
pointer passing to such functions into traps, if we explicitly state
that it has runtime effects.

Regards,
Akihiko Odaki

