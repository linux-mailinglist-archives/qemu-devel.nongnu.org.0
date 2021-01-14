Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4A42F6AB1
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 20:18:14 +0100 (CET)
Received: from localhost ([::1]:44532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l088L-0001Y0-Fh
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 14:18:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1l0847-0007xL-Uu
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 14:13:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1l0843-0008EG-99
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 14:13:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610651625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ko+npSZHZc9dqmJCpata5L29m+Uxumf/ZW8vh45X034=;
 b=EwCU7Qgu/5AEypTZJrLpEZTDeaDtXuDc6J13YvqMRp8jsLphiRbRKs0KT6e3PuLvaBZjjU
 mglcblMdF3zNQkJdROMq9tVQSqyXtBMWqw8D4ei5wtP+WS1+TMYVB77V/HCnezfONDieSn
 l9iKWfk/YaSpmc7/3Qne/1ZjJj8F2hI=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-367-XfZFzW-3NzennRNfWq2DWQ-1; Thu, 14 Jan 2021 14:13:43 -0500
X-MC-Unique: XfZFzW-3NzennRNfWq2DWQ-1
Received: by mail-vs1-f69.google.com with SMTP id r7so1119755vsp.0
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 11:13:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ko+npSZHZc9dqmJCpata5L29m+Uxumf/ZW8vh45X034=;
 b=puHDOqSsQ8ebU1Y6nZ8BcDt09U29V+6i2pXNgOcLgfAsZcDWoHyJVfznXra19vPK54
 tjLo6IRijNcXKOAhaAhyv5IRauS3lhnnHwvZa+nezQMtuicXIZmax0K/0QNWQrdrx6fc
 V9zqn8K06lkUi9c/jlMk0vNAgDdPMSgUFgWgSOcAEK2lPK8wnMDKOXqkfb7eeCKE0pQE
 nd0GVehe+NkqbpdtsgnU4kZu2IYaoVW2y6IMV7Hqj3P8VGUheEXq/f0K5VXhSQTEj3YG
 hfTNmYz7vbSmht6sF+FHpHk4TcQ7QfMxHUYqVCrcrjSekoQKeEegS6cFp6Z4KuuuCLyB
 5q3g==
X-Gm-Message-State: AOAM533b6hqOl0Q3nQ0/jztC5+AVW7RJONcwp4is6ag4x3sFm0FQYOyh
 NCAI5eW8GFGpeCrBm9+RlBw8JQ4AafHVTmkZ7A5PDRrnhEOhZj9GioVha25p0tCz27iiWyat8Yo
 exCcZoLvMfpe66sCEh44brSKvbh3ICKI=
X-Received: by 2002:a67:e155:: with SMTP id o21mr7898402vsl.39.1610651622643; 
 Thu, 14 Jan 2021 11:13:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzW3LQnPkxbiibe/KMGsb10LKlDLNhI8o/b9ThFUMcs9PsMObIN7bo2poSY6cM5swtXUG2i3hk3lQbUwC9PYS4=
X-Received: by 2002:a67:e155:: with SMTP id o21mr7898380vsl.39.1610651622411; 
 Thu, 14 Jan 2021 11:13:42 -0800 (PST)
MIME-Version: 1.0
References: <20210108185645.86351-1-thuth@redhat.com>
 <20210112115305.1cd5b8c5.cohuck@redhat.com>
 <877doinznw.fsf@linaro.org> <20210112132338.4122061b.cohuck@redhat.com>
 <efd30a52-8b5b-1afa-1505-6d6c296fe425@redhat.com>
 <350867de-59be-5756-9f12-3eae4c265472@redhat.com>
In-Reply-To: <350867de-59be-5756-9f12-3eae4c265472@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Thu, 14 Jan 2021 16:13:31 -0300
Message-ID: <CAKJDGDadiKJXFcV9YO5Fe318wmRsrUhC+D7yPrxqtTmafXnQhw@mail.gmail.com>
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

On Tue, Jan 12, 2021 at 10:53 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
...
> We explained this feature request to the Avocado project at the
> KVM forum 2018 in Lyon. There was an entry filled on their Trello
> dashboard. Then the project switched to GitLab and I lost track
> of it.

We moved our Avocado Trello board to the GitHub issues, but the
Avocado-QEMU Trello board stays live [1], with little or no action in
the last months as we are mostly using GitHub issued to track work any
on Avocado.

I don't recall or I was not involved in a discussion about a feature
like the one described in this thread in the KVM Forum of 2019 (Lyon).

>
> Cleber, if you remember, can you point us at the new ticket please?

I went through the Trello board and could not find a card related to
this feature. Anyway, just like the avocado_qemu package implements a
`wait_for_console_pattern`, it is possible to implement the needed
feature there.

>
> Thanks,
>
> Phil.
>
> > I already put my patch into my pull-request yesterday (so that people
> > are not running into failures with their gitlab-CI), so if someone want=
s
> > to have a go at creating such a function in python, feel free to do so
> > by refactoring that code again.
> >
> >  Thomas
> >
>


