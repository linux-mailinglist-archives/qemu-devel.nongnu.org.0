Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86AC54A9DA5
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 18:34:17 +0100 (CET)
Received: from localhost ([::1]:46680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG2TQ-0007uA-Cu
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 12:34:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nG23s-0008Dh-7o
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 12:07:52 -0500
Received: from [2a00:1450:4864:20::42c] (port=34738
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nG23n-0005Cd-8U
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 12:07:51 -0500
Received: by mail-wr1-x42c.google.com with SMTP id f17so12580261wrx.1
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 09:07:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KXHPCbSZG3TI6bJwdaAJwsoSLDtVrmWMx3HqLytKCw4=;
 b=wAiuWI13PRgy3spHJ4d+45J5IMdQyndA3WdFMcIgYXugZa1t9Kn9lYQyUzoh77RYhw
 CvDMcSWKtx6vY5rZIRfSCdy1c+OqPEMBABZboKmroSpj1qMYbNbhuGcJj9aVJR8NzxIH
 6P3GM5XQCD1pEAJyV7nVxR9/MZZcvTJRJrCXQ7qIWxG2HhOQHG5tIwHK2kiqWiOoZd/n
 ofhH8T9qOH6T4H7dfHJeKvC/Jn0miGBw+mkYpecYmn71klrG8Ur/6ZhcQ0HDVXHY+Wq0
 oBaWzecWor9p8cm178/ssgKf0tDS5PtvMtTTebwwzW98uxg3/mhcHH+3f3/KF3eNwvIc
 hAKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KXHPCbSZG3TI6bJwdaAJwsoSLDtVrmWMx3HqLytKCw4=;
 b=1EHu5T6BMW40VOulBNk8PTBaKMhZrs78YCl0hPU3lEliyhLQ/zwtZAYVfgJEf+/vGR
 GwBHaFk7VV7k/RgV2JUoNKK7AB38H8uO4swBnPj+O1EJQ3X5DpOZUimcWLsRGDsi1TuA
 ExyRkDKVnfXTeMojW87K3FlDTMBeO2QLJm816aqmJYRKv6SffBmvV3+dF9y6KDbC+OUf
 veOSz1G3sIjfOe90130yvTnYelTs9n4Ti4TF4+zZh/GvqjrASJZsDKPluqKSVG5SShn4
 N/34G++PoNPpqWlH/0s9YluCcFJQ5tLzrHabkxuqp3NMZ2Wmvfmwo9+RZ0RDJvXrwVZR
 Zd8g==
X-Gm-Message-State: AOAM533mPovDuqio3xiVPnGIcd0/yinryt9xa9S3QQ1r5WO5AXplAYV4
 TVSc3E/G79SLQZgc+hCt8aoixqSA3Q1iP5OsoHzs5A==
X-Google-Smtp-Source: ABdhPJys0zRGM5Ba7tfOmgFDDtSTf5Yk7O6srNuFNy0++2uUCOLTwNH8XajzWque6oFjoaoreqE+OQIXXavbhnDcsY4=
X-Received: by 2002:a5d:4c89:: with SMTP id z9mr2097956wrs.521.1643994461634; 
 Fri, 04 Feb 2022 09:07:41 -0800 (PST)
MIME-Version: 1.0
References: <20220203151742.1457-1-francisco.iglesias@xilinx.com>
In-Reply-To: <20220203151742.1457-1-francisco.iglesias@xilinx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Feb 2022 17:07:30 +0000
Message-ID: <CAFEAcA9w8oU_fsOQHZxgV+=QWyvCzyHFtjNQ2RPUxNM_V9vXew@mail.gmail.com>
Subject: Re: [PATCH v1] hw/arm/xlnx-zynqmp: 'Or' the QSPI / QSPI DMA IRQs
To: Francisco Iglesias <francisco.iglesias@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: edgar.iglesias@xilinx.com, frasse.iglesias@gmail.com,
 alistair@alistair23.me, luc@lmichel.fr, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 3 Feb 2022 at 15:17, Francisco Iglesias
<francisco.iglesias@xilinx.com> wrote:
>
> 'Or' the IRQs coming from the QSPI and QSPI DMA models. This is done for
> avoiding the situation where one of the models incorrectly deasserts an
> interrupt asserted from the other model (which will result in that the IRQ
> is lost and will not reach guest SW).
>
> Signed-off-by: Francisco Iglesias <francisco.iglesias@xilinx.com>



Applied to target-arm.next, thanks.

-- PMM

