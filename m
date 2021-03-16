Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBAA633DAA9
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 18:21:32 +0100 (CET)
Received: from localhost ([::1]:46964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMDNr-0002jB-Oq
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 13:21:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lMD3y-0005yt-Nj
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 13:00:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lMD3u-0003Cj-UH
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 13:00:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615914053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pnWmUmBIQ/i/qV6pOV7l2oG7PD5S68Io+50SU8NwErw=;
 b=Tg2J8c1NyuKsWyqS7Ig4rIWe4Jsq6RoD29ByREeE30hVWUVAPBqfD+sbVjbOEYRQraVwRf
 t/3VOwJMNrJG+BmAoHbwBZjJlZa5i26zhrMDXSM0fVcMty80hm7C+1w68UstwOVb2FP4Om
 6lzfro8WLNr3JF6DG5CVIdywd1gAL00=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-LykyUEIiNnqWi4hdhanF-A-1; Tue, 16 Mar 2021 13:00:51 -0400
X-MC-Unique: LykyUEIiNnqWi4hdhanF-A-1
Received: by mail-vk1-f198.google.com with SMTP id l2so10197095vkl.5
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 10:00:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pnWmUmBIQ/i/qV6pOV7l2oG7PD5S68Io+50SU8NwErw=;
 b=ofXRo4TxdbwuqNcAs2CmPLT8fb6qqqXsQ72eYPEVfHL4wJwstR5t534vbEDxrFMAwh
 EYKF8uubg5y3fDiw5UUAfDsHwQ4lfjfVJV/NbG0pmnaSw45Jl1vLJiWy4zeFrG8mDWO5
 lPC8W2zTAh6o7pZtrT3vu7pSkVdTVthyFnc6tmIacBxyhQv7/KOP77rvyE/FNSMxVpNW
 pzf1vjAKOltx/raO4FMNYdnici9WHEtBYxMq7Sm+v30ClHJ1+Y5PxX/N1leFG7fv3qjN
 5YoCabIIY+SEWJMFWd02PuCKuJh9hWUjRPT6v4eP4a8f7Vj/d77TllalveSiCTIa7Kml
 w2iA==
X-Gm-Message-State: AOAM533VtL73C3urhZd0L1WjvxZY+v767PRML1BFQ0rEnB4M+DuvsJ9C
 IKIQAL650m5S4/axYJpn5Y+ZypHuD3hGkGkfJrfFDjq1wwkr+TyhWW/EdXtH8wtzfTV+aVJzlO8
 i+/sFxhWszCBl8/0zVH1SNZVxcpyDMvg=
X-Received: by 2002:a67:3241:: with SMTP id y62mr327593vsy.45.1615914051151;
 Tue, 16 Mar 2021 10:00:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxc87bnQFUj3tdwNZrZPnsFJ3cTCVEK0WrJFke1qSphbCbW3mdEPiJeNGJSw9RyUjoFnGN98Y8OjSeQ/73YL4E=
X-Received: by 2002:a67:3241:: with SMTP id y62mr327570vsy.45.1615914050976;
 Tue, 16 Mar 2021 10:00:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210309153507.1905682-1-wainersm@redhat.com>
In-Reply-To: <20210309153507.1905682-1-wainersm@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Tue, 16 Mar 2021 14:00:25 -0300
Message-ID: <CAKJDGDaQTWAJkcfYv5s=wmd1nxu6N84_W5QtxYVJ5_YSF0B9vQ@mail.gmail.com>
Subject: Re: [PATCH] tests/acceptance: Print expected message on
 wait_for_console_pattern
To: Wainer dos Santos Moschetta <wainersm@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 Philippe Mathieu Daude <philmd@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Cleber Rosa Junior <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 9, 2021 at 12:36 PM Wainer dos Santos Moschetta
<wainersm@redhat.com> wrote:
>
> For the sake of improve debuggability of tests which use the
> wait_for_console_pattern(), this changed the _console_interaction() so that
> the expected message is printed if the test fail.
>
> Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> ---
> While I was testing  "[PATCH v2 2/2] tests/acceptance: Test ast2600 machine"
> I could not clearly determine which of the called wait_for_console_pattern()
> was failing. So this patch improves debuggability in such as situations.
>
>  tests/acceptance/avocado_qemu/__init__.py | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>

> diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
> index df167b142c..ed338caaba 100644
> --- a/tests/acceptance/avocado_qemu/__init__.py
> +++ b/tests/acceptance/avocado_qemu/__init__.py
> @@ -97,7 +97,8 @@ def _console_interaction(test, success_message, failure_message,
>              break
>          if failure_message and failure_message in msg:
>              console.close()
> -            fail = 'Failure message found in console: %s' % failure_message
> +            fail = 'Failure message found in console: "%s". Expected: "%s"' % \
> +                    (failure_message, success_message)
>              test.fail(fail)
>
>  def interrupt_interactive_console_until_pattern(test, success_message,
> --
> 2.29.2
>


