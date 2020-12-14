Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D48932D9683
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 11:44:50 +0100 (CET)
Received: from localhost ([::1]:38932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kolLV-0001av-Ua
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 05:44:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kolJP-0000S0-8i
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 05:42:39 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:39394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kolJN-0003jW-HG
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 05:42:38 -0500
Received: by mail-wr1-x443.google.com with SMTP id c5so12319709wrp.6
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 02:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=A1BWTcZfIxMDkYcCU1MvxP80L1OOZzsge52UxtjmEaQ=;
 b=Kmk4S++TfYbq8N87Vfc0gARQUsOAsxLWqrblua9YxP1/pOKLdnLWTfuDFWKGIfOPzM
 NP8KQ/HY0CSOXckpgbYjIxkPXLc34doRQQI5SI3dS/MH3e58e65C/t9g5hmp/bSISael
 S8ZZP8H9nFCasPIKfo6zyNXDklZyKVm9nfZzMcLdRWhjBOogJYCByDZ9R7wSxjnIVotR
 Z/HIjbHZA+YWSo7XSgdjRE4kNVdSISeYm3aqCWxlLPW/H1ZQbCzlP9CW7101jOSls9qR
 rPXwnDGES/RDdoVhfsYbz5aVaaddDgZt6FEskcxoNStwAMYeczjpyASnRFQL26+a9A6v
 Yu2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=A1BWTcZfIxMDkYcCU1MvxP80L1OOZzsge52UxtjmEaQ=;
 b=k7go3WsSBN2sSUqSPiMau8lhueNQxsrP98j2S47gjAtWsQrCrmLKrWaoFD4Pv+DUUQ
 Q18j8zX/OMn9FgtTHTxy4ebYBizgpUFHMmFHBHmqdKXndfg2WoA+nwfME/ZVVbnnQQBU
 dfsM8fdbLE2Bd/19m7hDhd1Z90eIGPfVSJuyVeH3YQEIN8CM8GtLeaG/h0IvtcwaRB5t
 CDzn8zQJJJi6Cxsj2s5WHW+9kbcU/j8NEMToiwmg7b5dT2MglBIDXoJsMjcuOYzoKo7a
 SjXcSE12Pw87IJLbuZ2sPw//P9G8AUFZkzxkoaws2SHI2mt+EnR7wMhjAxCl+DJcgHNm
 B0tQ==
X-Gm-Message-State: AOAM532CoyTUDfNm6UMVU31Vwly0Yzyo4LNcM9ZhcYPGkOvA/7EkjL9S
 MK/IcQZvTTIbAQSSDSNml9lteg==
X-Google-Smtp-Source: ABdhPJwb1oCTAZEu8BqFfyycMgQ3bLmtiOtqCKRo+SxE2YpmlkSu67U6+HAJfRdHIyKGgGE0lrFypg==
X-Received: by 2002:a5d:650f:: with SMTP id x15mr28428869wru.332.1607942555876; 
 Mon, 14 Dec 2020 02:42:35 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h5sm33111170wrp.56.2020.12.14.02.42.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 02:42:34 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3BFE01FF7E;
 Mon, 14 Dec 2020 10:42:34 +0000 (GMT)
References: <1607937538-69471-1-git-send-email-bmeng.cn@gmail.com>
 <1607937538-69471-4-git-send-email-bmeng.cn@gmail.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH 3/3] hw/arm: sabrelite: Connect the Ethernet PHY at
 address 6
Date: Mon, 14 Dec 2020 10:40:43 +0000
In-reply-to: <1607937538-69471-4-git-send-email-bmeng.cn@gmail.com>
Message-ID: <878sa0vfc5.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x443.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Bin Meng <bin.meng@windriver.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Bin Meng <bmeng.cn@gmail.com> writes:

> From: Bin Meng <bin.meng@windriver.com>
>
> At present, when booting U-Boot on QEMU sabrelite, we see:
>
>   Net:   Board Net Initialization Failed
>   No ethernet found.
>
> U-Boot scans PHY at address 4/5/6/7 (see board_eth_init() in the
> U-Boot source: board/boundary/nitrogen6x/nitrogen6x.c). On the real
> board, the Ethernet PHY is at address 6. Adjust this by updating the
> "fec-phy-num" property of the fsl_imx6 SoC object.
>
> With this change, U-Boot sees the PHY but complains MAC address:
>
>   Net:   using phy at 6
>   FEC [PRIME]
>   Error: FEC address not set.
>
> This is due to U-Boot tries to read the MAC address from the fuse,
> which QEMU does not have any valid content filled in. However this
> does not prevent the Ethernet from working in QEMU. We just need to
> set up the MAC address later in the U-Boot command shell, by:
>
>   =3D> setenv ethaddr 00:11:22:33:44:55
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

As you are giving this board some attention is there any chance you
could be persuaded to add an entry in docs/system/arm (linked from
docs/system/target-arm.rst) to briefly describe the board and what is
known to work and boot on it?

--=20
Alex Benn=C3=A9e

