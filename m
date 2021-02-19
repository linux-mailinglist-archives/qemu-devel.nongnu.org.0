Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 960E431FD01
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 17:19:32 +0100 (CET)
Received: from localhost ([::1]:33892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD8V9-0000bs-K5
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 11:19:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <miklos@szeredi.hu>) id 1lD87o-0003cr-Ez
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 10:55:24 -0500
Received: from mail-vs1-xe2a.google.com ([2607:f8b0:4864:20::e2a]:38546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <miklos@szeredi.hu>) id 1lD87j-0006y0-3D
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 10:55:23 -0500
Received: by mail-vs1-xe2a.google.com with SMTP id l192so2919347vsd.5
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 07:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=szeredi.hu; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3f9/KIEhjHz/f5OUekOg8TjqaaRrTrdZ6lRHNlW+PSo=;
 b=RntPNxbOG6X4yw1b7H+R0BWmIh7+RPkWgQbBP8NBkV0EmJuCBByb++ZENv9FYF8ytY
 m4fUWCsHqE3GymRJTPPx5RfilxAzbcxj0Kp2lpS/i/azbX4YrGcZ7E5/TZY/DzLtLSdo
 Q1q1+AnGC1+tmcc8tr/SzJRAeEq43PaKX30Rk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3f9/KIEhjHz/f5OUekOg8TjqaaRrTrdZ6lRHNlW+PSo=;
 b=LATMmIRF660FR4iD6z8EweCtUg+Myfts6a19XdCZmKUxFhw9tjmbC9w0NoNoJtX8Kw
 zLQa4Rw1wRvCYfLmTuHLcnhkcWi6LybsNhqItXbFJ7AvTPWQAvAE6ALOz6l2HFGkdt1B
 au4TX3van7IbV57R6kbr+Wf+k4z+HXl2IKYVXfRnIz1ICD8cCXvxheT9IDD1qst4jyM0
 cAyblJJpqR8NQisn/yFUHhUxDr9yxlJ6D/Gm6Uc7vbMrBboSD2JySnlTBZgnOA+pfmaa
 VofaLSgoxD3yo+I/W2tXN7lET0dL2HXqNNScI/69PWUSFR1F3VXbO4mLbeIhKbmi7s7W
 xDvg==
X-Gm-Message-State: AOAM533t7L7ox+8IB6qxP2KwB6+pL4/eXR4TCS1jG5QAil6dr0xbq8WY
 HGe86ztXE54E8R/kh5OAKFryqdCCeFqUa5serv7lgw==
X-Google-Smtp-Source: ABdhPJz6ex1qA5UfTOrZR9X2DkDKimoq5lgM3XcZgFwq2xBO18DDlI/EUd6rk2YhP+uq/ioKEG7F0OvbV+zH5xhYa7s=
X-Received: by 2002:a67:ea05:: with SMTP id g5mr6592695vso.47.1613750116768;
 Fri, 19 Feb 2021 07:55:16 -0800 (PST)
MIME-Version: 1.0
References: <20210217233046.81418-1-vgoyal@redhat.com> <87pn0wgtsx.fsf@suse.de>
 <20210219143403.GA3270@redhat.com>
In-Reply-To: <20210219143403.GA3270@redhat.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Fri, 19 Feb 2021 16:55:06 +0100
Message-ID: <CAJfpeguanq6PEf7jd9Ur_JO7aJ0eoojs65LXb6ukhoGGb_Ccdw@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] virtiofsd: Add options to enable/disable posix acl
To: Vivek Goyal <vgoyal@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2a;
 envelope-from=miklos@szeredi.hu; helo=mail-vs1-xe2a.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: virtio-fs-list <virtio-fs@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Luis Henriques <lhenriques@suse.de>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 19, 2021 at 3:34 PM Vivek Goyal <vgoyal@redhat.com> wrote:
>
> On Fri, Feb 19, 2021 at 11:50:54AM +0000, Luis Henriques wrote:
> > Vivek Goyal <vgoyal@redhat.com> writes:
> >
> > > Hi,
> > >
> > > This is V2 of the patches. Changes since v1 are.
> > >
> > > - Rebased on top of latest master.
> > > - Took care of Miklos's comments to block acl xattrs if user
> > >   explicitly disabled posix acl.
> > >
> > > Luis Henriques reported that fstest generic/099 fails with virtiofs.
> > > Little debugging showed that we don't enable acl support. So this
> > > patch series provides option to enable/disable posix acl support. By
> > > default it is disabled.
> > >
> > > I have run blogbench and pjdfstests with posix acl enabled and
> > > things work fine.
> > >
> > > Luis, can you please apply these patches, and run virtiofsd with
> > > "-o posix_acl" and see if it fixes the failure you are seeing. I
> > > ran the steps you provided manually and it fixes the issue for
> > > me.
> >
> > Sorry for the delay.  I've finally tested these patches and they indeed
> > fix the problem I reported.  My only question about this fix is why is
> > this option not enabled by default, since this is the documented behavior
> > in acl(5) and umask(2)?  In fact, why is this an option at all?
>
> You mean why to not enable acl by default?
>
> I am concerned about performance drop this can lead to because extra
> GETXATTR(system.posix_acl_*) messages which will trigger if acls are enabled.
> And not all users might require these. That's why I preferred to not enable
> acl by default. Those who need it can enable it explicitly.
>
> Another example is xattr support. Due to performance concerns, we don't
> enable xattrs by default either.

Actually generic xattr is much worse, since there's no caching for
them currently, as opposed to posix acls, which are cached both when
positive and negative.

If we enable ACL by default in case xattrs are enabled, we should be
safe, I think.  Having an option to disable acls still makes sense,
but it's an optional plus.

Thanks,
Miklos

