Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3A8304489
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 18:12:19 +0100 (CET)
Received: from localhost ([::1]:49530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4Rt3-0000rU-Q1
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 12:12:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l4RrY-00006v-H3
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 12:10:44 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:38997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l4RrW-00071m-J8
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 12:10:44 -0500
Received: by mail-wr1-x433.google.com with SMTP id a1so17282905wrq.6
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 09:10:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=kUsi29oCHqC4a/iz3I9WU6FbuGrSqvBofiNO5glD8v8=;
 b=qhf2q2mzpc2HCveM1cFw3eV3qKVKTVdZrh7X1gcXnsaRlfTT43oZeXCJP8NtZLA3eJ
 gc1NySNoBr61QJT7D6EC9uavuMX48bEbeAoGvIaheimDQ+LeaLGEMGEVR2MaROJ6/kGo
 cl3Rix6cebreeCVMlbEjUaaOrVqh4YBZ6p9TJJ8isrcLYwUxEdRMf6xilOfBUPJEO/ny
 YRnftmbixN4vQ7B/FuKND0YId3Wojo9w7HECSQnRgCGk8fl4g6pbBQT/jakoWbnOwiZK
 ONwO+JuBjsxXUaWjA/qknLanmN02Ktv/3K97tHKfApa9oWdbIoxYFmr5jCe7ys09A3n2
 Pv7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=kUsi29oCHqC4a/iz3I9WU6FbuGrSqvBofiNO5glD8v8=;
 b=H2kTzv8YfrRvQuvVLjuzfIIOSC8R7CNyI3e9R+LMzicoS7uqrCwS7p4O2mUXBMjHik
 QMWlZLOfcCDH7+6MXMWO/OtGLQeuUzpR+ctDwRSnXhzkxqWTBRKDDpAn6E9kM1a7gboK
 AEW5mmZ8hoRH0JUMwlT9DJxuatzhaHmlNO3Y6/GhHLT6G+tiSnjs65zsHe/Fhs63cs1p
 9tIACzDw8Zhwkt035VPiceLBYTBQW9ge8OlS6Qy1YLFwOX6NlSEY0Al0zLeZu6/lMd6j
 SHiscJ9NiVYFUT4p92nRaEBzr80gHCZo3wmPppqrmOyZwtIMLoi+7oBUZxTwk0JyuQIw
 uJYA==
X-Gm-Message-State: AOAM530KsDJm1Q7ObBIOhFroQzk1O28UboGQKDCE50QEQO79XJFRh70F
 PeI8NPSd7htOxW4A4jWB64m6tw==
X-Google-Smtp-Source: ABdhPJyWWgHkTrfXHW7ctLLuF7hwGR4Bs1knglDZk/0CpbrFGr5mkL7FGDubu8a+pKAoszxwkscZqw==
X-Received: by 2002:adf:e7c1:: with SMTP id e1mr7181071wrn.23.1611681040882;
 Tue, 26 Jan 2021 09:10:40 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j2sm26417595wrh.78.2021.01.26.09.10.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jan 2021 09:10:39 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 41AA31FF7E;
 Tue, 26 Jan 2021 17:10:38 +0000 (GMT)
References: <20210110162739.858087-1-f4bug@amsat.org>
 <20210110162739.858087-3-f4bug@amsat.org>
 <78a9718b-dec0-cc31-7ada-e815d9022e65@redhat.com>
 <20210121103250.GH3125227@redhat.com>
 <b1309c5e-69f2-0c4d-eefc-9023e906694d@amsat.org>
 <20210121112154.GJ3125227@redhat.com>
 <e46b9117-59ed-cfb8-303b-1a5a013c4cc8@amsat.org>
 <20210121120241.GK3125227@redhat.com>
 <97b12e1b-e570-bd4d-5484-376f3fe6f7dc@amsat.org>
 <ada021e4-b6e5-e720-bcfb-c078488c835c@wataash.com>
 <7e423408-b0e9-2c32-b88b-eb579dd273c5@weilnetz.de>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Stefan Weil <sw@weilnetz.de>
Subject: Re: [RFC PATCH 2/2] gitlab-ci: Add a job building TCI with Clang
Date: Tue, 26 Jan 2021 17:08:30 +0000
In-reply-to: <7e423408-b0e9-2c32-b88b-eb579dd273c5@weilnetz.de>
Message-ID: <878s8fy67l.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud?= =?utf-8?Q?=C3=A9?= <f4bug@amsat.org>,
 Wataru Ashihara <wataash@wataash.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Stefan Weil <sw@weilnetz.de> writes:

> Am 23.01.21 um 09:59 schrieb Wataru Ashihara:
>
>> Actually I use TCI also on macOS. Like the use case quoted by Philippe,
>> there're even other reasons to use TCI:
>>
>> 1. Learning TCG ops.
>> 2. Debugging QEMU with gdb. e.g. diagnose codegen or stepping into
>>     helper functions from tci.c:tcg_qemu_tb_exec().
>> 3. Guest instruction tracing. TCI is faster than TCG or KVM when tracing
>>     the guest ops [1]. I guess qira is using TCI for this reason [2].
>>
>> [1]: https://twitter.com/wata_ash/status/1352899988032942080
>> [2]: https://github.com/geohot/qira/blob/v1.3/tracers/qemu_build.sh#L55
>
>
> Yes, TCI can help a lot for debugging, especially also when porting TCG=20
> to a new host architecture.
>
> If we had binaries which can switch from native to interpreted TCG, it=20
> could also be a reference implementation used for unit tests, comparing=20
> the results for each TCG opcode.
>
> Using TCI with profiling like gprof is useful to count the frequency of=20
> the different TCG opcodes in practical scenarios and can be used to=20
> detect bottlenecks (and less frequent or unused opcodes) for native TCG,=
=20
> too.

FWIW I had a bunch of JIT profiling changes that exposed the TCG op
counts via the JIT profiler.  I think I even enabled the op counting by
default because it was fairly lightweight to add.

IOW I think more introspection can be brought into the core TCG code
rather than relying on TCI to achieve it.

--=20
Alex Benn=C3=A9e

