Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E43F3D0461
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 00:17:14 +0200 (CEST)
Received: from localhost ([::1]:46504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5y37-0002Bu-CB
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 18:17:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5y0m-0007lM-17
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 18:14:48 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:37768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5y0k-0007l7-AW
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 18:14:47 -0400
Received: by mail-wr1-x42f.google.com with SMTP id i94so42698wri.4
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 15:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=N/Jori2RquZGl3uJ8zYrOfBzZGVjJQzTmfvIle2OWVc=;
 b=qSd4/1tploigI7uKrNBMde2/t5pWasQSvZrF1NM9Aci8R7raKUMRLUSHzFb/PgsNnM
 rkj11bkw3flTsb3Ylz5HTpZmIQyBURLw0MYJa682tpRyAGBuhga3X9tsdM2g1TpwdnJB
 3sSlXW0WIaSC3nNVdZLmBriNNun1WpwR0bLbIyQNn3VGEd0V1BUEPtQ+fMfyxCUDAnQV
 qBh4M2iFPpdF7tG8m+AOVKqsjo2pioou/RBPee7zJkhbu/pg74RRaUaZePuYBys6br/Q
 HB2ao0KYJC9VfFcT1cKWZCI7Hp5tsESnnAtTxyAyqixGtrhJXjJTo9xtBKZM2XIi+BWK
 HdDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=N/Jori2RquZGl3uJ8zYrOfBzZGVjJQzTmfvIle2OWVc=;
 b=G/rCnEq8ti4pky1cUDj1APHl4PuarK1iP5vTZUBvdpXlxiiDJdi9earV2J1dfDX/AC
 cskVBfzvrr5ik4JxA4AXetpMBYuvDhh9/mHFajiL4pRv3wYcMIvycyMRpGD3PYvQWw19
 NHWfHeBUrQKVQAt189Wqa/DEWDowZTxqCFXwv4EJ97lGjBqUHFCElKi6IC9VX7NtTh+E
 tvK/UzKx4MtoOIReo+P3dovJhWyXgXODbxxyGK5NgEngGhjfFMzykAdeVLr08NrfCNb+
 iqgCdKWZavJi8yTrOpof7kjVpy4x1ZBg8ds5fZJJfGtMKel4Z/MAHSF9VYAh0Y7MoQP3
 Sn7A==
X-Gm-Message-State: AOAM533Wdkppj0t22zDxuVR3xt/NM6Hx2023Ra0PUfdBBTtIgHz65GIL
 cNFhFb+AMhzQmMiyJUYCrFd0Bw==
X-Google-Smtp-Source: ABdhPJxHdIckTWuklCwSHK2vo4hVO3TieVvFAcGcTi7op4A2xSyJocokBDVqo9812MKSQc38Q30VVQ==
X-Received: by 2002:a5d:6da2:: with SMTP id u2mr37987360wrs.134.1626819284455; 
 Tue, 20 Jul 2021 15:14:44 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z13sm25597830wro.79.2021.07.20.15.14.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 15:14:43 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B28481FF7E;
 Tue, 20 Jul 2021 23:14:42 +0100 (BST)
References: <20210720195735.3934473-1-aaron@os.amperecomputing.com>
User-agent: mu4e 1.5.14; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Subject: Re: [PATCH] plugins: Fix physical address calculation for IO regions
Date: Tue, 20 Jul 2021 23:14:34 +0100
In-reply-to: <20210720195735.3934473-1-aaron@os.amperecomputing.com>
Message-ID: <87v954ljjh.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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
Cc: richard.henderson@linaro.org, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, cota@braap.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Aaron Lindsay <aaron@os.amperecomputing.com> writes:

> The address calculation for IO regions introduced by
>
> commit 787148bf928a54b5cc86f5b434f9399e9737679c
> Author: Aaron Lindsay <aaron@os.amperecomputing.com>
>     plugins: Expose physical addresses instead of device offsets

Queued to for-6.1/fixes-for-rc1, thanks.

>
> is not always accurate. Use the more correct
> MemoryRegionSection.offset_within_address_space.
> ---
>  plugins/api.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/plugins/api.c b/plugins/api.c
> index 5c1a413928..ba14e6f2b2 100644
> --- a/plugins/api.c
> +++ b/plugins/api.c
> @@ -319,7 +319,7 @@ uint64_t qemu_plugin_hwaddr_phys_addr(const struct qe=
mu_plugin_hwaddr *haddr)
>              return block->offset + offset + block->mr->addr;
>          } else {
>              MemoryRegionSection *mrs =3D haddr->v.io.section;
> -            return haddr->v.io.offset + mrs->mr->addr;
> +            return mrs->offset_within_address_space + haddr->v.io.offset;
>          }
>      }
>  #endif


--=20
Alex Benn=C3=A9e

