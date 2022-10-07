Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF235F7BD6
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 18:56:25 +0200 (CEST)
Received: from localhost ([::1]:36688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogqe8-0000Tw-KT
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 12:56:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogpwe-0000gk-Sq
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 12:11:28 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:43975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogpwV-00064a-Oj
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 12:11:28 -0400
Received: by mail-pf1-x434.google.com with SMTP id 204so5275251pfx.10
 for <qemu-devel@nongnu.org>; Fri, 07 Oct 2022 09:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DRR5Vxo77shyz1gpQGn8nfsniOVpFa4god68254hExE=;
 b=eoCGk2E+VQf57UQL0CKk24OrGRx38F+ASpafJtESTi1vM36ibpW7WPuiZD8fZu/mxl
 iUoP6Tw24koqmGruczWf615zCDrEGd/WoFIUzrT1itps5gUdf2zTmMMF2vU4Xvfp4MAJ
 Plt+Te65ooukQXFBh5PSCSOpx13ZUTLqotYW1QPDGLAFqmYB9DGE+OIQCe9FFYVolUzJ
 2W38qxGp7thBI4x/2W3mcKgFD7BMw/W2C1J/3qz8ghDbTWZqRMC0sxnn7QJSM1d51BDE
 v4xxM3rMvgX3XeWCtTANbxUWxXxo7xvsquyh8RmLkDeK8EYaG7S2GDDdeDrIaDDEZM8w
 03jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DRR5Vxo77shyz1gpQGn8nfsniOVpFa4god68254hExE=;
 b=0NJUQoOOrJJ3p2eF9gtsaE8DgFt0wcKfVuDF7470t7LgganwdNjVhlYutBgYHDzsDi
 NMf2g6Khq+NcfB0eFj+iqtj+fYKNGcFGxRpsOR2FwptcwB+kY4DDmUmxkawhDNTas6ne
 fA3sCFu8T5A0ALLIbgpaKPlPA5tnhA8s8mUfC2nsdCulbLmgGycMkTyU2UNmTWrnbxr0
 FYc0YjeebYTHKREu7gmS09Mlr+23sxV8Mg2Vi766JnDHiA+UY2yKhBof4WAYGs3sylMe
 nIntucSRaBaRKf3hKviRQfata6vDL4drjp6a/AfRlylkbZYOKHIbAtTUUvLlc/P8fdKW
 w0xQ==
X-Gm-Message-State: ACrzQf2b2fm3y2bE3ViJnIwy5SXwD6UroqkNQHDrZzbCLRdjyzWKedVT
 USqhWr6ooz54SnyhKvr3G+3mGt6BRDVLcdoK2o9Muw==
X-Google-Smtp-Source: AMsMyM6cm4Z0pioaixWVp633tkYM1VVOuTOEIYNgLN/LYlJVsBmVSDYTRYkgfrQ9XAtdLn0A36+5NnKaLUaSfptbkCM=
X-Received: by 2002:a05:6a00:181f:b0:562:8e02:ec29 with SMTP id
 y31-20020a056a00181f00b005628e02ec29mr6131359pfa.3.1665159077326; Fri, 07 Oct
 2022 09:11:17 -0700 (PDT)
MIME-Version: 1.0
References: <20221001162318.153420-1-richard.henderson@linaro.org>
 <20221001162318.153420-33-richard.henderson@linaro.org>
 <CAFEAcA94XFJ1d0Trn08cMvxnDCxd+SGwJuG1ZQZaUb9g_FZg_Q@mail.gmail.com>
 <21eab094-34a5-6e02-6bf4-3ac4c70955dd@linaro.org>
In-Reply-To: <21eab094-34a5-6e02-6bf4-3ac4c70955dd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Oct 2022 17:11:05 +0100
Message-ID: <CAFEAcA8Tg2Vmy2B0a_QcF9wYMHsQUY8HhEOXhmhTF6qO_3RGtw@mail.gmail.com>
Subject: Re: [PATCH v3 32/42] target/arm: Extract HA and HD in
 aa64_va_parameters
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On Fri, 7 Oct 2022 at 16:37, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 10/7/22 02:24, Peter Maydell wrote:
> >> +        .ha = ha,
> >> +        .hd = ha & hd,
> >
> > This is a bitwise operation on two bools, should be && ?
>
> Bitwise works fine, but I can use boolean if you like.
>
> I'd be surprised (and filing a missed optimization bug) if the compiler treated these two
> operations differently in this case (simple bool operands with no side effects).

The different treatment I would expect would be that in the '&'
case it warns you about using a bitwise operation on a boolean :-)

-- PMM

