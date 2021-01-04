Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A402E980A
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jan 2021 16:05:46 +0100 (CET)
Received: from localhost ([::1]:49852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwRQX-0006mC-7c
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 10:05:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kwRN0-0004CW-Pv
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 10:02:06 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:38120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kwRMv-0002Gv-7o
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 10:02:06 -0500
Received: by mail-ej1-x634.google.com with SMTP id 6so37169422ejz.5
 for <qemu-devel@nongnu.org>; Mon, 04 Jan 2021 07:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=62kJC8MhpjTdhDAhauDoZet/7ufJi9wKK4JzbblNYjQ=;
 b=qPSgjO46wiix9Un8c+HqrMAKza5nNmboyhBOm1ON+leG0TWUGpPJX85k2u+1gc1AzK
 cOq0NAwnZBIMYAJl0KS/6Zncu9KhDLtftjataoPqz2lPmWZAZzyDt6wfnV8IMRhgUmmR
 CCv3tHQLhtWpAy/4KS+O/h3hjNl+vV267u9U6bnQOM7rfzNms0ZNb3+GfwPB1NHXGAeV
 G4sRESlil9XUoAc2lvLwMpw1Agio5J87F3YCsV4b7am5XDQTi0MTtfbY80mCHVxZNkhn
 qJSVM6Ps9ZFZAkiYfb0j+BO1vBT3rZmDM5D2JkqaYmW5LxB/soN4+O4BuaezvZIgimJ8
 N7Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=62kJC8MhpjTdhDAhauDoZet/7ufJi9wKK4JzbblNYjQ=;
 b=AgDP48h4mXU4ijKl9xsxiAUQ8aOSbeTAwEnc0AiPMnfC8jJK3Hw6g2kv5NSN3mixD9
 yl3FhuJd6QcFF53SFN2ol68bXRp86HZvaAIc+W2oT5LL3BI/VaeiB8Rj5XGIb9BukM57
 rBNFqZvyZz0VIkX/WxtZIxAQB01uggocrXCdw4VNihsaeVXCFAowKNxtaL9RhjK/hKv9
 5g/CCAWC38lagr/PM9aQc1OjOWJckVn88aEfr3qEhVab8o2RL0CDY9xuSPZvCyYfIwC3
 BDZW+D8/i+7r3EC+tSqGKqkZg0UXqpO7hU5saNTmN+aBDU+k1ZZIci+q6T82E53LXH+7
 t1kQ==
X-Gm-Message-State: AOAM5312PAc+clWxBQ5mosrYeef/4y8KSSpxmsiWBVSlDzSEHaKs+OjY
 py0X12M8cEwS6A9OX3Jm4DUVwWqKlJ/5a14qmR1slg==
X-Google-Smtp-Source: ABdhPJwSaR56KbMlehdWFCznSYoye4LDV+h5uJ8K2QjF6dfxyxgMYTx7d1lJ64GNQ2+0az1kwuWw6n72SgcvVfZ1GGA=
X-Received: by 2002:a17:906:6b88:: with SMTP id
 l8mr66883803ejr.482.1609772519504; 
 Mon, 04 Jan 2021 07:01:59 -0800 (PST)
MIME-Version: 1.0
References: <20210103205021.2837760-1-f4bug@amsat.org>
 <CAFEAcA--dkcqBJr=b1LcNpLtctYJewuT8Yvx9Uo47YC6JGgR-Q@mail.gmail.com>
 <CAFEAcA-HXHrXwGywi0MkxFhCCW3fk91Xr4yHA1--tiSqN2_HWQ@mail.gmail.com>
 <790b031a-2be6-82d0-565d-f7595e95c077@amsat.org>
 <CAAdtpL53Ngj3zc0ZtxEvHed0hAxYN0RZ7G2eiL_izuTSWBMM2A@mail.gmail.com>
In-Reply-To: <CAAdtpL53Ngj3zc0ZtxEvHed0hAxYN0RZ7G2eiL_izuTSWBMM2A@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jan 2021 15:01:48 +0000
Message-ID: <CAFEAcA-mTCyahsvVaD3PsOA4P8erDXmbLJCDtWaUFFoFiR4r=Q@mail.gmail.com>
Subject: Re: [PULL 00/35] MIPS patches for 2021-01-03
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
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
Cc: Huacai Chen <chenhuacai@kernel.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 4 Jan 2021 at 13:59, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
> I don't have access to OSX host. I'll see to install an aarch32 chroot an=
d
> keep testing (not sure what can differ from an i386 guest).
> If I can't find anything I'll resend the same series without the Loongson=
-3
> machine, which is the single part adding QOM objects.

You might also try using valgrind/address-sanitizer/etc, which can
sometimes flag up this kind of bug on x86-64 even if by default
it happens to work.

thanks
-- PMM

