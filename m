Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E593B4917
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 21:03:30 +0200 (CEST)
Received: from localhost ([::1]:54670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwr6v-0002g6-0v
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 15:03:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lwr58-0001ym-KO
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 15:01:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lwr55-0005Uj-6x
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 15:01:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624647693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=edCuM5sHanlVB6Hk+7uf5+yThXGk5qOZQOwf4cQMwVc=;
 b=gYtTFr1lEuOCzuhczdE5h26irOGmyKAZozebj7Wp9XJWWXB9v/VaPtLpo1XTy0XEG63GRx
 7KSVaSZ3CPnPIGbfc37klr38N44XHQvmso1dxBuVJEBRPyXy0wPs0pWuyiac2J71IxWF+w
 bdlIVsPo8fktwTe5RXjsrVNoG3YuD7I=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-222-IGRzRsLJMvifclbse8FJ1g-1; Fri, 25 Jun 2021 15:01:32 -0400
X-MC-Unique: IGRzRsLJMvifclbse8FJ1g-1
Received: by mail-vk1-f199.google.com with SMTP id
 22-20020a0561220716b029024e75239721so2890912vki.13
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 12:01:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=edCuM5sHanlVB6Hk+7uf5+yThXGk5qOZQOwf4cQMwVc=;
 b=lPHhHMUGB832J+RNcfMVlyjpS6ZEW6bnkiG3mz4wKQJpYjvGsqVb8sJEB4hC2uTIdj
 2jJDZMeh9a6jn36vx/iqDgyZ7y+NDvIp67j9RdkFm+yImRH+et1GSDO45YOdeHLSl7Zn
 yFoqFcysB+A72vLKn1MqffgnNtnfggJ+kd8Vjgz0drHoXnismeho4hPq7j9u7jhuHJ/P
 YFf3U3EQAgotq0Xj3ioyJKJ1M2QGZMKDyByozcWF66W2TaVpcoXc4/cLusage5349PmW
 MZom+5c0WnRPy+Ly6KF4SPE7PRL/z99vtY4mMQv3YJTD9xIL0O7LcGHZx6ygZ6yjAllj
 jgIA==
X-Gm-Message-State: AOAM533fro8I7jn8GEAypGul2/Nea9I9L4/oMrvA1TUanFH3enTbEp1F
 QJw1MnxvWRgdXkClRAaHKmuzyB2znXryr9ZByyPym8uHWX2gj4pTiO6qwP23PWbHlVpg6QRF0Nq
 +f+nqXLd0h/Wmjn6A6SuCPGa7hf7sucE=
X-Received: by 2002:a05:6102:747:: with SMTP id
 v7mr10579309vsg.50.1624647691942; 
 Fri, 25 Jun 2021 12:01:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwKu7AnoMbpv0ctEMLKxisdbVD7Bk47rc09Ml/rXkqRjAfqolkthgQd3l09g5oLMOqSXrlmZ7DE76VIm1HgxlI=
X-Received: by 2002:a05:6102:747:: with SMTP id
 v7mr10579291vsg.50.1624647691813; 
 Fri, 25 Jun 2021 12:01:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210625154540.783306-1-jsnow@redhat.com>
 <20210625154540.783306-9-jsnow@redhat.com>
 <CAKJDGDa5DfPO5nw=PFAGnN00iJ7vzqM6QZajFsM6otMqan8JKA@mail.gmail.com>
 <eb68be3e-7f12-2c44-aa5c-b4d98ed0702a@redhat.com>
In-Reply-To: <eb68be3e-7f12-2c44-aa5c-b4d98ed0702a@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 25 Jun 2021 16:01:06 -0300
Message-ID: <CAKJDGDbwGN2dvLSfD202R92bYWjSTMSOX2LXV6PtkETHpsUZXQ@mail.gmail.com>
Subject: Re: [PATCH 08/11] python: add 'make check-venv' invocation
To: John Snow <jsnow@redhat.com>
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 25, 2021 at 3:38 PM John Snow <jsnow@redhat.com> wrote:
>
> On 6/25/21 2:36 PM, Willian Rampazzo wrote:
> > Maybe, it may confuse people using `make check-venv` under `tests`.
> > Anyway, I'm not opposed to it.
> >
> > Reviewed-by: Willian Rampazzo<willianr@redhat.com>
>
> I have to admit there's much about Python packaging that is confusing :)
>

Oh, the comment was not so related to packaging, but to QEMU itself.

> Can you elaborate on your point for me, though?

Under the `tests` folder, `make check-venv` creates the Python venv
for the tests. It does not run the tests. The `make check-venv` under
the `pyhton` folder proposed here will actually run the tests in the
venv. My comment was related to people already used to the behavior of
`make` under the `tests` folder.

I don't think it is this patch fault and I think this makes more sense
than what we currently have under the `tests` folder. Maybe it is just
a matter of organizing the `tests` folder `make` command.

>
> --js
>


