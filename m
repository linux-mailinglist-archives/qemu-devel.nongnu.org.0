Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3754AF42C
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 15:34:47 +0100 (CET)
Received: from localhost ([::1]:45084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHo3S-00022b-Nb
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 09:34:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHnGr-0008MH-PW
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 08:44:33 -0500
Received: from [2a00:1450:4864:20::434] (port=37744
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHnGp-0000PG-6N
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 08:44:33 -0500
Received: by mail-wr1-x434.google.com with SMTP id w11so4165322wra.4
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 05:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=YYAs6hAG3aQ2JuZgiqg9pjs/GJqj+Ix4uLi3c1yCgPA=;
 b=dNMDDVjHt3THoGsrYxgKCX2711BED0GRWkCnvR1ziaOYLRWIq8m+UlBB8syecZxvC/
 LQFXMsVPUSLKbxVstji0+vtkKJ1KJsd8FintCDUNWLzCMj0JgfmH0gvFLU615b0CgJcz
 Y9g1t7qGn386bofE9VMm0SVxDrjBe1VMmMSvl9gbvJgSp5YIiqVPfqV7DX4tbxoC36F1
 7lGt8SRtnetMV+gRpRATTB0nJloNzorbv+w9q4p8HjHMgHCXhnbrny/7kZ4XJbWng2C7
 dKz4KyRBK6k118xuUY+A7Hxek/B1JSZ982WHInVPjIHhWCGx606TlaNd2mnQ5wXpDLxb
 COvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YYAs6hAG3aQ2JuZgiqg9pjs/GJqj+Ix4uLi3c1yCgPA=;
 b=Vg8KDKRsf3TyAw3QN6qHYNKbwT6srvKcLdO11d1FBdOIV/wnBNPGZw3ge6RVHpPNjb
 0G3F2qDbAjylhzlzvPbqM8acMBkqztI6AmJQNy+ezfpkHYyQQKQ/M8xpgMJsqCgnv5ZT
 sdl46IEsmHZC4BQxbbH1Iz28rG5knsElGRokFSDLZWsGs19NDfsYmCGL43AyG4oQNb4s
 v/4jBgTFH6TwYOiPKirPe90CI8uPXOA/z5UkAHQnxdz2B/9dzE2faf//4Vb/Sp61HprS
 Wc/XB2bcQWuIlftJ7YW+/pdzovY39+z+JxRvUMIIEpOp6GcgA5QbXqt5dWMV8BDpbM5L
 B3dw==
X-Gm-Message-State: AOAM533THjXjnElMxXfzLJjQDR5DJLmS5po1JJQlabILSLlLshvwgltF
 g5r1jD9amGvQbv15whHodliATP5qZS+ZIr/vV6I5Hg==
X-Google-Smtp-Source: ABdhPJzi8AcVF8fHl+A4rVdl7bj3FIqPBAzv3Cip2GkHQq9uWAb0C0/XCRCxVrJGY85VrOJfSnD4GhEna5IvnMt9gBk=
X-Received: by 2002:a5d:498d:: with SMTP id r13mr2235501wrq.172.1644414262833; 
 Wed, 09 Feb 2022 05:44:22 -0800 (PST)
MIME-Version: 1.0
References: <20220208200856.3558249-1-peter.maydell@linaro.org>
 <20220208200856.3558249-6-peter.maydell@linaro.org>
 <4a8c6105-b1b2-99a2-27b0-ebb48463a50d@amsat.org>
 <CAFEAcA-At8OFF4tU-c3T0simXX5B90ZzJ9Efj573RF6MM3D+JA@mail.gmail.com>
 <8f330b10-7978-860c-35c5-282c8db23f70@amsat.org>
In-Reply-To: <8f330b10-7978-860c-35c5-282c8db23f70@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 9 Feb 2022 13:44:11 +0000
Message-ID: <CAFEAcA_hXERA3Y0A8JkBxP6xotSHqJtdvTvV8c_gxGh1O_M+PQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] include: Move hardware version declarations to new
 qemu/hw-version.h
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On Wed, 9 Feb 2022 at 10:10, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
> On 9/2/22 10:25, Peter Maydell wrote:
> > On Wed, 9 Feb 2022 at 09:20, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
> > I'm not completely convinced that (a) we have a clear idea of
> > what of our APIs are legacy and what are not or (b) that we could
> > coherently move the 'legacy' ones into separate files.
> > If you want to propose something like that as an RFC, I don't
> > 100% object to it, but I don't want to do a very small subset
> > of that as part of what is really just a "get stuff out of osdep"
> > series.
>
> OK, thanks.

Thinking about the 'legacy API' issue a bit, rather than putting
them in particular include paths, maybe we could have a file
we list them in, and have checkpatch automatically check for new
uses of them. But I think our major problems with legacy APIs are
more "we never go through and complete transitions" rather than
"new code coming in uses old APIs we're trying to move away from"...

-- PMM

