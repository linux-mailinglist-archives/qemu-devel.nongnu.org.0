Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 909086ABDFF
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 12:17:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ8pK-0006Ns-OK; Mon, 06 Mar 2023 06:16:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZ8pH-0006NI-My
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 06:16:19 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZ8pF-0005OP-Ea
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 06:16:19 -0500
Received: by mail-pf1-x434.google.com with SMTP id y10so5476898pfi.8
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 03:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678101375;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LKbzwY4KSixpXabg4F8wzj3zvJt68nAYpChLwgrHmng=;
 b=ds9rptCneOIwZMMNuHSoAC+Zraqu0S85hdeeUPyHvHCQeh/nVgAuHobHtY/e/ALo48
 CyqfmNxMefrjWw4M3nisXSs7R3kYGjhgDVCg+6N/yJzGbvP0GN9IveEnkw65uhWQ1zOy
 /AkGu+A5w8FBO8OtM77wKHAholdDyaaLWBcNqmAa/mutFL7dt85DWGVevhQDZTEt6h0o
 aR7YqGNJ69nh7mvqQuTWHmHWX0R01nJ4OFX0+f5v2kwHFRPhOEIpQ0wmGN1BYXMNKXDV
 gRiDyjc2KV8xg5blQw8+SeUnxg7txzKOt8gKM+/CGdzlkNDusih1VUlyj5WFp89PFHnO
 d9Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678101375;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LKbzwY4KSixpXabg4F8wzj3zvJt68nAYpChLwgrHmng=;
 b=Kt+Xi/HPZjG2GRem9ZVsBTaiZmoYvYZ4ezsYhHCo2Csc3C48gflZY9ff8jw2QjfN6l
 4wELfn3iQVY2C5QJp47sCwZu06BfEe5KR6zVY/yvxggpayTXxACutEqDzp95V3458k4y
 uR5CMZl2SwlVYpOaL3LrJgCEvpnB3limU59v3mS/pi9QOdQyM+kRy9Bkc3P/vX5o7dku
 0dVlp0HI8Ye3ItaNfTPiuCdtr15iMKK0hfD0VO4AMnrtfH7mwzVM1UMOndRH782Oq4gL
 jH/qJxmhR77sVpuCb2pnHP+vwzuOY/Zyfi5tMP1sl4icE3/9HiNAz1rhQGGAAGjLgjIq
 4EfA==
X-Gm-Message-State: AO0yUKUhaactuuMJmd9pgNbEdW5p4w+GlG65KE3giL5rUa2E1iZ/gNxx
 pnWt7/IhjbVstIzEljACZONwAf3LxBTsyvB+79Vq6e/gingYIm53
X-Google-Smtp-Source: AK7set847hkx8/8vZC9p142DcuQ6LED3JN7+ncCJDF9NG7yivyvELyupUiEukLPdIRGPutXKxQmfnDwsEkDS/AqckLg=
X-Received: by 2002:a05:6a00:1d9f:b0:5a8:aaa1:6c05 with SMTP id
 z31-20020a056a001d9f00b005a8aaa16c05mr6308945pfw.2.1678101375424; Mon, 06 Mar
 2023 03:16:15 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA_SeUuZRo7HQPUJgeaepoup29YdAuFaWjNL+fhEt+pmkA@mail.gmail.com>
In-Reply-To: <CAFEAcA_SeUuZRo7HQPUJgeaepoup29YdAuFaWjNL+fhEt+pmkA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Mar 2023 11:16:03 +0000
Message-ID: <CAFEAcA87HtzYN76nHhHZBfazDZdoRnszgAt-e2CqBBWEoF6_2Q@mail.gmail.com>
Subject: Re: test-blockjob: intermittent CI failures in msys2-64bit job
To: QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x434.google.com
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

On Fri, 3 Mar 2023 at 18:36, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> I've noticed that test-blockjob seems to fail intermittently
> on the msys2-64bit job:
>
> https://gitlab.com/qemu-project/qemu/-/jobs/3872508803
> https://gitlab.com/qemu-project/qemu/-/jobs/3871061024
> https://gitlab.com/qemu-project/qemu/-/jobs/3865312440
>
> Sample output:
> | 53/89 ERROR:../tests/unit/test-blockjob.c:499:test_complete_in_standby:
> assertion failed: (job->status == JOB_STATUS_STANDBY) ERROR
> 53/89 qemu:unit / test-blockjob ERROR 0.08s exit status 3
>
> I haven't looked at whether these jobs all failed on the
> same subtest or whether there is better info lurking in
> some log file in the pipeline's artefacts.

Here's an intermittent failure from my macos x86 machine:

172/621 qemu:unit / test-blockjob
           ERROR           0.26s   killed by signal 6 SIGABRT
11:03:46 MALLOC_PERTURB_=176
G_TEST_SRCDIR=/Users/pm215/src/qemu-for-merges/tests/unit
G_TEST_BUILDDIR=/Users/pm215/src/qemu-for-merges/build/all/tests/unit
/Users/pm215/src/qemu-for-merges/build/all/tests/unit/test-blockjob
--tap -k
----------------------------------- output -----------------------------------
stdout:
# random seed: R02S8c79d6e1c01ce0b25475b2210a253242
1..9
# Start of blockjob tests
ok 1 /blockjob/ids
stderr:
Assertion failed: (job->status == JOB_STATUS_STANDBY), function
test_complete_in_standby, file ../../tests/unit/test-blockjob.c, line
499.


TAP parsing error: Too few tests run (expected 9, got 1)
(test program exited with status code -6)
------------------------------------------------------------------------------

thanks
-- PMM

