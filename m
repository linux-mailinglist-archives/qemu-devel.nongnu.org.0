Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E044F6523FE
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 16:52:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7euw-0000Ua-5p; Tue, 20 Dec 2022 10:52:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p7eus-0000SN-TD
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 10:52:30 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p7euq-0006o6-QV
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 10:52:30 -0500
Received: by mail-pl1-x62b.google.com with SMTP id a9so12658997pld.7
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 07:52:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7kf1P34ufLcpQh2Pe1Vd9U8q3PbbR5BfGpeyL19m9cM=;
 b=luKasvU4BxyLubm/wby3cpMz53MJi4qhCO1iaZO5/vyFjR1k1pSrDHlYqz4CaMh+nE
 tIY+yen4gRoyr7E2DSQ+g2SpRv19y/uD8mhxNv5RG3wpgNGrUDKdu55jdQO6UBT9RVwN
 jzEHSmBqAuU9uFnBWAcgZyy+2gEQATkO/js0oOGM99Qxr19jKZqdncpnqBG3mxgEXWIX
 xuwP2c7/fX+w//rsAyEvEtY0DEDygZM2y1xeJsF8DN6UU6p4QxqWyMFp80JTe6xwEDj9
 3AzxXWlCvqRla2d7nmz7G3wDS+sYZcflJFjj/2cmymMOOOZgI4l47f/9onVyrthfgEqm
 1Vew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7kf1P34ufLcpQh2Pe1Vd9U8q3PbbR5BfGpeyL19m9cM=;
 b=pY3JhCwElrLjriYewW505Hf+LF7gqrOLMucHZNy+SuSoEcWwhRWt34PTevQAB5DZAe
 nYc1Djn0/HoTJktVaIAWdK+RhCDGhTczunhYR/BzTVuGe4I9PpF2ZPBnoSSr8CJDtPGm
 BLIRNfOHWcZ/Z4HPM/Cfvvjygz3YxBw/xNo7sM9fGZPfurhtajB6sQuLw05GyorP8WYi
 qTqBI7jEtCDrhxPDbkQbpWUdodbSqF7yCwS8LAxKX0b0LYqaGDO64+P0x4W8gBlVFy4m
 j9X3+y4/qkBsUapwfyS2zT1OticJdaZL81J8jMv+3J3D3jr4MbNSjk0nR1xgyvUWPDb2
 7I8Q==
X-Gm-Message-State: AFqh2kpLQWW0NWJVp9/qWvFL0Dk+fGDWpqVlX6tPh4ywh3rlivdBS/ZU
 stgXkTdqoE9Ic7VJsr9D5annhdU1I3w0BJBfzOI2zA==
X-Google-Smtp-Source: AMrXdXu+GDZqOzQPFUtU3pENVr4ZKS/FH9yRqEOcdMoLJNNmee3PhnHHqjgpWE3NybhjT6t4TGmcCxvuZxC7u5OvPCk=
X-Received: by 2002:a17:90b:4f8d:b0:219:9874:c7d3 with SMTP id
 qe13-20020a17090b4f8d00b002199874c7d3mr1898584pjb.221.1671551547267; Tue, 20
 Dec 2022 07:52:27 -0800 (PST)
MIME-Version: 1.0
References: <20221220145625.26392-1-philmd@linaro.org>
 <20221220145625.26392-6-philmd@linaro.org>
In-Reply-To: <20221220145625.26392-6-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Dec 2022 15:52:15 +0000
Message-ID: <CAFEAcA-JD8E3R9vq9LK9wSng+9M2BCLRt73LgKM19VVdTqXPnw@mail.gmail.com>
Subject: Re: [PATCH 5/5] hw/core: Only build CPU reset handlers with system
 emulation
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>, 
 Eduardo Habkost <eduardo@habkost.net>, qemu-s390x@nongnu.org,
 Song Gao <gaosong@loongson.cn>, 
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, 
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Thomas Huth <thuth@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
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

On Tue, 20 Dec 2022 at 14:56, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> In user emulation, threads -- implemented as CPU -- are
> created/destroyed, but never reset. There is no point in
> providing the sysemu/reset handlers there.

We do reset the CPU, the linux-user code calls
cpu_reset() after creating it (and this is required for
correct behaviour). What we don't need (and what this patch
is making system-only) is the "register a global reset
function" API (which is non-functional in user-mode binaries
because nothing ever calls the qemu_devices_reset() function
to say "run all the hooks", so it makes sense not to compile
it in).

thanks
-- PMM

