Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 541B7518A9D
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 19:01:21 +0200 (CEST)
Received: from localhost ([::1]:41084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlvtn-0000GG-BA
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 13:01:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nlvr4-0006Bm-Te
 for qemu-devel@nongnu.org; Tue, 03 May 2022 12:58:30 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d]:44819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nlvr3-0008CK-En
 for qemu-devel@nongnu.org; Tue, 03 May 2022 12:58:30 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-2f7d621d1caso186204877b3.11
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 09:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Pvcki9gbSp7dgo7wEfYEoiTaZ8GHqrRi7fV1yBSPdOs=;
 b=zgnLlRNzSwjNT+8GfyRw0tQCXRP9SRWAfXI/rFPS7kipMtyj41NzLIXfyVVGJ+QZfP
 f6DbwjtqXUVFvba4DN+XpVmpl14Aczn6hMkV8GQEqKxgxQOnZvNRVl7pgdfnRD6ZBXOi
 /FyfH3G+3CQ0RcRq2qjuQRL/Hy5Lq/jpvv9EpaOeXTC7x6MJrU0DSVwxj/Yy4+fSLTgg
 b+daVlBnCelhJmluOH0cIcgUaGlnqDiMPX5eT/1Bw1/7suUeqZtI7AWr1od7Vbbb+nt4
 qT2iP+RTZNFlr8XAY6nVmx30mnus/BfcaUtxI03K6CtrVV/j8C+GoetAqbUmWSWDYMy0
 PbbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Pvcki9gbSp7dgo7wEfYEoiTaZ8GHqrRi7fV1yBSPdOs=;
 b=AotaN+2W4hcyCJyrntZoVoDDAvVVZYqVKp5xEb7rQAMTIcezcmhU9GlbwYSlTHCsfI
 wpuV750yDIIITidnaNBQrGCha3TEE8h3UrUHOJej8o2tRm1bYLA1gkDQRipc5xzZoOjw
 M6CWuyy314Fvjm0U1+FN1/x7AoXAgk3w8bjxED3ylHAe2Msv2NdJVgd5WA8Mv4Ixl/KP
 j6G98hnMlYmVqlc/fy8QStKGrFBlO72EFMgVm3mWJkP4KZd/C9w5p6uez6SbPVhedjHP
 8UESkizKFNbdYHRV3HfQzJvWKpHdDwtDR11iERJjW1dReLZO2c1mCH/ZvEOAzmaIJAWW
 EYpg==
X-Gm-Message-State: AOAM5319xXtUhlSU/f+5UTMjHJ3Iu8OOtT1cargD5TQjXOFLPLCWYYDe
 gQ3d8IBNBoftsx2cJbjm4NW84a0DqS7HBuO4HTds2Rf/Fro=
X-Google-Smtp-Source: ABdhPJzMgyOqenK3OVyhFKplFG5WHuwcoYiqxSaeImGMbUA4cJrkw+CLwLjZd+vMKvy3RDsDyBOlNGOgv8ceR5YH9RI=
X-Received: by 2002:a81:ac57:0:b0:2f1:99ec:91a2 with SMTP id
 z23-20020a81ac57000000b002f199ec91a2mr16004659ywj.329.1651597108225; Tue, 03
 May 2022 09:58:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220501055028.646596-1-richard.henderson@linaro.org>
 <20220501055028.646596-35-richard.henderson@linaro.org>
In-Reply-To: <20220501055028.646596-35-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 May 2022 17:58:17 +0100
Message-ID: <CAFEAcA8T-v=Z=nJDUofSG+2wg+YcrQTFfBJOVgs14PApxTEvLA@mail.gmail.com>
Subject: Re: [PATCH v4 34/45] target/arm: Add minimal RAS registers
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
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

On Sun, 1 May 2022 at 08:15, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Add only the system registers required to implement zero error
> records.  This means we need to save state for ERRSELR, but all
> values are out of range, so none of the indexed error record
> registers need be implemented.
>
> Add the EL2 registers required for injecting virtual SError.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

