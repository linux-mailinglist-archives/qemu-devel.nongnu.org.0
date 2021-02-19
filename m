Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3939031F7A9
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 11:54:08 +0100 (CET)
Received: from localhost ([::1]:49094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD3QF-00055w-8O
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 05:54:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD3Om-0004F1-Tq
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 05:52:38 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:34294)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD3Oj-0004HN-7p
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 05:52:36 -0500
Received: by mail-ed1-x52e.google.com with SMTP id j9so9130836edp.1
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 02:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=z1qO9I00sS43ctEJU/jUF0nu6Bmc5j6HTlLASEQJo94=;
 b=lStgWbGQOkYcqHUVWQ9Cu2M90q8hhz2VbSgEpkubZLY4NxkNQGV7yt18WrR30FS0ta
 10qJ7v8bTKsEYlXhZXq75H5/nPfcNyX2GrZ5tus/hx81uT389wewcbs6fzZpNl7kIluU
 8kOufjJzJrg3UxwuJa65T/iNGi2SQI6ICvKRTV+yB7QcJ9WMcKTTynUYjSfh5NDV5mzy
 yRREUdeRy1WGV4d2vui45FlB+sXkUnrQ7bWRMeKkLwW/oEd+7BRzCrbFAtpY4bEPhK4s
 AU7Hj5ia0Wo7lvV9e9SWgAjaj6eT2pTnlcARlHIWWisBZcQXEPiA3Xxxo5OfnNdjgFe+
 view==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z1qO9I00sS43ctEJU/jUF0nu6Bmc5j6HTlLASEQJo94=;
 b=bBvj00jUHU5G9HEQVENimOs8Lxhx54IqLAC9QW8lsY4yvn+mZsSy2YnQ9nT6in3wah
 2nPjQQQmUcRxLoNtGG62XXFDIrM0Jj9Dbeu5p5x8fh14h80vFzdqHJidL9fZMvZrpYuF
 0fL89gCorFVIGLQpvM0O5mF+HeynC7xh/VKFzUqGe6IFetH3QKRfY/3SBLCnUX84vu8A
 88oSZUGIMm4qop2mgTEWD0sDKv0wN18ttLLSkn1JAb1OWmpJ+jBMvl1qjMNnRz1CL8Ns
 /urQro6MALJre53W7ePJes5mosA9JBdOE5O+G6fbfnimc/xnxT1E94bze4n8rXVkyE1M
 TouQ==
X-Gm-Message-State: AOAM53248BSAQ5CdaEBMZ9zHX50QDfQPsWXjhCJq14ctkOb5QOnsrSpl
 WHVQS51ZirPXb6RAonaziRrDl6VoQ8RxK4cdE8V77Q==
X-Google-Smtp-Source: ABdhPJzaGZE2TsWx+K9aIi4AEITnxEzD2Jy+ZsVk+NVDyGb14KPm/aHnAlj667vLSx0E2autTIq8vK7ERRui6NwS5Yc=
X-Received: by 2002:a05:6402:5107:: with SMTP id
 m7mr8556448edd.52.1613731951429; 
 Fri, 19 Feb 2021 02:52:31 -0800 (PST)
MIME-Version: 1.0
References: <20210218162944.1756160-1-richard.henderson@linaro.org>
In-Reply-To: <20210218162944.1756160-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Feb 2021 10:52:20 +0000
Message-ID: <CAFEAcA_G_d8VF1U=WdBvFmUQCR3YFzQu1WqUqHFQRKsF2q6yeg@mail.gmail.com>
Subject: Re: [PULL v2 00/35] hexagon initial commit
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Taylor Simpson <tsimpson@quicinc.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 18 Feb 2021 at 16:29, Richard Henderson
<richard.henderson@linaro.org> wrote:
> ----------------------------------------------------------------
> Initial commit for the Qualcomm Hexagon processor.
>
> ----------------------------------------------------------------

Hi; Coverity Scan reports a pile of new issues in the Hexagon
code; could one of you go through them and confirm whether they
are either false positives or else provide fixes for them, please?

thanks
-- PMM

