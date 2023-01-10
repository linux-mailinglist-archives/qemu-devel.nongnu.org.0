Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CE8663EC2
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 11:56:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFCGD-00051m-Ri; Tue, 10 Jan 2023 05:53:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pFCG1-0004zh-S7
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 05:53:39 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pFCFz-0005By-03
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 05:53:29 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 w4-20020a17090ac98400b002186f5d7a4cso16076487pjt.0
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 02:53:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Go98DXXnf956AM4b62+S9PFtQxjeyhD24hRdb6NuW1g=;
 b=MNNwoiRW0KJ/zpuLjW13z92B2K0ms0mRCL2nP66EjP3pe865DM7JVMzKASmtPiGv6Q
 ornBu5YbCO7wn15A9H4Xp5dGWbIm0KWSHwYDQuaaqitmfQJ12ZvZbxAfXF685FFKcnYr
 rWgSNpRcBZ15jFGx0XzldOzoO4Ojll7ywCWLJnlwRSGP4WtuwQlNkFPWZ2U3VbCBWofV
 qv7V7DvCU44JXandEnFJsewWdMV42e3RVCyMVE4KqOijN4gNLd2y0rQcJr7WeO25YFwP
 sIO7iinYwsYz7qhUC6hKfRj0HW7fGDqZDlfKgfqnhXCKNebr7fu9PE220YatjiLAgQWr
 1y1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Go98DXXnf956AM4b62+S9PFtQxjeyhD24hRdb6NuW1g=;
 b=FTzGAzGFAFU+9uZqzRttnPt06fwYEmcyQ5TfRf/sbolz4RtO5g0OjFPoPpLckOf38c
 +n6nIGB5fqOR7QxAMneqXB2HXYyp+6htT3aozbcqNJtDXJxcIF6QREaBL2bYlTYaMtP3
 MHXZe45Z8lSk9l38Y+5wEubF1QeU8XwfwIHPXlx5YPknuAFtoP6E3sJw1RHRQIIpiRcz
 DGLrH7QD8SI3Bbn4F1Eme125Kai3iVbhm+bXACccTflYu5hFvXCrZbYmzqvWH95KoKtX
 PiX3xCVAQ3X+00W35+hWgeNsDaLetjd8WKTwejiXOdXPlbhClXCnBlQW8xtALAQkAiV7
 6Bgg==
X-Gm-Message-State: AFqh2kpy4A4P2nhupQAk19Xx2YZt5dhkSAL2G2j9sZNdlYFqqdRrZTAt
 g76LLRPNfhH3WuiAzgSQYiaSLRBu9A2ByUlpPOHm4g==
X-Google-Smtp-Source: AMrXdXtL/RCJXp/BtQVqglfN205JUd8NGoYEqDJqN3NyeD+zTixkXdGusJaNyQ+Jgc6gsHuy9NAOJpNv+Kq484W9NK4=
X-Received: by 2002:a17:902:efcf:b0:192:ea33:5092 with SMTP id
 ja15-20020a170902efcf00b00192ea335092mr1931647plb.19.1673348005071; Tue, 10
 Jan 2023 02:53:25 -0800 (PST)
MIME-Version: 1.0
References: <20230110084946.299480-1-pbonzini@redhat.com>
In-Reply-To: <20230110084946.299480-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 Jan 2023 10:53:13 +0000
Message-ID: <CAFEAcA9VCBqarUPzRrTx5ZXXFV8bdijge6zi=YUSrcirtv6bWA@mail.gmail.com>
Subject: Re: [PATCH] remove unnecessary extern "C" blocks
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1033.google.com
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

On Tue, 10 Jan 2023 at 09:33, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> A handful of header files in QEMU are wrapped with extern "C" blocks.
> These are not necessary: there are C++ source files anymore in QEMU,
> and even where there were some, they did not include most of these
> files anyway.

Any reason not to also take out the extern "C" block in osdep.h
and the uses of QEMU_EXTERN_C ?

thanks
-- PMM

