Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3AD03ACEE3
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 17:26:59 +0200 (CEST)
Received: from localhost ([::1]:46430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luGOY-0004M6-Gz
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 11:26:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1luGNT-0003Up-2H
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 11:25:51 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:55106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1luGNI-0006e2-Hw
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 11:25:46 -0400
Received: by mail-wm1-x332.google.com with SMTP id m3so5904720wms.4
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 08:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=AP0S5TO4oKHKtaA5AuX7fjLnOHuolA8M/8pqAxcfdZc=;
 b=DnUuZBE+yIf30WKdKcC+jT/h9RKhaE4rsEq0quGiGDfaxEQvzKGyDAkn9A1vaJhAR6
 EX7CuLpAS7ezUnkfEAGUvqUmgn7NcjXw45zKCKSR00s5Onx0qmlkIRyMYZHq+0xJDkWb
 Xfty30KK3Q1/FF8DqbU0Ae/hfqJ1cpPXO+5G0QzxuAn0TP1CZ4OqNkNHyqr+J5ZMTSGu
 BKne58/RElKxtL+/80i/chH3dmYNP6XchuIHzaq6x3U4c+m9RlNm/KfpbO56YXGsJhSU
 z4TeI3aYoTvl7tD4ZafpgiINzBs1uJcaeZZHrSmXTf/lAxJQ9/hTGai8UuWGM2RkMdZi
 669A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=AP0S5TO4oKHKtaA5AuX7fjLnOHuolA8M/8pqAxcfdZc=;
 b=iKXCuk2UK+7kOGSZq0KJidv38R5WPeLxzt9caRhsX+JG8cTwbF48Bo4HN3KvxeZFma
 fq4wrMuiPowkwGpItJf3mkNYifcbrieHp7Jd9SrZOnNKWv3eC1dDsHm1wjkawC0TTNYP
 aibBmfBt+HgZm7eriXbSM80DIT6qm/IbeJhM3G4/hKHyiVCosWighKZEl+Rot4olXkrY
 NfiB/KfRImrftLan48oogViA2M7B1b3FznrM7vi6Mz9JGcgT7/4pS8vxPRTKvybmM51c
 bX7VQRVqhVxBeuxpMIwWtwxw5cHiTjSPhVGzxrGhQi2fgbL9omZr+vtoXOIt0o7Tosqt
 5Vmw==
X-Gm-Message-State: AOAM530zN363oDuDDu5lUP2GcK0lF7TGEBiy7A7H0/kh+qq0/hGpZYkg
 RAyk8QB4A0mfPxnUA/mBs5y4Lg==
X-Google-Smtp-Source: ABdhPJxWMYtEjf/hQ4ESucILaF6l8jr2PrdTFJmyGw1aTQ8owhgu3G96q7zHecXYAQbsqwh3IwbPEg==
X-Received: by 2002:a1c:2604:: with SMTP id m4mr8920703wmm.131.1624029937076; 
 Fri, 18 Jun 2021 08:25:37 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r6sm8877577wrt.21.2021.06.18.08.25.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 08:25:36 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BC13D1FF7E;
 Fri, 18 Jun 2021 16:25:35 +0100 (BST)
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-64-alex.bennee@linaro.org>
 <24538cd3-0e17-7c32-4b71-8ca994f5cdc9@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v16 63/99] tests/qtest: skip bios-tables-test
 test_acpi_oem_fields_virt for KVM
Date: Fri, 18 Jun 2021 16:25:00 +0100
In-reply-to: <24538cd3-0e17-7c32-4b71-8ca994f5cdc9@linaro.org>
Message-ID: <87bl83dwk0.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> On 6/4/21 8:52 AM, Alex Benn=C3=A9e wrote:
>> From: Claudio Fontana<cfontana@suse.de>
>> test is TCG-only.
>> Signed-off-by: Claudio Fontana<cfontana@suse.de>
>> Cc: Philippe Mathieu-Daud=C3=A9<f4bug@amsat.org>
>> Signed-off-by: Alex Benn=C3=A9e<alex.bennee@linaro.org>
>> ---
>>   tests/qtest/bios-tables-test.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
>
> The new qtest_has_accel should be used instead of an ifdef.

I think I can drop the whole patch as nothing is added unless:

    } else if (strcmp(arch, "aarch64") =3D=3D 0 && tcg_accel_available) {

further down.

>
>
> r~


--=20
Alex Benn=C3=A9e

