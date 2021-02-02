Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A553A30C30D
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 16:09:15 +0100 (CET)
Received: from localhost ([::1]:37448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6xIo-0001cf-L0
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 10:09:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6x07-0001GD-2I
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:49:55 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:39534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6x05-0004K3-EI
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:49:54 -0500
Received: by mail-ed1-x530.google.com with SMTP id y8so8074486ede.6
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 06:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KSxTj45jFiT/wwZAfcR9pKH7i3/kT4hic4ubKy3HodA=;
 b=Xgp6U1ed8uEIHRDy7JDlM/NOlOsB2iG0+K44FnzamettoQRRtEy4kQcBE/Jv20FE0l
 qX5YeercEdf0seCWWLqGAMKtR9eeLvOQvWm5W3MD2tdURMdbsnF/ij74CIt59+a1i1iI
 5rU+xNt3oH/s8IHqhdr/dhTeaPtAXCELZmWCaYnbsfXjTKh4/jTU6xAUVU05fYK4O/LW
 fYCgPQiV7RVhT4imoDtaB81S/BM7Czi/kkQ8ZZk3Go1BxFckDa+VkfNKRenK8L2zF/zz
 2bT6lsWkgPMCP5nTsVfR1qGdFRISsXjnsZwqumWBWNPFXjNhQGQf4AWnobTpw3kyi9+E
 I1bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KSxTj45jFiT/wwZAfcR9pKH7i3/kT4hic4ubKy3HodA=;
 b=Gh8KmKjRkCEZuzeTnzWMYYA9QJV+b4ZD7yzsiKvzVRTKYzdMpsLCw99+9U5TI8etr0
 BnbGUwEGT+KPq3ZE8TuMizu/INhj3ByfyfcyO671eEpvSsWsOWtKfjqYFSyP8y131E0n
 Y4EMLwNHe+iMtGTOXvwwJiNrJa/Q8pWClq4Ivksl64G4eMlocg8vd7jmzUAdU6LgJ3YM
 AIg8we7lji81bHeL/wAxK2zXWeqaowZRD0WIPfsEjYAbz3SxgiXSr9fy99gi4sfbdMbo
 JHXVvSydOC/YI29ZD6VvFSJlzt4mXqeTsAP32GlDGTamTUBWIP2k+HxIRuFgbPu3CBD5
 Pj5A==
X-Gm-Message-State: AOAM533t245k43je2aBfCgMvLFozN+9Cfx/ieEeQMsUbIHGXh9WkvpVZ
 TQ7Y77kwzqyi71nbDycgPjkDpfH4VMw0R2TCnECTKw==
X-Google-Smtp-Source: ABdhPJwA28uLLCcFJ6wBOPprqJGRdvkZC7YWMP2Sg3YS7M7WxsGirQZX9ls4hLp8FVYf4mYnrzbEzNNYcs80y8/gmJ4=
X-Received: by 2002:a05:6402:3514:: with SMTP id
 b20mr23431025edd.100.1612277387137; 
 Tue, 02 Feb 2021 06:49:47 -0800 (PST)
MIME-Version: 1.0
References: <20210128224141.638790-1-richard.henderson@linaro.org>
 <20210128224141.638790-24-richard.henderson@linaro.org>
In-Reply-To: <20210128224141.638790-24-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Feb 2021 14:49:36 +0000
Message-ID: <CAFEAcA8EnGQz-2dq4MTYhTdmzhWFo=h8ZvQBVKpwqfPon99cBg@mail.gmail.com>
Subject: Re: [PATCH v4 23/23] tests/tcg/aarch64: Add mte smoke tests
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 28 Jan 2021 at 22:42, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

