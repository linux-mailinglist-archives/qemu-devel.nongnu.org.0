Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA012C6B87
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 19:24:27 +0100 (CET)
Received: from localhost ([::1]:49206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiiPy-0004aR-N7
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 13:24:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jannh@google.com>) id 1kiiP2-00045t-Ag
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 13:23:28 -0500
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:41733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jannh@google.com>) id 1kiiOx-0004pi-JZ
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 13:23:28 -0500
Received: by mail-lj1-x243.google.com with SMTP id y7so6855870lji.8
 for <qemu-devel@nongnu.org>; Fri, 27 Nov 2020 10:23:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e5KHpDtt5i2rR9LdUm+DCPfd8QCddCnGgU8lKoXRsc0=;
 b=k13XGK60aqGF8P+LZ5njqN9LkrUfUD2db3KBZtvlM/8c/m+Ar7Iaj3L9tzWBo8M07X
 SLsANqBnyZqRR6Y4soOGO3BasvLtrGteYICfbknYu6+sh6RI2ecZi3k8piaxa2oAkZ9r
 3r0E9YxnkK40upO2J0VCON60VP9A2pQg8FXc5xnBv6kNKFodimMOFDHidiR6CzUsbEFR
 loPKKh70S/Se5tUMMtUFbZCKu5Z+hj/H3WQX43nUvJytv6dzolyzWwSFRv5P6nDBJLoK
 qXUUk5BYiEe7ku9T/ezKgm1a+BRdDMxdD7inERGIrtnl3U0qHDisct5Mn5LnHgoH6V+P
 18tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e5KHpDtt5i2rR9LdUm+DCPfd8QCddCnGgU8lKoXRsc0=;
 b=SrLQ3sKP4SpUbFHT5Sszupbe30YeUPGzfAQ40Ar4ybEA7hNDDIncnmjguKxL4m+N+f
 mhI19/gnT+R5BBZLxT6rFruZ9m11RSYcliJDkkprYqoGrnX54FmM+h2mt5emALkozWc1
 4sPueimHB2Icw+Os0VUbCj16j5dvWjsKPn7K5fThJ9sDRaA44Jm8nV5EpuFTW54fZ6ro
 puQetdj4xZJhm2pn13EUOLBf0trFT81knRMtxd/1pimiZPwcq8qhZ1g6VAcMWG7N+Bsj
 BLZioYEBBNJAa86YVuqOrMcp4o/WqFXM5irMES6mzYA8JIQCs0Mjad225YXq+031zDCk
 C+sw==
X-Gm-Message-State: AOAM531/iL0JvMHsVuEl3t4wsR2K0QUpF1itxGMkrl/3RPXYw8RWW5J1
 zJNtVs4OL0502wcXst792DI18aaRy5fXC+uN4jd9pA==
X-Google-Smtp-Source: ABdhPJws0SUY2VfCWZwO1KgOCMLdvLLRf++rtY0jADZAsBpXkmgj4FmHl+qbGYochUFxuoYBMzoAHyDIowR/TJhi40s=
X-Received: by 2002:a2e:9216:: with SMTP id k22mr3959253ljg.138.1606501400078; 
 Fri, 27 Nov 2020 10:23:20 -0800 (PST)
MIME-Version: 1.0
References: <3E05451B-A9CD-4719-99D0-72750A304044@amazon.com>
 <CAG48ez2VAu6oARGVZ+muDK9_6_38KVUTJf7utz5Nn=AsmN17nA@mail.gmail.com>
In-Reply-To: <CAG48ez2VAu6oARGVZ+muDK9_6_38KVUTJf7utz5Nn=AsmN17nA@mail.gmail.com>
From: Jann Horn <jannh@google.com>
Date: Fri, 27 Nov 2020 19:22:53 +0100
Message-ID: <CAG48ez13ZAAOVmA89PRKRqr9UezV2_bj8Q6_6sSPzcqfzbsuQQ@mail.gmail.com>
Subject: Re: [PATCH v2] drivers/virt: vmgenid: add vm generation id driver
To: "Catangiu, Adrian Costin" <acatan@amazon.com>
Cc: "Graf (AWS), Alexander" <graf@amazon.de>,
 Christian Borntraeger <borntraeger@de.ibm.com>, 
 "Jason A. Donenfeld" <Jason@zx2c4.com>, Willy Tarreau <w@1wt.eu>, "MacCarthaigh,
 Colm" <colmmacc@amazon.com>, 
 Andy Lutomirski <luto@kernel.org>, "Theodore Y. Ts'o" <tytso@mit.edu>,
 Eric Biggers <ebiggers@kernel.org>, 
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 kernel list <linux-kernel@vger.kernel.org>, 
 "Woodhouse, David" <dwmw@amazon.co.uk>, "bonzini@gnu.org" <bonzini@gnu.org>,
 "Singh, Balbir" <sblbir@amazon.com>, 
 "Weiss, Radu" <raduweis@amazon.com>, "oridgar@gmail.com" <oridgar@gmail.com>, 
 "ghammer@redhat.com" <ghammer@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Qemu Developers <qemu-devel@nongnu.org>, KVM list <kvm@vger.kernel.org>, 
 Michal Hocko <mhocko@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Linux API <linux-api@vger.kernel.org>,
 "mpe@ellerman.id.au" <mpe@ellerman.id.au>, 
 linux-s390 <linux-s390@vger.kernel.org>,
 "areber@redhat.com" <areber@redhat.com>, 
 Pavel Emelyanov <ovzxemul@gmail.com>, Andrey Vagin <avagin@gmail.com>,
 Mike Rapoport <rppt@kernel.org>, Dmitry Safonov <0x7f454c46@gmail.com>,
 Pavel Tikhomirov <ptikhomirov@virtuozzo.com>, 
 "gil@azul.com" <gil@azul.com>, "asmehra@redhat.com" <asmehra@redhat.com>, 
 "dgunigun@redhat.com" <dgunigun@redhat.com>,
 "vijaysun@ca.ibm.com" <vijaysun@ca.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::243;
 envelope-from=jannh@google.com; helo=mail-lj1-x243.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[resend in the hope that amazon will accept my mail this time instead
of replying "550 Too many invalid recipients" again]

On Fri, Nov 20, 2020 at 11:29 PM Jann Horn <jannh@google.com> wrote:
> On Mon, Nov 16, 2020 at 4:35 PM Catangiu, Adrian Costin
> <acatan@amazon.com> wrote:
> > This patch is a driver that exposes a monotonic incremental Virtual
> > Machine Generation u32 counter via a char-dev FS interface that
> > provides sync and async VmGen counter updates notifications. It also
> > provides VmGen counter retrieval and confirmation mechanisms.
> >
> > The hw provided UUID is not exposed to userspace, it is internally
> > used by the driver to keep accounting for the exposed VmGen counter.
> > The counter starts from zero when the driver is initialized and
> > monotonically increments every time the hw UUID changes (the VM
> > generation changes).
> >
> > On each hw UUID change, the new hypervisor-provided UUID is also fed
> > to the kernel RNG.
>
> As for v1:
>
> Is there a reasonable usecase for the "confirmation" mechanism? It
> doesn't seem very useful to me.
>
> How do you envision integrating this with libraries that have to work
> in restrictive seccomp sandboxes? If this was in the vDSO, that would
> be much easier.

