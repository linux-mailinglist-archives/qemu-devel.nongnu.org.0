Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A773F5EC452
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 15:22:59 +0200 (CEST)
Received: from localhost ([::1]:42626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odAY6-00066T-GU
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 09:22:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1od8iV-0005rQ-MX
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:25:35 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:46797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1od8iU-0001Jb-2g
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:25:35 -0400
Received: by mail-ej1-x633.google.com with SMTP id bj12so19947787ejb.13
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 04:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=K3CGQRmOykz5tfoaaxFSaWYe5yWY7ptKtK/037Qvg2g=;
 b=yBVz/hXygei7svWzhpGDVu8e5DrU/34miPkM4tx7ycoLRyJE2UGQMPEK5WEw4uJOuk
 Wlg7H7jlTF/bAFUQQeWBGEco3Po7BcRb/3N6VTZnUkwIo+CXJENCstidGv9rTawuuE6M
 rrH137NV7j1Azmu6nsV4X8O3nnFXBhtefDnd1EFdcNii3RXH9M6IKuxzKUj/tONJE0W0
 FwDlV9tOsXtaJiSInkFmXxNUcV90JgYMI79fhOKhHdms1znlWPhLlWyOC2mMNOC2zLVc
 BLVmaRHPgkmkCfjEgX8cMJxtGYsoO9a5u5Ik9ca+8mgHlTx1sMJS1YkMQTSLoZNgR8pM
 Ch3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=K3CGQRmOykz5tfoaaxFSaWYe5yWY7ptKtK/037Qvg2g=;
 b=yRfMXNuDpS5cHBkm3RsFkDouMwIhXEr5GK3eyQHjmo+kSYck1hldUsgzRwz4JaR8TI
 7l77SnMVMpwnDpSnD90AAgoERcm6Qkxz3UJPDmorShBFwqdn66O3KflSkvlSdDrlZl5c
 F4mCusUL0E1Bqo6EhkRyNTF0K/0/1N8qcbsvlHUu/pkpn/6m9VPdgIW5PycHH9ILi+tQ
 Nw2G3Beh+PwKrxNWNSEEq/StYXYUDEJH+4IU522LXbpWCbmi8TJPgE+VMgw6QZTAaOtK
 J+Tb8Xoq09/eQ8EVEyk5kweyCCjO5ulKH/oWWrSf1y9Q31ZHcuUpt5gMAC2wMe45WyAM
 gxsQ==
X-Gm-Message-State: ACrzQf1OwKEzkuIHEk2qyZ8F3lvhWbhndB8wvGyL6b1s3lIwq+MOxrd+
 ilmlf37KbGSfS+7t/qPV54WD9e1Djv6qZrpjTh/bBw==
X-Google-Smtp-Source: AMsMyM4Ep83Ur0ZFn0u3sCoKa9Nk2/sIRyUtOU1kFysU6QEpcRxuNWG6LvfNYUNIxQV1AmIvfqAeZjulcUlIzAEe1a4=
X-Received: by 2002:a17:906:8a6b:b0:780:ab37:b63 with SMTP id
 hy11-20020a1709068a6b00b00780ab370b63mr21880756ejc.365.1664277932749; Tue, 27
 Sep 2022 04:25:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220927100347.176606-1-jean-philippe@linaro.org>
 <20220927100347.176606-6-jean-philippe@linaro.org>
In-Reply-To: <20220927100347.176606-6-jean-philippe@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Sep 2022 12:25:21 +0100
Message-ID: <CAFEAcA9EqYi0LdXtz84_-8r1L3DUNWdnNL4LTHrm0n4cub4ejQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] hw/arm/virt: Fix devicetree warnings about the
 GPIO node
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, robh+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 27 Sept 2022 at 11:12, Jean-Philippe Brucker
<jean-philippe@linaro.org> wrote:
>
> Since the pl061 device can be used as interrupt controller, its node
> should contain "interrupt-controller" and "#interrupt-cells" properties.

It *can* be, but this PL061 is *not* an interrupt controller.
I don't see any reason why we should claim so in the DT.

thanks
-- PMM

