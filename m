Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 447FA50B474
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 11:56:38 +0200 (CEST)
Received: from localhost ([::1]:44978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhq1l-0003uV-Db
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 05:56:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhpyZ-0002Ui-1X
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 05:53:19 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29]:34404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhpyX-0000vW-HR
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 05:53:18 -0400
Received: by mail-yb1-xb29.google.com with SMTP id b95so13556867ybi.1
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 02:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=esOGYz7p8GTIoasqAu0AdlHqEcw+9VUKHF9ulY5dS3w=;
 b=tkg+IwQtdNfutp2PNt0l75wFVwY8M2RqOWSRjJuv/7+HzLnefehMkmM3kYCQcQv3AA
 PoEIrMGf4hMi2B+XY4LKXTGJZ3/XjCESyQbi0z02vnjBepGcGM+E0SoCvQMBZrEb1TUo
 /BbaaZiyCs18AuyvAVfGgzAARePDsMIzzi98gYWSFvocOPzNtHUfGLRGyAZqGYViRKyc
 Svw3QfkcBSW7qymMFMtJrVjiRgEeWVOPdK0yTqUA1/tJhgxafR1YW8wevsewrptfeqYV
 AX3yLLrWc9MDyMTe04kKNMVsx+2y+xsVlDJTA5WoyIW1k5tqK3O17EifFc3JB1WBbjgn
 Dorw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=esOGYz7p8GTIoasqAu0AdlHqEcw+9VUKHF9ulY5dS3w=;
 b=vZ+TkAyHy3NnPYJHqweAma/vSFe0tMSbQRkrypjX0nwHdDxKwDtllJ6S65INx8swJr
 y1ErsEOGFXS7UDyN9EMM8HdGdZccO8mT4UywO2FT7Z5dauVY3+ZJkZajaZbDOOjsbF5t
 2Ad+rZSVJbp9ICSe87xKCzAna0l5JQKE/OvIUQyvqXIsad3IwhXliqnMoL19nyiTpIke
 rqxh4AmXkTHd2xG5Iz4vtIxHqSVAJj/QhYO9Sqk3uwVHE9gkVFktwYwiu0M4c9kvp3D+
 g9qjWsjMla2O2h/AV56kWuZ07cS8i9T688pwbzN6CJ96qOUD5rVosqurCF0/oZvEX12w
 76fg==
X-Gm-Message-State: AOAM531ZtEn045zaUH4AOdul6o8n62SbEXA/2wWpDbXAda+I/6eK17IZ
 7aFqejRFWw5aldo9OWIh0nKn4psEYII8WxWz4ZEY6wvFnow=
X-Google-Smtp-Source: ABdhPJxa5JAY2xx5+Uw0mowjwpupIpM++2CihTXTdiVDLb6Yga6KaFjfPm3oXCzrSiMfGKZS9TI+L77T/1cpFgC/Q6U=
X-Received: by 2002:a05:6902:390:b0:645:7d46:f1db with SMTP id
 f16-20020a056902039000b006457d46f1dbmr3556029ybs.85.1650621196596; Fri, 22
 Apr 2022 02:53:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-31-richard.henderson@linaro.org>
In-Reply-To: <20220417174426.711829-31-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Apr 2022 10:53:05 +0100
Message-ID: <CAFEAcA-6JmeoDJFvhM4JV40zjh-4BtUjVbFDx-ofS_fw+U+dTQ@mail.gmail.com>
Subject: Re: [PATCH v3 30/60] target/arm: Name CPState type
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb29.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 17 Apr 2022 at 19:16, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Give this enum a name and use in ARMCPRegInfo,
> add_cpreg_to_hashtable and define_one_arm_cp_reg_with_opaque.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

