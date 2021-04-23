Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F76E3697EF
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 19:05:40 +0200 (CEST)
Received: from localhost ([::1]:59322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZzFK-0000VF-QA
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 13:05:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lZzCo-0007cu-Vg
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 13:03:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lZzCi-0001AQ-1u
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 13:03:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619197374;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TWcHFCowj8aBaJCDPlJKdbTJfvU38qCJ5ZwR+eCrUeg=;
 b=K7/oD7IDf8CsJSoL5dcmMqp9UeptWdtBE8+uaSVwSIPkkizsZaH6VBp4+a1pzUPX/bkNjF
 vis8D8EqWG7KV/O95upUN1OYxwYdKxbH4+k/6bDXGMrEoP0Wiv5HVE7pR07kDyucfRomLv
 3Zv5mweE29pQ4A1rYgf0x7oQjhDFeY0=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-464-9rxJ_bNQNjKxLHgzyuJhyw-1; Fri, 23 Apr 2021 13:02:52 -0400
X-MC-Unique: 9rxJ_bNQNjKxLHgzyuJhyw-1
Received: by mail-vs1-f70.google.com with SMTP id
 u26-20020a67d99a0000b029022205ccd7f7so5149441vsj.12
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 10:02:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TWcHFCowj8aBaJCDPlJKdbTJfvU38qCJ5ZwR+eCrUeg=;
 b=ODQ/AlYaIi15mIIPZ4+KWV/4JDXNKQJNVcjBRvhyCzdIwKoTB0QoE2/bYi/jn2mRdX
 G0DkzLmqY0UybIoGBQ+o0Ky4TWh1MicZ3pQXK1cClBD9EHHKFwWabI+BmWdJsWjbkd7+
 fDET1RY8CJc/4toXHY0PN+g0QSBLE61aZZOSQZMMNU6uBF+mCPOR7KGYA3jlpHgcLLSw
 C3FRvFvVfgv+2rG0l6TnzTj6Vr9wk3pFCtbcEhOPqwGlvSb5AX0iDoKHtgyK87/GJSae
 9raVehMj55wpMplSYRROBu4U8hY6U7jKPtNJXr3LzV44UBKG78D+oP2ZGXQeBTNkksXC
 spvQ==
X-Gm-Message-State: AOAM5319vXT+RNjTZPdPV+/g/119tjfPE2RwiP0DvZaBkvikIQxfBLmd
 6u8RoqMviJIPdDQuI/hjHBpRHc57auUxrr8ty4qWb4pvcl7KJZYaXwlAHeFcOIofJpVz51vUmYr
 mcDYaiRSrZqPnW0yDEDWwmM+E9Ia+YL0=
X-Received: by 2002:a05:6102:a89:: with SMTP id
 n9mr4698898vsg.45.1619197372382; 
 Fri, 23 Apr 2021 10:02:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxVAEVhxForE1dWcE9OD4MIrjtf0R4h9rz1iQJyr6eCJyOPLa8Qfm555jbkITsMrL/944Mgibh3eBkeLCeThwc=
X-Received: by 2002:a05:6102:a89:: with SMTP id
 n9mr4698875vsg.45.1619197372247; 
 Fri, 23 Apr 2021 10:02:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210408195237.3489296-1-wainersm@redhat.com>
 <20210408195237.3489296-4-wainersm@redhat.com>
In-Reply-To: <20210408195237.3489296-4-wainersm@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 23 Apr 2021 14:02:26 -0300
Message-ID: <CAKJDGDYks1NrFZGmVHs2-RL=RDEsckbuJEgjwmA=vT3GjLJSZQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] tests/acceptance: Let the framework handle
 "cpu:VALUE" tagged tests
To: Wainer dos Santos Moschetta <wainersm@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Philippe Mathieu Daude <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Cleber Rosa Junior <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 8, 2021 at 5:01 PM Wainer dos Santos Moschetta
<wainersm@redhat.com> wrote:
>
> The tests that are already tagged with "cpu:VALUE" don't need to add
> "-cpu VALUE" to the list of arguments of the vm object because the avocado_qemu
> framework is able to handle it automatically.
>
> Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> ---
>  tests/acceptance/boot_linux.py         | 3 ---
>  tests/acceptance/machine_mips_malta.py | 1 -
>  tests/acceptance/replay_kernel.py      | 8 +++-----
>  tests/acceptance/reverse_debugging.py  | 2 +-
>  tests/acceptance/tcg_plugins.py        | 9 ++++-----
>  5 files changed, 8 insertions(+), 15 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


