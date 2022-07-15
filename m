Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6281E576263
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 15:03:10 +0200 (CEST)
Received: from localhost ([::1]:56206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCKyL-0006JI-IM
	for lists+qemu-devel@lfdr.de; Fri, 15 Jul 2022 09:03:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oCKuU-0002wy-O7
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 08:59:10 -0400
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f]:45925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oCKuS-0006He-Ml
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 08:59:10 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id 64so8260699ybt.12
 for <qemu-devel@nongnu.org>; Fri, 15 Jul 2022 05:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hes3BDDBOtqqs6AjZCtmk7w/D95neb0YgME8CFtnk9k=;
 b=yREGoRFfNwGzNlCuHM3MEaME5lYtTV5oOtRoMYsLoaHuB/5wv+FZTgRyZO4wbs3dBw
 MOJLhpLMvQ55Lq8MWWGPYeyztW2Mli637xHlDMaHitl/93X6ICXrpv+we17RginKDK1B
 n7cHHhy+ocmMAL9WvBYDhtUGX2wpPDe2TI4U9cBqMYnxyZfW4G8gWEBw/tN7pR0twv/z
 tNpJt966WrtJ3+y2I/C73JoVdj/J4zEfUtp+6iIwfzHIUjjLTXYE2jIcYAK2nlFTsMuB
 aXQesudhQg/AdpbIsfhAdn/ouskNo0NLl4KrmliIbpYqKqv6d3J+wAD0Isd/N7cGhTuc
 Zy9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hes3BDDBOtqqs6AjZCtmk7w/D95neb0YgME8CFtnk9k=;
 b=dVd/t+5sen2i9py2ntQIG4rZmuf3S8CAGY+rTF5oQsmzAJBo2UUAlij/06VmNc16nW
 Yj3Pp3h8rK9PGUws0uaI6u1Pp7HeMpDUhjAj+asnYcxwyB/ZRz7DAFlbd7I0qVvQ2tN/
 5dCutMsRHclTKFAhK94tgL7H1HpF+8Am9pRQ99/BCN2+5JuBUyL2grJRxVIuTDsNiDCU
 Q4JCCl/Y4tvquhbxvnGXglXjcbCYFFRb58OWVyuNjFgS2ZIt/Imcc5w87bFJcb2lTBB7
 7OPjcW44zYd/MUV3UhWrQUyxxuNJayssL23/qI4wjP5/IMVqU02BIYNeaQIwjcpZJ3LC
 DiHw==
X-Gm-Message-State: AJIora+Havb1Th6PWXkAaAE/hUI1Az8isM0qp6PapzeY5QPxAilwjfkJ
 Whum9o9tOQ04Dn4A94X2VQdVnHWUQwjj+Ru7UfY7hg==
X-Google-Smtp-Source: AGRyM1sbSncbFgT1c++7dKGd1pjHasrJcahe9YdErXtCD02ZDkNsF1FTzS8GQBykaoUFRbvhBuM5ORwyP5oLBJxHtn0=
X-Received: by 2002:a5b:dd2:0:b0:668:fc4a:9403 with SMTP id
 t18-20020a5b0dd2000000b00668fc4a9403mr14054930ybr.39.1657889946851; Fri, 15
 Jul 2022 05:59:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220715114039.59790-1-akihiko.odaki@gmail.com>
 <20220715114039.59790-4-akihiko.odaki@gmail.com>
In-Reply-To: <20220715114039.59790-4-akihiko.odaki@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 Jul 2022 13:58:26 +0100
Message-ID: <CAFEAcA9arqdX2SEKz3vVWgvdqXD6TL-o3Z4dFRSTYF+BQq+9KA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] meson: Allow to enable gtk and sdl while cocoa is
 enabled
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 Gerd Hoffmann <kraxel@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2f.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 15 Jul 2022 at 12:40, Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
>
> As ui/cocoa does no longer override main(), ui/gtk and ui/sdl
> can be enabled even ui/cocoa is enabled.
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

