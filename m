Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 724A3250338
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Aug 2020 18:41:31 +0200 (CEST)
Received: from localhost ([::1]:38046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAFXG-0004ww-HV
	for lists+qemu-devel@lfdr.de; Mon, 24 Aug 2020 12:41:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kAFWB-00041C-R8
 for qemu-devel@nongnu.org; Mon, 24 Aug 2020 12:40:23 -0400
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544]:46582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kAFWA-0007qn-E6
 for qemu-devel@nongnu.org; Mon, 24 Aug 2020 12:40:23 -0400
Received: by mail-ed1-x544.google.com with SMTP id k25so8626506edj.13
 for <qemu-devel@nongnu.org>; Mon, 24 Aug 2020 09:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lXhCOMMO86aujM29Ws2c7UaKdsmE01yGV+ahwpDBy1g=;
 b=GGwCBKVI1u8tdVYhhW8lo8H4K7Y9EvziWaZeQvEmq8/B+lPiztGX7UlSaW/tOEBKcN
 M44ENu15+BQ8iNPyCJck9oSXrU9FseTZR4XIgI/2H/pG8Pf6g3nQdv5sSWtyTVjyay/1
 Hb0qvq5tg7S24H2Mf2M9BUBcmhnaoLcKActtd2DiSBmz6NRmFO+NNlFnLvZnDZATWkxZ
 3pLxG8ScW6jswQV6eps+1tBO6I1HZF4ojzMsuSNFXhIEoEDBTNMHRWRFevV1fJWS3lh7
 3hYdvBh0RxkH1K/eFnNIssCzOIVlkMRmNXJs+zFDaYR9ZnFs077EfMicPID5cnY6XSaY
 T99g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lXhCOMMO86aujM29Ws2c7UaKdsmE01yGV+ahwpDBy1g=;
 b=DXLZWSvtog2gyv4sF+qFkR7Oq7SEVOofH7OgPdpI9groN0eIqrcvfJwwPZ/AbMQvXI
 b+pE4TKNyXjZ5IMAocImXBJmlwgu1epmDVSvTz2Xkd/Qo4+WMdikoCwalz2Uz2n3r3ec
 1QqWS3f8rqB9pEugSrvdpj3IGxb6NZNVKRVndLTUAgF9fzOKkneMjnoxa19HsCfIQNYg
 ta3uFJ5bM5yK7SWdagyo64Ouksjp/MtnGRH8nN78PDzaEX9DZJVgCfLt9qhlQsc3WWTp
 momUxlbSruY/kqFR4RlvM64LuPBOfyLf4WhpJyVEnHm+m8TaxZnI5EFzyTTg828bx+xV
 YeuQ==
X-Gm-Message-State: AOAM530Ox7hV98i/MpFG4JcaQTZKXZARUtZsawpY4PQnlUesNRzYbCIL
 rroE7TCg6VtbxbqXL093rDpL/5L31u9LNGQbP7ZoOQ==
X-Google-Smtp-Source: ABdhPJxFFY6eHrcb2P66q0sc0rZ/QGzuxHeaXpsmQ+NBk9zeJ1owWzDpZfFr9Q3Ma44HWwlQz7Wu9HOHqO27zkI92bc=
X-Received: by 2002:a50:8f45:: with SMTP id 63mr6401255edy.52.1598287221218;
 Mon, 24 Aug 2020 09:40:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200815013145.539409-1-richard.henderson@linaro.org>
 <20200815013145.539409-2-richard.henderson@linaro.org>
In-Reply-To: <20200815013145.539409-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Aug 2020 17:40:10 +0100
Message-ID: <CAFEAcA8X3w4cgCQXJmg7XpmLRJj4H-TTrwXJs6Wz1PBjLyQ34A@mail.gmail.com>
Subject: Re: [PATCH 01/20] qemu/int128: Add int128_lshift
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::544;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x544.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 15 Aug 2020 at 02:31, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Add left-shift to match the existing right-shift.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

