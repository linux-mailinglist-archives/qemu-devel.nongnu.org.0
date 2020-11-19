Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DD32B9C6B
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 22:02:08 +0100 (CET)
Received: from localhost ([::1]:54900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfr4B-0004Zg-AF
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 16:02:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfr0g-0002vP-Od
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 15:58:35 -0500
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:36015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfr0f-0000Ys-4i
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 15:58:30 -0500
Received: by mail-ej1-x642.google.com with SMTP id o21so9878444ejb.3
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 12:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=olWUWroNB6+kEBtK06nUt2/wYzlZRcagibV9VDZGnEQ=;
 b=gCE0oYeFjLY2TtnyFdw6kGwueLFOSCgb3vMdEbxD9Pr58OVNK0rhNmIC5t33XzcZAD
 l22fvVjKJJFtxPa9ipUnTIMI3kov2vWCEcGEGvOUFPOGs2wtqGKTPY9dVu2FexGQeZXq
 xUs2AEIwcERsxGy2Z8w+ckm7V0vTSTjBdSOwkxJEDKDorV2dM8vzOv1SJ83IKTCkHdBv
 OI5W4u4FBbX6sD4Inwz2Ss1E5oYMNmqvHsk0Pr6UxgAnD1R/NXRFBzXrTWao4gTeu6r3
 PxMZ95ARaWD63XIW9HYlZDbBBLzrDkLjEwMfoLlNl1uuJoST1bEVrtShoQgZRP3yTUnM
 E76w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=olWUWroNB6+kEBtK06nUt2/wYzlZRcagibV9VDZGnEQ=;
 b=RWWJJ66M5lVQLO6iSQNEvcXPRt/F2e583aev3utSOVH6pvT64JAXDu0rWYamSKRf6V
 gmEIMxINOBP+gsOX4ojmMKpXC8F1KjBPhr5Ji7WhYStMW1ssCRpfoZA15mEgSrprnAPH
 +A98ELjv7PkXubR+t48O2Cupnc1zCLwIG7H7a13IrswpPLCiwaDG78luD+dnp78sgvBV
 DmBZoIVPIhVI/21OSV4RjVEq5TIIaEY3e1AuuHMtRar39V3Kw2JFCZV2txxuv4nd//L0
 otY4xB8Gq7KuNkE+Ej63Kt2louvBB3BgJccKtDHzte5K/3ZpwGQiW0qgOZo3dkOxaE14
 D3Yw==
X-Gm-Message-State: AOAM530iOo/erjx3CEY/RoeMd7ichOutD+8aA/eEt0PEPyDWVwuXLYmv
 Vta4pUxQJdvnQZnLgvStUFpSjEtfUqsglRV/1zmM7A==
X-Google-Smtp-Source: ABdhPJyBUVnykO/N36c/2RXXgPyiIw1eOPR1wfF1uW8WeIaGN5ig7vNpaQzpiZ8lbPx2a6XsRT6aiG54CuYqv04pRB0=
X-Received: by 2002:a17:906:1542:: with SMTP id
 c2mr19666488ejd.382.1605819507492; 
 Thu, 19 Nov 2020 12:58:27 -0800 (PST)
MIME-Version: 1.0
References: <20201105175153.30489-1-alex.bennee@linaro.org>
 <20201105175153.30489-7-alex.bennee@linaro.org>
 <CAKmqyKPWiy77ePe6y7cOGkOjDfdikX=SoyACEfPf6XjvzwvX2A@mail.gmail.com>
In-Reply-To: <CAKmqyKPWiy77ePe6y7cOGkOjDfdikX=SoyACEfPf6XjvzwvX2A@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Nov 2020 20:58:16 +0000
Message-ID: <CAFEAcA86FC6=KwhPFYccyJSgGqOQCtg3U2P97YwM_ZZj=6m6eg@mail.gmail.com>
Subject: Re: [RFC PATCH 06/15] docs: add some documentation for the
 guest-loader
To: Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x642.google.com
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
Cc: julien@xen.org, Masami Hiramatsu <masami.hiramatsu@linaro.org>,
 Andre Przywara <andre.przywara@arm.com>,
 Stefano Stabellini <stefano.stabellini@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Takahiro Akashi <takahiro.akashi@linaro.org>, stefano.stabellini@xilinx.com,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 19 Nov 2020 at 20:30, Alistair Francis <alistair23@gmail.com> wrote=
:
>
> On Thu, Nov 5, 2020 at 9:58 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
> > +Currently the only supported machines which use FDT data to boot are
> > +the ARM and RiscV `virt` machines.
>
> RISC-V.

If we're going to be picky, also "Arm" :-)

-- PMM

