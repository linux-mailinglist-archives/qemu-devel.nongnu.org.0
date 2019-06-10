Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E45463B38B
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jun 2019 12:56:56 +0200 (CEST)
Received: from localhost ([::1]:44274 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1haHyx-0000JM-Bm
	for lists+qemu-devel@lfdr.de; Mon, 10 Jun 2019 06:56:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37085)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1haHvV-0006LZ-7Z
 for qemu-devel@nongnu.org; Mon, 10 Jun 2019 06:53:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1haHvU-0007pd-1m
 for qemu-devel@nongnu.org; Mon, 10 Jun 2019 06:53:21 -0400
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233]:35590)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1haHvT-0007mU-PK
 for qemu-devel@nongnu.org; Mon, 10 Jun 2019 06:53:19 -0400
Received: by mail-oi1-x233.google.com with SMTP id y6so5903463oix.2
 for <qemu-devel@nongnu.org>; Mon, 10 Jun 2019 03:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=C28I/h3Ux2Z1jb/k2a67OQHmiH1emte0mgTCdVs4or8=;
 b=jyqBsTUAOU4f4KuYHREwV7CeXaVWKi2iNnwfu/31KP1r/mjMZtk3/HxNgIJo2kUczF
 VrWbBfxcA0L7YfwU4mNzXLq6g/gZF4lqivl4ACTLhHIAzyeRd5BOrmkxu1+EjcQ4ECId
 koJfd4vmQYhcO812DJnN7L/rhqVsvfv/3yfAiecglNBfh8qJLEHWt8uq66wXoIOOyDKh
 +Qua1WUjzUuAYWXyNKc+Vc//1W2JQeVvyV4x5EML0p4mZs9FKCgG4E5RTwoLKo4VhJTp
 kWcD4dWnJ/rQKJhbBgwLWyatUqk/DS5JXkrBSzaYd8vFWxNMCEkKhAZHpL/jRlwHD894
 VBNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C28I/h3Ux2Z1jb/k2a67OQHmiH1emte0mgTCdVs4or8=;
 b=Pj3Nj55WiRjfKrVJoz+hc4bE+MKdntdV6+wJwgU8wGCqrb7dF1h3r0EF2GN21G7Ylu
 uc1hamHc8zMG14KnpOmHn6myHjkCUFXS/8jpUkDsJ9GRUJSaq5MMl2XRgo1RH9Zuv13Q
 fJ5NekJQpAwpMpuJxRa0dx74AQStjXfJYstpx52nK8S1z9PC98X6RF8VwrXby9031Yba
 AGzB3MmzX7W02qoIkbC9yWBjb1VS+QXX3yOjvWwMhxhqnD02VFoHSCeIf4i5poMFRnzm
 AbcOvzpNkVkI7gPeNaGmX9eGkvFZwGlju5eyzY/+S2WkDg7fP3RbHMpLQiRWQbVnpmf2
 Xs0Q==
X-Gm-Message-State: APjAAAU7lKBZcWv7zIJro57qwpYV9hQaU2WUt5GzAWCyMHxyK+Cv4Eor
 CHBn7fB4mFZXuGteeP/ddku5/rYX7iCoD4q2F99MrQ==
X-Google-Smtp-Source: APXvYqy8hAnASETyfrHO66IaUwlzD1C4GKnxOVd2GvhVKt92byP7f/KFwXGkn7EZ6sI6DMNb446qxwLsAUBhxINxn3U=
X-Received: by 2002:aca:ac48:: with SMTP id v69mr11228098oie.48.1560163998160; 
 Mon, 10 Jun 2019 03:53:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190607183228.22454-1-ehabkost@redhat.com>
In-Reply-To: <20190607183228.22454-1-ehabkost@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 10 Jun 2019 11:53:07 +0100
Message-ID: <CAFEAcA8WjX3oGqx-oBhkXewNyPw6o-c5_W+MfYb+EpvQB+AVbQ@mail.gmail.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::233
Subject: Re: [Qemu-devel] [PULL 0/2] Machine Core queue, 2019-06-07
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 7 Jun 2019 at 19:32, Eduardo Habkost <ehabkost@redhat.com> wrote:
>
> The following changes since commit 185b7ccc11354cbd69b6d53bf8d831dd964f6c88:
>
>   Merge remote-tracking branch 'remotes/cohuck/tags/s390x-20190607-2' into staging (2019-06-07 15:24:13 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/ehabkost/qemu.git tags/machine-next-pull-request
>
> for you to fetch changes up to 754f1dbcf1d4d543167e3212366055761c30bcf4:
>
>   accel: Remove unused AccelClass::opt_name attribute (2019-06-07 15:28:46 -0300)
>
> ----------------------------------------------------------------
> Machine Core queue, 2019-06-07
>
> * Improve CPU hotplug error message
>   (Laurent Vivier)
> * Remove unused AccelClass::opt_name field
>   (Wainer dos Santos Moschetta)
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/4.1
for any user-visible changes.

-- PMM

