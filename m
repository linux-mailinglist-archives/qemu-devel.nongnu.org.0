Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BFAB4C4717
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 15:09:38 +0100 (CET)
Received: from localhost ([::1]:36014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNbHt-0000zc-8m
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 09:09:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nNaPl-000895-TX
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 08:13:41 -0500
Received: from [2607:f8b0:4864:20::b32] (port=35337
 helo=mail-yb1-xb32.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nNaPj-0004wA-Js
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 08:13:41 -0500
Received: by mail-yb1-xb32.google.com with SMTP id bt13so5810542ybb.2
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 05:13:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=lGI1mogxhwryDLW4ABCiVDctbRe9KiKX94lviyCFJwI=;
 b=M/c2/p9AiTa6DO22Xc0Ham/paoyPPSbPjb3NJliU7mCVwDraFyo4ygg9TtfsxI+lqS
 SvfWHmnyAj6Xu8OiUGtQ2973st/vhV77sgv8/3y+Wr7cqBwdB98/R1xIFVg0QdHJ7TUZ
 zeLjhlE6lMAT5PA4KU6ozkHvjbthk8DfbprTEEjl0D6snVfGY1J/KhaFf8EW36IguiYu
 6nM6Al9wQAmN5YJCtiqrNE+bQk5KZF2Cl1ThebJkPdsmYf4/YlHiw6vrl6gLf0fo/int
 FW9JkHafTtIZtRAKT08Pw5NDwqgF/vbIoe3DEaLRFmU/Q6LH9jBVdTf5ODs0R5CZAwaj
 i13g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lGI1mogxhwryDLW4ABCiVDctbRe9KiKX94lviyCFJwI=;
 b=mxSBwMec8+Futrc8YvVdmxh6rTOj5U4gRyYE8GjOTH22stki7G5vEGUnhZ138Kslvo
 aXN6dSBIKwJtFMKzmRE/8Ij2YGDXL8EG/6Kx8n/kWZjLbnO2XXR67SbqfnNeOeLAOJ/g
 CCMbmVBB/AlEAiSn6tjWJ32h4V//01/yMMDkND8RHHUIJD9xH43NeLArz9y1uS69PRTR
 kqeu0qWyUheI0d8zcuyuW0e/DiUBmjQ2vV8E+qyCJ9/89dYUXt81AoAn3v+5Kw0g6/RK
 iL34RRfB+fVuj3dj0yPS6Wx4LYG57GQHXQriObZW7uO9jSISooRD3HxYIr2jXyrrb7+1
 Zg/Q==
X-Gm-Message-State: AOAM533mzysxpSl7UBunB0QWpL36oExOhs9OpLCw8E0Jq5DHAjMbUId7
 zGQ7ZPT1Ro/AncVi3vZb+1P45MuizWf7LeSfBA+Mww==
X-Google-Smtp-Source: ABdhPJxZs0Zb9e/wJlhSYsZBac42tEwTL+W3joDV5JrgtSXd41fyvSbMsPhKROjB5iU6zcvJjzQJ7z3wRo9IdkAwKnk=
X-Received: by 2002:a05:6902:83:b0:61a:709b:d841 with SMTP id
 h3-20020a056902008300b0061a709bd841mr6903546ybs.140.1645794818017; Fri, 25
 Feb 2022 05:13:38 -0800 (PST)
MIME-Version: 1.0
References: <20220214185605.28087-1-f4bug@amsat.org>
 <20220214185605.28087-6-f4bug@amsat.org>
In-Reply-To: <20220214185605.28087-6-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 25 Feb 2022 13:13:26 +0000
Message-ID: <CAFEAcA8yaBOD3KXc-DY94oqzC5wkCENPkePgVCybqR=9NmdQFQ@mail.gmail.com>
Subject: Re: [PATCH v5 05/16] hvf: Fix OOB write in RDTSCP instruction decode
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b32
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Li Zhang <lizhang@suse.de>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 qemu-devel@nongnu.org, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Will Cohen <wwcohen@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Feb 2022 at 18:57, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> From: Cameron Esfahani <dirty@apple.com>
>
> A guest could craft a specific stream of instructions that will have QEMU
> write 0xF9 to inappropriate locations in memory.  Add additional asserts
> to check for this.  Generate a #UD if there are more than 14 prefix bytes=
.
>
> Found by Julian Stecklina <julian.stecklina@cyberus-technology.de>
>
> Signed-off-by: Cameron Esfahani <dirty@apple.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  target/i386/hvf/x86_decode.c | 11 +++++++++--
>  target/i386/hvf/x86hvf.c     |  8 ++++++++
>  target/i386/hvf/x86hvf.h     |  1 +
>  3 files changed, 18 insertions(+), 2 deletions(-)

I'm not a huge fan of the VM_PANIC_ON() macro, which appears to be
essentially an obfuscated assert(), but it's the existing code style
in this decoder I guess.

> @@ -1847,7 +1849,8 @@ void calc_modrm_operand(CPUX86State *env, struct x8=
6_decode *decode,
>
>  static void decode_prefix(CPUX86State *env, struct x86_decode *decode)
>  {
> -    while (1) {
> +    /* At most 14 prefix bytes. */
> +    for (int i =3D 0; i < 14; i++) {
>          /*
>           * REX prefix must come after legacy prefixes.
>           * REX before legacy is ignored.
> @@ -1892,6 +1895,8 @@ static void decode_prefix(CPUX86State *env, struct =
x86_decode *decode)
>              return;
>          }
>      }
> +    /* Too many prefixes!  Generate #UD. */
> +    hvf_inject_ud(env);

This doesn't look right. This is the decoder, so it shouldn't be
actively affecting the state of the CPU. Also, we don't do anything
here to cause us to stop trying to decode this instruction, so we'll
carry on through the rest of decode and then the caller will call
exec_instruction() on whatever results.

I think if you want to say "this instruction should cause a #UD"
you should emit an X86_DECODE_CMD_* for "raise #UD", stop decode
of the insn at that point, and then handle that in exec_instruction().

You probably also need to take special care to avoid tripping the
assert(ins_len =3D=3D decode.len) at one of the callsites in hvf.c
(or else just drop or modify that assert).

thanks
-- PMM

