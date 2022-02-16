Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7A24B8F3D
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 18:34:43 +0100 (CET)
Received: from localhost ([::1]:55274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKOCQ-00047f-Na
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 12:34:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nKNy7-0005vy-Df
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 12:19:55 -0500
Received: from [2a00:1450:4864:20::434] (port=46053
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nKNy5-00044Z-6p
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 12:19:54 -0500
Received: by mail-wr1-x434.google.com with SMTP id p9so4569631wra.12
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 09:19:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=KnkYmmKj7SRQUO3Dj3thwmKdeRaaizNMtuGfGC3jrIE=;
 b=lpYCURmFE7FsoC+/F2UdkEvzb8jcX5mKU4lLRJJM6PW6KH+dPRmx0ITbOh6Q48W8qf
 OeM7a8FqN/0dCe1NJJOV08yqFBNf/MuNRY6Vt/g7jsMuROr/Int0IcpSsuRUle/vwLId
 XZsqsSl/dDOxwCHWd4WtQA+T5dde2hC5DFdQkOKc7WGkZ3LxlxwsUZfuqahH59Xst+JM
 dgp8cjrSuLto48oBpsHp6/4VmQF97IJUxC3GXei7crbHb+k1DRnhUa6ldeHjvWnSd4BA
 GyG1m7TokR6Vi6f5JgtJ2Tm8dBqXCNaYNa9C6nc51joEusMFmNnGk3c8EVikSM3MBHiG
 PXYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KnkYmmKj7SRQUO3Dj3thwmKdeRaaizNMtuGfGC3jrIE=;
 b=msjNPoWjDwq02bCeO6mx4MlDqxmD5pV/+ltr4bjr/e/oYMHFJyIDEMBPYPQz1hbwyj
 77rFpHX4IaVQkSeWrx8P+no9ktf8YefQHXCxeyw6rzQPfvhQnB967+eV4I6Nhvl3eG8e
 095te1REhp4Mtwjni3V8Mske4RaqkY6Fux8ZeMR9z/+i9L0mIhaA1dnH31k1tgjNmeXg
 uCVyEkj/mV9uDEaNoBhsltBFNKXevFpnMbQdaBEtmjP8U8V3KGPNphbFvJbGfwsT5JmY
 cdd+aNmqJazNmpeBxQyqhp/qPFkx947ioEpVxlX/6YUVp7WzeuSO1gJt2frIanpYaAv8
 Sc7g==
X-Gm-Message-State: AOAM530Lfq55U8Ynh3g8mgXc0+U1ewzlZ3Z5nl0TEcf9NXXni3/tqPMq
 mQGRSs6a8v0ZczHRQxP8INsXh//6W1KPMd5VnBXebA==
X-Google-Smtp-Source: ABdhPJwQ/BTswfO3wRULc6ACrO0BqWHAEnV4+QTal0oXcMEQYCNhgcR68ei8zuvfOPEB2D2rAIk2xKYHtqniW4DX7bc=
X-Received: by 2002:adf:d20e:0:b0:1e4:a0a0:9da2 with SMTP id
 j14-20020adfd20e000000b001e4a0a09da2mr3045326wrh.319.1645031991827; Wed, 16
 Feb 2022 09:19:51 -0800 (PST)
MIME-Version: 1.0
References: <20220215170106.95848-1-f4bug@amsat.org>
 <20220215170106.95848-5-f4bug@amsat.org>
 <1872c662-9363-6d49-d057-9be7ab7c6e0b@linaro.org>
 <5356ac8a-cfbf-cfcb-13c5-872ecaf7bed2@amsat.org>
 <996032dd-4f00-6480-a485-80d49fb70c67@gmail.com>
 <02c7d441-815b-2fd8-21dc-8357b5cd6ebb@amsat.org>
In-Reply-To: <02c7d441-815b-2fd8-21dc-8357b5cd6ebb@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 16 Feb 2022 17:19:40 +0000
Message-ID: <CAFEAcA8V-PAwbtPWghvyjgKtzi949F6g9TnBJpLsGGHt51J64w@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] configure: Disable out-of-line atomic operations
 on Aarch64
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.978, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Andrew Jones <drjones@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 16 Feb 2022 at 17:18, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
> Thanks for the pointer. And the next section is
> https://clang.llvm.org/docs/Toolchain.html#atomics-library :)
>
>    Clang does not currently automatically link against libatomic when
>     using libgcc_s. You may need to manually add -latomic to support
>    this configuration when using non-native atomic operations (if you
>    see link errors referring to __atomic_* functions).

We deliberately don't link against libatomic at the moment...

-- PMM

