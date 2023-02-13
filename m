Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FCE694C14
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 17:12:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRbPx-0005wH-Kz; Mon, 13 Feb 2023 11:11:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pRbPe-0005oV-Ge
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 11:10:47 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pRbPa-0004yt-Nl
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 11:10:41 -0500
Received: by mail-pl1-x632.google.com with SMTP id ja21so6380820plb.13
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 08:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Do+616PQhElMf57hM1MZQYkSUipV+Xi8qUc12DjFbSg=;
 b=cOe5rdXYWLX3XCwHx7/Ne8egMNTm4dRXSg+CHvPvIo6Ej+4wMVr2mknoHjzVg5RJJf
 Ta8zYZf5jKf2Dw2NVvC9OozLzRUmNR6vPswlNcYbkvleP7cmZMWbk1my/wFqACCHXNHM
 fu8opu0TxcOuDJ3C9JYaeOwL/px/kDeTdvPPvrCQtY+QEksd1wFaLhywHsbAJKFntc/x
 +dk/9UBIEFCYUCmcGvI0xvIqsHlhw0FQ9ga4dhQwfBEzTNoSYpNLFdnUBvtgPVrzYQO3
 gM29uZeh9E0d80o/06ihfuzFRC+Y8cpxh3mfFXaqtxo60g5v6Gm6IwhxjM9q063TyzOT
 C8Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Do+616PQhElMf57hM1MZQYkSUipV+Xi8qUc12DjFbSg=;
 b=tB6NxcCRWQYf09zP6uAX5irj2CGUXcyzwDP6WWvDy/esmO7ag0lsSHhjiMBD6ZAYDz
 VEJqns9TkSsDq8Q27/itflPfv1Ze3ON7zkOmnN1/FVzowzV09yRwgwV3Bv4YFjE7p4Xj
 KhFlR2k/m3rVL01Rtd3zW/46BYLdEnwH3VBeLAwR1+yOetVyGSsiVJBHrACljPgUJ80K
 TbsOCm3glPFh5Vb1zwydgZ6zNhgjiHU4hTv3IBVrsvCXMd3nUO998iSp9Z6ulw5FemX3
 8gjcsQImTJjKQ1yLUTAhx6bvXvBY29KJaL/wY4OdIP8rNIEDjtS+uaQqFW+HGI7R5HvG
 B29A==
X-Gm-Message-State: AO0yUKUy0kqz6ban1CszY/bhHKeqf/U0qYEWQYwUFj36CmscDwPFUJuB
 0t7yxhVd3H4wMcb436qG8UxNL/qgoyZQYNmFpWuw1A==
X-Google-Smtp-Source: AK7set/vVoK6jwoKI98v+VrMQ0aaxHGmoeHlD+tkRZ9Bmpy+qc8/h4wnv13Gki6jj3hShdtqkPn/GW5xLhiOwuk9b6o=
X-Received: by 2002:a17:90a:15d6:b0:233:dcb5:ee15 with SMTP id
 w22-20020a17090a15d600b00233dcb5ee15mr1391459pjd.92.1676304636004; Mon, 13
 Feb 2023 08:10:36 -0800 (PST)
MIME-Version: 1.0
References: <20230202211129.984060-1-aaron@os.amperecomputing.com>
 <20230202211129.984060-3-aaron@os.amperecomputing.com>
In-Reply-To: <20230202211129.984060-3-aaron@os.amperecomputing.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Feb 2023 16:10:24 +0000
Message-ID: <CAFEAcA_nmodWa=t8Y8Othq0K_x8ZBe1R5o_iyVjR_JHJ2V3kMw@mail.gmail.com>
Subject: Re: [PATCH 2/7] target/arm: Implement v8.3 QARMA3 PAC cipher
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>,
 Vincent Dehors <vincent.dehors@smile.fr>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x632.google.com
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

On Thu, 2 Feb 2023 at 21:13, Aaron Lindsay <aaron@os.amperecomputing.com> wrote:
>
> Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
> ---
>  target/arm/pauth_helper.c | 48 +++++++++++++++++++++++++++++++--------
>  1 file changed, 39 insertions(+), 9 deletions(-)

If you move the stray bit from patch 1 that should be in this patch
into here, then

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

