Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 831FE590F92
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 12:37:36 +0200 (CEST)
Received: from localhost ([::1]:56326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMS2p-0002AH-23
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 06:37:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMRwc-0006jr-H7
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 06:31:10 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130]:43793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMRwa-0007F9-Od
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 06:31:10 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-328303afa6eso5772567b3.10
 for <qemu-devel@nongnu.org>; Fri, 12 Aug 2022 03:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=/PZz8U1wt2t9LyrYY9eWAnlUGlm7HC1lkA2XWsS9g3s=;
 b=razmEO2wGp6IpnOsJ4GgLYlvFOOVvyDghrnq4wDjSV6yqwup2EX4wnPMaKxNOkHJPj
 tD+WK+JSNp0dldg3PHpm2U8/dwDZKS7ApQJGs0yAJyhI97pa4+Nfvc7SUPyFCrN/+q/7
 z4myMa1PP/D0Aeyzt5yh6c7GBIdCIwn7+/ErjC7z0Jr1jExQ26SnBThJHXJs3Q/rDl8K
 NJR3d/r+/IEP8UfSMACljr94p/HNTzQrgFmBj8KNQxi3ASBDkehvatAigu+0wO7DP2sf
 D4V4+hS88j2+axvL5eIgBe7aaJpNwquphcbQPHUXq3lI3cDypXNBOOHVWzRShi16spfq
 9MWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=/PZz8U1wt2t9LyrYY9eWAnlUGlm7HC1lkA2XWsS9g3s=;
 b=iMwVAxYL1Tlsl1tJjqFLAL5tuNSt9N76waEtldnzNK4q3PUwX8gtRuamnVAt+FL0El
 JOaLgc2py7tF+YfZdR/2L0iQ8iA6XZQdpIxJMFtKAbkuMkvKSYZd4yq4wHgl/rF6QJmb
 ohAwLwPm+kUiXMiQioTlWJNY2/IJXKuNTNAGbCMRmnNWIkRu5vEjI8UcCQ8oMyX4vAnD
 MElcs85lvzSkSYzsa1B9pSrekzrltLdLtGZJ3C1ckn4BDqpGU4KrOa+0ajUgToMJ6212
 +02inZ/G5mrCLhZXjTHr8zYZQpdOZTJKq7AlyJL3+JjfsD17pLbHdlB9dB/AfScBMvm/
 2mGA==
X-Gm-Message-State: ACgBeo2CxmwxAypeQ4UwFkLYawJYUK7FlBG/HC2UFZtFwBmGnScG+XDl
 qxQZKjUTb3OrNDVAI+85H+Soj9Mfr6C6c8Ypxop0yQ==
X-Google-Smtp-Source: AA6agR5LI1LaT8YXZ6hi+tLVMykpChNaQHszJzuGTk3J8VKqaFkepbr4zigFewMfDbkNUNRExQWJJ3DMLbXGcBYxl7Q=
X-Received: by 2002:a0d:fd05:0:b0:329:3836:53ac with SMTP id
 n5-20020a0dfd05000000b00329383653acmr3294063ywf.455.1660300267482; Fri, 12
 Aug 2022 03:31:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220809185639.750345-1-qemu@ben.fluff.org>
In-Reply-To: <20220809185639.750345-1-qemu@ben.fluff.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Aug 2022 11:30:56 +0100
Message-ID: <CAFEAcA-yFBJOTRrVdCM+YESKxmsPHGJA58mjcREt4erRKv=3vQ@mail.gmail.com>
Subject: Re: add qemu_fdt_setprop_strings() and use it in most places
To: Ben Dooks <qemu@ben.fluff.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, Alistair.Francis@wdc.com, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Tue, 9 Aug 2022 at 19:57, Ben Dooks <qemu@ben.fluff.org> wrote:
>
> Add a helper for qemu_fdt_setprop_strings() to take a set of strings
> to put into a device-tree, which removes several open-coded methods
> such as setting an char arr[] = {..} or setting char val[] = "str\0str2";
>
> This is for hw/arm, hw/mips and hw/riscv as well as a couple of cores. It
> is not fully tested over all of those, I may not have caught all places
> this is to be replaced.

Hi; just as a minor process thing for next time you send a
patchset: the usual convention is that the 'cover letter'
email has a subject starting with a tag like "[PATCH v4 0/6]".
This makes it easier to pick the cover letter out when eyeballing
a set of subject lines, and also helps some of the automated
tooling (eg I think this is why https://patchew.org/QEMU/ didn't
notice this series). Usually 'git format-patch --cover-letter'
will get this right automatically for you.

thanks
-- PMM

