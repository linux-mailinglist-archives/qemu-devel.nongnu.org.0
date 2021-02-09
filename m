Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEAE5314BF6
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 10:46:13 +0100 (CET)
Received: from localhost ([::1]:44354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Pb2-0005r2-W8
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 04:46:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9PZW-0005QE-9m
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 04:44:38 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:37790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9PZN-0001KD-Dm
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 04:44:37 -0500
Received: by mail-ed1-x535.google.com with SMTP id q2so22630324edi.4
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 01:44:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/ZYiljwIDgwipEca+/vnXYe6KidcBeMKRURhjOCHH2s=;
 b=afc+NXNuqKphW/VmMYn4q30qGMFP0hmSVRYkBAceoYMXEdWLqQhGCnsgcxLNaGdawX
 CBwJxa2OIBCW7GtsdZsJOwDTeIipKN1nPYKyTYfxBW4E3wKxRpFptuEEjUGPcDraDAw9
 qf5UEWZudUIZDr+yd7Mef+l38ABfgc9fvgNZPu+gfRK4C/VQt9a/VaIGWCd02Bun9hBw
 fJUOX4tnmWHIl0RkGvbTNntCGMFJmAzCLawR9cXj8yzBH1w9ZJQgOEdY6ff3lv24nfEc
 IvcmsKwwBq45jjpBx03C17bG/vUm8gbuwPERXJKbwk3XU+n6eTSlYjaf5P8ndDmLxSpC
 JbsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/ZYiljwIDgwipEca+/vnXYe6KidcBeMKRURhjOCHH2s=;
 b=FCKFfwhk87TyV0/SPgDF1Kv3a6xMSB9j0dn10t8EkHNqbPJSBrv3BHHiKCDPJBQamO
 1ZSqhCwZAQhJ/h4+rTcntuBB2i3NervPDYuMRTpcS6LQ83BZjSbe9sJoudHUHdGT4L4H
 SOuG403/YAhKVz3UUIgNQCw0S7EEYn14s+CB5b9gIajDWod0Ndnytfv2V/R7Qh5y1Xue
 89l2o+ibA0t6h7Bq4AwGznbFOyG/MyAKhxocZPV2j4sZ8OMSOSOKiQqg8Ra+gUq58CXd
 A1sIjPKPv4ibcxWCvYdSk2BjaRFmzjeY/0NHpL60lAy5nClj+AWP1Ym+8ZwTycgVYfhv
 r8Qg==
X-Gm-Message-State: AOAM533K9SiFb6JZ8knCbxzDdnemSnFVzcczK5jCQeXjupiusPKvN0gn
 hMxZBI1ZDKeBqVwelXmAmt6GQHmGNh5CuYMD4hW/hg==
X-Google-Smtp-Source: ABdhPJyo7nKQ3ZvP/DBiRENRxmqKneMBcsZpxv0Q7c/1m7mI+gwfOySD17s+HSxGdo2YvMIbGqjUmQFbWI0l8XYEoa8=
X-Received: by 2002:a05:6402:541:: with SMTP id
 i1mr13088405edx.36.1612863867795; 
 Tue, 09 Feb 2021 01:44:27 -0800 (PST)
MIME-Version: 1.0
References: <20210202232838.1641382-1-dje@google.com>
 <20210202232838.1641382-2-dje@google.com>
 <CAFEAcA_O7eNxk2hsDxj2=-zHEXP3K4fdVHs8nWqcH3ZaMMKM3g@mail.gmail.com>
 <CADPb22T69j7TahUr8OhmVv4ZQQyJxSvQ1qm1aDm_SpR2nuRr6w@mail.gmail.com>
In-Reply-To: <CADPb22T69j7TahUr8OhmVv4ZQQyJxSvQ1qm1aDm_SpR2nuRr6w@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Feb 2021 09:44:16 +0000
Message-ID: <CAFEAcA_mE_ixAmcYrtb_H=S8BNXU+nTqO6T2+iJLJ8wfk9hRQQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] hw/net: Add npcm7xx emc model
To: Doug Evans <dje@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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
Cc: Hao Wu <wuhaotsh@google.com>, Jason Wang <jasowang@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Avi Fishman <avi.fishman@nuvoton.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 9 Feb 2021 at 01:26, Doug Evans <dje@google.com> wrote:
> On Mon, Feb 8, 2021 at 9:17 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>> Don't put local variable declarations in the middle of functions,
>> please. Coding style says they should be at the start of a
>> block (so, here, the start of the function). It looks like you've
>> got middle-of-function declarations in several places in other
>> functions too, so could you fix them all up please?
>
>
> Fixed in v3.
> Maybe now's a good time though to revisit this rule.
> QEMU uses C99, and mixed decls/statements is an easy improvement to the coding standards.
> I'm guessing this is an uncontroversial request. Is there just inertia behind not making the change thus far?

My personal opinion is that having declarations in the
middle of functions is uglier. CODING_STYLE.rst already
notes that we have an occasional-exception if there are
#ifdefs involved, so we don't have the style rule because
we're trying to work with compilers that don't accept
middle-of-block declarations.

thanks
-- PMM

