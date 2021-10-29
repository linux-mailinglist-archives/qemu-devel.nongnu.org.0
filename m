Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDAD43F6CC
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 07:51:22 +0200 (CEST)
Received: from localhost ([::1]:38832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgKnR-0006SS-V9
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 01:51:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgKYj-0003bp-21
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 01:36:09 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:33710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgKYe-0000Vn-Ue
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 01:36:08 -0400
Received: by mail-wr1-x432.google.com with SMTP id m22so14422145wrb.0
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 22:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=yDA13UgzW0sagIS76kfYxxTOglQztiw5XUeuUy/09/E=;
 b=jEQGEk05z2TyR+mFDc0Li7oBUB2XFMUja0tJzA9OCB7zVo8aNB90Frqseowg8iEpFE
 NN2pKyWUKQgpL/qlPxuLMyAZ6oSf1kr9dwmw+FH3Dc6RMN4Lca3mgfn0z0TD8LivDb/6
 /6VKqTns+fYWgN8rWeQFDLjHLfMiDWA0Jank9W6B1HN9+Y20GmvX+dAkPt99WCq2mFUH
 LeoNmXI4NUYKitmTZU4BjMMaLCEeVb0OL5s7bTnbUDtJF/HyTXVhMoYK0AVdzx3GMdrw
 50B9ZRNE/4xVhGmFSQ+WFXW1/TzfYMZhj49sU8ZlpOe9vEm94sK8wVE/XW2NQ806TOIT
 zdzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=yDA13UgzW0sagIS76kfYxxTOglQztiw5XUeuUy/09/E=;
 b=cmBafegGIHKLbgaQxXvXyJ0RadlICRbk9DPbDFg7nZ+4kWl7/uwQA8dj0r0ebZbh+O
 t1kaRyl/Xy0EkGgzbL1eX9frUCKT+f6rV7mCMSm76L6dlWOXMBpLd+aEwglwEmve/rti
 l4dPiFiDowbCmGyUnkVOt2ccqkHmOCfFy10gp4pLnMKaJvc4Qj5bPUioFIfmU/L02Py9
 r5edQESOEwwicrZaAagsomQhgClF7O0Kt+Ra1garBSr9Cv/ooI0hrJ7TvjhikffAII+P
 O9XPhWgLDKjINXnDawidP1sTYD+/GlQaK7aH+GX5PY9v6qepNaA7zP5nYedhzoF/5fOO
 6PAA==
X-Gm-Message-State: AOAM532CQSoUCaEVi+EVgrO+e6UH1Vn8yXgsNpfEINojRC0GxUFrnj5I
 6lcyexVSFRjPAbgIrSKyfzk=
X-Google-Smtp-Source: ABdhPJxUCOks6KnnoRH+bJc/5RYZ5Fh085277PKIzUByJPhPA+p3iQaaNFl0o5TuXZP/AdZbmv3TbQ==
X-Received: by 2002:a5d:6441:: with SMTP id d1mr11868319wrw.208.1635485762380; 
 Thu, 28 Oct 2021 22:36:02 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id c1sm1813273wrt.14.2021.10.28.22.36.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 22:36:01 -0700 (PDT)
Message-ID: <0f125686-dc93-9c3f-a9db-84527d79c36f@amsat.org>
Date: Fri, 29 Oct 2021 07:36:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 10/23] hw/intc/sh_intc: Rename iomem region
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1635449225.git.balaton@eik.bme.hu>
 <c31fcd740f079c6fd905876f762a68f82feae5d0.1635449225.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <c31fcd740f079c6fd905876f762a68f82feae5d0.1635449225.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.847,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/28/21 21:27, BALATON Zoltan wrote:
> Rename the iomem region to "intc" from "interrupt-controller" which
> makes the info mtree output less wide as it is already too wide
> because of all the aliases. Also drop the format macro which was only
> used twice in close proximity so we can just use the literal string
> instead without a macro definition.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  hw/intc/sh_intc.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

