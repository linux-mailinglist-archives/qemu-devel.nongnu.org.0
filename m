Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F724B2746
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 14:36:09 +0100 (CET)
Received: from localhost ([::1]:57180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIW5o-0006ea-2F
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 08:36:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nIVRs-0006Pk-Rp
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 07:54:52 -0500
Received: from [2a00:1450:4864:20::32e] (port=45719
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nIVRq-0002qD-RI
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 07:54:52 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 az26-20020a05600c601a00b0037c078db59cso1761708wmb.4
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 04:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=uSN7qddcbCZbfinKZYJsSPNEJ7jx742sFmfxeZDqdV8=;
 b=R2/R5/3L/KOwfCbQqzGkGyXDpbOzZ58KECqfSQCmgSpA/fbkaSwOywJoptzQxNY/U2
 1yB+r8T6OJnUib06hEX1iocVhEzp7zfwtHjAfFw1b3nWb8Dg48bz5udcSTwg/ClTWySR
 uzMLVPjgVM68IvgWOJMrDk9mnE0ySCcw1DdJrOMi4wykQtB7Ew/CnAG3+2hVqGH/sjUk
 ZVdkwKU8nSSqhJC9xyFGqaFztNXlMm8WrQQLVAoFPpavVSk1bjR1DJRmLczgvrVZ9FBh
 gUK93kd7de780nuD8gUJ0KAGTHHiy4i2edpIZy3SP+FmiUYOivTAMr3w4q6O/bAJQXXm
 bleQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=uSN7qddcbCZbfinKZYJsSPNEJ7jx742sFmfxeZDqdV8=;
 b=jmhgglXIa0Td9XToIn9dj+viNagGHpGiDx7zmcKOxtUx1JjWQe/7GRjfIBHRr44qbc
 FaUZjo3KBC5rnTty+qjifOCAykF+8ivA4QSEXt/AvWokhUI6zHz4IvyBWOQW6aO/F144
 paAkPOm31d+VJGCZo3D0nX/K35PEMpNDqIPTVYkZZC/nFuuwLRfTOowq2MojHJ6n8a2U
 8kB2xaB16gBSPVfER2aiuGpyL7uUliAb4zObdpN+OvZc6Z0Q//OyYjhlVu4pX+ULhTLi
 /TZDiEi0k1Zae7eauat1MGy3NuFWepwtR6i8AjRgd3gxRP7QFQILLvdKkoRsSDehG76I
 NrQw==
X-Gm-Message-State: AOAM530qd4QXXEL2ir+H69eS9nE0lyJcavjQSy+k3aPPv61PjoGFGvDg
 uNvF2zZzCzjtisOKPKjtzaERTbgX52avRBuhv64WeA==
X-Google-Smtp-Source: ABdhPJwOhTtpI37OvnVgSzh6Zj2Yr/trQeoJo0wT4UA41mJPS9WHXQ/QIm+X3nhwGvQ0CVBXbQTPgWrZL6agALbjRRY=
X-Received: by 2002:a05:600c:354c:: with SMTP id
 i12mr196406wmq.21.1644584088371; 
 Fri, 11 Feb 2022 04:54:48 -0800 (PST)
MIME-Version: 1.0
References: <20220209230030.93987-1-f4bug@amsat.org>
 <20220209230030.93987-3-f4bug@amsat.org>
 <CAFEAcA_DYEKgn31ULPVZzR9kQ32FZe+MBdkbC8cRNjy4Oa=7iA@mail.gmail.com>
 <54ea7876-e1e0-193d-31fc-da2f360c7d7a@amsat.org>
In-Reply-To: <54ea7876-e1e0-193d-31fc-da2f360c7d7a@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 11 Feb 2022 12:54:37 +0000
Message-ID: <CAFEAcA_A+vAmSbeSyTf-_GkRHHqz==5M4s7mfByBuD4GNOeO0Q@mail.gmail.com>
Subject: Re: [PATCH 2/9] coverity-scan: Cover common-user/
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Laurent Vivier <Laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 11 Feb 2022 at 12:38, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> On 11/2/22 12:56, Peter Maydell wrote:
> > On Wed, 9 Feb 2022 at 23:12, Philippe Mathieu-Daud=C3=A9 via
> > <qemu-devel@nongnu.org> wrote:
> >>
> >> common-user/ has been added in commit bbf15aaf7c
> >> ("common-user: Move safe-syscall.* from linux-user").
> >>
> >> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> >> ---
> >>   scripts/coverity-scan/COMPONENTS.md | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/scripts/coverity-scan/COMPONENTS.md b/scripts/coverity-sc=
an/COMPONENTS.md
> >> index 183f26a32c..cea6695ecd 100644
> >> --- a/scripts/coverity-scan/COMPONENTS.md
> >> +++ b/scripts/coverity-scan/COMPONENTS.md
> >> @@ -127,7 +127,7 @@ usb
> >>     ~ (/qemu)?(/hw/usb/.*|/include/hw/usb/.*)
> >>
> >>   user
> >> -  ~ (/qemu)?(/linux-user/.*|/bsd-user/.*|/user-exec\.c|/thunk\.c|/inc=
lude/exec/user/.*)
> >> +  ~ (/qemu)?(/common-user/.*|/linux-user/.*|/bsd-user/.*|/user-exec\.=
c|/thunk\.c|/include/exec/user/.*)
> >>
> >>   util
> >>     ~ (/qemu)?(/util/.*|/include/qemu/.*)
> >
> > Note that there is no automatic process by which changes to this
> > file get applied to the coverity scan config, so hiding changes
> > to it inside a larger patchset increases the chance they get
> > overlooked (by Paolo, who gets to do the manual config update)...
>
> Oh OK, I thought this was consumed by a script.

Unfortunately Coverity don't provide an API for configuring
components, so it all has to be done via their webpage GUI :-(

-- PMM

