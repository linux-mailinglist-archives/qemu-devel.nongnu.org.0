Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A99BE2B0CB4
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 19:34:31 +0100 (CET)
Received: from localhost ([::1]:57256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdHQU-0005a8-N7
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 13:34:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kdHOo-0004Et-Pt
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 13:32:47 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:40168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kdHOn-0004Oi-7r
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 13:32:46 -0500
Received: by mail-wm1-x333.google.com with SMTP id a3so6357685wmb.5
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 10:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=nU/8aNKRJlsYAFsByIAJ3lNPZemTKSCpEava/Rw4pC4=;
 b=gEyTGRRvTKWtOxsQI5zELoP9eTeTDeCqGDRQbEDloOXYWbU6BCLsM7O/62f6rJPG8T
 quXUtc1TiypjaC+rM70kaHWn9i5Dzv4q0XkY4c9wQ9xfMuZomOQUG+SXeVCQ/OnwQbE6
 cDeiZlT8ipqTaxJzcya1mRM2lrLGP9YKuAj7aM7Zc2JI4vydMxcH88cs+waoh9dcNLwo
 pEIA09FhFIWw3qfoAXgoP/2T3/nncBj3V5e0kOJ1IVtt7qr4wMAHcByHwZPHsvvL7XI4
 oav3H8V2+Sp40m3WTZWCyrlKB4s6tmZY9ZqDV5ocCrvbFj2slUHXA2Z2pphZoHY/gss3
 RreQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=nU/8aNKRJlsYAFsByIAJ3lNPZemTKSCpEava/Rw4pC4=;
 b=SAfUAxp1vxKapXulQLQXOMj0IB3Dpj3k0wiNpkuG+oki25bcG0YtRap8TOiAAAes9e
 ssaeL1FEilsq1HOPOUyYTyaKDCYsjZUBbjsH5uZKq8gFnClMwaVphxn34KWS8nSfJjZm
 OeopwH+dOMFC9DS582kmvXBnl9QRBBreZaYzq8QtXSK3gcsZxJVxwyFgwP2TZMTKCv1H
 DOpnbx2zuzJqKIEQoJjN8oJi2+4L23Sobin53tbdaXhNjxHdxzJ+IVrk6QBI4V2a+cmj
 x70v5j5Hf3cq246fmXxj2hfwZ94rIL5cmSiLgF0Px44jxiGFpTee0y0PuoLdgP4MEZ9i
 qYgg==
X-Gm-Message-State: AOAM5338OC2ToCOGML4g/Jq+Bz9DIJHPKrXOK43ojNl17yepjvEKCZ6W
 6P4/v/knVLx+03RJcoIP7dZZ8w==
X-Google-Smtp-Source: ABdhPJylId3hQU1PbpG84s8MFR/uPRBfY4qpUODQL38IiUmKuVfyjPeg1h0GgFXhSYKVylxNR1azRA==
X-Received: by 2002:a1c:7418:: with SMTP id p24mr981345wmc.36.1605205963774;
 Thu, 12 Nov 2020 10:32:43 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u81sm8389950wmb.27.2020.11.12.10.32.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 10:32:42 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 042F51FF7E;
 Thu, 12 Nov 2020 18:32:42 +0000 (GMT)
References: <20201112144041.32278-1-peter.maydell@linaro.org>
 <20201112144041.32278-10-peter.maydell@linaro.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [for-5.2 9/9] docs/system/pr-manager.rst: Fix minor docs nits
In-reply-to: <20201112144041.32278-10-peter.maydell@linaro.org>
Date: Thu, 12 Nov 2020 18:32:42 +0000
Message-ID: <87k0uq5stx.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> Fix a couple of nits in pr-manager.rst:
>  * the title marker for the top level heading is overlength
>  * stray capital 'R' in the middle of a sentence
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

