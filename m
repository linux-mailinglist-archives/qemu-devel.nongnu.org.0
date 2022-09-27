Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D67665EC9FB
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 18:50:20 +0200 (CEST)
Received: from localhost ([::1]:49650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odDml-0008Jt-Dc
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 12:50:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1odDUQ-0003VX-W1
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 12:31:24 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:37879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1odDUP-0007JO-D8
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 12:31:22 -0400
Received: by mail-ed1-x533.google.com with SMTP id a41so13942142edf.4
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 09:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=jcNRls5nMA1+tgZwCzNKm7oxvrfe8y+Tn+xwhvEwZ6s=;
 b=uSDw/5N1RK6UQgItVl3CJuNVrYKWvWME9yFGdtJsQDJRtWvnS7aBGRAn5jLarTGBaI
 eVbgFhCjKtKgPDZ1e0jD25vbdF/SVW3v8Mo9b3k9jvNK4+RfTgUfewEt+YX+anl1hWx2
 Nx5WqWFTrM79P2eEMHqVMp5MdMfPQ423OUcrqAz4elzd75csEMy2OTJRiPr0dOyBdOfi
 vbq6sp6T8yo22vcSgAPnaqhs9sSheAAY18wbTjgngc21BA+p5nzPRpOM/SKGkuiN5Hoh
 oauaznRvHgXsPAsDcyI1gddmt+LxptRS3D8DrXKh87PqRcgppn0/AicWpcq1dxelxWVZ
 imYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=jcNRls5nMA1+tgZwCzNKm7oxvrfe8y+Tn+xwhvEwZ6s=;
 b=idt9g4Sfp+iye3nEQqBlEUywV23MXhat1fvkCpuxkdI2jMPNB4HLLaCtQeXwxl5bSb
 nIeC8cZK5cS34Z9cXruClmNfsqvqMLes/TGz7JyojSdaa3d0/ggnsOtEdtozISU1/EiP
 ZJA/wruvyb0cB2MXEbsLt3YktW1fQIO4JcFznL+WrtI4++6AnJ5kohF3/im0Ufiovn02
 DlPqNU4c48lKvalmYYZ4C64rd34zAprpRqcVLpIVqd2RILR1FMrwsfAnPBzqpFWtPkRv
 VpAT/gp6fHQHnnRMLdbzGIwM9NcRd0i8B1+kEPgfEa0mTAKpjJZitEP18aW797xKyOEz
 SkdA==
X-Gm-Message-State: ACrzQf3yLrxFOfsWXuvBMhaVNVHlsslWSrde5pa1upFzGGkC11Ze/kQw
 YYZ3di7LYZ9w7HDnbqu3fqrTLOx0T6FyV6ohC78BFg==
X-Google-Smtp-Source: AMsMyM5Hv3P0OY4FsOs0wKi8A/1Xmd8Iy6eEvez7XmZePQB3hZ0cutJzMAwf4FLKWnvksn/KKZL0XQTLBkSyCd4+zZQ=
X-Received: by 2002:a05:6402:2787:b0:451:d655:9269 with SMTP id
 b7-20020a056402278700b00451d6559269mr28729149ede.375.1664296279939; Tue, 27
 Sep 2022 09:31:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220820141914.217399-1-tobias.roehmel@rwth-aachen.de>
In-Reply-To: <20220820141914.217399-1-tobias.roehmel@rwth-aachen.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Sep 2022 17:31:08 +0100
Message-ID: <CAFEAcA8CMUC6_zi2SFdV7Gomsjm_mK2T3hPZ1-t0Ahn+R92NCA@mail.gmail.com>
Subject: Re: [PATCH v3 0/9] Add ARM Cortex-R52 cpu
To: tobias.roehmel@rwth-aachen.de
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 20 Aug 2022 at 15:19, <tobias.roehmel@rwth-aachen.de> wrote:
>
> From: Tobias R=C3=B6hmel <tobias.roehmel@rwth-aachen.de>
>
> Thanks for the review!
> Here is v3:
>
> v3:
> PATCH 2 (Don't add all MIDR aliases for cores that immplement PMSA):
> fixed the comment and changed to single element instead of array.
> Also the alias is not added for all PMSA CPUs as Peter suggested.
> PATCH 3 (Make RVBAR available for all ARMv8 CPUs):
> Added the missing RVBAR register as alias to RVBAR_ELx.
> Tested that this code actually takes the lower 32 bits
> of RVBAR_ELx as RVBAR.

Hi -- sorry it's taken me so long to get to this, but I had
a combination of holiday and KVM Forum :-(  Anyway, I've now
completed my review pass for v3.

thanks
-- PMM

