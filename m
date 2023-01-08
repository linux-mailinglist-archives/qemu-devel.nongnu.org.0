Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA63066150D
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Jan 2023 13:29:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEUmt-0006vm-La; Sun, 08 Jan 2023 07:28:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pEUmp-0006v5-TH
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 07:28:27 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pEUml-0005XO-Js
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 07:28:27 -0500
Received: by mail-ej1-x62d.google.com with SMTP id vm8so13733241ejc.2
 for <qemu-devel@nongnu.org>; Sun, 08 Jan 2023 04:28:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XqSlJUBLEnHOh1GHokAohKEG/Al07LcDJcBoVFcJabk=;
 b=fCFKOf0LIc6WPqqN5t83zx4HdiShGuKX5YW7IH5VO2diwDY4Zjrvxl55EUDq0B+rxg
 oc2cY1+24VTTjs3mYtpPFpf+PFUNe/dj61IsQNTFjF8F2tE3CiH/H6VhJpt0eRuEsOkv
 Tm9NbYx5sT3e86SRfyKfjkQk03sB1yehYbYLxoiSSOs/NBH75VISZ67g3i0ezeqJ6g1X
 sQUkOK9Xvk0YMZCmym3ghmskRc2yJR2LBsN6dO0nkuAqFzapvcsg0vDI9jYHJWF6DsQu
 1rDTWb0IEVURwLVc7gw9PPBkPgbjT0/wjOx40N8q35z0o4vcMMmeBjI+v8qn7RH+sJJn
 ksqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XqSlJUBLEnHOh1GHokAohKEG/Al07LcDJcBoVFcJabk=;
 b=61BVn9KGpkUpQIVx6cPXDbZDIMw1cIXlIQ0vp39ErCYtkjOgryeaBc3JgRqVVSruNp
 rloRvf5BF5dcWEArGZg4EEWslTtStT1PePR+P+7gyJEmXKMzUUBe6s5BZ3Te88ihCbOt
 nRRkHXmqmdoSA94jDtMY0RCs7j9hHaZpqVJRdhL3vzfG0nJeMW3Mmpx7w4reTjZiCu43
 DA7coueAA5kCq88r8B4AeYm4whYSTEA/EOKDZWUV0jrfLEzqiWbFQZ6C9/lPAyvJk1Fz
 gK20Zb3QFKIhm9x6EvzhK4lkgt1H//1p4udliVYmEN4XX98DeKy5BGBr1HUGP+xIRQvm
 bXGg==
X-Gm-Message-State: AFqh2kqEzWRu4Tw4XTc4CqGCaq0+bKm+uRshNqRCNlOVdEED5F6VeJ+0
 cHPWF7BRHnUCA7O8eaALv6hJWTF/OfgsF2PfTKw=
X-Google-Smtp-Source: AMrXdXvhhESZ0oCVpZEduggnfX8d0c9YMGl5m9eJHJjHmMiEVgJICzbaCYjg73cFV2M6G2eVICNCeOkUDDv9DcD2haI=
X-Received: by 2002:a17:906:824a:b0:7c1:6f0a:a2d6 with SMTP id
 f10-20020a170906824a00b007c16f0aa2d6mr6998051ejx.337.1673180896234; Sun, 08
 Jan 2023 04:28:16 -0800 (PST)
MIME-Version: 1.0
References: <20230104220449.41337-1-philmd@linaro.org>
 <20230104220449.41337-12-philmd@linaro.org>
In-Reply-To: <20230104220449.41337-12-philmd@linaro.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 8 Jan 2023 20:28:00 +0800
Message-ID: <CAEUhbmXN1hWqESLksT7Sr7SGerQ-tHzKOoEeJexNoPKRRjz5_w@mail.gmail.com>
Subject: Re: [PATCH 11/20] hw/microblaze: Open-code pflash_cfi01_register()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Jan 5, 2023 at 6:37 AM Philippe Mathieu-Daud=C3=A9 <philmd@linaro.o=
rg> wrote:
>
> pflash_cfi01_register() hides an implicit sysbus mapping of
> MMIO region #0. This is not practical in a heterogeneous world
> where multiple cores use different address spaces. In order to
> remove to remove pflash_cfi01_register() from the pflash API,

duplicated "to remove"

> open-code it as a qdev creation call followed by an explicit
> sysbus mapping.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/microblaze/petalogix_ml605_mmu.c      | 8 ++++----
>  hw/microblaze/petalogix_s3adsp1800_mmu.c | 8 ++++----
>  2 files changed, 8 insertions(+), 8 deletions(-)
>

Otherwise,
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

