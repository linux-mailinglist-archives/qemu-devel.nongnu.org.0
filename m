Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19CFCE445
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Apr 2019 16:08:13 +0200 (CEST)
Received: from localhost ([127.0.0.1]:58116 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hL6x2-0003RB-98
	for lists+qemu-devel@lfdr.de; Mon, 29 Apr 2019 10:08:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39586)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hL6w2-00039k-CG
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 10:07:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hL6w0-0003Ru-Bi
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 10:07:10 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:39886)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hL6vy-0003Nd-R5
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 10:07:07 -0400
Received: by mail-ot1-x343.google.com with SMTP id o39so8702442ota.6
	for <qemu-devel@nongnu.org>; Mon, 29 Apr 2019 07:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=mRVUcmLKkBgEhGP7RGgRcEUeoSuw53AOfhH7wwH1/uY=;
	b=l6G461sJJweSJGvBVy83wdPj/9znNGRKnPuDnHCVcVgJzNtcngfnv0tGvVQ5tr36MA
	rUTRS3nnp6MLqroKgsAm946g/JozKUMipxsvVQiJMsNoGeE6PZ9PuPC0oAxNm/8b5D3I
	g0yHPP7R+/FLxzYkQbC0tKPsfpX1eZcrymgW2pS5wga9WBbSq2CfUKeUVZ+FeY/H+54J
	j5ARWh4f0gQsFaMeZgp8X593nHk7e3388uz1Q99kDxv64xt3IduYr34W3IBk/shMMRYz
	BfmwLrdY+OeSV7g8U+8l27XJ9iFGyoglv1cxJpdNT1nZCyvRCxn1IE92q8x2LOxJUiaZ
	huLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=mRVUcmLKkBgEhGP7RGgRcEUeoSuw53AOfhH7wwH1/uY=;
	b=Q+O2iuyGfl4HvU9jTQ1akKF1v59na0q+EUQKSgvPcqO1ho8TF16IokJ9Fv0XKqssG7
	SBhtNrJPl6PQ7h0altYUOlRHkqMDFaxFwjUr5c6pL2kuFGOsKGxGgasnnzBAIeJ1+h9V
	XS5l0NHH4LRq68aQ6h3trdUSdIaZD3M04QONBCMaB7WXheIHRS55KWMHtJScF0rXTKlP
	/yOhMCltzn/RsWqQrtcakHEieYwhPXACRhBC5Krof434ctr67L0qQiYmO0cde58hCPvt
	QDq9R5RjnfX89MPSRFq/mDI8zy7qToycn2/T7NMgLJf6aaTT5NS+tCH/Qu1IB03cGBEG
	fY5w==
X-Gm-Message-State: APjAAAXfWPP1taQjq+LgusYpXFFw93Hc5rAmGUCi5GtRpLAqUWwfpm9e
	VSydp4HPgaI6SfQ85HKoE27TNYcEttxscO//NiPOIA==
X-Google-Smtp-Source: APXvYqy0iPdYd7mwrais5EsC7fdfVJ1gsPoIQni9b4q3BWyMyYQTTVYSsKxmn9dNgfTNWOaMh9v717YpeTg/rCYftQo=
X-Received: by 2002:a9d:360b:: with SMTP id w11mr12169382otb.238.1556546825105;
	Mon, 29 Apr 2019 07:07:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190328230404.12909-1-richard.henderson@linaro.org>
	<20190328230404.12909-10-richard.henderson@linaro.org>
In-Reply-To: <20190328230404.12909-10-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Apr 2019 15:06:54 +0100
Message-ID: <CAFEAcA8hSByAHAiX8j2LzucCsaMEBM=_T3MJh7-D-QVw-Y6K4Q@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-devel] [PATCH for-4.1 v2 09/36] target/arm: Use env_cpu,
 env_archcpu
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 28 Mar 2019 at 23:51, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Combined uses of CPU(arm_env_get_cpu()) were failures to use
> the more proper, ENV_GET_CPU macro, now replaced by env_cpu.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

(though I imagine that this will need updating when the
M-profile fp patchset hits master.)

thanks
-- PMM

