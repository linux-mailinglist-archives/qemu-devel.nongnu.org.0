Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7448526026
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 12:42:22 +0200 (CEST)
Received: from localhost ([::1]:58922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npSkX-0000lx-LP
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 06:42:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1npShl-0006F2-NS; Fri, 13 May 2022 06:39:29 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:34442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1npShj-00050L-SE; Fri, 13 May 2022 06:39:29 -0400
Received: by mail-ed1-x52e.google.com with SMTP id a21so9489070edb.1;
 Fri, 13 May 2022 03:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:in-reply-to:references:message-id
 :mime-version:content-transfer-encoding;
 bh=NaT6dXW76wXDq+p+wA+rsrTa1VclrnPzN5iPMNxtyQ0=;
 b=KCccBMjrRQr70Ns+NajKXJexQZNNkQ+qmt3pXwDHVEPwNBhwD83kWtrD5SRcjBJDv5
 IYLwFu5GXSrl/Pv70af5KNUzi0nuO6m4CYTdTmN2UjuCsre+frDr5OkCgPb2oae8WTuU
 LWlbt5HAKFm0ShqzhSLSP8BdpilxohLtjhvyBxcvKq37qW2K3sAJTvuE5bRiF0VtlM19
 o4iF5mEUL1P75nI9PhutPIUDKCddv91s2BOsiAAAdCkN3fBa5kTHpM3BevZbZtqwWQlO
 h3OvHK1jUNJA52NaEvGhuCVhEwNpi29xXuzjyftYNrrtsa7P33oL3VJJ81xVyNBhv9Co
 2v2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=NaT6dXW76wXDq+p+wA+rsrTa1VclrnPzN5iPMNxtyQ0=;
 b=08RuxlT5qfuKvzb/g5biuaebFY9Ej1pFO/kUWKY4GAAbF1nzjHvZmL1QFQ+EnJbYSM
 /4bzwySEUNTEqq7WxlkujY4P4HR7m8qXeJgZ4ZRcSBj31+trm+LvTAg/qIfn2CfqYXLm
 Fqjo4eOTOJ83I++InTfdk8PJhpVap/ZnedxcvvQPuyjN7aqKOHSuVEu8StinNmi17sS2
 iwdAG5F51U4qMLEaGzpbSg3qQlPTwRy9CRjp2MU0KSY1hb0aWN3figh0FlNL9UAexSps
 Azj4uZfFmz2Gvmhjba2NrRnjfJI1UGHfA1izSQYFsmVDFTypuJOQ8k9mnfa1Vvn6JIB0
 +YGw==
X-Gm-Message-State: AOAM532QHyYJl5X+7MblFCAD5pK2zum8RH+GgZfHF5C1hPCmE16z8GC7
 aC0D5rvbfzoitkNgCJ+QRuL375WRp8Q=
X-Google-Smtp-Source: ABdhPJzZgW8+uAzjWsQlXNKnV8HDWRGLj/0FpTyx2niKsp8a4LfUeHfHPIgNI0qH0FwKDEoqVLeclQ==
X-Received: by 2002:a05:6402:158a:b0:426:9efd:57a with SMTP id
 c10-20020a056402158a00b004269efd057amr38617706edv.85.1652438365317; 
 Fri, 13 May 2022 03:39:25 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-089-014-181-123.89.14.pool.telefonica.de.
 [89.14.181.123]) by smtp.gmail.com with ESMTPSA id
 k2-20020aa7d8c2000000b0042617ba63d4sm771188eds.94.2022.05.13.03.39.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 13 May 2022 03:39:24 -0700 (PDT)
Date: Fri, 13 May 2022 10:39:22 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
CC: qemu-trivial@nongnu.org
Subject: Re: [PATCH RESEND 0/2] Resolve some redundant property accessors
In-Reply-To: <A987D65D-940B-4827-B547-92D27FBBA46E@gmail.com>
References: <20220301225220.239065-1-shentey@gmail.com>
 <A987D65D-940B-4827-B547-92D27FBBA46E@gmail.com>
Message-ID: <A5F957DF-375E-4CFF-BF01-4714064E5C7B@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 5=2E Mai 2022 16:52:13 UTC schrieb Bernhard Beschow <shentey@gmail=2Ecom=
>:
>Am 1=2E M=C3=A4rz 2022 22:52:18 UTC schrieb Bernhard Beschow <shentey@gma=
il=2Ecom>:
>>No changes=2E Just also CC'ed to qemu-trivial=2E
>>
>>The QOM API already provides appropriate accessors, so reuse them=2E
>>
>>Testing done:
>>
>>  :$ make check
>>  Ok:                 570
>>  Expected Fail:      0
>>  Fail:               0
>>  Unexpected Pass:    0
>>  Skipped:            178
>>  Timeout:            0
>>
>>
>>Bernhard Beschow (2):
>>  hw/vfio/pci-quirks: Resolve redundant property getters
>>  hw/riscv/sifive_u: Resolve redundant property accessors
>>
>> hw/riscv/sifive_u=2Ec  | 24 ++++--------------------
>> hw/vfio/pci-quirks=2Ec | 34 +++++++++-------------------------
>> 2 files changed, 13 insertions(+), 45 deletions(-)
>>
>
>Ping
>
>First round of trivial patches went already in for 7=2E1, hence a reminde=
r=2E
>
>Best regards,
>Bernhard
Ping 2

