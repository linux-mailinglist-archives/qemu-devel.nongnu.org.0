Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0C82C8396
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 12:59:11 +0100 (CET)
Received: from localhost ([::1]:49588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjhpm-0008Nb-Ck
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 06:59:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kjho6-0007Ty-6g
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 06:57:26 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:38238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kjho4-0001ZP-Lw
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 06:57:25 -0500
Received: by mail-ej1-x632.google.com with SMTP id a16so21260289ejj.5
 for <qemu-devel@nongnu.org>; Mon, 30 Nov 2020 03:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PQ7gUd1qZAxDTde/bjGFuSC0f+CnY0r52Rg1WEpw0go=;
 b=Mm3q5n+DhsPYO18HRKItPYe2iD42UvenIlkmUtvYbWvJhLVIUhw+e4TclINW202Ea+
 da7wF7092YSizlQITa1TuxqpsNUf4OTqTEvQXU1kWyiYUn8pqhjszLyffENkWe+9d/P+
 s48ypoMZFKUnBQkfkh1/78aWHN7oorm5Gx954Vdhua4iy30yVi+zEU5rYA1s53kbrUkb
 oe7a0Wgs4PVDTGhN1Rcrx2KVS3jR798oW9aS4m8mdSlx+mwUgz01ocLFS9BirbakD+Jq
 xNRXFlePqdfI1DRABqQK1P62zqwn1RVEQI3pzRIJUxRq2gRYft235EFX5LdjajIC1i1p
 /Iug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PQ7gUd1qZAxDTde/bjGFuSC0f+CnY0r52Rg1WEpw0go=;
 b=FjUMfgndiMQEr90aEkCBgdKhP+YoXmSZ0wR3ufinLBHYwcl9Azfcozigws55VY1PSi
 Dz4rM0I1P4gWa8KKyOI/s+AsG2xWSivZZaI0pb1l/vDIt2BIncexLInFpDEBWvgj6v3C
 t8LZUFutBxWiEuX/TOcIs9ItrA8jK0QTiQvq7tRgO3TkZUkpGngH/wN6nYffEnuN+4ia
 2oK8rrW0lpCoP8XRgTaQDh7c2L628chMH5D5kxRQt0nN6KNID+FeFxcWYHnQDANoZ7tF
 XT71CwQRKXyZ/XIqH7adHHHdY26j1Ro1g4iOH8GGT9NcNrdMshtBjYWZ0mZtROx4EcaP
 IgRQ==
X-Gm-Message-State: AOAM531+dxkwasedQk3693qArjRYwCpgEqljmLCjXJHL7u5yZpHkaFFQ
 AsPD4Gul5s8sN+JyqMUwCc1Zw/7dawwLS+ftmZsRdQ==
X-Google-Smtp-Source: ABdhPJyVMSCqQDCQOWrGxvQWVbhzfz1CJ7GkEXE0YEfk8YO7AIdhnynE8GrM+oOL6RuhDJGblwgieXhfRxxY3rt6cbA=
X-Received: by 2002:a17:906:dc4:: with SMTP id
 p4mr20241787eji.56.1606737441137; 
 Mon, 30 Nov 2020 03:57:21 -0800 (PST)
MIME-Version: 1.0
References: <1605728926-352690-1-git-send-email-fnu.vikram@xilinx.com>
In-Reply-To: <1605728926-352690-1-git-send-email-fnu.vikram@xilinx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 Nov 2020 11:57:10 +0000
Message-ID: <CAFEAcA9JJUmL=8NqfodcyZ5=fitf7AkBmhZdknC_ENx1jyU1hA@mail.gmail.com>
Subject: Re: [PATCH v12 0/4] Introduce Xilinx ZynqMP CAN controller
To: Vikram Garhwal <fnu.vikram@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
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
Cc: francisco.iglesias@xilinx.com, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 18 Nov 2020 at 19:48, Vikram Garhwal <fnu.vikram@xilinx.com> wrote:
>
> Changelog:
>
> v11 -> v12:
>     Change/add new trace events with relevant debug info.
>     Rename val64 to val wherever appropriate.
>     Added new error logs.
>     Corrected xlnx_zynqmp_can_receive function checks.

Applied to target-arm.next for 6.0, thanks.

-- PMM

