Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF8E6A96A5
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 12:44:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY3pZ-0007qs-15; Fri, 03 Mar 2023 06:44:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY3pX-0007qO-Gu
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 06:44:07 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY3pW-00027k-1S
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 06:44:07 -0500
Received: by mail-pf1-x432.google.com with SMTP id fd25so1372402pfb.1
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 03:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677843844;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=AeoXiJWxj2QShZEQU4jANa5M0burtCEiuZuI+VRxHE0=;
 b=lPJmxSwzuuLmyG0pUA+82GlGfsOxmiUWe7XyeJ8E6BpYzSXeSsnHrUzrcdl7ouCJkW
 pHntFS5FPXZE6PI4gxh6wIlSwKKaj4H89SS7YjdRS+wL4mVKrX0GfKIwVBMhc3/K4xnj
 Tss/2b2mVPG3xRO+mluKjA/FtW7DfeW3vz/HZMCcVZZ0QWKexv4+6+/V9xcayORomjyF
 g1OS5Vo0Pzy9Xlw1zzNsHWjZG/U/9dMjRTWKd1FDmQy6TvBPpD68zDTdc0/MI7M2sxDH
 Eh1FH53lXSL4bFj3GTrLWHIMfkkIsjoVOSZI8+d1rA7qtWK16zEBLef6vb2RC2ZFBgn0
 UH1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677843844;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AeoXiJWxj2QShZEQU4jANa5M0burtCEiuZuI+VRxHE0=;
 b=EWtqZabCKc83/ZxmZHHACtxemyr3f21KEUNbwRJK1AGkMA+6krh4p1YL1MN7ySF66h
 i22hSw7FWk4nfpLrZiyNjjpjKdQvnPMdBZLwAcplRMeFF317D3syTPOy3zKqn1Tz+LDW
 pfbmcgA6qvyZb3CJuyEmwoDbBhOefLcj7moeFIzhFcMJR3+8oupNZC9YZC69Z384TP7w
 1kc7wogwg+4cx5gvn2oT/DvIYFRativE0AF0vj3PaGX0s6wwzDUPcWhqhRjioauievTY
 JD/DSKiFW40pS2tPZf05fakZo8s28y/L5rdZ9N34akhleK3S2mp+MEnbXWhaYd1r94ZJ
 TQVA==
X-Gm-Message-State: AO0yUKWi+8llhP+mJYw+8IwSrfdDcAp6pgew6EfQxBDYQX/46SGU8MIK
 h7o5Mc8IyuQsWKUfvZBjZeUM+ouk8azENULRUR2S3Q==
X-Google-Smtp-Source: AK7set93A+kndqhNzu2WIu/AEgwQIsP+7VewjMYNTO2J+X2+JKm+334345jMDrwn11Qb0l4g7ine2w3kbQnnwYCki6I=
X-Received: by 2002:a63:a80c:0:b0:503:a7:d244 with SMTP id
 o12-20020a63a80c000000b0050300a7d244mr389524pgf.9.1677843844152; 
 Fri, 03 Mar 2023 03:44:04 -0800 (PST)
MIME-Version: 1.0
References: <20230302172211.4146376-1-peter.maydell@linaro.org>
 <ZADeLNaltLAZ9BU8@redhat.com> <87edq6i4jf.fsf@secure.mitica>
 <CAFEAcA8aKkFse_nfoKSPA--QdQnB1xVZyMQoQWfqpf4yyxtzDA@mail.gmail.com>
 <188bd1ff-4ea2-6d92-2b6e-6f19af3df232@redhat.com>
In-Reply-To: <188bd1ff-4ea2-6d92-2b6e-6f19af3df232@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 11:43:52 +0000
Message-ID: <CAFEAcA-q3wixOMK3YxxWJ80Bomcod3MJEgHmZifBXJxzGeB9Lw@mail.gmail.com>
Subject: Re: [PATCH] tests/qtest/migration-test: Disable
 migration/multifd/tcp/plain/cancel
To: Thomas Huth <thuth@redhat.com>
Cc: quintela@redhat.com,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 qemu-devel@nongnu.org, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x432.google.com
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

On Fri, 3 Mar 2023 at 11:29, Thomas Huth <thuth@redhat.com> wrote:
>
> On 03/03/2023 12.18, Peter Maydell wrote:
> > On Fri, 3 Mar 2023 at 09:10, Juan Quintela <quintela@redhat.com> wrote:
> >> What is really weird with this failure is that:
> >> - it only happens on non-x86
> >
> > No, I have seen it on x86 macos, and x86 OpenBSD
> >
> >> - on code that is not arch dependent
> >> - on cancel, what we really do there is close fd's for the multifd
> >>    channel threads to get out of the recv, i.e. again, nothing that
> >>    should be arch dependent.
> >
> > I'm pretty sure that it tends to happen when the machine that's
> > running the test is heavily loaded. You probably have a race condition.
>
> I think I can second that. IIRC I've seen it a couple of times on my x86
> laptop when running "make check -j$(nproc) SPEED=slow" here.

Also, to repeat an offer I've made before, on my x86 macos laptop
'make check -j4' fails on this test about one time in two. If you
write a patch to add whatever logging information you would find
useful for debugging, I'm happy to do test runs with that patch
and send you the logs.

-- PMM

