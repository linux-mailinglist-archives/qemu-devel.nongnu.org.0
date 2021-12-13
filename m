Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5CA4472FCC
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 15:52:27 +0100 (CET)
Received: from localhost ([::1]:59602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwmgk-00058w-9n
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 09:52:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mwmeE-00039X-TW
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 09:49:50 -0500
Received: from [2a00:1450:4864:20::435] (port=40617
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mwmeD-0000UK-1s
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 09:49:50 -0500
Received: by mail-wr1-x435.google.com with SMTP id t9so27473157wrx.7
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 06:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=h3qhblrk5zLVhJmecojGx3sVFdIygEUK64KjD2dnOEo=;
 b=Nu6wNrUsKIM449b2IbTfSkhFs10UHI676VbDTj+OulWe4+CpdLgvH/4Giu1SeZU8UR
 3GsG33lPgK43rVtJtdxs9T7wmPsYT/bw5qKJOPre87+ZAaTOklB+hHP2OKLAxZckuvx2
 fi+ivk7Z+/8K5o8+FL776amNNu5oXE1IfnpyniQWr1OLb8dCmF6RZ2L0XvA9sivgQbr2
 KwMZL7ObCIEov6HCsT8umRTZrRLZqzqnx+AlYRB3TM0qGxCw8swJB9oKgmS64H/C6yXt
 tWyv/zp6hf7n2UUnk1gyra7pn4YbpKyzm5UF4JuNyKOMSn0BsJa7SFiVnt2QtoymUUtI
 pobA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=h3qhblrk5zLVhJmecojGx3sVFdIygEUK64KjD2dnOEo=;
 b=4aLK4a3XB/V9KY33bku23MdJ2KuDDuEaf0DAt86TfpShDVSswo6ZYjZ2OMueubOTyo
 cJypMZ4AO0w2Aw5v1fQeyfPBaz7tj5m3dZUwdeUvNVA4V3Xcg7qaZn/0YnSrASBOJhIy
 uFhaPVo0eBaa885BTBGDF31lAEixDNfaTGNZzyx3SXkgHUFXLxxKfzPkugse7EwFYaPs
 wTw3Zo19nkYwwIt1ovU2NrwXS8EfxoIPA6FDWwolsdWX6ecnH/oVKivF27cxcviLoTnS
 qoC4iwaK8ES/fOIXHGsliNYmv/KcU1M3MI61bq9CcjU92migpOq2Ct+VIXUTw2fBlFQ4
 4rTA==
X-Gm-Message-State: AOAM531vkwBgut2rvHkfAW6Ue+EgcKxp426/cH54uyqIkvm2BDbY1/om
 f//MBta4h2eB0m6GEnapyOeojg==
X-Google-Smtp-Source: ABdhPJyBg09JLRP29FLY6nn56gpyG9F0mnKM8PjqmbLQAsOQV9xhzIn1BNVvrCTbKipiAgNN5Ctkgw==
X-Received: by 2002:adf:dbcb:: with SMTP id e11mr31638431wrj.575.1639406987622; 
 Mon, 13 Dec 2021 06:49:47 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y6sm12226329wrh.18.2021.12.13.06.49.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 06:49:46 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 198551FF96;
 Mon, 13 Dec 2021 14:49:46 +0000 (GMT)
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-20-peter.maydell@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 19/26] hw/intc/arm_gicv3_its: Don't use data if reading
 command failed
Date: Mon, 13 Dec 2021 14:49:40 +0000
In-reply-to: <20211211191135.1764649-20-peter.maydell@linaro.org>
Message-ID: <87mtl4k19x.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> In process_cmdq(), we read 64 bits of the command packet, which
> contain the command identifier, which we then switch() on to dispatch
> to an appropriate sub-function.  However, if address_space_ldq_le()
> reports a memory transaction failure, we still read the command
> identifier out of the data and switch() on it.  Restructure the code
> so that we stop immediately (stalling the command queue) in this
> case.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

