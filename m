Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2BB5819D3
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 20:37:51 +0200 (CEST)
Received: from localhost ([::1]:35388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGPRG-0004sc-Ty
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 14:37:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oGPFd-00030I-5n
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 14:25:52 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130]:39512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oGPFZ-00027h-3m
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 14:25:46 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-31f434f2884so38491617b3.6
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 11:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Dumw7OeelxsrNvHFhfpMzWTNFyyJTwhu+HIalNh40yo=;
 b=eK70PdDZEMkFbJPbb+N8dPjKCRy/5hB8icVtU0zBFmdl19PRTuZHe6Gk/jzrB7Wx40
 cPVj/xeAckjZEscQ/3rkj6ElULYxe6tOPQIylyXABBgJXVN8KfaIiSb8qxUTc4ndhjII
 7QC3o8qgAwLr7Y5Q225t9k1FC+kotBTq0ClwcNlJoznNuyCc6zK/KILNRKIUC7Kcsh1Z
 XipjSsnKCLAySA+zziFnzf8Gd/nbDTJSocjpp1QCnMkvFi/unASeRkFCvbgN5tG9V+Pw
 09+RgBr7PAX9aU9mXfcNajbNvvBsgd66Q9nHmIR1GtiJoPJsYGkoW/6M0l/6ER/l6n9r
 0RyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Dumw7OeelxsrNvHFhfpMzWTNFyyJTwhu+HIalNh40yo=;
 b=W/fuPLSwoXxVww6ndQNIU+yaIfP/uvT77rY213y5928ZAbIX4HMOdtwsk34K7EtNX2
 MxpgQee5w7da29/q0mOH0eaQyfPMzdPhDWdN1/RWNfg4bPQFLOKP1jGIBuyFiyTKacE6
 4OFxKZx+yTEO7eFYWL6RlvaWo3VW/JQh3rRWcy466/DCK5lnbdG2gR4IXHyrR4dHLaBO
 /sLwFu32kcWTJv8NfKjyDdDQHMQDWukgkoGWtqQmW6/KConNTetDt/lGyFqYSQVkCfX6
 SoGItKEBLwVDeRPGAj9Sof2uA9vNa1J3X1Y7XJjVXzF700WRtmYdMtPWBaopVLvuiRsC
 1Stw==
X-Gm-Message-State: AJIora9lRxDkY9+owI7pEzGPMkjbAPohn2dc3SYhZGznrDaKsH3FhJul
 QMHqAJBoY16v4YF6KKrDh7ilEoiWh8qPf5986cPge+n+2TIz/A==
X-Google-Smtp-Source: AGRyM1vm1lXeUS7cvZbAOvcgSF8wobRpawUhTxNza6oyzqJkA8dE54XLVUFSrOpUyiVEOD69uVBCofRksG5N39g0GFE=
X-Received: by 2002:a0d:d2c3:0:b0:31e:62ea:3303 with SMTP id
 u186-20020a0dd2c3000000b0031e62ea3303mr16308989ywd.64.1658859936351; Tue, 26
 Jul 2022 11:25:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220726182341.1888115-1-peter.maydell@linaro.org>
 <20220726182341.1888115-2-peter.maydell@linaro.org>
In-Reply-To: <20220726182341.1888115-2-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 26 Jul 2022 19:24:56 +0100
Message-ID: <CAFEAcA8s9vgBFVuDVVednC4cv5Q4M7L+uTCc74tEmdht4ss+pA@mail.gmail.com>
Subject: Re: [RFC 1/2] hw/ppc/ppc440_uc: Initialize length passed to
 cpu_physical_memory_map()
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, 26 Jul 2022 at 19:23, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> In dcr_write_dma(), there is code that uses cpu_physical_memory_map()
> to implement a DMA transfer.  That function takes a 'plen' argument,
> which points to a hwaddr which is used for both input and output: the
> caller must set it to the size of the range it wants to map, and on
> return it is updated to the actual length mapped. The dcr_write_dma()
> code fails to initialize rlen and wlen, so will end up mapping an
> unpredictable amount of memory.
>
> Initialize the length values correctly, and check that we managed to
> map the entire range before using the fast-path memmove().
>
> This was spotted by Coverity, which points out that we never
> initialized the variables before using them.
>
> Fixes: Coverity CID 1487137

Also CID 1487150 (it reports the wlen and rlen issues separately).

> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

-- PMM

