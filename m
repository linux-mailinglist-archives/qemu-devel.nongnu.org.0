Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6276615D2
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Jan 2023 15:29:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEWeB-0003p4-St; Sun, 08 Jan 2023 09:27:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pEWeA-0003oW-4o
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 09:27:38 -0500
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pEWe8-0005dA-ED
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 09:27:37 -0500
Received: by mail-pf1-x433.google.com with SMTP id c85so1084111pfc.8
 for <qemu-devel@nongnu.org>; Sun, 08 Jan 2023 06:27:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4HHhdOwVMdHInmjuAPpis9xdTq4NRsyw2BWD8z6Vcrk=;
 b=Y23RuF6wXl3jullU76rbribBt+WdK6pvxpvzKPF+c0KnsI4+zH41sOKwRbKkBNs17s
 CZBK5DYxHQIhKNFRtj/hjgDaUj0sPdEFjVmdko2JZksOKJSgBqgOv0hkRH+w7SzsUpbC
 eAHUvACmJAo9rm5fJoJAQDAEcTZq/KezRoRWar3/2FgnrpkSKBKBEx8T6/iTXtG0iPOI
 6cJN42jppCeiovcdQURryNH3GMVlptksxErDrT4Dlre8jYdwmjm5hvJFhmfVkkF/ay7R
 CyuBcsXtxE+CVylnxzJn0no2PZXzx3ahBxMPu8Kv5bPrCk4hZH6Php6Zms8u5j/DxKdw
 W/Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4HHhdOwVMdHInmjuAPpis9xdTq4NRsyw2BWD8z6Vcrk=;
 b=uoTkDyYXmfFWoSnARPONburc4Q53tMCBV9kM8IoOS587ZHBZv8aCyRjKB/bufVM8V6
 n1X+rhfRlVdfcAakaGOfQSc+joTr0z+tucwyD79wvcjBEqLHNUBj/t6sdHGLawpxPeIQ
 u/bmq+svs/QtjgiGJFWpLffb+g55RTv3O7GoEcDigZXWxp8ZZOS5UGglZkQqj1v/hOue
 CJQ8iRW6lE10vHZPyk2avsjLQCc3lKwvbRweHc9GCah7gUzeFMPi866H3xtv576CasKe
 8+kYuc5cLBj7VV0wwGEN4+vsZ+QeV1NptHrZhRsJVlvpHC3W4Em/zvqhnVahp9CrqeF8
 lBWQ==
X-Gm-Message-State: AFqh2koxUTPoToicORrDxfv+MB7Ev5jATLlC++PYBrCEnOGKXFZ4PqM0
 0jktu+4m7hmCfzt+pZQyi42dh0nHE7qptkF5xpMbQQ==
X-Google-Smtp-Source: AMrXdXsgHpO6LrMuERGR16mYQJ+RpFOJS1v3FpoBUm06VgQoOvaM1N2RnopX46a05WmOObB8kNiy2cgU6YjybnDfqLE=
X-Received: by 2002:a63:9d47:0:b0:4af:9f91:54d1 with SMTP id
 i68-20020a639d47000000b004af9f9154d1mr245949pgd.192.1673188054673; Sun, 08
 Jan 2023 06:27:34 -0800 (PST)
MIME-Version: 1.0
References: <20230107075118.1814503-1-richard.henderson@linaro.org>
In-Reply-To: <20230107075118.1814503-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 8 Jan 2023 14:27:23 +0000
Message-ID: <CAFEAcA8OU3fwhC=pAedP6-U_YmOo91cRgxn2K=BTS9mUxdkEiQ@mail.gmail.com>
Subject: Re: [PULL 00/27] tcg/s390x patch queue
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Sat, 7 Jan 2023 at 07:53, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The following changes since commit aaa90fede5d10e2a3c3fc7f2df608128d2cba761:
>
>   Merge tag 'pull-tcg-20230105' of https://gitlab.com/rth7680/qemu into staging (2023-01-06 15:40:37 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20230106
>
> for you to fetch changes up to 90497e03ca7432153c5db4a06019265486541d44:
>
>   tcg/s390x: Avoid the constant pool in tcg_out_movi (2023-01-06 23:07:10 +0000)
>
> ----------------------------------------------------------------
> tcg/s390x improvements:
>  - drop support for pre-z196 cpus (eol before 2019)
>  - add support for misc-instruction-extensions-3
>  - misc cleanups
>
> ----------------------------------------------------------------

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

