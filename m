Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3560B644759
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 16:02:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2ZSO-0002BE-V6; Tue, 06 Dec 2022 10:02:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p2ZSK-0002Ai-KB
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 10:02:00 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p2ZSI-000586-SP
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 10:02:00 -0500
Received: by mail-pl1-x62b.google.com with SMTP id k7so14163296pll.6
 for <qemu-devel@nongnu.org>; Tue, 06 Dec 2022 07:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=upGRHEIcODMPb2+Q0L6p8ZlR5kFQOmKAgVHQGYYYVNk=;
 b=jTc+FCfK1TOdVn+RHZU+HuKvm+6fhNThH/AzflxDQYoPY4AyKQgIixx/sdJtCZfPGQ
 R2jOULzrTbxKbVrIvi8HiDcvB4Z/YwiUFnlu4l/ePvI1a6IWHrO0bw+GQ/O2Ert4dXni
 K8BKXx42NcFuzZcAaCwC83BAjVw6GtcTXKyzB2iJRxkYSwlE9znMAVUaNUxiRMWou2zb
 FP6h4pc6+qiKC+vClXwPE7IUIa/NxTmOIedTbbLVwj7FJnCOtvHRzFKKl4HqKWp0qvhN
 rjY939Z8cTQwRTs5gV0fw7dV8R9Aiyg5gsjMAO78Ooksdo8UVeftiEcPADttDCNn7c81
 +DHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=upGRHEIcODMPb2+Q0L6p8ZlR5kFQOmKAgVHQGYYYVNk=;
 b=TWE0UlAL5Hu5W80mV6nOb4ABUvHAi161Sk/wf76ELTMsln78gfKqsfS9PxqNZ/XDT9
 AO3VAqFKmDEtTIRtD5rEynSPWDinYmT1Hz+27XDLjkf/QxYLnZzrzwzb1uUX7sP4goER
 /qn5gTVfE9TjcvgufEnblFmuaxNgs8RCIsgS/8qDzse0PQGsM35duaZ9huol8b1RGeJJ
 EHDbKauo8yQAjHfkZmutYAxG35uEf1bSG+Y7eOpuVBOatGhAEk17oiwDQ9mZuR1LQ7PR
 ZxdL888IrZljQ++S73pj2/amgn1XEo+VmTYp4BAPX4uiBXpGC1kzMThAqc437UwchDz9
 +9mQ==
X-Gm-Message-State: ANoB5pln6zC37Soqm0PaVuCeOALPfkrgrXx4XbidFavAixrZ2u9uoz2K
 GXZZ6r1rk6/rGgxqj6r1n45BoVfliBHmtP9J52q5WQ==
X-Google-Smtp-Source: AA0mqf5dqInKTN1eptxLAu4has7P6/wCO6CiDFys2C5drU10gmPDKchZLo244MeE+wQZAovnKmv1iROX1bSlOWCcDx8=
X-Received: by 2002:a17:90b:33c8:b0:219:94b2:2004 with SMTP id
 lk8-20020a17090b33c800b0021994b22004mr20067915pjb.215.1670338916295; Tue, 06
 Dec 2022 07:01:56 -0800 (PST)
MIME-Version: 1.0
References: <20210517111111.1068153-1-f4bug@amsat.org>
 <20210517111111.1068153-3-f4bug@amsat.org>
In-Reply-To: <20210517111111.1068153-3-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 Dec 2022 15:01:45 +0000
Message-ID: <CAFEAcA_MOdDFB34pwY7bdiiYAeWSf82pgCatPcUTty68TFm3KQ@mail.gmail.com>
Subject: Re: [PATCH 02/11] exec: Restrict hwaddr.h to sysemu/
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Claudio Fontana <cfontana@suse.de>, Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62b.google.com
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

On Mon, 17 May 2021 at 12:16, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Guard declarations within hwaddr.h against inclusion
> from user-mode emulation.

They're all safe, though; none of them are target-dependent.

I wonder if we should move MemMapEntry somewhere else -- it's used
in less than 20 files and doesn't really warrant putting
it in hwaddr.h.

-- PMM

