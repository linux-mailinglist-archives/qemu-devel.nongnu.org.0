Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6192A3E1A93
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 19:41:41 +0200 (CEST)
Received: from localhost ([::1]:52080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBhNE-0007dC-Et
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 13:41:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mBhLm-0005wE-Km
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 13:40:10 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:41577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mBhLk-0004qn-T9
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 13:40:10 -0400
Received: by mail-ed1-x536.google.com with SMTP id x90so9496082ede.8
 for <qemu-devel@nongnu.org>; Thu, 05 Aug 2021 10:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nV4hbXKvvVxaj4uxhsJ6nqbQ8LQl78Q82EIDvvNEuEk=;
 b=nk+p5pL+BdT53geBrPr0Su0G1Cd2EXEtDLfolSr6wwK9N+wjFxKUl9y7lPjKnc4PJp
 kRDbdDNxH9j/EUg1IThLoNvb7hfpOqkMYwlP8MUtfTHkdIj4zJzUZXkTMBNB4/oiszOe
 LTh/ozfyMApZDwUU8ofblV6ZNs9BtDV5nvH+b57WAiWuupis4Ye1GdHgsZymADEsAa9Y
 z0mIfkDiJnN9ELK2m+IuKO9OsP14yYs2qWu+SYP0Jk8f4Ka1OaYXRZfOYh4sVpR2dlp9
 Mv+IRXOwSgQ+zbGkQFZ5T2G0wx8+FqtpXZhyx+lhXHKG+bpkgNnU3WLzxih3qAuMS7zY
 NBVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nV4hbXKvvVxaj4uxhsJ6nqbQ8LQl78Q82EIDvvNEuEk=;
 b=k4UKkE2Bs0rtPlLLjmQC7BITTe3ag49pTMUEwpcS6ep+2NZwXXliymNXCJZCd3Ksi3
 D3CDTY6xM7uVfcOGJQ4l1cX5tTFdfY2iXKVCfZKlscfeIDI0wx26tcTvwaP+ENXX9AfF
 S1ykAyiFeZa25bIvSHLiZn39gOEzVFyfQMBN32CwNfq1HCZ8zxopxrYhKUpXF61s58pn
 nFr6BU4vEsjqQA/7mwOK18DghP/LBew/Mj4x7R5J/C0kr01QFIJ9oXJaYi1Szr4QyZeH
 FkdtOdw6ORqU43p+W/BA5OkDXrKVHhpjjyvDTAdHSmQio/wDqL6eRbzFWmnofvxB+v3Y
 6Vig==
X-Gm-Message-State: AOAM533I2PRt+Gf0oOxIZbCoWa1cRgzrNVZ0HxdCR3YB3lTfb59VEGCn
 CMPYtMLXDul511xmZbwcV7sHQz7sKlNkT3+uNNLyrA==
X-Google-Smtp-Source: ABdhPJyQxqaDU10UavPC8MvjvT8rWm4AV2wWvLf5A4TiVa0tFBwYV7L8+y/Yj3ZwrgcCZOT/ye3iap6ZM476AbgqErk=
X-Received: by 2002:aa7:d30e:: with SMTP id p14mr8007453edq.204.1628185206337; 
 Thu, 05 Aug 2021 10:40:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA-QcwjGtgzqkLshyU4NCq2ZhhdvJN3V_7rTCA4nUavhaQ@mail.gmail.com>
 <20210804094231-mutt-send-email-mst@kernel.org>
 <CAFEAcA9yb9MzY3w1G5xcPdY0h-S=m2Z8YOxc7fLTU4TOJ4z6-w@mail.gmail.com>
In-Reply-To: <CAFEAcA9yb9MzY3w1G5xcPdY0h-S=m2Z8YOxc7fLTU4TOJ4z6-w@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Aug 2021 18:39:22 +0100
Message-ID: <CAFEAcA-y8R-tXv1vd68V9x69pyc0whns35yvft5fP5JUMgV2oQ@mail.gmail.com>
Subject: Re: intermittent failure, s390 host, x86-64 guest, vhost-user-blk test
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Eric Blake <eblake@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 4 Aug 2021 at 15:33, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Wed, 4 Aug 2021 at 14:43, Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Wed, Aug 04, 2021 at 01:40:37PM +0100, Peter Maydell wrote:
> > > Saw this intermittent as part of my ad-hoc CI test setup.
> > > The backtrace says that the QEMU process has somehow hung
> > > during 'realize' of the vhost-user device...
> >
> > Hmm seems to have to do with the daemon not responding ...
> > Cc a bunch more people ...
>
> Here's another one; same thing, but a ppc64 guest, I think.

Ran into this again; I'll spare you the backtraces but it was the
same 'hang in realize', this one for qemu-system-i386. Same s390 host.
This seems to be a fairly frequent intermittent -- can somebody
have a look at it ?

-- PMM

