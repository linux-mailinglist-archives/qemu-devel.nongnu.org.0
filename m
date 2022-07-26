Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1B4581432
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 15:31:55 +0200 (CEST)
Received: from localhost ([::1]:47862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGKf9-0000ld-Hd
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 09:31:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1oGKZu-0003Xi-MD
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 09:26:28 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:35634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1oGKZp-00039M-62
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 09:26:23 -0400
Received: by mail-ej1-x635.google.com with SMTP id j22so26171760ejs.2
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 06:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=livius-net.20210112.gappssmtp.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=VLVlje7T4b0UxxueE57S/rCMTA2p69AjKh0UmHdW0SU=;
 b=Ga9gvRGKEj9ekcKvWb7ZNWwfwoDM/1bLasCoevRnhRbZpZsh7Tg267mc2czjGMgLsm
 aA4498tCXcbReyq8lojad+Lpr6eS7KiGkLb8fFrBnj3MQNWxJBOXqgCFt0kBxftUcdHw
 RC6+k5E0A0nepyLz1IUBedTylY2+DvNiCpp2xDS2vVwX14S2ICIQrWVswFPXDW49WrWh
 z7oWNnxEXzLYAwwHs4L2E8TLenSjo7Yb5R+H6bhRGDVtlGFGD1M8pbmY4krh4zn+I6yh
 n+G9esTEyWPOgEtgXfbqpkAvSfu8eG0U73qICYt/vqFJy4xkO8oHnmv1OBZJp2vpgV9+
 C89g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=VLVlje7T4b0UxxueE57S/rCMTA2p69AjKh0UmHdW0SU=;
 b=pwqhedHw8kaGt5DitoXtGJcF5ZhHaq/0gp71MfrfsOV2bgBIrLm6vDJ8Bllom0aQnc
 CbxozBq25z/D2gYn22hFsuL+22495rPmmFbwbABruVnE+Oa8mBwYcj21IEAINtklYXha
 s1xzZelfV8jfdB2dyDq+ja1kfi8805asmg/fwOovrH9962Alnf8f2BnbrvwdP3iHldFL
 254BsjZ3XzhSSYeYvFTV6JK3WoGtgbM1FJhV0WZ2pp22AmbNx1Xzat9aw6NwLTPZ0IFR
 JhwkDBwBvUtP2plHF2iaeGzNZ4wKBtp2jYlspxpKLXDC6+r5UcooSTk3agq5gb7tBEgO
 2NKA==
X-Gm-Message-State: AJIora/PDk2iGbKMSWoHLNnOUvAO5ZcM2dqEOPTa6YCS1PeqNmC0iGg7
 WzoA3wJ115eYqF/Mvj7MY56f0Q==
X-Google-Smtp-Source: AGRyM1tN6JBeBgRNpGhgxNF6EMLyI/SwmBHl5Y6sLTm6HyN66Xt0QMkChdvFSKnq3ikziw4APm3hvw==
X-Received: by 2002:a17:906:9beb:b0:72b:4a68:ffdf with SMTP id
 de43-20020a1709069beb00b0072b4a68ffdfmr14465736ejc.21.1658841979338; 
 Tue, 26 Jul 2022 06:26:19 -0700 (PDT)
Received: from smtpclient.apple (5-12-52-36.residential.rdsnet.ro.
 [5.12.52.36]) by smtp.gmail.com with ESMTPSA id
 vp5-20020a17090712c500b0072b1e27888asm6357649ejb.50.2022.07.26.06.26.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 26 Jul 2022 06:26:18 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.100.31\))
Subject: Re: TARGET_SYS_HEAPINFO and Cortex-A15 memory map
From: Liviu Ionescu <ilg@livius.net>
In-Reply-To: <CAFEAcA-Bmaj9YEwqJzvNZtBvKP_sAZNhszqeKeiwyB2=CwMPJA@mail.gmail.com>
Date: Tue, 26 Jul 2022 16:26:17 +0300
Cc: QEMU Developers <qemu-devel@nongnu.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <10A374C0-A9C7-43CF-B194-C2D5E13C9BEC@livius.net>
References: <8F58FBA7-17C8-44F6-9798-A65FD63E0E78@livius.net>
 <BE36745B-A3A6-443A-A290-31A5578F36E3@livius.net>
 <CAFEAcA_BcnzQ1KnRh=ovKTSahHCabc61n+BHvedqjC0bD2fKOg@mail.gmail.com>
 <4B583095-ED34-4D33-A193-59666FBFAB8A@livius.net>
 <CAFEAcA8BJ+jphWCMNemBC30x+wf3PW2kqSqNz6pCHeD+RyBFeQ@mail.gmail.com>
 <C1F087EA-B319-493F-B7BC-BB94D75B443C@livius.net>
 <CAFEAcA-Bmaj9YEwqJzvNZtBvKP_sAZNhszqeKeiwyB2=CwMPJA@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-Mailer: Apple Mail (2.3696.100.31)
Received-SPF: none client-ip=2a00:1450:4864:20::635;
 envelope-from=ilg@livius.net; helo=mail-ej1-x635.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



> On 26 Jul 2022, at 13:56, Peter Maydell <peter.maydell@linaro.org> =
wrote:
>=20
> ... If you're able to figure out what your original failing binary
> setup was and repro the problem again, please send me the executable.

Thank you for investigating.=20

I'll try to revert my projects to running from flash, and, if still =
having problems, keep the binaries for further analysis.


Liviu


