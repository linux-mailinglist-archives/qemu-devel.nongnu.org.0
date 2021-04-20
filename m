Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A23BA36563C
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 12:34:36 +0200 (CEST)
Received: from localhost ([::1]:34270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYniF-0005pE-Ns
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 06:34:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lYneF-0002cq-77
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 06:30:27 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:34627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lYneD-0008UV-Jq
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 06:30:26 -0400
Received: by mail-wr1-x430.google.com with SMTP id r7so25036628wrm.1
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 03:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=0+rQ76WaRDe5AJ9BNq8EvMS4QbrFFEtm3hC/rP75vEE=;
 b=gP0rxh93qrfX0r7zTcizQuRSTRa7rQDkMsd9b/egXQJy1jr9/iLm5c1ib9FAhvPIUp
 phQbnpPQ4NzyXJTlchbbzGsrxKatpka/3TnDshFfL/9f6/JNmVGjUELtLzpdGFhFQF1a
 +tH/8C34dR3Ia/8zlmthWKpSTKluE0B8i6jv3/UY3dmIM6Wrtfj2pNUwkzK8TMkOVvaG
 Wxz9YSVqckJzXkG5Y/yEsGtzd8kkxVmspYF7GF+wR5NUHQY2/9yv/b7QU8IZwD8LSsKN
 srt3Kz6itpUUxGoHTexv/tS+6XOV5QG2OFA2qZ/v128PvpeL1k4vg4+3f/LKgYtGi0JM
 unlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=0+rQ76WaRDe5AJ9BNq8EvMS4QbrFFEtm3hC/rP75vEE=;
 b=s8RPEDm77gRKqeiRhzV+U57vzvcNVvIRoZoXNysQxnWjvvU3W9RgxhNrD1bBh/C3cd
 QmX2wzeUhCqE86SYltAmiEEfgYYzCzt68L4ibemcVTclOV5YbAZ9TmiGmzvobrALiREl
 MCsqr31i9bUGCMOfr7BhYmR47hK9+DIyaKeb5i+jn3u96LgD9HY7cgBSX3DPkr6JpPOe
 nJ19mKVXpEGwbHArBrPOL3GAcjm1ZF2/BsIre8yuHT8DsEOZeSmBNst1rpP7jfJy2Aqm
 2XQOSK3nXGPNi+5cjYgcX01QI60UZW1UJNGH/8EsyOPRq/80Q7ksQhaUURpo8B8+2ycl
 AbiA==
X-Gm-Message-State: AOAM532R3c/Q5hGcUBS8MCV6oD2ulVOP1Qc+8gxM3J+b9W9TrYnugJEV
 idYmkaOYUds/65ARoEX746Ej8w==
X-Google-Smtp-Source: ABdhPJxQt88YzehL7IlqSHT7RYwpxMhu4x6Ujmn+YtBEXBrqJp1fCK/kMRejlF4p7IT8pApyY4+q3w==
X-Received: by 2002:a05:6000:1789:: with SMTP id
 e9mr18588485wrg.110.1618914624034; 
 Tue, 20 Apr 2021 03:30:24 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b12sm28700412wrn.18.2021.04.20.03.30.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 03:30:23 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 848DB1FF7E;
 Tue, 20 Apr 2021 11:30:22 +0100 (BST)
References: <20210416162824.25131-1-cfontana@suse.de>
 <20210416162824.25131-12-cfontana@suse.de>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC v14 11/80] target/arm: tcg: fix comment style before move
 to cpu-mmu
Date: Tue, 20 Apr 2021 11:30:16 +0100
In-reply-to: <20210416162824.25131-12-cfontana@suse.de>
Message-ID: <87pmyp8czl.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-D?= =?utf-8?Q?aud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Claudio Fontana <cfontana@suse.de> writes:

> before exporting some functionality from helper.c into a new module,
> fix the comment style of those functions.
>
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

