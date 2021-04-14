Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF4C35F4CB
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 15:26:32 +0200 (CEST)
Received: from localhost ([::1]:50622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWfXK-0006Kt-K9
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 09:26:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWfWE-0005rV-1e
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 09:25:22 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:44684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWfW0-0001q8-T4
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 09:25:21 -0400
Received: by mail-ej1-x62a.google.com with SMTP id e14so31357597ejz.11
 for <qemu-devel@nongnu.org>; Wed, 14 Apr 2021 06:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=4+njtwIMb6WeiT2DpVXexhsut18UlXwjNhXDW6f4IlQ=;
 b=JY3xqLmGgCpaSj4gqT6XRd7V8uWK99oxS1Youwx9T9HoWSz+sd+TGArYYFTc4ejlgC
 TiX8dLftCGYoIQ1MiJM5/9OIl2HYkXMPn7L8z75hoGlX7zI5oRMIds2JQyZnWBT//SOP
 lHZp0JM1R8m1C31Uz3Nsed8pJ/kwRUXBTARL8QMZPTwfqza8PRbK+D6Zmcba41QOTKOx
 Epvhs1XmEHWNAIV4TzfqO0Cu3yr8ZRJ6eUP9fvkMcpVdp3Yz/tMo4XNkx09YdlSvlPYl
 BPw+v3RquAeS4IsQJOu7sBD7wYFjFOlVn7IymYmCUYKoln0VUon9YfEFtApgSTUDZQQh
 +oeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4+njtwIMb6WeiT2DpVXexhsut18UlXwjNhXDW6f4IlQ=;
 b=Ht5GXMoIr1CnafzlcoGttQFD0dkWi/KHDaDoquZob1fT6vlNQ91lY9ORLOSk3ENimK
 KDVxe9DDLkcKtIvjXPTeawetg8+BEsQhPn++MM1adlGjb20s08TuBrpAiZ8rcMQyfjIB
 kXauF1+8laKuhBozG1isx/NIoWd17HuSRusaHf6wI0VekwInyAZOkou+KNFDdvxPPubn
 33Ujbq5+9d9Pth8X1W/cf/c9B5pDBN9N7Nwp5egFotc/tDyan1o3aMtBIISDK1O1dH9E
 hs6xe/yNTSnHtpiBHDEcYMMNVekftqEKWuvojd/2/+OXOQ70NEX1+jDbdx+0KABVhcMq
 l2Kg==
X-Gm-Message-State: AOAM532o9f8kslIzBeRRv2uLejVG2W9WRXmmv45T64kfeSWrhr1lmtZS
 IlFacnczeupEqbs/qpDAwFrT3aDrrc6Pka4RjjuCOA==
X-Google-Smtp-Source: ABdhPJyfTeSHwFE0DUDRCeqv8lPmygfgD3wGscwe32H4C3d19vyiFBsUl+hVqWSxfoeyh2M43XfrZT8dMkte+ypdNLo=
X-Received: by 2002:a17:907:629e:: with SMTP id
 nd30mr37539831ejc.407.1618406706545; 
 Wed, 14 Apr 2021 06:25:06 -0700 (PDT)
MIME-Version: 1.0
References: <554c28f.2f15.178cec36fd2.Coremail.fxm16899@163.com>
In-Reply-To: <554c28f.2f15.178cec36fd2.Coremail.fxm16899@163.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 14 Apr 2021 14:24:20 +0100
Message-ID: <CAFEAcA9Ar9AWnUAnDmPJXCPtZHGNujdOoCFZufMctRkX01o+3A@mail.gmail.com>
Subject: Re: set qemu support serial crtscts
To: =?UTF-8?B?5LuY5bCP5piO?= <fxm16899@163.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 14 Apr 2021 at 14:18, =E4=BB=98=E5=B0=8F=E6=98=8E <fxm16899@163.com=
> wrote:
>
> HI, I have find qemu serial not support crtscts. This result some
> machine not communication, because this machine need crtscts

Could you provide more detail, please? For a bug report it
is useful to know:
 * what you were trying to do
 * what happened
 * what you expected to happen
 * full details like the QEMU command line
 * what guest software you were running

Ideally, the report should have everything we need to be
able to reproduce the problem ourselves.

thanks
-- PMM

