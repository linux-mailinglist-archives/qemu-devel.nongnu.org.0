Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5632CA1E2
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 12:58:17 +0100 (CET)
Received: from localhost ([::1]:39538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk4IS-0006TJ-FT
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 06:58:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kk4Gv-0005xl-8s
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 06:56:41 -0500
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:38259)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kk4Gt-0007nG-Or
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 06:56:41 -0500
Received: by mail-ed1-x543.google.com with SMTP id y4so2813831edy.5
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 03:56:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mY7iQAlCDv3m/pSFTAcG32WtflFk1CABCP1rf+2nyJY=;
 b=N6ERR3oDzH7bAbri2CfZlwbNC3SDoBMC/1OQXau8oCo9R7bBsZLtKgE3iJoWjyiWLP
 QlbnsxR2XXXVUVnXVMJLaKWWYZqr3uTUSc3juUWI2zi/3eIKukJJsAZ7IEffIktsTi/f
 aG44fb9hrqUvdZWTodJKVoY8DkKlmu3n+dBeOeN++VO8Cc3mOqYrlqP4uh4iotK768+G
 k7BIHZLXkihW8qOkaMNCcDx41oA5JE0ylirJi7Xzf9nhsgBT9EGdnHVxYzEOvzYZFu8n
 ylzs4u/ciNj/++ii9oa4LQ+HpsVVe8GL4KAU1fLatmOJkeLyEI1XjESQxqA9PRHJacyn
 FkdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mY7iQAlCDv3m/pSFTAcG32WtflFk1CABCP1rf+2nyJY=;
 b=ska/x47/cbVBV2SDPCb0BnamoobrxztT9BT8bhfWlbrgf63a5afz5fUTMLd8I1PlQ8
 BiVJ0gzkmi0R5GFOP/x6KUX5jho/JtxqWDQPN4EoCDTIc29cTdUdN94VMdNkR6yL5vPP
 +71smmI9hmOtMT6AoPnbaDiBywt1CMfkQRhJ1KUXOYngzafZ9444m5L5NYtM8odDnqk3
 UdePS9jqiKVvE9NM2mK8VmKwcd8Oj5hJKbPbxz+Xe+Mk8dTs9YIEzFL+IVH1vIQVkLj4
 cTaRbMLebAGnY+XcvS3CafpCkSHk+nEOh5Cp67w+MFaqcfwOEdvF4hEMLLx1CBvtNSUI
 kj9w==
X-Gm-Message-State: AOAM531sM5cf56hLD2vrU34sxzAU6/mhA2bBWFg1+faju1oqcFqNIpPf
 VALFsbo6BC4aAEJ9kb6RLfaOZBobIemQUaQ0nWy9iw==
X-Google-Smtp-Source: ABdhPJxrdT5H/NK0SSJ+6i/lEOMxEKnNt6HXsoPmsOOxIwm7ajxcGRo5LbitxkE+siXGh+yTYebFymgMdEKZugzxm5U=
X-Received: by 2002:aa7:d915:: with SMTP id a21mr2537511edr.251.1606823798104; 
 Tue, 01 Dec 2020 03:56:38 -0800 (PST)
MIME-Version: 1.0
References: <cover.1605316268.git.ashish.kalra@amd.com>
 <2ba88b512ec667eff66b2ece2177330a28e657c0.1605316268.git.ashish.kalra@amd.com>
 <CAFEAcA8eiyzUbHXQip1sT_TrT+Mfv-WG8cSMmM-w_eOFShAMzQ@mail.gmail.com>
 <20201201115047.GA15055@work-vm>
In-Reply-To: <20201201115047.GA15055@work-vm>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Dec 2020 11:56:26 +0000
Message-ID: <CAFEAcA_cdixD7jvu68snUU=PN2xQow1W2goKjshfdF9jGb2dBQ@mail.gmail.com>
Subject: Re: [PATCH 01/11] memattrs: add debug attribute
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::543;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x543.google.com
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
Cc: Thomas Lendacky <Thomas.Lendacky@amd.com>,
 Ashish Kalra <Ashish.Kalra@amd.com>, Brijesh Singh <brijesh.singh@amd.com>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm-devel <kvm@vger.kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 ssg.sos.patches@amd.com, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 1 Dec 2020 at 11:51, Dr. David Alan Gilbert <dgilbert@redhat.com> wrote:
>
> * Peter Maydell (peter.maydell@linaro.org) wrote:
> > On Mon, 16 Nov 2020 at 19:28, Ashish Kalra <Ashish.Kalra@amd.com> wrote:
> > >
> > > From: Brijesh Singh <brijesh.singh@amd.com>
> > >
> > > From: Brijesh Singh <brijesh.singh@amd.com>
> > >
> > > Extend the MemTxAttrs to include a 'debug' flag. The flag can be used as
> > > general indicator that operation was triggered by the debugger.
> > >
> > > A subsequent patch will set the debug=1 when issuing a memory access
> > > from the gdbstub or HMP commands. This is a prerequisite to support
> > > debugging an encrypted guest. When a request with debug=1 is seen, the
> > > encryption APIs will be used to access the guest memory.
> >
> > So, what counts as "debug" here, and why are debug requests
> > special? If "debug=1" means "can actually get at the guest memory",
> > why wouldn't every device model want to use it?
>
> SEV has a flag that the guest-owner can set on a VM to enable debug;
> it's rare for it to be enabled; so it's not suitable for use by normal
> devices.  It's only there for debug if the guest owner allows you to.

So if I do a memory transaction with debug=1 then I should expect
that it might come back with a failure status (meaning "this VM
doesn't permit debug") and I should handle that error ?

thanks
-- PMM

