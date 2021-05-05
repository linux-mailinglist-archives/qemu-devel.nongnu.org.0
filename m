Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C74B373BBF
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 14:54:04 +0200 (CEST)
Received: from localhost ([::1]:52164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leH2R-000837-5C
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 08:54:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1leH0S-0007OH-CI
 for qemu-devel@nongnu.org; Wed, 05 May 2021 08:52:03 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:35567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1leH0O-0000Wr-RF
 for qemu-devel@nongnu.org; Wed, 05 May 2021 08:51:58 -0400
Received: by mail-ej1-x635.google.com with SMTP id m12so2686765eja.2
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 05:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+H1OWX8UD0LqwV1inoR3zZEYWvYJbF0KuDtqUUZiYuU=;
 b=i0qRFskLONVWRCd29sn9DRZApAII1ChxZ0Nc5nk2sf8eCiNC1PuyBBbnqS4F/mQOKO
 ddFiiXAvdTkkgywzayoDkzjWyDB+v9wR25v3bdvnZBefBmEJLB4ZxXH2srN4dlIIfSuM
 RBBNFP1K+Yg34s1gNSCPhiLxtwIVgLNuKPbQ+mTXFEVmDiil4M62ErQ5G3upGnTXu0+E
 VrckE7GHC6BRRxVuBDL9I6CzGer+0ALvxCsrVHYLFEKmjb1LOhs1TXLVrWF9z24H9YYN
 j88NfyNOO0XyLvU7AfAgZRNankzQBPAJYAAolteTrukt3fbWyYqMFBnbbVpSthx8SXNk
 UE8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+H1OWX8UD0LqwV1inoR3zZEYWvYJbF0KuDtqUUZiYuU=;
 b=iCmF3pZ4Qy/Xs491USFmzk4FKLpid8pX81PATJGwKcKbVPn2Xq/XhAX/MkKb+V/cOz
 ntkwSh9X8EfsnFQyZnDfz4ei/AdtSvMVXh74T/B1AwCXgp+0/DlnYdF/RgdX6EdUap18
 FJ+ehsVednA1B1FtvxG2ryPk0q5huZ3EZSwxWVLVFUdmd05ZKRZPUkYOctQTuN42pHR+
 cgJRdhvKXW9W9XMc8ygThMgvu+WmdBJDb1BhoH5403fnt2D4evcj3Tx2xVIc9h/Oc+b4
 5vLb3oNoMnkCc3yuz6O0kF/aSTAP4UkP7zgCj735VZzZjEQWoPPfOLScNb5s0p543ilf
 gzQw==
X-Gm-Message-State: AOAM530DO81fsOTy53zDIhBoskBNSWcWaYVe2WRc7RxcOtZwvzvn5diP
 /vBZ2V9AiTza8zTPxzQqfEYJDM8JFkeQVOlWOaDuWA==
X-Google-Smtp-Source: ABdhPJyWuDHwgW+vihbi8RID6ffUP8tdPxXGiadFBgDgJ2WBELOgr36KJZxCJbuuWH7nk4PLIVBzth048Q6B9N1VTrY=
X-Received: by 2002:a17:906:eced:: with SMTP id
 qt13mr27022850ejb.382.1620219114954; 
 Wed, 05 May 2021 05:51:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210503052600.290483-1-clg@kaod.org>
In-Reply-To: <20210503052600.290483-1-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 5 May 2021 13:50:48 +0100
Message-ID: <CAFEAcA_Y=BDwdFq7-EXANtK2Z0F0rWBFG4-NcouCCygNYhC9Bw@mail.gmail.com>
Subject: Re: [PULL 00/18] aspeed queue (v2)
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 3 May 2021 at 06:26, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The following changes since commit 609d7596524ab204ccd71ef42c9eee4c7c338e=
a4:
>
>   Update version for v6.0.0 release (2021-04-29 18:05:29 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/legoater/qemu/ tags/pull-aspeed-20210503
>
> for you to fetch changes up to 9cccb912cfa865f0bae6b156fa94e2f216dd8835:
>
>   aspeed: Add support for the quanta-q7l1-bmc board (2021-05-01 10:03:52 =
+0200)
>
> ----------------------------------------------------------------
> Aspeed patches :
>
> * Fixes for the DMA space
> * New model for ASPEED's Hash and Crypto Engine (Joel and Klaus)
> * Acceptance tests (Joel)
> * A fix for the XDMA  model
> * Some extra features for the SMC controller.
> * Two new boards : rainier-bmc and quanta-q7l1-bmc (Patrick)


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

