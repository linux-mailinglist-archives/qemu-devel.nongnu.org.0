Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A47316FC727
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 14:54:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwMrA-00088R-QK; Tue, 09 May 2023 08:54:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pwMr4-0007wU-M1
 for qemu-devel@nongnu.org; Tue, 09 May 2023 08:54:11 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pwMr0-0001L8-If
 for qemu-devel@nongnu.org; Tue, 09 May 2023 08:54:09 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-50bd37ca954so58641787a12.0
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 05:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683636844; x=1686228844;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CVK0kQhny3NJd0snSPdKUmmS0jt3MBQzREKcax5J20A=;
 b=OmZkiUzK84hCdl+taJx91xfK3Zn/u4Di1RZ1/DB6ZavSE5HeZ5ogCw3N52PlPtjV9f
 psjzjAeu3ifVFNnv0ziIm9dKzUikwDYXqBJIaAtpLLPcd31TbUmN1Ng4Kt/J84zX77ns
 7Zr8rxtEuQvSUYeFvayQsRtaLNiZDJSgBxheM2qul2v2IHQBXzZvXBoQbLWajlZ4n/l8
 GWop0lt3zlmZLPpslDBWXwf9vIAFvoJ3l2kzjty0QgJKhmlQx4lpavoLXVwd5v+dHvnC
 M7Q7UHq9Bd3l2DdnPRc6LgmXv1x5r+8SpcbWkh/pw+HMgFSxV6p/sYJrU84MI8m7xPgz
 kmdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683636844; x=1686228844;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CVK0kQhny3NJd0snSPdKUmmS0jt3MBQzREKcax5J20A=;
 b=ILa8SsdCzB6Co4P1BRhDqpPgl+4u2kpn0GQ4Nn+SVNDvGogOK5YBVp1VkCtW8HB8Be
 wSeEsczvzYfsahFCOerddRfjPyXVCEHeajVV+oXSqEnfxTyvN+421lPGivt3D8ohXWnm
 ohpIFaXTvuOi92Tu3Dr6JHyQsxNwjLc4QENbC8ndZdsyMQsfCiOVT42B0pLtGOFyOD64
 ftLFkPTafpfbs86PphJB+d0ajr76z8iyFhL9XT5BCCmhv3slkbOptA3SyEvs+YnmSVSB
 inSobzfPFWbLGRH/zfpRvkzh1F/d8kpcGc3bRDm83Bfs4iMpLUaM3aNJtciUh+wKaGPS
 48sg==
X-Gm-Message-State: AC+VfDxRxmnA/1BWZWP0fKfzKMg/+zo/vcYqq7uCiaDVqRVY/ffuNv7+
 XVulP6PVEK/cGiUQ/oFoXOBJUNFVjelURSI10TpASw==
X-Google-Smtp-Source: ACHHUZ4bi1KwEk52DEfWsoevMEva+NUVwl+PLX+0Hnz/XyCkQhVA52eCYEbPqKzlArW2z9Ee6NVccq6a+xRmKMpaQaE=
X-Received: by 2002:aa7:cfce:0:b0:50d:8d42:a454 with SMTP id
 r14-20020aa7cfce000000b0050d8d42a454mr8491465edy.21.1683636844540; Tue, 09
 May 2023 05:54:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAP5Nno6wrz4qEMK70KFwxoZWeo89+SAyXDXFW8A30mJ-WeFi4A@mail.gmail.com>
 <87ttwts5ur.fsf@linaro.org>
 <CAP5Nno4C6C-sfj73NM92Gstnw8mm7A7RwEYT=oUZm1Fh0QqFYQ@mail.gmail.com>
In-Reply-To: <CAP5Nno4C6C-sfj73NM92Gstnw8mm7A7RwEYT=oUZm1Fh0QqFYQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 May 2023 13:53:53 +0100
Message-ID: <CAFEAcA-wT3OUZzkVA8riMRDWE4M_f3yZD2HLHSTksLUVM+kH3Q@mail.gmail.com>
Subject: Re: [PATCH risu] use time() as random seed and introduce --randseed
 option
To: Jun Sun <jsun@junsun.net>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Fri, 5 May 2023 at 01:23, Jun Sun <jsun@junsun.net> wrote:
>
> Agree on the usefulness of generating the same test.  That is the reason behind adding --randseed option.  Once a seed is set, it always generates the same sequence of instructions.
>
> Basically with this patch,
>
> by default you will generate random instruction sequences for most testing cases
> you can provide a random seed option in the commandline to generate a deterministic instruction sequence
>
> Without this patch,
>
> we always get one fixed sequence (ie. random seed == 0 case)
> Otherwise we would have to manually modify code to generate random instruction sequences or generate a different fixed sequence.
>
> Hope this clarifies things a little bit.

Mmm; it comes down to: should we default to 'time' and
require the user to specify --randseed 0 to get the old
behaviour; or do we retain the current behaviour as the
default and let the user pass an option if they want a
non-reproducibly random output.

Alex, what do you reckon? You probably have been using
risugen more actively than me recently. I guess I vaguely
lean to "default to randomize(time)".

Also, should we make risugen print the random seed to stdout
so you can repro it even if you didn't pass --randseed initially?

Now that the random-seed-setting is 6 lines instead of 1,
this should definitely be abstracted out to a function
in the common code and not repeated in each per-arch file.

thanks
-- PMM

