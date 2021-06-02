Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCCF7399353
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 21:13:23 +0200 (CEST)
Received: from localhost ([::1]:39430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loWIs-0001VI-Jl
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 15:13:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1loWH7-0008ED-0p
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 15:11:33 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:46701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1loWH4-0001au-1e
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 15:11:32 -0400
Received: by mail-ej1-x62f.google.com with SMTP id b9so5394129ejc.13
 for <qemu-devel@nongnu.org>; Wed, 02 Jun 2021 12:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gEBlWTqqbQ/WstFOo6dKhZ1DayOTP2LTUDvw5I5JPOo=;
 b=vKOZNXCrgZFC/oU+4840uBBa+7eVh+FLqKVK13FhcQeboCmmlKCedODzfNNG5jQwYA
 zHAkrSmGVHeXIPvQ6MN1AQXI5lULrMuxSADXJri2y/jeASoIq59bVLL+6HQSqha4Cui2
 fGtjBIeWZ6+u16rGwHPf7kEewhD/+y9N259sJAnAIgt6TN7bzTrVbgEzbvB0jBEK+xTh
 /mktbX9s+7eZG+Utlq3NZIiqBjr5GsAwU9LTXwIA2I+VhFtK+gMGG1whsFlK/wLSO2c4
 QVWXo9HEWjbsq7xYdsxPaimyTzLuJJ6uHCW6xd9qzU6+4iUbb65iWPM/W3z3Ol7CKt0P
 Og1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gEBlWTqqbQ/WstFOo6dKhZ1DayOTP2LTUDvw5I5JPOo=;
 b=QOQnbMMuBOnfu9y2nBRjRixX0++RGCK4ENMSLnK8NDZpCatrgU0E/dsLUvTRFqWUBr
 nbLJ8zwgiYJlFtlgFsVrSMI+p6TUCatpI2kxAUneF4iGN78iwa4v049NYgpKplZkWEnN
 syAEXg/UHv6MYVrwMmyM5/3sPo/BEpKwttFMqgX74JOXwGa2jHhia+/r4/dhakvdWEB/
 0UxSaRGE1KP0lYIXyU/587gRjYGC9m79l2aIhwHNB8kL4h2OuilCvQdIESDKM7IQsrZ9
 VMNowZW6I+uwkjlV7weKRc6oI400u32+8Yu439OLIzBhxSEH0kGrerxSZtPg3gplSQYz
 OyYA==
X-Gm-Message-State: AOAM531dCpvyAzjHbMey1cQfT690CdO/cSGNSyVvmzrUgKwD80HJz+4z
 69z5j3Fs5IknNh2k4qa4xn6jV+PAxNgGkhvNemLLMQ==
X-Google-Smtp-Source: ABdhPJxw25Aelr8eFwYWwWnx6OMgbCSyJm25sanmDM0oUFBdEP5hemctDXpJ3lxsyBQmPrOMsd5LmnYWvo9QEy/3NX0=
X-Received: by 2002:a17:906:5299:: with SMTP id
 c25mr20105482ejm.85.1622661088322; 
 Wed, 02 Jun 2021 12:11:28 -0700 (PDT)
MIME-Version: 1.0
References: <OS3PR01MB61515F08F0709D9E22B8DDDFE9249@OS3PR01MB6151.jpnprd01.prod.outlook.com>
 <TYCPR01MB6160FB4A9712F3F5E14D8BBAE93E9@TYCPR01MB6160.jpnprd01.prod.outlook.com>
 <CAFEAcA_fZ_jC640XrFUCSk6YxzoSmdwDaMDAXoX47mBFKdS9hg@mail.gmail.com>
 <a56283b3-3bb2-d9a3-9a6e-8175cc17b376@linaro.org>
In-Reply-To: <a56283b3-3bb2-d9a3-9a6e-8175cc17b376@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 2 Jun 2021 20:10:56 +0100
Message-ID: <CAFEAcA8-KXp204HD=LcUo8CHQX-ioCMzL8kaOyHTUP9KQz-TAA@mail.gmail.com>
Subject: Re: [RFC] Adding the A64FX's HPC funtions.
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "ishii.shuuichir@fujitsu.com" <ishii.shuuichir@fujitsu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2 Jun 2021 at 20:02, Richard Henderson
<richard.henderson@linaro.org> wrote:
> On 6/1/21 8:21 AM, Peter Maydell wrote:
> >>> 2) Is it OK to specify the option to set the HPC extension of A64FX as follows,
> >>> for example?
> >>>
> >>> -M virt -cpu max,a64fx-hpc-sec=on (*sector cache function) -M virt -cpu
> >>> max,a64fx-hpc-hwpf=on (*hardware prefetvh assist function) -M virt -cpu
> >>> max,a64fx-hpc-hwb=on (*hardware barrier function)
> >>>
> >>> It is also possible to implement something like -cpu a64fx, but since we don't
> >>> know if we can implement it immediately, we assume that we will use the -cpu
> >>> max option first.
>
> My first thought is that -cpu max can simply enable the extensions, without
> extra flags.  The max cpu has all of the features that we can enable, and as I
> see it this is just one more.

I dunno, because it's not an architectural feature, it's an implementation
feature. We can rely on architectural features not to step on each others'
toes, but there's no guarantee that some other impdef feature might not
clash with these a64fx ones.

Also, how does the guest OS typically detect the presence of these
features? If it does it by looking for MIDR etc values that say
"this is an A64FX" then -cpu max won't trigger that.

> I would like to add -cpu a64fx at some point.  But as you say, that need not
> happen right away.

I think it would be worth scoping out how much work the a64fx CPU
would require (ie what else does it need beyond these extensions
and whatever features we currently implement?). If that's not a
lot of work it might be simpler to just add it (possibly even
add it but with one or two of its features as not-yet-implemented.)

thanks
-- PMM

