Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8128B3C9BEF
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 11:35:07 +0200 (CEST)
Received: from localhost ([::1]:46276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3xlq-0001Rl-JH
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 05:35:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3xky-00006T-M2
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 05:34:12 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:36771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3xkw-0008Mk-TN
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 05:34:12 -0400
Received: by mail-ej1-x632.google.com with SMTP id nd37so8234924ejc.3
 for <qemu-devel@nongnu.org>; Thu, 15 Jul 2021 02:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=GwdYkwxtlb49QYIrtr4aoBCAxXFzDhnoj/5JBlRwwp4=;
 b=L66s4Nlai68F9rcyn7xoKne2oKq3h5t9x0+bExHzZPUoJcNG4iZGwDd5OqTLFtOBdZ
 o9m+6elHaulB7+yEEnK644Wz4YSxZ/4LMDwajCSLH9hPGYpB6Huvt/+5Iurpdwt6jFZu
 XzhrBkxm12dPFQ7ZrdJoNvUBaolE9OLVzJCl/YWmsBrscmyP56eYqJIN4tflTWwK7qcH
 GyGNvzSv7DAd09SqTK/aL5Y0eHwSvIgi8lBh4Wdeqiy5KUMw75J/JpLhcDwWm2ZhhMFC
 snp1vCP9Kcm/s+1qFmZf2GqZOv50Ufh/3223QKpMCijMwmpVBjykpYQpmk/N6mnsV800
 /qow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=GwdYkwxtlb49QYIrtr4aoBCAxXFzDhnoj/5JBlRwwp4=;
 b=i1gRmVjU4ZiVQ9fPcuPAfMF5qIrIZ9+1DuJ0UKCxVOggwl3gFI7USIfDvSjicjDti1
 qA0W6oj/NpmTwjhidInqKZbG2GMjsSkvTAIExs8Cdq1TS8T7CpYpJ2jA+4Q7Lbb7943N
 25nLxumIO66xHcF1XNTOfg/GFpJJ0bOz/8CSEmNv/5vlUQ8ZfGPLk2FyUbsGE12i/nCl
 KRPkyP3RkCETXSfYOXH7Y0yzbfREfrN27GS4tQJMcyLxLXYTqGl8Djx6yWQgLorjIAHv
 SsWFUDW4wbnxlyRqHj6AJMRRlwPgX+WVDN2gkni7Ea4RtrADWCmdnElBGukYoDNojeHb
 j3/A==
X-Gm-Message-State: AOAM530WN7K00yIHw33IFBIHiI29fr4RDHZkK7g+ydJq+5g/ySLKu5Ud
 3POtFWssuvhPHdAvoRFX5qKgT6H/6fkTf14VKwhUej9JBPsIkXla
X-Google-Smtp-Source: ABdhPJwpW6ATknTaQz1y90ykUIsTYVOJYYz4YlmSWLFSCQ85pDlFAL7Q5TkXOweuB7tem821VsNwlezganbpWYt4WWE=
X-Received: by 2002:a17:906:a108:: with SMTP id
 t8mr4435008ejy.407.1626341648875; 
 Thu, 15 Jul 2021 02:34:08 -0700 (PDT)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Jul 2021 10:33:28 +0100
Message-ID: <CAFEAcA85CpJ6x3P=XG6VnR9NGaQFhEDN_u4UbWP9Zfia7rXYoA@mail.gmail.com>
Subject: inline expressions for decodetree !function syntax
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I have found myself wondering whether it would be a good idea for
decodetree to support some minimal syntax for defining constant-modifying
functions inline in the decode file, so that instead of writing

   %imm4_16_p1 16:4 !function=plus_1

and then having to define a "plus_1" function somewhere in a .c file,
you could write something like

   %imm4_16_p1 16:4 !function="x + 1"

and decodetree would just wrap the quoted string in
 "static inline int fnname(DisasContext *s, int x) {return %s;}"
(autogenerating a unique function name for it).

Obviously the error messages if you put some complete rubbish inside the
quoted string could be a bit opaque, but a full-on expression parser seems
like overkill. The existing mechanism would be retained for more
complicated functions, but this sort of shorthand seems like it is more
readable than the current situation where we are gradually accumulating
various "plus_1", "times_2", "negate", etc functions and trying to come
up with function names that remind us of the trivial expressions they
are wrapping. (target/arm actually has three separate implementations of
the "add 1" function right now :-))

What do you think?

thanks
-- PMM

