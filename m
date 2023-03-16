Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82CE06BC61F
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 07:33:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pch9b-0001NT-1m; Thu, 16 Mar 2023 02:31:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1pch8t-0001M8-KQ
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 02:31:19 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1pch8r-0003Qm-Lb
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 02:31:15 -0400
Received: by mail-ed1-x533.google.com with SMTP id w9so3479774edc.3
 for <qemu-devel@nongnu.org>; Wed, 15 Mar 2023 23:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678948272;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IL//WyywUmFHKYonq+S1+bshJTJZrhHL52b5xkaBBc0=;
 b=WPbKHKG5sQw4ZNvmDaKuGMK2noFxL4GqjScnz4SKhl+NUId8iFVU/TFXuYIDvdoKvo
 j3CyR4k5PdbBKbqeowTYTxL/kjHaHMhdnUXw2R10zsqzEBZGY64jVPwoTRcjzlcoVnnE
 GxsDL0nCSR/cT8NmJZlUKwuGYXA5/dmoc2CpTeU/p7/sywhF9VH69XKFmXWeq1/Uk8h2
 qCqItyyrkZ0+CQ1dLPRaYA1/HWgo8z35zISbdzA/p0ST+jjgVJ1qaYNPaXL/ROdhcA2f
 i9oxBEF2GtnBFjk4yliZMQmyO04WJzW2HoWc8ZQiZOyWWnIh53wl9LZd6QRZN2aJOOOA
 u9/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678948272;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IL//WyywUmFHKYonq+S1+bshJTJZrhHL52b5xkaBBc0=;
 b=RjWqZKtImZ9FHdLBPfJH0u8X0wl8k9JimH4S64wKA/s4jgPVWu27PItCFIHOFN6u8V
 GWNoNNPm6mt6YO6lrpT4ZrgFn2eU55I1HApAk0nG7/NP03ubEO8m2Ay769p4M98rzL5J
 rR5je78s7pKy9TjLU6GmFVd1HYgxey2BWNZfJvMuA+cT8a2rE09/qW0ToPjuOqBSipuZ
 peSiP5PvEW4LHePjWoffEM4kxzuxa3VOg8pnmtsF5v3e0+ferlg1evO09M+l4aBcMnbT
 XuQt+wNI8pkIIFGeL/J/2yyXbghB05jQLrWCT/vQ8nvWjlQ9sIDd72d+bK4qSWcbrZVI
 bKXg==
X-Gm-Message-State: AO0yUKUSC0eKnRcAShPfPTlYXg1iwCXkKax6WXm8iG/iAM4IQ6MTEbJV
 i6bVtCgUeYkdcHdr1jscnigdMv8sdFiUD+O9YU0=
X-Google-Smtp-Source: AK7set9SsJeXNwPtuYKkF3HYj44FUFt47BXNIgGxxPBdOpD+V8j85dIEGEDCINgUe2IEo60w3XnlmX4MtWg5dlkUav4=
X-Received: by 2002:a17:907:2104:b0:930:310:abc9 with SMTP id
 qn4-20020a170907210400b009300310abc9mr1041140ejb.9.1678948271872; Wed, 15 Mar
 2023 23:31:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230310180332.2274827-1-alex.bennee@linaro.org>
 <20230310180332.2274827-10-alex.bennee@linaro.org>
In-Reply-To: <20230310180332.2274827-10-alex.bennee@linaro.org>
From: Strahinja Jankovic <strahinjapjankovic@gmail.com>
Date: Thu, 16 Mar 2023 07:31:00 +0100
Message-ID: <CABtshVTUwomhr0fggG2cVzbG3m1pzcbWxBEHfswnS3nBJXa0Xw@mail.gmail.com>
Subject: Re: [PATCH v2 09/10] contrib/gitdm: add more individual contributors
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Bernhard Beschow <shentey@gmail.com>, 
 Amarjargal Gundjalam <amarjargal16@gmail.com>, Bin Meng <bmeng@tinylab.org>, 
 "Jason A . Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=strahinjapjankovic@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Mar 10, 2023 at 7:03=E2=80=AFPM Alex Benn=C3=A9e <alex.bennee@linar=
o.org> wrote:
>
> I'll only add names explicitly acked here. Let me know if you want
> contributions mapped to a company instead.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Bernhard Beschow <shentey@gmail.com>
> Cc: Amarjargal Gundjalam <amarjargal16@gmail.com>
> Cc: Bin Meng <bmeng@tinylab.org>
> Cc: Jason A. Donenfeld <Jason@zx2c4.com>
> Cc: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
> ---
>  contrib/gitdm/group-map-individuals | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/contrib/gitdm/group-map-individuals b/contrib/gitdm/group-ma=
p-individuals
> index e2263a5ee3..0e4618f1ce 100644
> --- a/contrib/gitdm/group-map-individuals
> +++ b/contrib/gitdm/group-map-individuals
> @@ -38,3 +38,8 @@ paul@nowt.org
>  git@xen0n.name
>  simon@simonsafar.com
>  research_trasio@irq.a4lg.com
> +shentey@gmail.com
> +bmeng@tinylab.org
> +amarjargal16@gmail.com
> +strahinjapjankovic@gmail.com
> +jason@zx2c4.com
> --
> 2.39.2
>

Acked-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>

