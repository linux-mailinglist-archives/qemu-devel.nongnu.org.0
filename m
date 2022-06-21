Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9EEB553152
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 13:49:04 +0200 (CEST)
Received: from localhost ([::1]:51206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3cNT-00020L-VQ
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 07:49:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o3cId-00008u-8U
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 07:44:03 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f]:43809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o3cIb-0001o6-Ow
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 07:44:02 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-3137316bb69so127559037b3.10
 for <qemu-devel@nongnu.org>; Tue, 21 Jun 2022 04:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=qCFE0oQKi5KiISWC+O/SiYq6V6ZHp3mmz5ArVUlbyQo=;
 b=GJFTeGUiJ0AIdHpoWTJAjghRify9+gZELAc1ULxnaAhxDKd00a+/2C/eqChpeO613x
 1QONFCjkVF7XCLa89GH+pgkoOrGCd6GlOcUzu67lMN5gFlLHkfP3K8tBLASKpK6EhU2i
 xNf7g0v+09vhnA0YSiNtcERICuWdI5SdfU/RGQJKgHykqh95A3SM2OZyBjPys5gTjeTk
 pE7aH3erq/LaZ/1m8a5O+5ImEW0U//wBW+QOBRgpQZYscJDjziOUkyz5Zpf9VzLAq1A6
 dKDKPvqwsUVAO3ZinNgFNob3FLVtiON1oPwv9fQ2iIVHVoBribw5uTl2TPeWENTW1G2p
 yU9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qCFE0oQKi5KiISWC+O/SiYq6V6ZHp3mmz5ArVUlbyQo=;
 b=y2wxzzvaPM/xlehgPLLCELeGuOlBeCF9boXDwIfNqD3TwWUhWHt6Ukk+e9GpW92qkA
 W6c2Jk3u+IN3Jm0kQw0ON0WWvItNOTLDEs7bZL+H/HwX8kvj2JpW2bx77Rhb6PQkTiXu
 EeDd/vxvPKuR/kqYXA/8XowDbuKWj9yfrKXsnUtCOwZTsrWTb2fKG9Z2FOvh3ajNSIxL
 2PxlHa/eGiCj9MkbpTzFeFQRt9SL6NNySeOZlpV/ggirsIpks3itL8s5gE4g5jEILzSV
 QUdGhblwCYV+pyPCR0EJ7OwQyyPdAusMGt9K9BG6o+GjjRuuKj3PSkkjEFGAabnjisYC
 F2bg==
X-Gm-Message-State: AJIora+kjCmHLg8D+iZgMBoZV6LENZEKXz69MIW0hchB8Qvzq39h8FiK
 bELXUI+mud/F2LjBBzIDx7Bqz9VZmOiT4v6CCOmU0g==
X-Google-Smtp-Source: AGRyM1s6VFxrUEUYdPCyCAc2sxD9ri6e1AiVSHJI/a7WZbuI3Gv9Tv5TCTsxFdPsOWZ60a7DIi8nG6MHN3XGAyd0ncE=
X-Received: by 2002:a81:a047:0:b0:317:8761:14f8 with SMTP id
 x68-20020a81a047000000b00317876114f8mr24395616ywg.469.1655811840732; Tue, 21
 Jun 2022 04:44:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220621083420.66365-1-marcandre.lureau@redhat.com>
In-Reply-To: <20220621083420.66365-1-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Jun 2022 12:43:49 +0100
Message-ID: <CAFEAcA9SyfaMYkH2RvELExUJF_V-XbnhCmJa_m7RA0rOTOvEQQ@mail.gmail.com>
Subject: Re: [PATCH] tests: fix test-cutils leaks
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
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

On Tue, 21 Jun 2022 at 09:36, <marcandre.lureau@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Reported by ASAN.
>
> Fixes commit cfb34489 ("cutils: add functions for IEC and SI prefixes").
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

g_autofree would be neater, but this works, so:
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

