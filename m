Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61AA66BA3E4
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 01:09:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcEhb-0004mU-BY; Tue, 14 Mar 2023 20:09:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1pcEhZ-0004lG-8R
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 20:09:09 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1pcEhX-0007gQ-Pf
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 20:09:09 -0400
Received: by mail-pf1-x42c.google.com with SMTP id fd25so10785008pfb.1
 for <qemu-devel@nongnu.org>; Tue, 14 Mar 2023 17:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678838946;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SotRd8zywSDv0dY2Pow09nbNToLsqraxmkmgFwVL2QM=;
 b=XbuAtLuNH1LXD55MEjdZKtiwSyZkIwgq3BpKaB/qrIuyCsoqLsCDCnGH7LnJYD1S/g
 vYrK/ZUsGH4z9myazzziF7CtVmj5gvk0zebrOgElUnbGv/YXexlnPk/Su5p5vMj369ig
 SAVRI+c1tDP3WFj+q3pJmv6KmoHgE1PH6t4+7NDQfbENvGF/kXcenQ51thb+9vqqGW6+
 sZLHE5MrecfIcIoRRc8SQjMOVhKmchQml1ft6hPPpgK31aPxhfPrILJUzTp+yqfYrLsJ
 6ptpzVult+ulJsgxDZyoApH4voaSvQQtc8obsYTkQGUDmUY3HSjgp+P9EykVSUjxZudb
 kGXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678838946;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SotRd8zywSDv0dY2Pow09nbNToLsqraxmkmgFwVL2QM=;
 b=gPZINjr69jlBTu4Aj5BSVbdWy4cMQvDuzvGTF8sWgura6MfFSmhDPSp3SiTlDiFIGn
 cW6HmivyxbbirdseVReuS0GsSNwA9UZCPFYPaLQULlgjUpRHKoOmm26hNTXB8DsGdoft
 47HN0owyteJO7rAaIz9wRzPSLWN9nIEyWask3QRCVnPPYRZsMMzJQ41cFuxx7pDsYe7T
 /oE2D7+4aHQztGvAQy3veBKkE3S0CwTMgqCQOPmL7ZxPLT53Bz+iU3cDyHOSua4V0jZP
 hf5OPGHpmlVSvAyLSlRHmoKlV5ZR7PZkwWlipYrsCDeutcKMvPRg1TZL91+/IIstS8lB
 d1fQ==
X-Gm-Message-State: AO0yUKWhl6ahOm8qil2a4viiFUXzKMHIuiF8eHBw5FW7FA37LqlYJCu8
 6laWpTyr22xkKTSDb4bTU++jNHa0oB7DrWbIVd8=
X-Google-Smtp-Source: AK7set/Izcwxtb9y9dOYOmhf6zqrCUOuG3kskwXh2IiXxdrvnHVyRCDUs94G41eHCcu0yBauJxzuMtw9BxwRik0usXE=
X-Received: by 2002:a62:8454:0:b0:624:6e5:1a2a with SMTP id
 k81-20020a628454000000b0062406e51a2amr3292441pfd.0.1678838946432; Tue, 14 Mar
 2023 17:09:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230314220832.2211028-1-jcmvbkbc@gmail.com>
 <6909cb4a238e25bfef9f216b7bdbfa0a20fda582.camel@wdc.com>
In-Reply-To: <6909cb4a238e25bfef9f216b7bdbfa0a20fda582.camel@wdc.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 14 Mar 2023 17:08:55 -0700
Message-ID: <CAMo8Bf+4xCBuY=iNZG1e2XKgBbMzMyQQ_oRjZSo4U-YZq9uEgg@mail.gmail.com>
Subject: Re: [PATCH] tests/tcg/xtensa: add linker.ld to CLEANFILES
To: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-pf1-x42c.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Mar 14, 2023 at 4:41=E2=80=AFPM Wilfred Mallawa <wilfred.mallawa@wd=
c.com> wrote:
>
> On Tue, 2023-03-14 at 15:08 -0700, Max Filippov wrote:
> > Linker script for xtensa tests must be preprocessed for a specific
> > target, remove it as a part of make clean.
> >
> > Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
> > ---
> >  tests/tcg/xtensa/Makefile.softmmu-target | 1 +
> >  1 file changed, 1 insertion(+)

> Wilfred Mallawa <wilfred.mallawa@wdc.com>

The tag is missing, I assume you meant Reviewed-by.

--=20
Thanks.
-- Max

