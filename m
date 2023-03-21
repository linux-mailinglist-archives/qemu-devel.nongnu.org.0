Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 168C46C3813
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 18:20:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pefeS-0005yJ-3N; Tue, 21 Mar 2023 13:20:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pefeP-0005y8-Ma
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 13:19:57 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pefeO-00048F-68
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 13:19:57 -0400
Received: by mail-pf1-x435.google.com with SMTP id u38so4679497pfg.10
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 10:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679419194;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9Z8nUybaxsdI3Cum3ag4w0ujCfxe+YEwKcSi6g1PSf8=;
 b=lKE5TKBiDY7Dimc6mvTqeNg0uBlwYZM2wiltPH0c3r5trb6f6V8wVvkNDXwocC5b+I
 eroJGtGaxcBmRziMJntPVoW+sPWCWuH7KX8Ofo18IczWCogo3Rbau3je3W8cYlhIw29j
 /t5KyFikoXAVBF5Wj1mNht5qh+Vdv9/JjRl9y2VUcFqDf1iDyoTnkZ/qoW1LIiSo0wYq
 rodEfEnCZrY0jQaubDKGmu9Q+w/jSx3F25rtUNPE+QAhPuzz4pb5jHq4zawAh+hTEtbK
 sNYiXrmZWAVqR7BLl2B5NdOvEoMpcZz9+C+fVg+JtfqKQBpWmVgSpAwaRHL9GhE5d3Hj
 Prkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679419194;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9Z8nUybaxsdI3Cum3ag4w0ujCfxe+YEwKcSi6g1PSf8=;
 b=AruECQ8cZYZQGALeBKNup1KSGG9LPOQRmPSwM7Mf6ajRenGq22LNwxSJUacHlzkRqi
 yBgr9+5wqTO+6WQHpUTcPrBU9kCMEKT79/IODok0yLft1hfwSgOdUEHvt74tBdkdW4e7
 0QHgpo7p+bbx3utt+eE8UtCbJWzd0PhOH7SZJNESMs8f6jXkbG1K+IS/VjAKhBhpnbYx
 Mjx3Wxhb0srKe0DrOS3MK5qthDME3WlbrSGsfA/Ji7vz+DFOx2Evncy1naRvYUN75Sbl
 GhKeIP657ZanDy2nqdbyaehVJhiJkFL59W4PWq6LgR7VuV0YwX3mTZ2SgvOn7c2Rmz4j
 EMGQ==
X-Gm-Message-State: AO0yUKXIaT6GqSz5ad4yFCWM0r4uWOMZB0d3rVVcaEY3qwxzO8CmpfsT
 I798DOMlVNCn2Sfj0GUHmVLHmNwjW5Z6PMeQs7xzLQ==
X-Google-Smtp-Source: AK7set+5BZqx4qToq30hPTGczW2TQEpXaG0XMi7qCni9Iwkat/v8qd4Rx5IjipcspQqj7jJrr2TeC1nB+15RcTnYecI=
X-Received: by 2002:a65:56c6:0:b0:50c:bd0:eb8c with SMTP id
 w6-20020a6556c6000000b0050c0bd0eb8cmr886757pgs.6.1679419194454; Tue, 21 Mar
 2023 10:19:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230321141206.751719-1-quic_mliebel@quicinc.com>
 <20230321141206.751719-3-quic_mliebel@quicinc.com>
In-Reply-To: <20230321141206.751719-3-quic_mliebel@quicinc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Mar 2023 17:19:43 +0000
Message-ID: <CAFEAcA8mt=iisDOMz716FuG-Nu2WUWeEskyk6QLL8tsntc6i7g@mail.gmail.com>
Subject: Re: [PATCH 2/2] Add test for storing .new vector
To: Marco Liebel <quic_mliebel@quicinc.com>
Cc: qemu-devel@nongnu.org, Taylor Simpson <tsimpson@quicinc.com>, 
 Matheus Bernardino <quic_mathbern@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x435.google.com
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

On Tue, 21 Mar 2023 at 14:13, Marco Liebel <quic_mliebel@quicinc.com> wrote:
>
> Hexagon toolchain version 16.0.0 fixes a bug where the ecoding of
> storing a .new vector was incorrect. This resulted in an incorrect
> valued being stored. The test checks that the correct value is used.

So is this a compiler/assembler bug? Do we need to have tests
relating to those in QEMU's test suite ?

thanks
-- PMM

