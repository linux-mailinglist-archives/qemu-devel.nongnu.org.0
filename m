Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE785911F2
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 16:11:35 +0200 (CEST)
Received: from localhost ([::1]:48482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMVNu-0003fR-FH
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 10:11:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1oMVLy-0001vg-VM
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 10:09:35 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c]:40658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1oMVLw-0003GG-OO
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 10:09:34 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-324ec5a9e97so11006137b3.7
 for <qemu-devel@nongnu.org>; Fri, 12 Aug 2022 07:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=ubM9o0C2c/Ax331L8WBvvEOdXkeMlgLRtcARvYDJ7G8=;
 b=XRyOccXh+a5b9j3QggAOjXX8Y+8+jzuEqPi4TrVYkWSWAxqjHgaNYg23ol4lZfsLcI
 SoCvcrqoH47zoVDehrUR0z9dK9hlyVqlBpIkF+le4UbDLSjOJmECZXtXoCcbuxfWhiR9
 /EjnLz7llxaJSF+7O36c1QzCycbQ/BfCemt4p9/F/qDcDElRr3uZmciIc+OBt/WkwlM1
 35Mw9mG0Ziex0pTzqCgB+OU2URdEHYPtTh0y12guQCpW8PGvdy3rM3j2Z45ANk/u1OvO
 3rNljEmaeuwo6B3t25lWGWg3p3XFjwmtOv9d8MYqk1wiwVWxbMiaqeliaOUVrl3hZo4K
 DA/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=ubM9o0C2c/Ax331L8WBvvEOdXkeMlgLRtcARvYDJ7G8=;
 b=4oIBXs/LwnruqIeSpYZpLASeXOjuC6VdHUwLt6OVrgliw4XL1cZhJbyywUPfF8OffX
 JTmDVLZ6fkFWU1cb0/AWFN8V2Nx3X6vJYlf7XtPwSXBPcx8Uv8bqw9kq6Ddw/6crE/yy
 oZWPCnZv11+YPLD5pUhUzKGOyDbGUqY5Qfa3sH8MyLSlt/iDp+le8xCMcHgN/RiG8usR
 3rwtR0/FVvOUWDNM91F/SwG+XuxYlNDXqBB/xBbK388VWKdqvUI5Vw7Rwey2MaINh/6i
 nAAqUL1nSNdHcAOzSnbPUQFs3qyTjd1Q6VHSudnXopDkhnL7rBh7LowJoJoxP2IL9O2V
 awzg==
X-Gm-Message-State: ACgBeo2Y7YZnFWFpybtCr1NaAb7iXSiyepsL1kuEiCKnuNOKXGN4HzYT
 cw3vu5SYZ7n7lasK8ohDKPKBX1b1fMqfbjpNoEnU5Q==
X-Google-Smtp-Source: AA6agR7yx292fJpNx+5n6POr/jeInUJu4ymSjWhFryV9qiVirK7MLFtwU2LIeG4KfAdKfrxb9tjgRVjxdyGyJSCsnqA=
X-Received: by 2002:a81:1dc5:0:b0:328:8d1b:bd54 with SMTP id
 d188-20020a811dc5000000b003288d1bbd54mr3882175ywd.110.1660313370608; Fri, 12
 Aug 2022 07:09:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220812131304.1674484-1-philipp.tomsich@vrull.eu>
 <20220812140103.3lbh45oidiw2fhsf@kamzik>
In-Reply-To: <20220812140103.3lbh45oidiw2fhsf@kamzik>
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
Date: Fri, 12 Aug 2022 16:09:19 +0200
Message-ID: <CAAeLtUDbVwvQzr9u+D2KH6qBoiu4ikEbf3aVahbmK_i=6gEM7A@mail.gmail.com>
Subject: Re: [PATCH 1/2] target/riscv: fence.i: update decode pattern
To: Andrew Jones <ajones@ventanamicro.com>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-yw1-x112c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 12 Aug 2022 at 16:01, Andrew Jones <ajones@ventanamicro.com> wrote:
>
> > Update the decode pattern to reflect the specification.
>
> I got hung-up on this for a bit since there isn't any "must-be-0" fields,

Please refer to '=E2=80=9CZifencei=E2=80=9D Instruction-Fetch Fence, Versio=
n 2.0' in
the specification.
The encoding diagram clearly states 0 for imm[11:0], 0 for rs1 and 0 for rd=
.

However, there is an explanatory paragraph below (unfortunately, it is
not clear whether this is normative or informative):
> The unused fields in the FENCE.I instruction, imm[11:0], rs1, and rd, are=
 reserved for finer-grain fences in future extensions. For forward compatib=
ility, base implementations shall ignore these fields, and standard softwar=
e shall zero these fields.

Strictly speaking, this patch may be too restrictive (it violates the
"for forward-compatibility" part =E2=80=94 which I consider informative onl=
y,
though).

Thanks,
Philipp.

