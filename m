Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A3D3F2A52
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 12:53:35 +0200 (CEST)
Received: from localhost ([::1]:39894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mH29W-0001xt-I7
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 06:53:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mH27U-0001BP-Sd
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 06:51:28 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:36411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mH27P-0006pF-Du
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 06:51:28 -0400
Received: by mail-ej1-x632.google.com with SMTP id bt14so19385553ejb.3
 for <qemu-devel@nongnu.org>; Fri, 20 Aug 2021 03:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ziOUALe/OMTC2G+xaBCfz02nQDBuyw66GCfRoS9/KIU=;
 b=kKW68aca08vyP2lRW9ebRgXvvtAEnh4KZP4svIS/XnoMrET9Fi83P9O6LOhLa+DykX
 nqNFRFwGmaQ0PtHyQnSNnN6hFVVIwI6Ik+BSZiDZyfEC41AFHdu4UTBXUjw+b4tegRZI
 mljQQuXXm1+olAg4w9uqu7ceMwIwG1OnIMbBgY8tjwZcXM2yUjPqMY0KLn3WIBcZ6CNG
 jmVSx9e1TWcYsjJpUbDP9wdA04OSMykznK5KDWN0v2KI2K+hNcxeZX9d8YMF3KsdjL5d
 6MxBh+2l/GvNPsOwRkjs2P+o3TLQdhjqiaGKePAWgPpOoxDLay1yF60mw75HSG2AGZiJ
 IqDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ziOUALe/OMTC2G+xaBCfz02nQDBuyw66GCfRoS9/KIU=;
 b=ZFPW49u1JU4Ls8Y9DE7GFAoc9rHrdPdz7xZXPmdwqsWbraHTB5YgDUPeqVPFkI14h8
 H8Xi+rW+Z88/lWPkBu7LcV8X/VWaFIe2ob+oC3iCpFntic1xsMjx8l/9iRVXOgnljU0V
 btNItC8vDVR3H4GHPrzF6/cd38fxuio0rZaySKSkxmnA+/iiVeVg6drdSEePXScczzTU
 xdQtg/222SvRKTkgq1fYIQDrCjHNa4GSL7lRCQi/XplmMXsswoA7TSeeRPNxqLNAqHpr
 fPmERf9PTMYrDK4ujVx+GtQFP3mbLIocuiWjVdBdgPSrzpm4blorHSFbNYnvBBClZwDf
 VXoA==
X-Gm-Message-State: AOAM530mYs3mxLHxn1NDTk3imO/Qa1mk/xu/Rgcip1fn0yX/WoPkWfu5
 I7O/8pJAAyCaz73G2M4e9MzoG7o1L3yyTiMbaavZyA==
X-Google-Smtp-Source: ABdhPJxKhmJf/r8e0vubc5pE1wwjTizmO9ddNzAK0aV9YwcYucToP2nwbYEJKlj/zm1s9+HCRkuIer2G9ihPHnyU6og=
X-Received: by 2002:a17:906:c085:: with SMTP id
 f5mr21342792ejz.250.1629456681236; 
 Fri, 20 Aug 2021 03:51:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210818212912.396794-1-richard.henderson@linaro.org>
 <20210818212912.396794-5-richard.henderson@linaro.org>
In-Reply-To: <20210818212912.396794-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Aug 2021 11:50:35 +0100
Message-ID: <CAFEAcA8v_Rt7N0C49ff2Cvj8DW4Pp7U_cF76h5h9G8rB+vAeiQ@mail.gmail.com>
Subject: Re: [PATCH v3 04/14] tcg/arm: Support armv4t in tcg_out_goto and
 tcg_out_call
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 18 Aug 2021 at 22:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> ARMv4T has BX as its only interworking instruction.  In order
> to support testing of different architecture revisions with a
> qemu binary that may have been built for, say ARMv6T2, fill in
> the blank required to make calls to helpers in thumb mode.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

