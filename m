Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9914D2F6B1C
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 20:36:54 +0100 (CET)
Received: from localhost ([::1]:47428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l08QP-0000BD-MG
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 14:36:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1l08Fx-0000dS-0E
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 14:26:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41100)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1l08Fv-00042D-Am
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 14:26:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610652362;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZzRHTdx5d9Y6rqdMK44VKf2XEAVsy2dW+RMVjhUVfyk=;
 b=HQ9e/jOc5ZScF5vcnMqKEALe7VXouBHVe/f85BfngpsmtlVLUNWClbwbndcYcT0g/Z8Vqz
 KYcb9110+s62PgvN+vWjdDLN6GkA031/lW/plUrTTb9/c6One8t6djuJpk9/Q2qf37DXpJ
 Jg36pPewKu64kFxxcFd4XFLpVwaj+Zg=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-329-anXwvlNsOuCtXHZwQzJf5w-1; Thu, 14 Jan 2021 14:25:56 -0500
X-MC-Unique: anXwvlNsOuCtXHZwQzJf5w-1
Received: by mail-vk1-f197.google.com with SMTP id p184so2711627vkd.18
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 11:25:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZzRHTdx5d9Y6rqdMK44VKf2XEAVsy2dW+RMVjhUVfyk=;
 b=rVa1RUsuz59cot7QOloCHbUILSKJdyaBgW2GBMFrWY/iMqb471jBvfOK0tvzHuqTFG
 izjVflnoX01OzNtPyg6TrApWUoShblGNcq2lzWrlkLYLj8PAZGG0IziCQbiuzUxkBD/M
 I9drRI8OXEkYYKx/KPj5mCaUaTNCn6Elc0lVUzN+UWr8vRCvJh3c7WnSI1Ec0fMG3s7X
 55VzyuxVQkKRi7/Upl1dSlW3gPrV/jMIbfrgDEJJOw3RMyJRBin9h1R8FLKpxdg1/Lrr
 SFjtSjEiSTrmKYq4au4mYy21ng3PHrTbYXrejzRKk2zKSoHNTMn57RSTNDYcbyUalt0M
 V7wQ==
X-Gm-Message-State: AOAM533VZnlbTBr8RO6oe3TO7pc+te8HIm7VeWEMPNxeRMpU80Fs2SD9
 UAhEQPN5VpIL1sHmNILB1GXRsFDWpUnhsqwXrjvWBOOsZkQB6g3orcYpbo1QWc8rtYziL89GnvX
 TvEPV3rPg32Ef7iYNrYQQELE8aQROy5s=
X-Received: by 2002:a1f:db87:: with SMTP id s129mr7991143vkg.1.1610652355877; 
 Thu, 14 Jan 2021 11:25:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyAr28lnz7PIY3QQehiLrxLE2CDQ60VwzUcNqI1kmwLcjNbU5bSM5YW7/hQWplWd2xdyd5R86TEC13hb3ZZJeA=
X-Received: by 2002:a1f:db87:: with SMTP id s129mr7991126vkg.1.1610652355676; 
 Thu, 14 Jan 2021 11:25:55 -0800 (PST)
MIME-Version: 1.0
References: <20210108185645.86351-1-thuth@redhat.com>
 <20210112115305.1cd5b8c5.cohuck@redhat.com>
 <877doinznw.fsf@linaro.org> <20210112132338.4122061b.cohuck@redhat.com>
 <efd30a52-8b5b-1afa-1505-6d6c296fe425@redhat.com>
 <350867de-59be-5756-9f12-3eae4c265472@redhat.com>
 <CAKJDGDadiKJXFcV9YO5Fe318wmRsrUhC+D7yPrxqtTmafXnQhw@mail.gmail.com>
In-Reply-To: <CAKJDGDadiKJXFcV9YO5Fe318wmRsrUhC+D7yPrxqtTmafXnQhw@mail.gmail.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Thu, 14 Jan 2021 16:25:44 -0300
Message-ID: <CAKJDGDakNcj0bC30CByRswFkOKd=okzsTErYnmvOgU2sA4BsEg@mail.gmail.com>
Subject: Re: [PATCH] tests/acceptance: Fix race conditions in s390x tests &
 skip fedora on gitlab-CI
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 "open list:S390 Virtio-ccw" <qemu-s390x@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Avocado-QEMU Trello board missing in my previous mail.

On Thu, Jan 14, 2021 at 4:13 PM Willian Rampazzo <wrampazz@redhat.com> wrot=
e:
>
> On Tue, Jan 12, 2021 at 10:53 AM Philippe Mathieu-Daud=C3=A9
> <philmd@redhat.com> wrote:
> >
> ...
> > We explained this feature request to the Avocado project at the
> > KVM forum 2018 in Lyon. There was an entry filled on their Trello
> > dashboard. Then the project switched to GitLab and I lost track
> > of it.
>
> We moved our Avocado Trello board to the GitHub issues, but the
> Avocado-QEMU Trello board stays live [1], with little or no action in
> the last months as we are mostly using GitHub issued to track work any
> on Avocado.

[1] https://trello.com/b/6Qi1pxVn/avocado-qemu

>
> I don't recall or I was not involved in a discussion about a feature
> like the one described in this thread in the KVM Forum of 2019 (Lyon).
>
> >
> > Cleber, if you remember, can you point us at the new ticket please?
>
> I went through the Trello board and could not find a card related to
> this feature. Anyway, just like the avocado_qemu package implements a
> `wait_for_console_pattern`, it is possible to implement the needed
> feature there.
>
> >
> > Thanks,
> >
> > Phil.
> >
> > > I already put my patch into my pull-request yesterday (so that people
> > > are not running into failures with their gitlab-CI), so if someone wa=
nts
> > > to have a go at creating such a function in python, feel free to do s=
o
> > > by refactoring that code again.
> > >
> > >  Thomas
> > >
> >


