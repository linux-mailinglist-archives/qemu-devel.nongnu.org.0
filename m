Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD6E60A191
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 13:28:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omuXX-0006ZA-PI; Mon, 24 Oct 2022 06:18:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1omuWw-0006Le-Gt
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 06:18:02 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1omuWt-0005Kb-Oq
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 06:18:02 -0400
Received: by mail-pf1-x435.google.com with SMTP id d10so8579563pfh.6
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 03:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8M9WmVJUvXKEvxToF1eUHXwfivIiyL/p6arcwPokscQ=;
 b=HmBXZVaH/gLPCmR3huEvCZWv2M3es8sT2jtuxS6sT9V7rVQ0SUTizHC0glPr0mKEU1
 CZnBK6lqs353Uz27ikOqRjcE2L+Px/66rLKudb6lLiLhDx7oEexznYc3RSGzAIk3b8uo
 UZza+QXBUSYJUG4mW5spNAn1+RzuKacbhun/1g7UFrvTOJwj2XCUC4m3ngjVLCz+P6F8
 UoRY87QVAl9yNE3kTvaYncerHDTJJFCcPILFfjwsoF/Prtdgn2xRdoDGymd33T4UC7CJ
 DrK4KhSDAgyPm1p/UbpAaahxJVB45YR9Mr6vqsOC5sGpBhi9wXyfGB9XxOj0u7UgqDsY
 0wWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8M9WmVJUvXKEvxToF1eUHXwfivIiyL/p6arcwPokscQ=;
 b=IMhenN5MJ9eOCUOLuzgll4g2WsTLkqlYw3Pe1Rm4coXNwl9RRp7M+QsrrQre8XIRtP
 CsGkHiyaL1HgdRQAXMfWojRLXBMd5DpwUkpRoAxzUvC4O7PPCtVbFYkCHlIY+etnvvm7
 J1P6WVgjg954GXz8/XjrRDhhBQkea7P/DynRfD19ECIuGO8ULHDThLihKZMM9OrevAk2
 IztY9pXAFTSDqyMMlLWPr8VFVwCjksDiKIrOihJHPNDXUN9HpOY38d0qxPgf1oX5GWmL
 nMk5k473yZsS8ymbxejBE4DQz3sCQxdWDPivdpyjmzNURSjZaB7iN2oh4p02Rtou5cgH
 AFow==
X-Gm-Message-State: ACrzQf0Kvq7Ou4HFep3K2zULOoOJvBXknH1sM1JwQFWu1dp+e02f/G3D
 7wZHtxl6nGJTZ394zEx7qdHm7o6Y8gtkFq/TyFBqOg==
X-Google-Smtp-Source: AMsMyM68sGLkBZVMotXjm/AbD7mS7wHKg5xsY9Os2hdG0o7EMyWrFP98MMkn+RoplBS7fhXv4EUZYz3gEtTRjcBLWd8=
X-Received: by 2002:a63:2212:0:b0:43b:f03d:856a with SMTP id
 i18-20020a632212000000b0043bf03d856amr27646498pgi.192.1666606677719; Mon, 24
 Oct 2022 03:17:57 -0700 (PDT)
MIME-Version: 1.0
References: <20221024072802.457832-1-bmeng@tinylab.org>
In-Reply-To: <20221024072802.457832-1-bmeng@tinylab.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Oct 2022 11:17:45 +0100
Message-ID: <CAFEAcA_547EyiBQotG-E--Mb_t4XBCfxx5XsaTYAW8oe1Xm+wQ@mail.gmail.com>
Subject: Re: [PATCH] treewide: Remove the unnecessary space before semicolon
To: Bin Meng <bmeng@tinylab.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Greg Kurz <groug@kaod.org>, 
 Jason Wang <jasowang@redhat.com>, Magnus Damm <magnus.damm@gmail.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Pavel Pisa <pisa@cmp.felk.cvut.cz>, 
 Vikram Garhwal <fnu.vikram@xilinx.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, qemu-arm@nongnu.org, 
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 24 Oct 2022 at 08:28, Bin Meng <bmeng@tinylab.org> wrote:
>
> %s/return ;/return;
>
> Signed-off-by: Bin Meng <bmeng@tinylab.org>
> ---


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

