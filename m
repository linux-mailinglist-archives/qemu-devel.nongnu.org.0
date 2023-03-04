Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BD96AAAE4
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Mar 2023 16:41:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYTzT-0002bo-6N; Sat, 04 Mar 2023 10:40:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYTzQ-0002bL-GY
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 10:40:04 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYTzO-0001eo-Ty
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 10:40:04 -0500
Received: by mail-pj1-x1035.google.com with SMTP id oj5so5580714pjb.5
 for <qemu-devel@nongnu.org>; Sat, 04 Mar 2023 07:40:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677944401;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3bq30Jmz61FRRFXcsk7LFt4GI84lQwyHV4WytiMl4QQ=;
 b=Y77OH+u3yf+kuxaJT0EL4WBaDeYLugyFETfZvN8bWB8tQbJSSev7gItRkx8xYu/EB+
 B+4jv6Ie5Yor9r/GQj0/oO00IgF1rqyCwAoPMRFlzMA27C3RZOhMBysCeCOekG7OVMc4
 80nny9xaHupqKmIXeT+1f7c1dMOSLktKCoyuA+25y874ci1HuCxg5M/8G+DtdlzeuPAC
 YsDX0qNud2ynmTo959MEcFvJeFN1f4toL/5BGvErpKwwNZFVMfKZxjIyzATmOky+OkAc
 jE9hv59WztWdhvOfFd2MeouI25ghwtkgFYz4SNhg2aYyWMwQNlVzC7V5dhmeJifUhIZ6
 g/7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677944401;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3bq30Jmz61FRRFXcsk7LFt4GI84lQwyHV4WytiMl4QQ=;
 b=3ymfjX2mNzMjnLMyFR5DJrJS+rUWny5QzEsCjl39LV+IoHLzt4b0NszDeptx4YDMnZ
 xQzByYTfNpgKTtmK9OqNYVD8dQyulmFgKjbkuhe/UKgjDNzb7SMBehPDZBk/j7Pgjqwz
 V//MBZDfMR5rkrVt3q37fdVsvV9Tc5UaxBeRMqhxg2fV4odwSL0+8P1PHxz1xCPzvg9S
 n4HODOtes7MegyzLX+0UW+svmPjDYT8fFE9wQqMwc6uaddj5P+7PW58ktwnoKefg47gW
 FhUwJiGhTMFFcOA4BRdDiIcrHUPxuu6DOHwWzU0mz1unKMuB0DCqNx1UG6R99DMssEp6
 zWZw==
X-Gm-Message-State: AO0yUKVheIRhcIG8UTm4DgQlWC0sFXChacoK4t79vwm4oLT11vR7FLIW
 opUJLbn7gfdheHLDcH9HGBCW9C28pBYexc9raB0pmPPd7g0091mE0vc=
X-Google-Smtp-Source: AK7set/4rA0cN/NZob6maNfeZGIMpkVKUJjyHAFeNsTm6bvwKXBiy043z37qUxn6YiRFUqMHBeEpmy2Hc+kkJP+bJR4=
X-Received: by 2002:a17:90a:a888:b0:236:a1f9:9a9d with SMTP id
 h8-20020a17090aa88800b00236a1f99a9dmr3870191pjq.2.1677944401147; Sat, 04 Mar
 2023 07:40:01 -0800 (PST)
MIME-Version: 1.0
References: <20230302172211.4146376-1-peter.maydell@linaro.org>
In-Reply-To: <20230302172211.4146376-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 4 Mar 2023 15:39:49 +0000
Message-ID: <CAFEAcA_Pf11W3FuaLHvzQ7yrkh6KC556HDfvXpZYaHqN4iMvsg@mail.gmail.com>
Subject: Re: [PATCH] tests/qtest/migration-test: Disable
 migration/multifd/tcp/plain/cancel
To: qemu-devel@nongnu.org
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1035.google.com
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

On Thu, 2 Mar 2023 at 17:22, Peter Maydell <peter.maydell@linaro.org> wrote=
:
>
> migration-test has been flaky for a long time, both in CI and
> otherwise:
>


> In the cases where I've looked at the underlying log, this seems to
> be in the migration/multifd/tcp/plain/cancel subtest.  Disable that
> specific subtest by default until somebody can track down the
> underlying cause. Enthusiasts can opt back in by setting
> QEMU_TEST_FLAKY_TESTS=3D1 in their environment.

So I'm going to apply this, because hopefully it will improve
the reliability a bit, but it's clearly not all of the
issues with migration-test, because in the course of the
run I was doing to test it before applying it I got this
error from the OpenBSD VM:

 32/646 qemu:qtest+qtest-aarch64 / qtest-aarch64/migration-test
           ERROR          134.73s   killed by signal 6 SIGABRT
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95 =E2=9C=80  =E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95
stderr:
qemu-system-aarch64: multifd_send_sync_main: channel 15 has already quit
qemu-system-aarch64: failed to save SaveStateEntry with id(name): 2(ram): -=
1
qemu-system-aarch64: Failed to connect to '127.0.0.1:19581': Address
already in use
query-migrate shows failed migration: Failed to connect to
'127.0.0.1:19581': Address already in use
**
ERROR:../src/tests/qtest/migration-helpers.c:151:migrate_query_not_failed:
assertion failed: (!g_str_equal(status, "failed"))

(test program exited with status code -6)

thanks
-- PMM

