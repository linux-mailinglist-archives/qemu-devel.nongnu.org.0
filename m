Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8FA9E864
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Aug 2019 14:53:19 +0200 (CEST)
Received: from localhost ([::1]:51198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2ayL-0002ru-Vf
	for lists+qemu-devel@lfdr.de; Tue, 27 Aug 2019 08:53:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54177)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i2aws-00022j-0g
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 08:51:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i2awq-0002Au-VU
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 08:51:45 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:46490)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i2awq-0002Af-PT
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 08:51:44 -0400
Received: by mail-ot1-x344.google.com with SMTP id z17so18470817otk.13
 for <qemu-devel@nongnu.org>; Tue, 27 Aug 2019 05:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cQ4eR/ZrAnIV2k/pOuepZ9kiuU66uDlGWvsbhdC/PjQ=;
 b=KUWN28ChSCdZFVCfEjWiYOyhKvAFZVPSVdLwtsQfIzmM+hoR43RT2YVkj5q1WyRRCP
 mJFzelNGwZEJlsVMXSL2IM4Ti2h1XZkfZZ2HCLzzIA5tOCGBIyep/jv1ERavYYYK0M/V
 KFSAlNzTSeRfin2ok3WmwnCoI+D+wCXy2V425x8T8m07hM1aj97xgLY+mpXo5UsB0q4O
 GCo57aHxiP007O9NFoOHYGfoHUQYcHL9YX3rBjswXv0BJhhqtPBwFUkKLsv5v2YA8Zyh
 D1I0L/ygzfEZxeYsZTtFv4PzPCDq6/tOgYXuGTM34VvZNPEOH2ilNV0UxbQ+vIY9kXH3
 MBmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cQ4eR/ZrAnIV2k/pOuepZ9kiuU66uDlGWvsbhdC/PjQ=;
 b=trDe0/MG7xmiwY5liNWErVqAiU5mesDs24VAwKzi6hnZzWCdJUJNiw6Uu3T8qqbxzy
 0nIiESmAh/0CvnxOBEZjCL2hOTjypLKbT5mZaakg1oracFTA7Vm7JiuTiuH6zroGK/8G
 jWh4cDS0bVM45qbmr//riLKEJ7qk3qE+sFrJbM7UJea8t/C2tdNr9HaRWoY5nbDhaisE
 TUgnZeO7Ujuh6nY3UwlxOlEiQEg+1cliyVBta70I+607a3mK7LfhBe7GqnxA5oRfddmy
 bZHqbQPTfnQeXWI/MvRL/mc4DIyERvubP1ca0QNnoYkV+YS+PVeTRjIqvRSGfrZg8WQC
 KPFQ==
X-Gm-Message-State: APjAAAVgvofGDIo8NXO4My1rJhSi4A6KfMVy/yBTCbiIn9NmwRKMhl03
 /FMNIDZeKX7bohy9pPdbA0CVC6W7q99QaUVZyiNRyQ==
X-Google-Smtp-Source: APXvYqy0/UX46yXxvDab0nUCEG6nhWPNF1Dzdqt7cSeH5q2UFWf97yEqahHwHhhZ+envOMj1CIZQQ5StcCWCj5qijHE=
X-Received: by 2002:a9d:6a94:: with SMTP id l20mr18772846otq.221.1566910303651; 
 Tue, 27 Aug 2019 05:51:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190826151536.6771-1-richard.henderson@linaro.org>
In-Reply-To: <20190826151536.6771-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Aug 2019 13:51:32 +0100
Message-ID: <CAFEAcA9bDtHCps4z6BNgDLnGmzTKaW5S8p8qQFLfxCFjGRYaHQ@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-devel] [PATCH 0/2] target/arm: Fix aarch64 illegal opcode
 exceptions
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
Cc: Laurent Desnogues <laurent.desnogues@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 26 Aug 2019 at 16:15, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> As Laurent pointed out, gen_exception_insn is very different
> between aarch64 and aarch32, so we shouldn't accidentally
> redirect one to the other.
>
>
> r~
>
>
> Richard Henderson (2):
>   Revert "target/arm: Use unallocated_encoding for aarch32"
>   target/arm: Factor out unallocated_encoding for aarch32



Applied to target-arm.next, thanks.

-- PMM

