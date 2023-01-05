Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B846C65EA5F
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 13:05:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDOzi-0003Fe-Pq; Thu, 05 Jan 2023 07:05:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDOzf-0003D8-Ma
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 07:05:11 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDOzd-00031J-TK
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 07:05:11 -0500
Received: by mail-pf1-x431.google.com with SMTP id a184so14375871pfa.9
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 04:05:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=oFYvXyd2SWmjUBDOxsVyjRGoQwPiLrpWkNxKegS2YAA=;
 b=L/6pXTRKX0408/qwuMTJxivI2W74CQVIjcZP0o5wxedCMDFYt3xj6/aWNE4UDoksRD
 AiCydc+9LGI6L2oT4mPmlwLucynn8tAeAKnjJq+Ih6bFC1KUNhg2A3mRdiA6Lpgwx0Mc
 kF5kJBfgdNWm4cv8/TOdGHySKFtja5s6ljk4Fk179Ib4inSk2bzMaBOWwnrcMjlAJ9Fm
 UHT9Gtl/44sDzkYuppLVDp5ItOdAGuZ0SG7UJBobII3uJlqi0vSQY6QbIrUI8Xs14aH6
 lIYLxdWBv072gDXa44sg7xEhhY0/4+p9GrV8xBlPKXYjBBIz2hknhIwSEOGgU7TxIpW2
 JMZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oFYvXyd2SWmjUBDOxsVyjRGoQwPiLrpWkNxKegS2YAA=;
 b=x2B3Sda/PFnR9OtoVRXzXy+ObyzJVw2oGuwge1M4G637jMheTDIy84G8UC6vx7ncK8
 ANqeB+EtgKddG84rfDWymZWeggP9Mp9a6FTqkYHBJ3V2kgDWs0bYhxFm6tuQlbssFnUz
 P7LNyG34dyFO4dKe0iWLaHU0vVhfWIYWUvkr1sb70wTHbSo0Vb3gowxnkZRc0bSOSld2
 bYPc3XuQm64+gfEC6IH6NS6mmZXKtZsku8hg+9s8p8pnd9eeI3rND6sCdCpC709MIobm
 a5GbBf3Rgwy/sR+8U4MEhZ0/H/ENTn6pSBXXtZn3AzIQ13/JWNVD5gyvOoENk/Yo5i5A
 Hf8A==
X-Gm-Message-State: AFqh2kpXqK/VEfv0l3P1CktzkRndBc+q/JDMSBi4eFHo3AM4GGvaCFLZ
 7Z8IeHkSxFXlGxyrBQUqPzSDQRw2XF79KlgjGTohwt4DVWo7Ww==
X-Google-Smtp-Source: AMrXdXussnqR1BiCS2WE9WEgJ8RSIcpswZruwP6BDfOLLwTS3dF8S4tE++v1OlhnsiO4FU93YenkYV/i8KjnFT0UzIU=
X-Received: by 2002:a63:3d4:0:b0:492:50dc:da4d with SMTP id
 203-20020a6303d4000000b0049250dcda4dmr2312564pgd.192.1672920308185; Thu, 05
 Jan 2023 04:05:08 -0800 (PST)
MIME-Version: 1.0
References: <166990932074.29941.8709118178538288040-0@git.sr.ht>
 <166990932074.29941.8709118178538288040-6@git.sr.ht>
In-Reply-To: <166990932074.29941.8709118178538288040-6@git.sr.ht>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Jan 2023 12:04:57 +0000
Message-ID: <CAFEAcA96141q+bPn879FxWPbPe6XZWWhtuHhHfXGCCi0ALpWgg@mail.gmail.com>
Subject: Re: [PATCH qemu.git v3 6/8] hw/timer/imx_epit: factor out register
 write handlers
To: "~axelheider" <axelheider@gmx.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Thu, 1 Dec 2022 at 15:42, ~axelheider <axelheider@git.sr.ht> wrote:
>
> From: Axel Heider <axel.heider@hensoldt.net>
>
> Signed-off-by: Axel Heider <axel.heider@hensoldt.net>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

