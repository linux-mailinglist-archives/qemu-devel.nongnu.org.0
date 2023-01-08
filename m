Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E49CB6613B0
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Jan 2023 06:27:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEOBW-0001l9-O0; Sun, 08 Jan 2023 00:25:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pEOBK-0001kh-Vs
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 00:25:20 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pEOBI-0005cC-HU
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 00:25:17 -0500
Received: by mail-ej1-x630.google.com with SMTP id vm8so12518598ejc.2
 for <qemu-devel@nongnu.org>; Sat, 07 Jan 2023 21:25:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+/eKHoeuPfeCN6g98LqK33WFLV2W31OhUnqPZ56HULg=;
 b=m+bWAn0esFMCMvV+zQPqau0YkRNuh8AVFvh2QEgjJcWiAwomnOC0vMA7RqU6M7KPh9
 ywjVB6UG4/9M9ydYE9eC+u2mPRk+ympD1LZwpzWMXLfxQaJplf6E5kScFp1ldHFAhWnw
 8IOmP0gGeuFrYSGnbGdDzhLVsVoPy8kBATjUMe6Cs+Mig+RgrOAcFFDcpuEeN9BXDrWo
 mmjH+SAKOp/JfKHARWS6uGf3o/rfKsQUt+j95ZMry6q5BkguAyE7SxiQX+vocNyceYrO
 7dOtdT/PAo4TL2twkV1CT2+HFwhyfOY1BezcjqPiBIwU7YNxFwOKoQLxyfYfI08zvzV0
 GxTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+/eKHoeuPfeCN6g98LqK33WFLV2W31OhUnqPZ56HULg=;
 b=J1nfacsniwGRJ0sJjM961CfsimXnMD+P7IJ62ym5PQWBvaixwnPXsCEzHGQ8PZZqxK
 3DYcdF0ghznJ5a3zzEf+3jvK0y0lhux1K4+lXNDS352mvLlgj0LCmjIOAABQ8Uss4XYV
 ykWJUdmZFhKhpmEMbHxnJLurVwhtywOuMnzqJ19ejUeFiPP9qcq/yDoHeVtKZPxyYLyC
 wOpFMNAfy9YuCtFKEVvBv1CcyXAwOJ+LiufzYNH73KJ6AwQyP69FjceuRrMVEWyrL73N
 NeKD7EmwoVUECSgE7e4bkhYzEUDh8lHahRqErZ6K8SpIJKs6tYGYkuSEX0VguGwfAWFa
 AxPg==
X-Gm-Message-State: AFqh2ko909U/w8xVl8fIAKFa3Swexr2fDfuhcxNhp/FuUa6LztF5guFw
 6BA6eXSYwjFu+KVaQnVASOelPoFuHoboi3hNVJw=
X-Google-Smtp-Source: AMrXdXuAdaCulXj9W/eeXHppknYBJ7dsMMk90iNbwnSGFxMQgBnOvcWf8JztmqkkeMYpvGFgk7tJgVmHN958PHAXcQk=
X-Received: by 2002:a17:907:c302:b0:81b:f6fc:e6d8 with SMTP id
 tl2-20020a170907c30200b0081bf6fce6d8mr5595374ejc.13.1673155514009; Sat, 07
 Jan 2023 21:25:14 -0800 (PST)
MIME-Version: 1.0
References: <20230104220449.41337-1-philmd@linaro.org>
 <20230104220449.41337-5-philmd@linaro.org>
In-Reply-To: <20230104220449.41337-5-philmd@linaro.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 8 Jan 2023 13:25:03 +0800
Message-ID: <CAEUhbmXy=n4HF6c9rgCnxL3jHJdwjTDpioEYDCP4c=em9u-dwg@mail.gmail.com>
Subject: Re: [PATCH 04/20] hw/arm: Use generic DeviceState instead of
 PFlashCFI01
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x630.google.com
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

On Thu, Jan 5, 2023 at 6:35 AM Philippe Mathieu-Daud=C3=A9 <philmd@linaro.o=
rg> wrote:
>
> Nothing here requires access to PFlashCFI01 internal fields:
> use the inherited generic DeviceState.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/arm/sbsa-ref.c     | 12 ++++++------
>  hw/arm/vexpress.c     | 12 +++++-------
>  hw/arm/virt.c         | 10 +++++-----
>  include/hw/arm/virt.h |  3 +--
>  4 files changed, 17 insertions(+), 20 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

