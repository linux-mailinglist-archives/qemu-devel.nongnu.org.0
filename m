Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C376B5FB7C8
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 17:54:27 +0200 (CEST)
Received: from localhost ([::1]:48634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiHaM-0003Y4-24
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 11:54:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oiHSP-0008R8-Pt
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 11:46:21 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:44969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oiHSN-0005dU-0z
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 11:46:13 -0400
Received: by mail-pl1-x629.google.com with SMTP id x6so13558018pll.11
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 08:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rlTXHFhe0HKoNEa5fPIFMDAeUvr6Q820R5cRXfzpG6Q=;
 b=VwILFHeo+EMz1mW/rR9QnsvWyuHMcqHwUFuwU4lB2GhsPHbAmXOfUxjiqGU4Vo8d+p
 WlLwbDC97dMCHzs7PB6/zFVaFaTO7hKpa+XEzLeCGnPfjuxokSejcu+G7rpO3NpRZNtu
 Gf/kJWLvxS0Hmv6po8NotJM2l/XyarIj6upNtlKetSVht7NRrcymyEgLVSNyEH3Iut+D
 IREi03xDEzbSzoNwpU76bBRIK51/rHZfGn1GCc/CKG2uRsLfxpwnRd0lPdSP/V028ROX
 tAIPBpaGZknVig1+FpNTkAD36SOIU6T14KrCcdUhVveZ6A8zJDIz77JmmjsIM4nraYwB
 6Tew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rlTXHFhe0HKoNEa5fPIFMDAeUvr6Q820R5cRXfzpG6Q=;
 b=oi7Wbefvj10kZfq5rkqyP9tq3Ss6W32cY4uhYDtXBmTwnWlMDgnfMAtnYwi2DVfW+5
 0C3wQ4hEEQLDV8E1m1fMDFM/itU2qtAK4Wfw7aPlyBH79Ff4pWeFqprjU//0wxdSGeOI
 s2WgH0MrjCFvL7LgRhO2jXGLUjULqOTZPu0zSCmiljB29dGzuKUS33578EYRJhzDtrpF
 6Z1gcqDzp8dk8YdPGFrRXPBwotJfH0IYmlXwTX4A3ilFuhxN9+utCI+sypMRhye/WGV+
 4TRBbTA9BJx9k6wsJ+jFZnENU8fUJvBcagcSuiZDMJDpLXfavvamVmxnCy3xlprW9tAn
 fgzA==
X-Gm-Message-State: ACrzQf09cEUHEjyME64NvqKJj4gDdtUpFz62/nA8Chz+u3b6aYh44XWH
 JZ1tfI+F1Mw8VyQyj01BkUxzGMmkScnSOZU3BJSssQ==
X-Google-Smtp-Source: AMsMyM61cCjneqZQAFxHWbkMdOKyOoi/2Q648R5lt6yN0cWMNdtDceoNhBPBiBvclaklCXMGy4/u7j5R93Ob8AenNME=
X-Received: by 2002:a17:902:aa8b:b0:178:8f1d:6936 with SMTP id
 d11-20020a170902aa8b00b001788f1d6936mr25088243plr.168.1665503169346; Tue, 11
 Oct 2022 08:46:09 -0700 (PDT)
MIME-Version: 1.0
References: <20221010222944.3923556-1-ira.weiny@intel.com>
 <20221010222944.3923556-2-ira.weiny@intel.com>
 <CAFEAcA9yVKWCZ-PhCbHqpaEW7Tgtqoo=wSQLy6=U5yfq2uVfPA@mail.gmail.com>
 <05ed1f6a-0771-798c-408b-272fb57b4582@linaro.org>
In-Reply-To: <05ed1f6a-0771-798c-408b-272fb57b4582@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Oct 2022 16:45:57 +0100
Message-ID: <CAFEAcA-M_4Srp2=9OwG81DGCxo08fJRnxBY6+NEUn6j1idiB7Q@mail.gmail.com>
Subject: Re: [RFC PATCH 1/6] qemu/bswap: Add const_le64()
To: Richard Henderson <richard.henderson@linaro.org>
Cc: ira.weiny@intel.com, Michael Tsirkin <mst@redhat.com>,
 Ben Widawsky <bwidawsk@kernel.org>, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, qemu-devel@nongnu.org, 
 linux-cxl@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x629.google.com
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

On Tue, 11 Oct 2022 at 16:22, Richard Henderson
<richard.henderson@linaro.org> wrote:
> On 10/11/22 02:48, Peter Maydell wrote:
> > This is kind of a weird API, because:
> >   * it only exists for little-endian, not big-endian
> >   * we use it in exactly two files (linux-user/elfload.c and
> >     hw/input/virtio-input-hid.c)
> >
> > which leaves me wondering if there's a better way of doing
> > it that I'm missing. But maybe it's just that we never filled
> > out the missing bits of the API surface because we haven't
> > needed them yet. Richard ?
>
> It's piecemeal because, as you note, very few places require a version of byte swapping
> that must be applicable to static data.  I certainly don't want to completely fill this
> out and have most of it remain unused.

Makes sense. In that case, other than ordering the definitions
64-32-16,

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

