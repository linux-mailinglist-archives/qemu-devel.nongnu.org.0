Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 114B850B953
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 15:58:18 +0200 (CEST)
Received: from localhost ([::1]:43500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhtnc-0005wr-Tz
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 09:58:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhtm5-00051y-1b
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 09:56:41 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a]:44855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhtm3-000641-Eg
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 09:56:40 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-2eafabbc80aso85949847b3.11
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 06:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zsBKZcluOR/vrhg+g+i/GRR7HofGxorLIVtF+XZIvSo=;
 b=oxxHc0HWEJTFuq223cKs8CjHW2v3ydA542rFuIu5Wrc4FjjALZNOg4uAgVnwpTFpKD
 +6tkGxpIvhb2fTf+kZrME1diZykfH+Txvw4ax06mIGefwpQr7N4VqZB3gPfeSSp5iDsM
 8+MTIaoD/b3A11l0PoUEm/YukH/Hk2AXpm06qEgI6siB1n28bFGD4omb9+9w0Q7KHqBn
 9un7SuSXCelCNLOcWQ2R/3F8irNrp5B/C9BXbg6Qphwy9lFExSzivhclGET6psqzF1It
 Ns8jHUbJDuhuCQ8LlqDkBeEOZVC2H0Ns3cTLf5nfsALx5/0Au/VeEelIpc30/4neSu4P
 zMHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zsBKZcluOR/vrhg+g+i/GRR7HofGxorLIVtF+XZIvSo=;
 b=nYmBI0VCWcua1aKoHAkSHA/xD5HUzFvoNJzJ8Gx7uUG0Vk3uRJA2X3NJUPibaQ6ygw
 qBwQVRW/Gq9zt5gekW2Cxpyo0kUgBGrWsmapZ46eZ57cIFFLd2pp0nspcy7ODUuwPMvI
 wh2lgaG2NEuKSQikfgeci0hLAVRXOpIjgB9Gqp0YRE6EgJoH3HbcH8bqb9ASXrMYLWkl
 krOgviLPW+19zU6/1l6D8mDhnYiV9wyGUh7smpOO7tXZpgnxH3hgrQfxegAl+Tp4cmEB
 y+Y8/lJPisCJrFKN005lIeDw+F0x5deVWn8jPEvZd9NULvKWqsWBA4HlgOtzYB6HuoRH
 x4TA==
X-Gm-Message-State: AOAM531T0dij/v1q/+KRec4XtMuNQatnEP4yjfD5BsxmCMZ+NoutOdDw
 nTiSjtd9gTXkIE9eyEnBW92Sl2JfG3xn7OgPHAjwiA==
X-Google-Smtp-Source: ABdhPJw39edtpTr8/guf2d/vGBOYKw0ANVx77f9/bGgH9OK5tkC5bqmtOQIUYBpRtdiQq+MZ11NiU4fbIvPB1eKaGZc=
X-Received: by 2002:a0d:fc83:0:b0:2e5:b0f4:c125 with SMTP id
 m125-20020a0dfc83000000b002e5b0f4c125mr4860448ywf.347.1650635787774; Fri, 22
 Apr 2022 06:56:27 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1650633281.git.balaton@eik.bme.hu>
 <b2729322770e17a12709f2abc5b4789fd51bc034.1650633281.git.balaton@eik.bme.hu>
In-Reply-To: <b2729322770e17a12709f2abc5b4789fd51bc034.1650633281.git.balaton@eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Apr 2022 14:56:16 +0100
Message-ID: <CAFEAcA8nbyPHSfWx34se2k5nf6jhqzvj6dzBVfs=Wqs7m4va5w@mail.gmail.com>
Subject: Re: [PATCH 3/3] hw/audio/ac97: Remove unneeded local variables
To: BALATON Zoltan <balaton@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 22 Apr 2022 at 14:42, BALATON Zoltan <balaton@eik.bme.hu> wrote:
>
> Several functions have a local variable that is just a copy of one of
> the function parameters. This is unneeded complication so just get rid
> of these.
>
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/audio/ac97.c | 102 +++++++++++++++++++++++-------------------------
>  1 file changed, 49 insertions(+), 53 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

