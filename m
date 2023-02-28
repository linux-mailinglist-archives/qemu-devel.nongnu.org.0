Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C766A6028
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 21:09:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX6HY-0000Ax-N4; Tue, 28 Feb 2023 15:09:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pX6HX-0000Ab-0K
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 15:09:03 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pX6HU-00074a-T2
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 15:09:02 -0500
Received: by mail-pl1-x62c.google.com with SMTP id n6so10326232plf.5
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 12:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677614939;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+DO/6Nygfb584/f/t2R+CU8DGiroPOJR0U+nP5k7K8c=;
 b=ohmr4utIRE9ASpYk8MDjDtduvRs4V5dXFN8vVEexPkmJ5wmHSJn+7gn26fdVzcUshA
 v/PmE4WsNrecZ3Nde9uYI4ybvR08LQ4hAqC3JVutV1LxTdOkb4pzJoefNBeO9pDtDRUm
 fE5VWR2wqLtOIMRBLbkXH8VduzbQBv/T5ZFqcOfHHVLmkIyWFPtuZks1WCDLBB5xR/Yt
 u/3oZcF2jC/nCex6nYsLArsFaIRRYz52RkQ6d3dBEB1avh50P7yPbVhql81VwGcR5gEU
 8WYSw7Iq6yItZvwd+84HjzLf6ni0g/4wGKBI6DAppRpW2a32+H0/1u+5U0fa+UjbLzoy
 Fd5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677614939;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+DO/6Nygfb584/f/t2R+CU8DGiroPOJR0U+nP5k7K8c=;
 b=3j3CNIDSSv6UAp/pU3qcPbWS9LG8tLe6zAzOwfgvjeuDS7n8uaOEv60EY6e/pZp8n8
 XXJLvItKkcqQe5VxtUKPal7eKyHvHyjoE+hssKsimkxzycsz+MCpxpzL5XRRwtjnpCPK
 B9HyoZQYn99ViuK3qH9pH+BEMI08JZelq//9UpifvolIm9EBXSpNJjwpxk6keamyWeHP
 E7cj75I1MV0n6biKs95bAiwXL4N1AoiCl495Jxm3l2jtKMD2x9Cr46qCM3j+B73pYGng
 1n9DGmWXLt5tgWU66Y8WjcxiRpnDDXNy1ZkKMG9M/F3+824mxQckURjvOPssPHsmrN2X
 RDFA==
X-Gm-Message-State: AO0yUKXOYDPjviKMFKkEQc5ZYU/OIcyi1gq+JeVwDyesK2HnM7IdrjTk
 2zQOc0T1705P1ar++NAx+8nwv1QmiTE/NNirv5bW9w==
X-Google-Smtp-Source: AK7set+i8nWshPPAiFP9qWyqV7rGkeTtTkfdXXn7ckTKF6ILcSPnhHJoeqGTy59iZlweSYSuwSzCitAtawgUlcsy1Sg=
X-Received: by 2002:a17:903:1314:b0:199:4a4f:9d2a with SMTP id
 iy20-20020a170903131400b001994a4f9d2amr1418987plb.13.1677614939343; Tue, 28
 Feb 2023 12:08:59 -0800 (PST)
MIME-Version: 1.0
References: <20230227213853.37885-1-philmd@linaro.org>
In-Reply-To: <20230227213853.37885-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Feb 2023 20:08:47 +0000
Message-ID: <CAFEAcA95yUEp1DO5MXg1LV_VQo7Gz8TBCEyDe=+pnRC00MBPYA@mail.gmail.com>
Subject: Re: [PULL v2 000/125] Buildsys / QOM / QDev / UI patches for
 2023-02-27
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62c.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 27 Feb 2023 at 21:40, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Hi Peter,
>
> I apologize for the size of this request, I was hoping various
> series would go via other tree, but everybody has been quite busy
> and the freezing windows is close, so I'm sending a huge mixed
> patchset here.
>
> Since v1:
> - Dropped "cputlb: Restrict SavedIOTLB to system emulation" patch
>
> The following changes since commit e1f9f73ba15e0356ce1aa3317d7bd294f587ab=
58:
>
>   Merge tag 'pull-target-arm-20230227' of https://git.linaro.org/people/p=
maydell/qemu-arm into staging (2023-02-27 14:46:00 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/philmd/qemu.git tags/buildsys-qom-qdev-ui-20230227
>
> for you to fetch changes up to 23bdd0de97a18e34fe05126fbaf4de540e9eb7b2:
>
>   ui/cocoa: user friendly characters for release mouse (2023-02-27 22:29:=
02 +0100)
>
> ----------------------------------------------------------------
> - buildsys
>   - Various header cleaned up (removing pointless headers)
>   - Mark various files/code user/system specific
>   - Make various objects target-independent
>   - Remove tswapN() calls from dump.o
>   - Suggest g_assert_not_reached() instead of assert(0)
>
> - qdev / qom
>   - Replace various container_of() by QOM cast macros
>   - Declare some QOM macros using OBJECT_DECLARE_TYPE()
>   - Embed OHCI QOM child in SM501 chipset
>
> - hw (ISA & IDE)
>   - add some documentation, improve function names
>   - un-inline, open-code few functions
>   - have ISA API accessing IRQ/DMA prefer ISABus over ISADevice
>   - Demote IDE subsystem maintenance to "Odd Fixes"
>
> - ui: Improve Ctrl+Alt hint on Darwin Cocoa


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

