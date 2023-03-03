Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF366A996A
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 15:30:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY6Pz-0006wm-3x; Fri, 03 Mar 2023 09:29:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY6Pw-0006wH-Ti
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 09:29:52 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY6Pv-0007Cz-E2
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 09:29:52 -0500
Received: by mail-pf1-x436.google.com with SMTP id fd25so1682120pfb.1
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 06:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677853790;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=51IZpA1dynVt+5lRDC2bcX9f9rBMfnCJq3VatCa8Z6k=;
 b=CReS4wOGDBN7SRTYiIHw/qWimjWe+WZ/YwchiUe3XGhfs2O6NhiVHQiqSlbsTqxJKb
 eBKeDkkV1zMl9PDtBa7SIJUKGbwIOLxk61eMOPcbpcVGPeaIpVo/ji3L2UYJThI1xb09
 QVaPE59WdYEKxOOu7mJJEk0ODF9Dz5VNjHrcTI56p2OHXF9pPUPAawHAo0rw9coRx8nU
 2+Lg33p+lcja1auKXj4AGEElQqqvQ7zwNR8e1f72OqgpCtXIuvRCQOEx2CVB3HX2//Ok
 QYQ5kQqCUfkNmSt1w6Etyv3uEgPPy8jXxzOMrhPSAuE/Sg0ti/43HINKgYuXj5QffZsU
 KLxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677853790;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=51IZpA1dynVt+5lRDC2bcX9f9rBMfnCJq3VatCa8Z6k=;
 b=ZmtdUYupUxPPjmrQ5hmBnfGOTn+ckzGs0qKQ2j+jZ8P8Fx96S7eE+ILF0F3Uq9ghI3
 ZiO60Ma+9m1YD6ls6HIl6qlIx7INY7agQ9f5nVx8kX9NZ1rWhDarDDf89JNoUZwe6j5f
 kO9fadrTBb9yRpsx5A/ma6QeH9XSO497D08QDVM3bFtJ+Ef+7myxTPHpD5ZcWzJaQdEo
 86nS7F3XbT8mHDGqwtBlni8kXZPGrpTk12aX6V5iHQKnlN9ELn27hsjN8orhVgT333DC
 3fTK6egCdOAmrzCG3l2POmhWn/br4grgIhx7dkJI/Tw14jqfGnMSF2EOHsSVCOCZdeVm
 bpgA==
X-Gm-Message-State: AO0yUKXz3ufeFMKd8bzOfrZVkFz0A9vDOtjeWtySTlzM63W5f2PnR1Bs
 hF3ZTOplNxGXTBtpmU4ku4h4eMV0qhy6j88GCDq08A==
X-Google-Smtp-Source: AK7set+IetcMBbsECUkMp7x1mv/NKWUivoE65xMtCYV7ViHYh/Z6RrEMSGHZrk00hK0WpqUsSoAa+80mLuWxvZumhO4=
X-Received: by 2002:a63:7d03:0:b0:503:4a2c:5f0 with SMTP id
 y3-20020a637d03000000b005034a2c05f0mr522760pgc.9.1677853789825; Fri, 03 Mar
 2023 06:29:49 -0800 (PST)
MIME-Version: 1.0
References: <20230227230122.816702-1-richard.henderson@linaro.org>
 <a5b66aee-0c97-96f7-81ca-44fac1289733@linaro.org>
In-Reply-To: <a5b66aee-0c97-96f7-81ca-44fac1289733@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 14:29:38 +0000
Message-ID: <CAFEAcA-fMVab0e0CG_uep49+JPZ=tfJgJXJmbtJeepGBSLsLhA@mail.gmail.com>
Subject: Re: [PATCH for-8.0 v4 00/21] target/arm: Implement FEAT_RME
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x436.google.com
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

On Mon, 27 Feb 2023 at 23:10, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Gah!  I didn't mean to tag this one with for-8.0.

Ah; I was wondering :-)

-- PMM

