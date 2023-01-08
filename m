Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5CCF6613B1
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Jan 2023 06:27:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEOCE-0001t8-Nz; Sun, 08 Jan 2023 00:26:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pEOC8-0001so-RN
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 00:26:08 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pEOC4-0005mT-QA
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 00:26:07 -0500
Received: by mail-ej1-x636.google.com with SMTP id lc27so3206255ejc.1
 for <qemu-devel@nongnu.org>; Sat, 07 Jan 2023 21:26:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rlEQgu46bPTrOOl1jKoqpzSYEoYfR5Bm42sCdC39fKE=;
 b=iC5kwA379t40X6VazghRm6IS7BmjqNbJMVuzS9KRoIzfsVG8UO9frkL9BQrAq8Fn94
 zO9JHlpikqv3w9QDSraRLHdQQu0PjMmUZ+OqR+lkDxm8MDKjKiVxBB++PZ6rIFolLBlc
 WDEshDKlTq/zPOFcLxCSxGfdUpAPAdCb0Y6Wi7E4B2+YPSe1uRxzTjdO11uA5get02sM
 hV6+EwX5gH16dL1WPDj/aH9BXsgmhRS4e0rKs34xnLaAg0BPK1PezIm8bRV0C0wrZu3X
 3RhZWA9SnLM+oSWO+v81a68o1v8b+xxFXBp72WfbkF+PJ5TiPC9E3GBUnFcNgmXFoS52
 IP1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rlEQgu46bPTrOOl1jKoqpzSYEoYfR5Bm42sCdC39fKE=;
 b=CG6JLoueEj3dI/5GZqFneio7jY8CAhH7mDQXraS9k1FbZhLr/XvRFN4MkivqglfNcl
 Abd6CC0V8jNeahyKUloCm/a1wJXOj2vy4+lTjNN3Pwe9VXd16fSoVrW6N1vuGaI3xQ3t
 dAPdrTNuADB9gorAclSvhi+7bhPEEEbmMdw6ioAXQEBmc6/9osMf43zTB7CcxQYcMhS0
 YJK0zUZ7QHZ/uFaBgWZ8ZSMTUD3/ObQCXA3b8LyUYYxJVdFH/6LDuts5e0ezem0TF5ca
 may2dhxQmMhJnlDFC9uWaljhUfqMZ2BTO+0gtW2/hKm6SkfMNnPwvjeJOwLKFGcSiqJE
 EpjQ==
X-Gm-Message-State: AFqh2kq5RQkssHfvpxwBonumQS8wYXg97ZKRIByva2K1ZkETGjb0mcP5
 ElU59RI3f/Fx79xi/SK2gb3KO0nOgxQjqIj2HaMDpBMBjV0=
X-Google-Smtp-Source: AMrXdXt11BYwTb9BGIMgX4SQBGdHN6zswsGLHMzlyXMAnG8efZx6an5jxDoiH6sLZxEePWuzKGBx543StuNM2EvG9w0=
X-Received: by 2002:a17:906:5798:b0:7c0:dcb3:718b with SMTP id
 k24-20020a170906579800b007c0dcb3718bmr3607753ejq.711.1673155563610; Sat, 07
 Jan 2023 21:26:03 -0800 (PST)
MIME-Version: 1.0
References: <20230104220449.41337-1-philmd@linaro.org>
 <20230104220449.41337-6-philmd@linaro.org>
In-Reply-To: <20230104220449.41337-6-philmd@linaro.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 8 Jan 2023 13:25:52 +0800
Message-ID: <CAEUhbmXfTAzpg8GMU09yAcYpsk08mi18QQT=sYEc8cjWmEzEZw@mail.gmail.com>
Subject: Re: [PATCH 05/20] hw/loongarch: Use generic DeviceState instead of
 PFlashCFI01
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x636.google.com
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

On Thu, Jan 5, 2023 at 6:16 AM Philippe Mathieu-Daud=C3=A9 <philmd@linaro.o=
rg> wrote:
>
> Nothing here requires access to PFlashCFI01 internal fields:
> use the inherited generic DeviceState.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/loongarch/virt.c         | 9 ++++-----
>  include/hw/loongarch/virt.h | 3 +--
>  2 files changed, 5 insertions(+), 7 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

