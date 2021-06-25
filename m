Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D463B48CD
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 20:32:11 +0200 (CEST)
Received: from localhost ([::1]:52928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwqcc-0006bo-CO
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 14:32:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lwqZg-0004MM-EK
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 14:29:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lwqZa-0002Jx-Hs
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 14:29:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624645741;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HAX/p4TcOJT/LnqJfZrbZcBtnP8x9He0P2bv7TVfiYc=;
 b=G/4lZRxbcTEa7upCeBG/rAOydkB1TAOVrpDjscU+cWqtHk3zTjpXQUFnlxMRvBxN58oYG7
 qpyx/GyH7yXsIvUhYe4y0eoOGnWUFcsH7mjp1VNHqjZNy+DsoOr9x9DOY1ZsxT+9vpuOvz
 g09itLLTxoY0jcTuPWkqstiWaQTGeQA=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-fwHXcPtAMtyxtLcs0yp1qA-1; Fri, 25 Jun 2021 14:29:00 -0400
X-MC-Unique: fwHXcPtAMtyxtLcs0yp1qA-1
Received: by mail-vk1-f200.google.com with SMTP id
 z16-20020a0561221490b029024cf7dcad61so3325871vkp.14
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 11:29:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HAX/p4TcOJT/LnqJfZrbZcBtnP8x9He0P2bv7TVfiYc=;
 b=a+GNZ/9pOufq+fl8MeCSDwo/YfVfvaYrpQ6crsMVyxsywR3XCwy26gaEW81c5MCxo8
 LY6kj1sjfxxSMaakA9p5tVE9wzi6Auz1rPt/+hLmRHiYXDBvk4KHzuT5cBWojlFu6cO3
 5ykyjitS8O3XJIfokU2WM7SgfqLxT9gVbi97oB/145kPsQv/qgx+iFo591iyzkFKlqD/
 Axsuedlvo1zyR30vCPrbMVLKk8Ng5/ZB4tYrb0ToIDT1PvNL9FKZr8pKMLBApgS+KQ6H
 ckAwsgzAOfGScqf/wvpaevudwDN9tpLmI8emCZdwVBLFcacO3jRgbtF/pxjCn6LTaVLd
 l+gA==
X-Gm-Message-State: AOAM530qc1jSoyf1qBvRd/oJ9S6LYlyO6/vHcALjD/i+X3susvY+Km8P
 C0ZPaz9Z8P0MVJqAiWCeZ4BeWGE2FMQci23ScZiIQ/RmD/OPlcZRxNphb9KU3BcHQCLaayX6TeD
 uARIi3nDYR6H9DAHutpIN1io4dKUNIp0=
X-Received: by 2002:a1f:e3c2:: with SMTP id a185mr3373217vkh.7.1624645740393; 
 Fri, 25 Jun 2021 11:29:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyh0c2xuOQwqEZ6qYrDFscpiiqFftdzIIPgkPW78HFkNt37M5GcpvMnC4/CIJbM3wR9gOpv/PSaXXACTaR5jWk=
X-Received: by 2002:a1f:e3c2:: with SMTP id a185mr3373073vkh.7.1624645738768; 
 Fri, 25 Jun 2021 11:28:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210625154540.783306-1-jsnow@redhat.com>
 <20210625154540.783306-4-jsnow@redhat.com>
In-Reply-To: <20210625154540.783306-4-jsnow@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 25 Jun 2021 15:28:33 -0300
Message-ID: <CAKJDGDY7ane5A+CWbyMLn9TDGgoU9Xqh15t14+70C1vo2FoNGw@mail.gmail.com>
Subject: Re: [PATCH 03/11] python: Re-lock pipenv at *oldest* supported
 versions
To: John Snow <jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
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

On Fri, Jun 25, 2021 at 12:46 PM John Snow <jsnow@redhat.com> wrote:
>
> tox is already testing the most recent versions. Let's use pipenv to
> test the oldest versions we claim to support. This matches the stylistic
> choice to have pipenv always test our oldest supported Python version, 3.6.
>
> The effect of this is that the python-check-pipenv CI job on gitlab will
> now test against much older versions of these linters, which will help
> highlight incompatible changes that might otherwise go unnoticed.
>
> Update instructions for adding and bumping versions in setup.cfg. The
> reason for deleting the line that gets added to Pipfile is largely just
> to avoid having the version minimums specified in multiple places in
> config checked into the tree.
>
> (This patch was written by deleting Pipfile and Pipfile.lock, then
> explicitly installing each dependency manually at a specific
> version. Then, I restored the prior Pipfile and re-ran `pipenv lock
> --dev --keep-outdated` to re-add the qemu dependency back to the pipenv
> environment while keeping the "old" packages. It's annoying, yes, but I
> think the improvement to test coverage is worthwhile.)
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/Pipfile.lock | 113 +++++++++++++++++++++-----------------------
>  python/setup.cfg    |   4 +-
>  2 files changed, 56 insertions(+), 61 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


