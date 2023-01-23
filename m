Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8A267798F
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 11:48:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJuMZ-0005c2-FO; Mon, 23 Jan 2023 05:47:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pJuMW-0005al-T1
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 05:47:41 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pJuMU-0004dg-QJ
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 05:47:40 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 k10-20020a17090a590a00b0022ba875a1a4so7894269pji.3
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 02:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=F+FeA34keWKW4l1oQh5H26w230bGLt5qy+O/o4lVWPI=;
 b=SEkctyMYSUq8CmsU7viFQyaK+/+4LbQcCxdeG19j4AI1Skk+ykxH/5lvD5kigVCFK/
 wOtyokErCRrn1Wauo7QO+JrZIbKlW4LMPj39hegZkO/v4rSXOk8eDaAphnib3k6MSYFN
 mUE46xwh3gOLFdM9bV0XBJ6PGbaYUglyDFE+QRGglEZz5kgmGBOj9vXZ0/b0Z/za6GN/
 KIE1uX6GDKw6CTs/2o6aoUvfbFN2BCTajzC8B/h5IsBf0TyJ/Vzl4AHF89oJYSjQXsI3
 FO2B5hyIK0TqZoTp2vNBlK17AnZBDLQy6ihvteGjFgR3rmwGFqHvm9YuOF06yrHXd8+9
 aFGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=F+FeA34keWKW4l1oQh5H26w230bGLt5qy+O/o4lVWPI=;
 b=ggy5gEd0ZBywTbpylmTJ6Lr3bDsz1NQH0a8RpoSwtJOlxjNTUN6SBwkLEffhzeaOTx
 Q0yKhv+kqW5hX8SLWq0xEXbwNAq8Rq7tjpa+Uq8MO0AXG7ub34qkn5Kph+RcH6Y59RdI
 OgW+UCTtM9tsJbvOGVUhtD6jJbIg2aacT0XhH2AXMBXBZPNycdm3jtGmNn1JPy4Bx6V5
 xccXkDqtHDT67NgQPP5APyUcNSO5rBQSbdED1pSbVR71w4N6nhpbH3qblvEF+spsoCXN
 O3tu5ihc6j9xaddDoikfSTx4Q3MX8xthdS+3UGKnGzKSimuc2XMt8wWN2UEChO7UGJXH
 hkUA==
X-Gm-Message-State: AFqh2kqpV2H5H7Vvadsa4nI9QBc88m3DcOD216PI0FDQInRSbpDluv32
 nXnmR/QkedNn6KDxTZdJB1exCDSbz4ZhIPHK3GSiRQ==
X-Google-Smtp-Source: AMrXdXuX0ZlJYLIGD1qoxB6oZCaOOS9iij1o3ef/9OZxVcmHh+Zv9p1OLGx0r6mFSwqwu+YrDr/7fbipdNRkJUva0Io=
X-Received: by 2002:a17:90a:ea92:b0:229:189b:6fee with SMTP id
 h18-20020a17090aea9200b00229189b6feemr2805645pjz.221.1674470855311; Mon, 23
 Jan 2023 02:47:35 -0800 (PST)
MIME-Version: 1.0
References: <20230123102626.4144557-1-i.qemu@xen0n.name>
In-Reply-To: <20230123102626.4144557-1-i.qemu@xen0n.name>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 Jan 2023 10:47:24 +0000
Message-ID: <CAFEAcA8iVrpzFnKj6Ws+F63RJSzV-atUbspFQKqsWOtptOxwPw@mail.gmail.com>
Subject: Re: [PATCH] linux-user: Add support for LoongArch64's old world ABI
To: WANG Xuerui <i.qemu@xen0n.name>
Cc: qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>, 
 Song Gao <gaosong@loongson.cn>, WANG Xuerui <git@xen0n.name>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1031.google.com
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

On Mon, 23 Jan 2023 at 10:27, WANG Xuerui <i.qemu@xen0n.name> wrote:
>
> From: WANG Xuerui <git@xen0n.name>
>
> This patch adds a "loongarch64ow-linux-user" target and a
> corresponding "qemu-loongarch64ow" binary, for supporting user-mode
> emulation of old-world LoongArch applications in the wild.
>
> Although the old-world LoongArch is already being (slowly) phased out,
> there are already a number of deployments (mainly as a result of
> LoongArch's early commercial growth), whose migration path is something
> software developers have to care about. Support for user-mode emulation
> in addition to system-level emulation would help development of such
> migration & compatibility solutions.

Is this 'old-world' ABI supported by the upstream Linux kernel?
I can't see signs of it from a quick grep. If it isn't, then
I'm not sure if we should support it in QEMU user-mode emulation.
We've always set "upstream Linux" as our definition of what the
official ABI and featureset is for usermode emulation.

thanks
-- PMM

