Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5743966153F
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Jan 2023 13:53:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEV9l-0000xd-VQ; Sun, 08 Jan 2023 07:52:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pEV9b-0000vy-Qr
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 07:52:02 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pEV9Z-0002AR-R3
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 07:51:59 -0500
Received: by mail-ej1-x62e.google.com with SMTP id cf18so7471477ejb.5
 for <qemu-devel@nongnu.org>; Sun, 08 Jan 2023 04:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cP1oqofE9LxtlTu8B9ilX856Gi6q3i6WYCOJ/BufXHM=;
 b=hKmq4dMJ8vAhn5CcG7tnPh+8NoSkis60nffe2TDPTeVZ9Dw9jMWlwE7Jd0visTjsvo
 AgTQczwt4+3aKOv9hIQaD3IIv4EODxYcn4Y343L3g6KC8ziQY/SzIOlYxYNjVDEsmldr
 a1VuKVGplWOWUy9qHIP7zag2UiDnmcDop9qFZB0DtsZs/yTRZA18V0D+gOHXH1WVrgeC
 2jHfDPEpxoiDzLgup07lRNAB1zOySqMf/ggMDgzhVOv3atQnoPtdrhfZdcq0z3FBIwV5
 mOKVR9DhLvo01LgOECor1vEtWbmPFoJe27EMT5GJ9oCoOsqSi/epHeyIORYDVDjkN9Jw
 Y09g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cP1oqofE9LxtlTu8B9ilX856Gi6q3i6WYCOJ/BufXHM=;
 b=DkMLpj037we5l8U4xTroHgU8J7TfraeTgbz/L6qTyB3HyAKoZSVNemUAUVTekwG9qH
 wRoR9Km5YxPwXeU8QDxLdfmFfJL3LP82W3y99pBb1TFFuYhkdZT2e9Ny8RqvR4qPspzn
 9GG+JXGWBgxVIP5ELkkCSzUTQBppCBp7mg9N1fXnBI7llmsD07nwKmej0gXDFsdh44Lp
 DD2puhUkv0sI/UxHgsnFH71ddxdYzm2IjeGvEWbAku8WGT/yrUtFJNeb6FCWhurq4o48
 cMIZqFnzWgNRrFnouZUSZU/T417lV5tGvfrpl4jfsjVZwAawKdRpCbhPZnQG7XefWVCE
 zFLw==
X-Gm-Message-State: AFqh2krSNDzaTvZu+/hGfwHsHks2V2tQBVxUXVSegj1UN4MVn64fIMFv
 NWxo9yachVH+IaSUQ3gyQME+xfsZhe53CsbSJZc=
X-Google-Smtp-Source: AMrXdXs0aNUcV05n14LApa/mxVVOhLc3bBuc9WZJqxtSPVAOKonuVwwdCu7+c9IKz5egkcHzRbFNE+dcfAtLRLRnygw=
X-Received: by 2002:a17:906:5798:b0:7c0:dcb3:718b with SMTP id
 k24-20020a170906579800b007c0dcb3718bmr3651951ejq.711.1673182316131; Sun, 08
 Jan 2023 04:51:56 -0800 (PST)
MIME-Version: 1.0
References: <20230105164320.2164095-1-alex.bennee@linaro.org>
 <20230105164320.2164095-2-alex.bennee@linaro.org>
In-Reply-To: <20230105164320.2164095-2-alex.bennee@linaro.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 8 Jan 2023 20:51:44 +0800
Message-ID: <CAEUhbmUkkoPCL4tEFSmK_EevCKDZ2vRWpzdB7t3vPO8cRXqPaQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/21] gdbstub/internals.h: clean up include guard
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x62e.google.com
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

On Fri, Jan 6, 2023 at 12:55 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>
> Use something more specific to avoid name clashes.
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  gdbstub/internals.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

