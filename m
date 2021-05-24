Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 326F038F4AE
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 23:01:12 +0200 (CEST)
Received: from localhost ([::1]:56352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llHhG-0005Mn-HX
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 17:01:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1llHf9-00049j-Ow
 for qemu-devel@nongnu.org; Mon, 24 May 2021 16:59:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47100)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1llHf7-0007SQ-Pm
 for qemu-devel@nongnu.org; Mon, 24 May 2021 16:58:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621889936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uZkbveEoNYdJ9M+hcBepOw7qX5g6jub9n8V4dexWoJk=;
 b=QwAy0RNrLlQhaXR4zI4JlSdo07vfNkY4xK1WQ1RS/UdVt7iQu0PTa7nJMHrHWHOaS+xdiW
 nX0eq2xf99dfAvofr4CWizpF3s+4AhssZX39miGFFFIducZqCZIrmGWtOi1MtHUOGfMtG8
 D3xg95XLZV9vVb3xxnktv3QON/u1N3Q=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-570-SS_9okyVOlynnHSnHBH1TQ-1; Mon, 24 May 2021 16:58:52 -0400
X-MC-Unique: SS_9okyVOlynnHSnHBH1TQ-1
Received: by mail-vk1-f199.google.com with SMTP id
 j188-20020a1febc50000b02901fadc53568dso4942928vkh.9
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 13:58:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uZkbveEoNYdJ9M+hcBepOw7qX5g6jub9n8V4dexWoJk=;
 b=nO19Gl00ZAY9ikdLEkfxwwwrpAjIYD0XVFVVgur4qOOwjhRzrxJAY3b/1yT9M147+y
 mDeF50kSqc0pGfs/Xs/k88eS8Reo55nu1GvhDvQ0u4GA+Vsbvla4gVdfzrHp3AH2D9MP
 aMRMqoh0ekX7DOwqzfrlVk16oTyaE7/FOiifunzBkj43Y2A0t6beIuYpEAXmr9VBOiWq
 u1bKfhJDcITltq4kY9jABCUmFy5fSEIqB6N2nW+JnRDL7xMSOppOoly9GPLrXzm9cW1B
 Z/tPe24HV0M+sgPTIC1/sSIeBt5U5Q4/swfuDBj8r7Vur2dYFFfZFnrJotkt+lGfWNSF
 6PeQ==
X-Gm-Message-State: AOAM531PnrT7a+t4WyeD9tP6Hlvs+3hYsy8q7umB3IC7kcZ5c+ZQDr+r
 B9e7eGuYTDGUHQZ0O7iH4Io88BArXykPkIdLLv/tbRn4gIVr3YeT5Ke507uezdgPawrMOda3vsl
 7ic+xbkRPfDWWS3sr+yPq8PsvBkkiZNs=
X-Received: by 2002:ab0:3403:: with SMTP id z3mr25046051uap.113.1621889932036; 
 Mon, 24 May 2021 13:58:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwGMzNVXrAcOE5jab/DSsylMKteIB8G0UKrHtaBP7VavN0hewLy4dHdCDC2ljeLK1XPCrttC69RWtpSeCRNyUU=
X-Received: by 2002:ab0:3403:: with SMTP id z3mr25046043uap.113.1621889931832; 
 Mon, 24 May 2021 13:58:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210503224326.206208-1-wainersm@redhat.com>
In-Reply-To: <20210503224326.206208-1-wainersm@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 24 May 2021 17:58:25 -0300
Message-ID: <CAKJDGDbJ6nC67bhv6JjqJHA-s_h1zYbGkAPNgKQqHcGyv1rCZQ@mail.gmail.com>
Subject: Re: [PATCH 0/7] tests/acceptance: Introducing the ConsoleMixIn
To: Wainer dos Santos Moschetta <wainersm@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
 qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa Junior <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Wainer,

On Mon, May 3, 2021 at 7:43 PM Wainer dos Santos Moschetta
<wainersm@redhat.com> wrote:
>
> The avocado_qemu package provides the following methods to interact with the
> guest via console, which are mainly used on the acceptance boot tests:
>
>  exec_command(), exec_command_and_wait_for_pattern(), wait_for_console_pattern(),
>  interrupt_interactive_console_until_pattern()
>
> Those methods are loosely defined in avocado_qemu/__init__.py. Because that file is expected to
> grow, I thought that for the sake of keeping it organized it would be better to logically group
> them. So in this series I create the ConsoleMixIn class to be the new home for the console
> methods. An alternative approach could be to create a separated package, however because
> they are just a few methods at the moment, I prefered not to break avocado_qemu into smaller pieces.
>
> As the "MixIn" in the name implies, the class is meant to be used as a mixin on the test class. Here
> I am following an idea introduced by Cleber in [1].
>
> This series was tested on CI (https://gitlab.com/wainersm/qemu/-/pipelines/296412039)
>
> [1] http://next.patchew.org/QEMU/20210412044644.55083-1-crosa@redhat.com/
>

So, personally, I found this an interesting change, it keeps the code
more organized IMO.

I have mixed feelings about using mixin for something that should be
straightforward, like develop tests on a project where python is not
the primary programming language. I would imagine that the mixin
pattern is nice inside core code and functions or methods are more
suitable for test writers.

Anyway, I'm not against it and will not block the series if others are
okay with the changes.


