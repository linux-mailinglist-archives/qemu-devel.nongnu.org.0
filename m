Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B284C6F4191
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 12:28:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptnEy-0003Bs-1P; Tue, 02 May 2023 06:28:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptnEv-0003BB-JL
 for qemu-devel@nongnu.org; Tue, 02 May 2023 06:28:09 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptnEt-0007fd-L0
 for qemu-devel@nongnu.org; Tue, 02 May 2023 06:28:09 -0400
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-94f32588c13so608972566b.2
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 03:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683023285; x=1685615285;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uiFYtbbu+GJ8DAgMrIDX9dXz6hNz43k0g5kkPTV8j7Y=;
 b=l9rWETmGWOlDw2FvJEN9742JEq7yiucozsWqoFQwKI3he1LAvAdc1NSU6oxvDyRTBo
 uWGfxvOnxYzMSCAvT0TZdUxyJVYlaVqM4rwOV93Zv94frJUEdzimeLKoeZAOHA1wejhA
 VBAjdPgt2cV6xEr27bsMU7ixEtvXGx6+ORagPHfftWb/yMEF9mhXQ7nhEE0a+GzE5yqL
 td6izUYb6rsJS5JmnU3+N6PygmpIBG1qv9R2WJUaN3WWVmVAkKa/oojktEjftPLV0v02
 3FVUo9Pebd2hcdkhcMTLS1tsozEII4Kth1kSs2B3VRPdKn6/VuymBVAVt2P1vuELs/0m
 AFEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683023285; x=1685615285;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uiFYtbbu+GJ8DAgMrIDX9dXz6hNz43k0g5kkPTV8j7Y=;
 b=a9B/EB1UbPoNxCx3CeCJj0dZIK3L5Z7Wh0e3UMs6gIfBpEIjCH/3xT5dUODodp6Yuy
 cvk6Vx4va/1nByYT86aHFNTW620Qi6/d37YqWHl5VO/ce8T3xCkDlkPUBw5kxCpr6agd
 1GmLK6Jz9CF/P4LcZTDCUNpDA57jGXqY9VuQRA7Dywg1Peh1p6y1O8B83VUODpmwzK/p
 KgtI+vj8s+PlQORhoCqDykmHlu8zXxkuxVBCA7SoU7x00X1dEbJ1iT6St2rx02HxNcTU
 PiSeVi4ThO1mrDI3uIzoXPs5r096pG9Tcz0Q8MYlgiZDbp7ULZXM+zXNeTkt4VbrF0/8
 Oxdw==
X-Gm-Message-State: AC+VfDzc4VfPDT6lZ8IJZUUNybj4nq51pbv0V6+o8rf3KThgzTr6fVNS
 l74Clt5AckRDiAOrOctDpRsXxLiW7B7OIDU2nDMgvA==
X-Google-Smtp-Source: ACHHUZ5Djva6pyMD2VD1MgfdxOcN0gT72OnBHliXTto3ISX0cZYA41TrBFlMcKysWqdg2iz18S7PoecnTPP5WFbQ1Bs=
X-Received: by 2002:a17:907:9693:b0:961:be96:b0e7 with SMTP id
 hd19-20020a170907969300b00961be96b0e7mr3884770ejc.48.1683023285420; Tue, 02
 May 2023 03:28:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230424152717.1333930-1-peter.maydell@linaro.org>
In-Reply-To: <20230424152717.1333930-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 May 2023 11:27:54 +0100
Message-ID: <CAFEAcA8Pmk5U5BWD61mWNo=X_SLX9P_1sfuOwKFPT8rCp0CDHA@mail.gmail.com>
Subject: Re: [PATCH 0/3] hw/arm: Fix raspi,
 aspeed bootloaders on big-endian hosts
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 24 Apr 2023 at 16:27, Peter Maydell <peter.maydell@linaro.org> wrot=
e:
>
> Both the raspi and aspeed boards load their secondary CPU bootloader
> code in a way that only works on little-endian hosts. This patchset
> fixes that by making them both use the write_bootloader() function
> in boot.c, which gets endianness-handling right.
>
> Patches 1 and 2 are essentially a patch from C=C3=A9dric from a few
> months ago:
> https://patchew.org/QEMU/20230119123449.531826-1-clg@kaod.org/20230119123=
449.531826-9-clg@kaod.org/
> I've split it into two patches and tweaked it a bit.
>
> These fixes let us run the avocado tests for these boards on
> big-endian hosts.



Applied to target-arm.next, thanks.

-- PMM

