Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B03D0679483
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 10:49:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKFv7-0007cT-6x; Tue, 24 Jan 2023 04:48:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pKFv4-0007bP-7q
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 04:48:46 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pKFv2-0004SU-Hy
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 04:48:45 -0500
Received: by mail-pj1-x102d.google.com with SMTP id j5so644480pjn.5
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 01:48:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8UEks4CwU1BsFxJqEf8zp7FWxLC2BpuJ+D8cbsxTOiY=;
 b=TQDjGgmIMxwu6DVViWYO9ng5RNUW4tpkNMJvJR8SBgrS1ji7dAc+l4VLWricUEb3x6
 Ts0JsVE2JKQHhTgrB4btZoHadgIy697Myx9QbD6CZakz04ULbybPRrtkrsM/NK7Mpwlk
 rbykcavewsy+7akSGEAS3st5/1ZcCK+LRiwb7BS7+T1KLjfUmME4pXhx1xWKnljggOny
 u5CzcSxXigXSCcv8PWrFvWFUNQp9GaON3YBrNpYMHAbre49AZnHMBrdi11FDGj7BeF+z
 YqjgV2eWh5RO+PR5sYDTH0TUd0kHjejDJhDj2yF5mFkBufCM1kqURsxSlGxKxtL2Ucft
 XG3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8UEks4CwU1BsFxJqEf8zp7FWxLC2BpuJ+D8cbsxTOiY=;
 b=wBeHLzxmlzCs9BLwID2RSHBC1zBFr4RhDAuELzwpNNWySSBj9aZrju5Uft0qVRZNC/
 u7MQmzCWRrWjap7nCZTIKczNJJnFQXEWnlGv9Qko5lDXRHf7cg9Sm4aBQriuJgrCQBno
 fXvgH5SUzUznYwMUXhPxKb9d08RYWt8TVKjYDOaNVikDrLGWLZkWz0WAtT7J3DXxEHnU
 XFhyAohAr9KYpaDfBRJ41RMtAGDKFhTHcJauZ6gIMUFYO5247tXWQG3LpqGf6Pz7U+BN
 wdiPT67R7/TGc4MAYoN+DD024JuPFjn8S4x6OvyN5gs55eOrh1HWM4PFy+rcNeoRs/9F
 ZoUQ==
X-Gm-Message-State: AO0yUKUg+vliM50A/05Pl5aKE0KrDmogyKBZnZOMgvF2u29KmSwBrSjX
 dxFit5NnC8OT0BBj2pex4yuMbpwUWEj4nJbeCIH23w==
X-Google-Smtp-Source: AK7set9ZqcoMrrEFs8SxfZxzkCGwVkxfQtj526UYvA3KUsC/hRbl4dYMyZtOQDnUCkvOF3n16K++dzXpeWOEdmT22Mw=
X-Received: by 2002:a17:90a:8a0b:b0:22b:e329:7262 with SMTP id
 w11-20020a17090a8a0b00b0022be3297262mr516653pjn.221.1674553722925; Tue, 24
 Jan 2023 01:48:42 -0800 (PST)
MIME-Version: 1.0
References: <20230106194451.1213153-1-richard.henderson@linaro.org>
 <20230106194451.1213153-3-richard.henderson@linaro.org>
 <CAFEAcA9mh+eS8rHwqmyjOAmcnPDJ7K54QbJPd7itKZskQeox5g@mail.gmail.com>
 <3443cf40-4013-6ac6-895d-08f86c229809@linaro.org>
In-Reply-To: <3443cf40-4013-6ac6-895d-08f86c229809@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Jan 2023 09:48:31 +0000
Message-ID: <CAFEAcA8hR3QpHP5UjnyAv1LLV6dC_VcW3bnDmu5ubAV5OAWeXA@mail.gmail.com>
Subject: Re: [PATCH 2/2] target/arm: Look up ARMCPRegInfo at runtime
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, 24 Jan 2023 at 00:20, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 1/23/23 02:53, Peter Maydell wrote:
> > On Fri, 6 Jan 2023 at 19:45, Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >>
> >> Do not encode the pointer as a constant in the opcode stream.
> >> This pointer is specific to the cpu that first generated the
> >> translation, which runs into problems with both hot-pluggable
> >> cpus and user-only threads, as cpus are removed.
> >>
> >> Perform the lookup in either helper_access_check_cp_reg,
> >> or a new helper_lookup_cp_reg.
> >
> > As well as the use-after-free, this is also a correctness
> > bug, isn't it? If we hardwire in the cpregs pointer for
> > CPU 0 into the TB, and then CPU 1 with a slightly different
> > config executes the TB, it will get the cpregs of CPU 0,
> > not its own, so it might see a register it should not or
> > vice-versa.
>
> Existing assumption was that each cpu configuration would have its own cluster_index,
> which gets encoded into cpu->tcg_cflags, which is part of the comparison used when hashing
> TBs.

Yes, I realized that last night (so my edit to the commit message
is unfortunately wrong). If we really did need to share the TB
between different-cpregs CPUs we'd need to do more than this
patch does, because we couldn't generate "no such register" code
in the TB or the other things we do based on what the cpreg lookup
returns, we'd have to do everything at runtime.

We could in theory share cpregs hashtables between the CPUs in
a cluster, except that at CPU creation time you don't know
which cluster the CPU is going to be in...

thanks
-- PMM

