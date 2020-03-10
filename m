Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0796217F5FC
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Mar 2020 12:17:19 +0100 (CET)
Received: from localhost ([::1]:58002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jBcsw-00006V-3O
	for lists+qemu-devel@lfdr.de; Tue, 10 Mar 2020 07:17:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46586)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jBcri-0007sj-Kq
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 07:16:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jBcrh-0002M8-HU
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 07:16:02 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:35181)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jBcrh-0002J4-9U
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 07:16:01 -0400
Received: by mail-oi1-x241.google.com with SMTP id c1so13430251oiy.2
 for <qemu-devel@nongnu.org>; Tue, 10 Mar 2020 04:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1X5heOiSYqZ2K0ikvRQym7c3BMSbrHW89NSxe0iJLbA=;
 b=WG5TtJdf8tJ3tDEK5fIt/Jh7dH2xLKufFGPY8G6ab2cVpXmqOMa6jCCDTrWnVdBBrP
 NL/j5pUApo5l4BiLWXqA2lb5OwayqsGKbq8ScQJen8Mv2x3GPwlwhwPuIpahg1bDi9v3
 l990P28Ien1NaGdrFbl4fM7xHYoqy0EFcB+qyC4qpfE3fyxikyrAeLWh4SBmpQFgOEEj
 TXlLkYRVSlHkp0rpVcbBtaFlLoMO8oVEjRM1fwvTOO/Jd/KLZc1Hojt44zYH5XXkcMJV
 rQKT0ClrsRd6bSLgjIkY//DvKVUrIr0d6nWMZa6XTX8zR05Z22zngoLetljMEWUlAy10
 hplA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1X5heOiSYqZ2K0ikvRQym7c3BMSbrHW89NSxe0iJLbA=;
 b=SvyQw2q0qoLCEOEw3xpWzMoK+3ptTAXxBL/QN9Yt90FhhRcDwQy8PEpgqZkxj9WZyZ
 V47Go1OIAULe3Yvx8qH5l510eeAD4SQN5n8AFCcqlgwAG2tXs/3PZj9B98Xo/qutmhqG
 gdq8vdfztx0FNNO15OTtJncu088EPmxT9o13uIIJllnFycXBzWfPjKoE/qduCwcTWW1B
 MVM/bQFaPnrMK7uXCZH2TxwwIGArWLXnVVYTz8wVdNPxzuP6J5HEltAhCjMP/g71hwec
 Sd6c6jYJer7T8/DCRfNwYi0+gaz7CXAO0y4fXElILJeQP/vDe83xTTHMhQrihPd+u5IE
 ijrw==
X-Gm-Message-State: ANhLgQ3fRGiOQdieX+8/479fo7BZ7Eir8te3Ae0xTrQkwq8TYEk8pnr+
 RDdoj1p2TMmopW+WLhUHJondQuGxL6b6OQJFtoG1hQ==
X-Google-Smtp-Source: ADFU+vuPWqCXgGZPTG1lt9QA8CeFIhvzt6OykPdVMeG+pzOAeH3fNSpRPBQt+546LcY3A2Yt9g/u5NhDoQjYKhz694Q=
X-Received: by 2002:aca:c608:: with SMTP id w8mr730205oif.163.1583838960307;
 Tue, 10 Mar 2020 04:16:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200310103403.3284090-1-laurent@vivier.eu>
In-Reply-To: <20200310103403.3284090-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 Mar 2020 11:15:48 +0000
Message-ID: <CAFEAcA8iXabS+Dj+6SiBCoNn2U2gFi0hoH6ogAmv15raGYUHUA@mail.gmail.com>
Subject: Re: [PATCH v4 00/21] linux-user: generate syscall_nr.sh
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
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
Cc: Cornelia Huck <cohuck@redhat.com>, qemu-s390x <qemu-s390x@nongnu.org>,
 Riku Voipio <riku.voipio@iki.fi>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Taylor Simpson <tsimpson@quicinc.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 10 Mar 2020 at 10:36, Laurent Vivier <laurent@vivier.eu> wrote:
>
> This series copies the files syscall.tbl from linux v5.5 and generates
> the file syscall_nr.h from them.
>
> This is done for all the QEMU targets that have a syscall.tbl
> in the linux source tree: mips, mips64, i386, x86_64, sparc, s390x,
> ppc, arm, microblaze, sh4, xtensa, m68k, hppa and alpha.
>
> tilegx and cris are depecrated in linux (tilegx has no maintainer in QEMU)
>
> aarch64, nios2, openrisc and riscv have no syscall.tbl in linux and files
> are generated manually with the help of a script from the asm-generic/unistd.h

Incidentally I hear from Arnd Bergmann that eventually the plan
is to have a syscall.tbl equivalent for the asm-generic users,
though I don't think there's a timescale for when this might happen.

thanks
-- PMM

