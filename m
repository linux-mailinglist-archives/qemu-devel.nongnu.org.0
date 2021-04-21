Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D629A3669AD
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 13:07:08 +0200 (CEST)
Received: from localhost ([::1]:35712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZAhI-0000By-02
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 07:07:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lZAgL-0007j3-PG
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 07:06:09 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:40801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lZAgH-0003AW-Ev
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 07:06:09 -0400
Received: by mail-ej1-x629.google.com with SMTP id n2so62866485ejy.7
 for <qemu-devel@nongnu.org>; Wed, 21 Apr 2021 04:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TxWuQZKRedPJGYp27hbOmtzPUrXJyfjU9m/ETwoBG14=;
 b=xjONI/8BzNLz+6KlIaCJSKP8/9w4+4S3mmcD9WvPasdwS8YnAVcwetmgNCo5K5nbpr
 jSQhU1SAUapsVdgiDcRiohF8LdZvLV8FrP0/HHwsB0foZOCB+HOix5OyilGVxkwEvCvs
 b8sP+HhSEQNGnBWilmSeDwFMUGkbV5RPku22NWOu+pBvQJ/FjygjSVmpMWq1+GX2OPf6
 jz2AhpR44hTQQdd+lQWgmyyq4UVqbJlU+5JByAwfSjKiiAqcI4lGyEghgRpNRKkjRQwz
 Q9T5MdJkWK+WwgIkU6Vim21VJC/59ei7cc4Ee3ayspqx5lW9k6AkHjYjKpaqBs4VZywW
 qKwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TxWuQZKRedPJGYp27hbOmtzPUrXJyfjU9m/ETwoBG14=;
 b=H7UxWyHe6KJcqdMlKVcdkRv6BYEVMrHl6iKO/W2fn/tAwVZyAyjV3I5XISAQOrdZV5
 UGyi3UFm+1uCcnMUeu5G/UtMVFaHCov9TctXMSkqcQYNAzYJ7iaLTe8fZldwfPv3tJsL
 YKgQ8Fvm/wBpfCVe3sdvut65fe5y1+DcZwPhs1lxfYFVnWyQF0SmDhqwaZupyZswNxNJ
 M7mIofkheUGAFV84Jw68hREy9IqdmGi9R0FgS9W0mpGx/I9N0UegQNGt5FaupQUdOZwN
 A7Mu74qwrFNP9OYEr0H8VJ+F1QoGzqFcU1jrHDE3rW8j7cZsiiayFVfOEkSbW9t0DvB0
 2Mag==
X-Gm-Message-State: AOAM5329MePbjBjvfT96JTIyPBOJaGTUDcJZ7RFF3xboFwhkr9MKeomt
 EZqkh2SfniowUcT8T8w3jIRgHFsE5f148B+G0FCeCw==
X-Google-Smtp-Source: ABdhPJzfvQ0GybjK2hWhEgocOQbbDagd7WlGI6E6K1YpQ9niSwXtP/n58us36jQ2EOOL82FVayOSJh0fGAJrLuDX9ec=
X-Received: by 2002:a17:906:6d41:: with SMTP id
 a1mr25217904ejt.482.1619003161430; 
 Wed, 21 Apr 2021 04:06:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210417140206.673885-1-f4bug@amsat.org>
 <8f59bd60-3588-3be0-c44c-1ebfbefd78bd@ilande.co.uk>
 <67955dd0-dfc7-271f-009f-cf7247f3b6c2@amsat.org>
 <efea7689-15c6-44bf-77a8-3d6ee945d097@ilande.co.uk>
 <916b95b2-c128-69e0-6e68-78daa0b15722@amsat.org> <20210420205933.GF4440@xz-x1>
In-Reply-To: <20210420205933.GF4440@xz-x1>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 21 Apr 2021 12:05:08 +0100
Message-ID: <CAFEAcA9Q+tSb6T5N-mkZjS1CZr05AErfPPcWccYGGw9hcHKuXA@mail.gmail.com>
Subject: Re: [PATCH v3] memory: Directly dispatch alias accesses on origin
 memory region
To: Peter Xu <peterx@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Richard Henderson <richard.henderson@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Jan Kiszka <jan.kiszka@web.de>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 20 Apr 2021 at 21:59, Peter Xu <peterx@redhat.com> wrote:
> I think it should always be a valid request to trigger memory access via the MR
> layer, say, what if the caller has no address space context at all? From the
> name of memory_region_dispatch_write|read I don't see either on why we should
> not take care of alias mrs.  That's also the reason I'd even prefer this patch
> rather than an assert.

It's a bit of an odd case to need to do direct accesses on an MR
(so if you think you need to you should probably look for whether there's
a better way to do it), but there are sometimes reasons it's necessary or
expedient -- we have about half a dozen uses which aren't part of the core
memory system using memory_region_dispatch_* as an internal function.
So I think I agree that while we have this as an API exposed to
the rest of the system it would be nice if it Just Worked for
alias MRs.

thanks
-- PMM

