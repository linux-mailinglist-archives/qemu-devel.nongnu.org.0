Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3243B8533
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 16:45:17 +0200 (CEST)
Received: from localhost ([::1]:37250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lybSm-0006pG-Ad
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 10:45:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lybRW-0005le-CY
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 10:43:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28128)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lybRQ-0006jJ-G7
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 10:43:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625064232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0vC+8q5BjHw3nw2sinFqRkwvARg5wTPIRwkdlFiuvGg=;
 b=KvWciwIrbFqjdWGZGCJiPZlzSmIBSJAX9zdOlboogvHbWFghmhCV0Imly90lfUlfOuutHy
 z5080V6Q9B+Kg+sXCm3X5+rJMZ0rDENdA2h3810J/IeKIMJnaa7oi0TsVuvr9Mw7qtYAAq
 DqRUDKSuzUIDbH7hV54Xt1DElduaTBQ=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-568-kJnWoVQ7N9KVj0mMlRTb-w-1; Wed, 30 Jun 2021 10:43:50 -0400
X-MC-Unique: kJnWoVQ7N9KVj0mMlRTb-w-1
Received: by mail-vk1-f199.google.com with SMTP id
 s1-20020a1ff4010000b029024e2e9504e3so568837vkh.16
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 07:43:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0vC+8q5BjHw3nw2sinFqRkwvARg5wTPIRwkdlFiuvGg=;
 b=Yt3iRt1K7+DQevHuUD3NdXerZnwzVFh9iqKyUQXBaN7moXICAebABxNL861SrBdDnz
 ZZ1w++oYIIPvJGFFbLEzp16IrI6+ISTWtBd7GSRr0HvpDwIEFwMzPTnJHNAnoJknpVYV
 F4eMFgbLFL3D0kd6PXEVUqZxCcZus0pyIuK4xBsZNnYyQPvAhXQJB5Vu21ZGrBO22LXF
 p2+ADyZxZKi3JFVKIEAQAg/SdotRFjuVoSvH8A7cVOetzsoZQfe58mfB4GZTUu926N/M
 cum8a0S5RZ4JNG3x3f2ZF6peysp1/ujDw1kAv99i0V4CmrR1Wh3b/kf7sdew/SV2A7lB
 1oTQ==
X-Gm-Message-State: AOAM531SkJFJpTZbnqAMr61SRI3Ji3C3dFVzlbXRYsmjfdryXOmO3rV5
 TJExuUWpadUEO/em8glXYP1Yk1mItQ5HaKARh+B9QOeV7ZwcjRuojXxoEFcP+uXVdoVxy3t+Iyr
 Z+rAwLfFd1EE6fcfhpixCT9Im6n0z3nI=
X-Received: by 2002:ab0:3253:: with SMTP id r19mr32507078uan.5.1625064230309; 
 Wed, 30 Jun 2021 07:43:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzJNiF+//l433EzUXkaao90j9sdJhVJNlydTxzS5fiB2b4mpyCg2ntL6gW6u56S69bA4OMmcjg+csqoO1y6TVQ=
X-Received: by 2002:ab0:3253:: with SMTP id r19mr32507055uan.5.1625064230170; 
 Wed, 30 Jun 2021 07:43:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210629214323.1329806-1-jsnow@redhat.com>
 <20210629214323.1329806-16-jsnow@redhat.com>
In-Reply-To: <20210629214323.1329806-16-jsnow@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 30 Jun 2021 11:43:24 -0300
Message-ID: <CAKJDGDY9rZBX-yVu-gOMU4UKR=+fPZE8_DLCAHx54RyhZgi-mw@mail.gmail.com>
Subject: Re: [PATCH v3 15/15] python: Fix broken ReST docstrings
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 29, 2021 at 6:44 PM John Snow <jsnow@redhat.com> wrote:
>
> This patch *doesn't* update all of the docstring standards across the
> QEMU package directory to make our docstring usage consistent. It
> *doesn't* fix the formatting to make it look pretty or reasonable in
> generated output. It *does* fix a few small instances where Sphinx would
> emit a build warning because of malformed ReST -- If we built our Python
> docs with Sphinx.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
>
> ---
>
> You'll have to take my word for it for now, or, to test that (ugly
> though it may be) a theoretical Sphinx build would produce no build
> errors:
>
> > cd ~/src/qemu/python
> > sphinx-apidoc --separate --private --no-toc --module-first \
>     --implicit-namespaces --full --ext-intersphinx --ext-coverage \
>     --ext-viewcode qemu/ -o docs/
> > sed -i '1s|^|import os; import sys; sys.path.insert(0, os.path.abspath("../"))\n|' docs/conf.py
> > make -C docs html
> > rm -rf docs/
>
> I am preparing to add Sphinx, but need to fix these annoyances first so
> that regressions are easy to spot as fixes are applied across the
> tree. I plan to use my forthcoming Asynchronous QMP series as a test
> pilot for documenting our docstring standards. Assuming it goes well, I
> will update the docstrings elsewhere in this package at that time.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/qemu/machine/__init__.py | 6 +++---
>  python/qemu/machine/machine.py  | 3 ++-
>  python/qemu/qmp/__init__.py     | 1 +
>  python/qemu/qmp/qom_common.py   | 2 +-
>  python/qemu/utils/accel.py      | 2 +-
>  5 files changed, 8 insertions(+), 6 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


