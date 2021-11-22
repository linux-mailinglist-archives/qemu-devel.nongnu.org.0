Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8EB458DAE
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 12:45:25 +0100 (CET)
Received: from localhost ([::1]:49052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp7lA-0004Gj-LS
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 06:45:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zltjiangshi@gmail.com>)
 id 1mp7kD-0003b3-U7
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 06:44:21 -0500
Received: from [2a00:1450:4864:20::32d] (port=50849
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zltjiangshi@gmail.com>)
 id 1mp7kC-0008AX-I9
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 06:44:21 -0500
Received: by mail-wm1-x32d.google.com with SMTP id 133so15072281wme.0
 for <qemu-devel@nongnu.org>; Mon, 22 Nov 2021 03:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6rrqR/QH+Ioe0D3HlAbLd0NZL6fTd6FJwBg6T/5LXUs=;
 b=PESFEmZWlQhJJbvWOHnOXSf4ONdQhw3G2kr/3uGp5KYEL9oN+bQ6kOViIxD+5Zyu/j
 z/hlsOK+lK+Cc/AAygHsnR61eaeqMgamZmrD8Y6XZmquXbjU9Z83P6Of0IvjcSXd1tuY
 FkojTHq59BVRpe0DzwaoCvmoCdl/b7W6UDfIFQcFtP/EtFpH5oyvkNSpkrJYGtoIeqg5
 ca5GpCdFEeHCVNJtZOySacwgwOWxRFsoUchgcfs3bDc4PTb2twxBnaOsXQLTAIL8vrwZ
 +kRG9zvSWS5Rvg9qBZC5qDeeU6P+TSpPzb0isUFt8PKHgTWKQBUG6p+pmpGXb621KWUi
 f87w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6rrqR/QH+Ioe0D3HlAbLd0NZL6fTd6FJwBg6T/5LXUs=;
 b=wTzfQt5IFNU9rdL2r5nUo1qn042PTuRYTMmp1ZlQSCGXsVVwa8RWNSdd6fh8c4Gxyw
 lsNKamDwjMnhJmWkmPSEfCByiFsX/wcC8pXGfFhniPKyBJ2ZEOCLK/51BskOIK1kawUV
 5Syc1cSt0ibHYdJV5B+83R7VBA5BDSfdCv2dPXCOdzoIasPfvqi1u6CQfX5U34egxUZ8
 YOAxfwWB3fyh47kksc3cYWv5KF5MZtzvVcixa6aN+px5Lmk4GRa0gVMRfAkAh39Bs1ak
 ai4D3kw36R8nMuWNLxMGTVo16Y4CajknrXxKfBeUEk9mp8X8zMExYzDga4CL3LxEKzAa
 YxaA==
X-Gm-Message-State: AOAM532/TU9W8e1l0oeyrSZvOIZG4tqYU7qeaLCiryh+V8zgMSYUAFaI
 61OCXtjmILIJ3RKiIwJCL7/qQgVXSrqUNDTcbDo=
X-Google-Smtp-Source: ABdhPJxg5k47Ozr7jlbpgGcku3X5Jrny8cdh1j2Dl8BUkf81qeO/tnDhvQFrTSaATlG3MorQ/nOqOC4bnlEEC/k/T2o=
X-Received: by 2002:a05:600c:3b27:: with SMTP id
 m39mr30517462wms.132.1637581458618; 
 Mon, 22 Nov 2021 03:44:18 -0800 (PST)
MIME-Version: 1.0
References: <1637302410-24632-1-git-send-email-gaosong@loongson.cn>
 <1637302410-24632-20-git-send-email-gaosong@loongson.cn>
 <9195824d-31d2-f2e8-610b-f8f86d687707@linaro.org>
 <d5fed5e0-3708-4891-03e6-868986dea360@loongson.cn>
In-Reply-To: <d5fed5e0-3708-4891-03e6-868986dea360@loongson.cn>
From: chen huacai <zltjiangshi@gmail.com>
Date: Mon, 22 Nov 2021 19:44:06 +0800
Message-ID: <CABDp7Vqamk6jDz+=BC8-CxARM0VMt1b=-yZX4hMbqLQPv_Q_DA@mail.gmail.com>
Subject: Re: [PATCH v11 19/26] linux-user: Add LoongArch signal support
To: gaosong <gaosong@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=zltjiangshi@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-level <qemu-devel@nongnu.org>, maobibo@loongson.cn,
 Laurent Vivier <laurent@vivier.eu>, chenhuacai@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, all,

On Mon, Nov 22, 2021 at 7:41 PM gaosong <gaosong@loongson.cn> wrote:
>
> Hi Richard,
>
> On 2021/11/20 =E4=B8=8B=E5=8D=886:33, Richard Henderson wrote:
>
>
> Drop all of the the inline markers.
>
> +{
> +    int i;
> +
> +    __put_user(env->pc, &sc->sc_pc);
> +
> +    __put_user(0, &sc->sc_gpr[0]);
> +    for (i =3D 1; i < 32; ++i) {
> +        __put_user(env->gpr[i], &sc->sc_gpr[i]);
> +    }
> +
> +    for (i =3D 0; i < 32; ++i) {
> +        __put_user(env->fpr[i], &sc->sc_fpr[i]);
> +    }
> +}
>
>
> Missing fcsr and fcc.
>
> I'll note that the kernel is missing sets of vscr and scr[0-3].  IMO they=
 should at least be zeroed in advance of supporting the vector extension.
>
> I see that vcsr set at [1]:178.
> [1]
> https://github.com/loongson/linux/blob/loongarch-next/arch/loongarch/kern=
el/signal.c
>
> and I also see that the kernel is missing sets of scr[0-3],  Huacai is th=
at right?
scr[0-3] is reserved for binary translation, it doesn't need to be set now.

Huacai
>
> Thanks
> Song Gao



--=20
Huacai Chen

