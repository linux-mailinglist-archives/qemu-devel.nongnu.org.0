Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AEDEE5DE
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Apr 2019 17:13:44 +0200 (CEST)
Received: from localhost ([127.0.0.1]:59036 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hL7yR-0001OW-Ib
	for lists+qemu-devel@lfdr.de; Mon, 29 Apr 2019 11:13:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56220)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hL7xJ-0000uN-IX
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 11:12:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hL7xI-0002ha-J6
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 11:12:33 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:42183)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hL7xI-0002cF-E4
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 11:12:32 -0400
Received: by mail-ot1-x342.google.com with SMTP id f23so8895982otl.9
	for <qemu-devel@nongnu.org>; Mon, 29 Apr 2019 08:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=GEwlfRSjRRkr2AjxP0uQtHdyBXB+sJ3xZrCovizd7N8=;
	b=V9pEIJZ6S24E1rIqbC2GKXSzSk5P+vveuFov+B8huflobZrAEbYB5B4k3NhJJ6B/EF
	O20hoxcl0fX++w56YoRfvvMUTVCqtvzSZFtVrkVs642V3q3axEHUXoHq2uZOooNTAXgW
	kv5UY2ClaNL6rebDfaJuuvZ//QO1Og/n49GZGx5ewaP93WEUnt4/sWkMy2njBSeV9FW6
	zTzYbq3B4YypPYAi0yN8xhsHlaTi6geloV+1M0AA5AtRX6D1Piafza2sbuXcDNP9n1+H
	uak0iI8Fo6bSYgzti2so/hP9tOgqcJ3jZAeEeXPdHmASPhJ9pjOLZEyj70xpdBwISZVy
	kVDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=GEwlfRSjRRkr2AjxP0uQtHdyBXB+sJ3xZrCovizd7N8=;
	b=GcpDBTVbGPFrjfUOrsCp61Bz2dmasMybSROo+9e6oLIuKy/Ysm0QdL+qmAqlft6fNt
	jBX7HCpsYYDuy/RJlVHctMQRONoV45gzD/wPsYcLiRP0eofIyl6Al93rWeRZOz3g1nIH
	Ae21Wkr/qxE5ZC5WjbLtKnN3C8ZgvM4tAjryTFKqB2cDyoih2cIeYCSOrOST14X/SRbj
	SuKkFcDEslTQk6IB2rPsiZPpceLk6UyW3nIFL9wy43jd6MHtaMYk93iyGeBXSga1yaAX
	uQZ+XdGezwx9p52Ulm9dZYYe39wp9DMsU1JsgawrAaAoVgO0VV2E9b4tTKyWVBDsgdFD
	l3iQ==
X-Gm-Message-State: APjAAAXb2MGF0po1FxPiusoaGN7d+lShI9Ga1YKeE65F0tNYHcp/22e0
	TsaGpeRh+0nFAO+dNaL6mqS2PDINbMVbD1u4v7L4QCyS9rI=
X-Google-Smtp-Source: APXvYqyTvzfckyuG6qK3F1PEViuTmrfAtTs5hsL/tn/bKEvbXcpc8v7nTaxg8RM8RdlOFSjrnBJv7oImGLJ/ojFM1/4=
X-Received: by 2002:a9d:360b:: with SMTP id w11mr12413208otb.238.1556550751288;
	Mon, 29 Apr 2019 08:12:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190328230404.12909-1-richard.henderson@linaro.org>
	<155381739615.24.12240723664123883584@76452e4e88f2>
In-Reply-To: <155381739615.24.12240723664123883584@76452e4e88f2>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Apr 2019 16:12:20 +0100
Message-ID: <CAFEAcA9cyZAHj9DRgq6dXsFXGNLKcEOXCndLYTpf9b+EGHnr0g@mail.gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-devel] [PATCH for-4.1 v2 00/36] tcg: Move the softmmu tlb
 to CPUNegativeOffsetState
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>,
	Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 29 Mar 2019 at 00:44, <no-reply@patchew.org> wrote:
>
> Patchew URL: https://patchew.org/QEMU/20190328230404.12909-1-richard.henderson@linaro.org/
>
>
>
> Hi,
>
> This series seems to have some coding style problems. See output below for
> more information:

Richard -- at least some of these checkpatch nits look like
they're real rather than false positives: could you have a look
through them and fold in fixes where appropriate?

thanks
-- PMM

