Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2DA13B0D95
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 21:21:26 +0200 (CEST)
Received: from localhost ([::1]:60922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvlxd-0008OY-FG
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 15:21:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lvlw8-0007cc-0X
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 15:19:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lvlw5-0006x6-46
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 15:19:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624389587;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+eXl+WR+jpuK62d1Ac/tm7XDqiI1pukpEaXj6NO9ltk=;
 b=Z/hKhZLzsM0vKmeZJeqFFMa8116dSRA07zjXeXaJ2J9nrm3TzkgnuYeAXfYQHU2vo7RlBe
 2jt7exKanTrCM8LJEKM9wZVLnmfKVrymKi8W1ui5FPJ94/cVJ3e45GdLGpxioYeL7+1QmC
 CwopmO4JFhFh7AeP9hwUJmThfax194I=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-496-tJ_sQq0YNqysXPo_Jm1Fxw-1; Tue, 22 Jun 2021 15:19:46 -0400
X-MC-Unique: tJ_sQq0YNqysXPo_Jm1Fxw-1
Received: by mail-vk1-f199.google.com with SMTP id
 bc7-20020a0561220d87b02902007377372cso2808703vkb.2
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 12:19:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+eXl+WR+jpuK62d1Ac/tm7XDqiI1pukpEaXj6NO9ltk=;
 b=aQ3ycd+iNS01yoBAWI6xVB5Pnx2KU95S9yYJFkns7OElZa1Wn45aWOqm0BO8pT1Leu
 VMa6cnAi9GeRHwFBCbet9/N+d5zQId6khlYKc2PuekfxGWLafME48syyap4JpqHetAdW
 27fb+1wfCRyaodGbsfKO0yT3lq3O4ewVtjUCW3kOJ4gfjQansLUmyXJFVj88o9FjWj3h
 FjQE0f7Wb6DCJY4HFQneDO1aBLo5PRNnXrP3HwcH1jM01ARfatvNnGM20a43uxKxmc2p
 wwtJ6lgmWokQBKerAP170yPLQXwHt8q1OkGbLDamSGvWNwHYpTtUn0Y9zDTKUo5vedlo
 hfvQ==
X-Gm-Message-State: AOAM531c7iZ3XU57iK+U28AfmAGfqaDgfM1YPZyQBE6QaqO43OtiakLA
 f5boBDqGJEP3ovfqLegU8ej2/KT6iXt7kJ1ccXUWrANqwMKShI9wG0rCuxOILXzyQMMPj1Q1Ymi
 hNVCz72g9ywLeQPiz7r5Am5Yw3Rzz1RU=
X-Received: by 2002:a9f:2370:: with SMTP id 103mr500806uae.124.1624389585848; 
 Tue, 22 Jun 2021 12:19:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwop/Wgjw3j/9OdaXqkqmfdHeWKYOR4rb7EGbjHQjg0GPPAdXZpkr1vEpAqpun3uIA8CW/pDDWDqOXKnq+fsgE=
X-Received: by 2002:a9f:2370:: with SMTP id 103mr500783uae.124.1624389585618; 
 Tue, 22 Jun 2021 12:19:45 -0700 (PDT)
MIME-Version: 1.0
References: <162332427732.194926.7555369160312506539.stgit@pasha-ThinkPad-X280>
 <162332428461.194926.1520270427966779509.stgit@pasha-ThinkPad-X280>
In-Reply-To: <162332428461.194926.1520270427966779509.stgit@pasha-ThinkPad-X280>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Tue, 22 Jun 2021 16:19:19 -0300
Message-ID: <CAKJDGDZZ1bUqEfR1-VB1figSbyn=bxN-a2hMee7J0Rnkn8_OwA@mail.gmail.com>
Subject: Re: [PATCH 1/6] tests/acceptance: add replay kernel test for s390
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.223,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Cleber Rosa Junior <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Philippe Mathieu Daude <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 10, 2021 at 8:24 AM Pavel Dovgalyuk
<pavel.dovgalyuk@ispras.ru> wrote:
>
> This patch adds record/replay test which boots Linux
> kernel on s390x platform. The test uses kernel binaries
> taken from boot_linux_console test.
>
> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
> ---
>  tests/acceptance/replay_kernel.py |   16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


