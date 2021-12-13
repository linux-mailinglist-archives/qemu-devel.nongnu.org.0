Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15143472BD3
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 12:58:14 +0100 (CET)
Received: from localhost ([::1]:38494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwjy9-0000ti-47
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 06:58:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mwjuj-0007mL-2E
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 06:54:42 -0500
Received: from [2a00:1450:4864:20::431] (port=34530
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mwjuf-0005Ir-T6
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 06:54:40 -0500
Received: by mail-wr1-x431.google.com with SMTP id j3so26633458wrp.1
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 03:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=daXwgMDdtjMg/AP0Ntmb/QqzZUarraLjIEcPbo/cJUk=;
 b=Ryi9bcWNY4eJAwxhV1zi+J22EsuPFZMAylD2/x2TGj8iCCMt3nkK/j97prT+U6HVNz
 i/Dmw8YXGYg8DCLsOzES228TLt+YWeFIg1kWh5mqBHlHALlz3M+5h0CLJol/++FZMRXQ
 bYOzU3poroXHaMPBd+KKj57GN61w6+7RKTFztmgs8yFQCsYhASE6vNSx4nGy/qEPakiQ
 ALsWKtYFBh1sallC+Itd06M3tO5o0vQzL6oVB8W79aRL5zLiEkyet2z2ND4uoUNo4nhy
 q842eVIsv8Q8MjCM0S4uc/nzCHioG2YtZBBY6l6QRJezbftyKiFDarAgh5YqvYZzbqBE
 If1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=daXwgMDdtjMg/AP0Ntmb/QqzZUarraLjIEcPbo/cJUk=;
 b=2d1Vi4TCIe6m+41s4CIbXfL82AYdsW/xIq5LBEUbOftyDPVwAnasypWldBVT6QiTPk
 nkoRnMP9IIAHfEq84DNsBJwl4VJamLtZ037arFvcLJ6wRhUnss0SPgl424PwXPCWxys2
 lw8O2xLJsuyJjemqXrg4TeJdrhvxqN8RybTaO1NrT17fLbr3mIKBqxFZczLyUU47Z5so
 VtDdkU538GjKvymj/wUvuAjfY7kDDWCTf7XprHg2IICfilVLbLdsmrqIwvGlv8xlX2Ma
 RxhF9OeSwFPosnGRapfdQ+BRlgg/AeYzuzuPJiGPe5et/uEpUYq1Vs0GNTqvkDLVzIHL
 VQAw==
X-Gm-Message-State: AOAM530GC7lMM3GUyRkjXDD58LCJ24EYP9lYj71fMzf8QBfD4LapsIkL
 o34l8HJWAJ4PBT7ZkfQwtxxPfQ==
X-Google-Smtp-Source: ABdhPJyT5pvTCAR7ujWO8xydGlKdnlIlwx7zJa8um22TS5HWXBDRvrCUFLem6uMJDJ0MMlxWB1DWUA==
X-Received: by 2002:adf:f150:: with SMTP id y16mr16400055wro.686.1639396476469; 
 Mon, 13 Dec 2021 03:54:36 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p6sm10456105wru.41.2021.12.13.03.54.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 03:54:35 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 45D791FF96;
 Mon, 13 Dec 2021 11:54:35 +0000 (GMT)
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-10-peter.maydell@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 09/26] hw/intc/arm_gicv3_its: Correct handling of MAPI
Date: Mon, 13 Dec 2021 11:54:12 +0000
In-reply-to: <20211211191135.1764649-10-peter.maydell@linaro.org>
Message-ID: <877dc8n2is.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> The MAPI command takes arguments DeviceID, EventID, ICID, and is
> defined to be equivalent to MAPTI DeviceID, EventID, EventID, ICID.
> (That is, where MAPTI takes an explicit pINTID, MAPI uses the EventID
> as the pINTID.)
>
> We didn't quite get this right.  In particular the error checks for
> MAPI include "EventID does not specify a valid LPI identifier", which
> is the same as MAPTI's error check for the pINTID field.  QEMU's code
> skips the pINTID error check entirely in the MAPI case.
>
> We can fix this bug and in the process simplify the code by switching
> to the obvious implementation of setting pIntid =3D eventid early
> if ignore_pInt is true.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/intc/arm_gicv3_its.c | 18 +++++++-----------
>  1 file changed, 7 insertions(+), 11 deletions(-)
>
> diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
> index 15eb72a0a15..6f21c56fba2 100644
> --- a/hw/intc/arm_gicv3_its.c
> +++ b/hw/intc/arm_gicv3_its.c
> @@ -354,7 +354,9 @@ static bool process_mapti(GICv3ITSState *s, uint64_t =
value, uint32_t offset,
>=20=20
>      eventid =3D (value & EVENTID_MASK);
>=20=20
> -    if (!ignore_pInt) {
> +    if (ignore_pInt) {
> +        pIntid =3D eventid;
> +    } else {
>          pIntid =3D ((value & pINTID_MASK) >> pINTID_SHIFT);

This would be worth cleaning up with field accessors at some point.

Anyway:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

