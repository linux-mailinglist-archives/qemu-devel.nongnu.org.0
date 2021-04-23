Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB9B369687
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 18:00:01 +0200 (CEST)
Received: from localhost ([::1]:57568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZyDo-0005Vf-CB
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 12:00:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lZyBz-0004tM-LA
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 11:58:08 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:47041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lZyBx-0002l4-Ss
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 11:58:07 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 k4-20020a7bc4040000b02901331d89fb83so1483904wmi.5
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 08:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=d9q/OZZRjlD+J5z0b+Q6nRqKlXdRlLIaorE8Rj3NzMo=;
 b=YdWJDZzyerRhW4Xm1J5ZAYRESTk/hisHgYpo/LC+KB10KrL1DJ2QVdrWWQ1VcYz6Mm
 gSTjwt0+9QU8PJV/AFvSp6GbTSRNd51O4/bjw2MoOpuIZwipZ0Idos/2J6rK9fCgoIK7
 jZEr0frqNB4tgUg9RxW+E+Dq3BG88lMFgzHvsdQMbPHOEBlaMBqhTtlWef9HmwmeQQtN
 7coeNXhgGIl2nSU3PjC+Xzz9TNq3Y+eGrl8omQA48GDc2Hb3c/IvjofD340vSYB5Ffbp
 3gDzEVriKtOHxYhHob2lL0Wzv6p+cchCRlnSb4DvZy7mwyd84F8CIthdEvOlHzskd3ef
 GXKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=d9q/OZZRjlD+J5z0b+Q6nRqKlXdRlLIaorE8Rj3NzMo=;
 b=QH4l7N7wlEZqFF2tZzrbGCxr8MmZ7Kh1xjQcApgBFZAgvaLMn9t+hOmBug0lRImtBL
 tH1pkQ8foQaLdX/IhWFlHU53jurvxQ68ZB4e8rdhUa2J0Z07ezC8nbZMv/PVm7bKPHVC
 sG9jYET33GPHZDywSWzHQv0APqA1yTNGitmPOldfMm7Ahsex0ru3ojf/4wi3FJoeUVxf
 r/BVmeYKCK7ZAAXg/0AmbLkOGeZu7i8SJviBL933Ati82fzyTW0YM7FFTf/zvmYHR6eK
 n6wHdV87kFgJIoV4odDekJOttDkfFDVf2kP/EE/s5SDbf+VYIQQBFDPFDwXj5XmC+BHJ
 J2uA==
X-Gm-Message-State: AOAM533eT7QyaNGlf7MfcJvl5QDh8OAwR8PHO61t2sGoi9Wpldi076/N
 vkAugT7fuLaykB/G4pdqDcTBV5haDkYXoA==
X-Google-Smtp-Source: ABdhPJyrqFouJt2mgCsHBa/r9tXubm9DndHwv/oye2N8AqeIyKl9GrMX06eGoNSReiTRP7RMwvvEPg==
X-Received: by 2002:a05:600c:3397:: with SMTP id
 o23mr6159199wmp.26.1619193483427; 
 Fri, 23 Apr 2021 08:58:03 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i15sm10076740wru.12.2021.04.23.08.58.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Apr 2021 08:58:02 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 29C981FF7E;
 Fri, 23 Apr 2021 16:58:02 +0100 (BST)
References: <CAJyG1bOR659y=6oP5-XFyVv-xLq-C-m4cdsdRP2D+ZVQqyJnqg@mail.gmail.com>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Min-Yih Hsu <minyihh@uci.edu>
Subject: Re: [RFC] tcg plugin: Additional plugin interface
Date: Fri, 23 Apr 2021 16:44:49 +0100
In-reply-to: <CAJyG1bOR659y=6oP5-XFyVv-xLq-C-m4cdsdRP2D+ZVQqyJnqg@mail.gmail.com>
Message-ID: <87a6pp6lit.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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
Cc: Aaron Lindsay <aaron@os.amperecomputing.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Min-Yih Hsu <minyihh@uci.edu> writes:

> Hi Alex and QEMU developers,
>
> Recently I was working with the TCG plugin. I found that `qemu_plugin_cb_=
flags` seems to reserve the functionality to
> read / write CPU register state, I'm wondering if you can share some
> roadmap or thoughts on this feature?

I think reading the CPU register state is certainly on the roadmap,
writing registers presents a more philosophical question of if it opens
the way to people attempting a GPL bypass via plugins. However reading
registers would certainly be a worthwhile addition to the API.

> Personally I see reading the CPU register state as (kind of) low-hanging =
fruit. The most straightforward way to implement
> it will be adding another function that can be called by insn_exec callba=
cks to read (v)CPU register values. What do you
> think about this?

It depends on your definition of low hanging fruit ;-)

Yes the implementation would be a simple helper which could be called
from a callback - I don't think we need to limit it to just insn_exec. I
think the challenge is proving a non-ugly API that works cleanly across
all the architectures. I'm not keen on exposing arbitrary gdb register
IDs to the plugins.

There has been some discussion previously on the list which is probably
worth reviewing:

  Date: Mon, 7 Dec 2020 16:03:24 -0500
  From: Aaron Lindsay <aaron@os.amperecomputing.com>
  Subject: Plugin Register Accesses
  Message-ID: <X86YnHhHMpQBr2/G@strawberry.localdomain>

But in short I think we need a new subsystem in QEMU where frontends can
register registers (sic) and then provide a common API for various
users. This common subsystem would then be the source of data for:

  - plugins
  - gdbstub
  - monitor (info registers)
  - -d LOG_CPU logging

If you are interested in tackling such a project I'm certainly happy to
provide pointers and review.

>
> Thank you
> -Min


--=20
Alex Benn=C3=A9e

