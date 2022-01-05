Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 713ED48553A
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 16:01:52 +0100 (CET)
Received: from localhost ([::1]:44674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n57nS-00086q-TA
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 10:01:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n57gJ-0001OJ-HV
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 09:54:27 -0500
Received: from [2a00:1450:4864:20::430] (port=35658
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n57gH-0005pC-V8
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 09:54:27 -0500
Received: by mail-wr1-x430.google.com with SMTP id j18so83546479wrd.2
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 06:54:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=VJxEsbv5c7IktayFQaL0NAarm1dXTV29fiUVQhJTaE4=;
 b=caK1Vmf2Z/YubGnS6yYbtJegj1FrWFfQpHG6XYx7OlwvlGhsSF57nCZ/+/SdqMyZhG
 6ivQddH62Fr/oTGLC72E8MwuknYs33opxKjROF8KOyM7WNGwAo7nfQ0aqwoPYhvrihdb
 Wohv/KPx3zWfw1ACMcvocMUP+5Z+EAE7lrKik5Q+z7bc8ronrBre0bzKa1SIRjxRO4bz
 ecvJo/iFNNPUr7nw5Xycp5w9l34MyO4EIa89sQk6I29LnGqhdG2qr8O1XUVAANNDbsNF
 RdLz3/oadLyUQnazzX3fX3g/RXsSCnhawYk+oDJ9L+ReLxvf4tOyZYSqilAoJd+c0t8U
 2WcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=VJxEsbv5c7IktayFQaL0NAarm1dXTV29fiUVQhJTaE4=;
 b=fBoFrkQ8Vl8FglYPWgv41FRC/lQBRtDMyTRez1q7t6qrt61x1XDg7pEQCstimmkXU/
 En2Wv5AetcAf85lOnuVKTwfkxCUc0mcQfmc9focWZFfNJo9iPYdcK9SbRM1bLr9eounS
 yK6xgPaRoFU8GzCNkA46ZZlJ3Q9cq4FsQnFWDmSRo33SkcZC/VhI+0XW+mYOWMe365uz
 4748qyIuUiIqVEaA8jznxOeDvp9OCzJ4YLJFh2iQHV6Vw4Jp/PEBs/6XZ4Av2kKEMrvN
 dR1rZCsIR6d5R30oZp+iSMmP+ztYgRZUgulLePnD62vngBJvfNjtveZld8ICjiKKVn3X
 TH5Q==
X-Gm-Message-State: AOAM533VBnY1pnMbSTefflF3rdOwxn+YeImPmkL0OVmjuZKkN/1W5iFv
 nVe4alHqq8OWRRG+VcZKn8UtF8JAH1mePw==
X-Google-Smtp-Source: ABdhPJzcYvKM3i60OtM9bIrdRpfcbQRmrcszKx3dDSSGR3sURl+sGA6x8HVTb6WNReWGpgxVRoRodw==
X-Received: by 2002:adf:fc0d:: with SMTP id i13mr46176149wrr.296.1641394463374; 
 Wed, 05 Jan 2022 06:54:23 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r13sm2057855wmq.28.2022.01.05.06.54.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 06:54:22 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DB3991FFB7;
 Wed,  5 Jan 2022 14:54:21 +0000 (GMT)
References: <CGME20211227125057eucas1p14ebd7c0d73df4a25abc40bfa3fe0c3f2@eucas1p1.samsung.com>
 <20211227125048.22610-1-a.kazmin@partner.samsung.com>
 <18882253-9e57-0654-1eb2-870a451a50ce@vivier.eu>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH] linux-user/syscall.c: fix missed flag for shared memory
 in open_self_maps
Date: Wed, 05 Jan 2022 14:54:17 +0000
In-reply-to: <18882253-9e57-0654-1eb2-870a451a50ce@vivier.eu>
Message-ID: <87h7aijkrm.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Laurent Vivier <laurent@vivier.eu> writes:

> Le 27/12/2021 =C3=A0 13:50, Andrey Kazmin a =C3=A9crit=C2=A0:
>> The possible variants for region type in /proc/self/maps are either
>> private "p" or shared "s". In the current implementation,
>> we mark shared regions as "-". It could break memory mapping parsers
>> such as included into ASan/HWASan sanitizers.
>> Signed-off-by: Andrey Kazmin <a.kazmin@partner.samsung.com>

Acked-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

