Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8697460DFC
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 05:11:48 +0100 (CET)
Received: from localhost ([::1]:57140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrY16-0000Ir-2r
	for lists+qemu-devel@lfdr.de; Sun, 28 Nov 2021 23:11:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mrXCu-0004CI-JF
 for qemu-devel@nongnu.org; Sun, 28 Nov 2021 22:19:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mrXCs-0002FD-US
 for qemu-devel@nongnu.org; Sun, 28 Nov 2021 22:19:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638155994;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tXVgwP/VrXO5NZZ+mb7knJMihOq0VhjJrIz/ODU3p0E=;
 b=OmFgg9zt3CelF0HQ2PiwdjGgYqka9dlQnaW/1t2H309L30zKjOTMK6savYTlHbTEYjBdj9
 9VOUccjsVoBj8mw+telkO5PdPwGGlu0Rf6Ii44i1/9ilV9NkyJO97ZHhPCAi7IUCz03ogA
 SyTQoyvkPVg9dXZdA4T7TeBAuL5La/w=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-563-KpNATzolPLCCDYxk6tZ0mg-1; Sun, 28 Nov 2021 22:19:53 -0500
X-MC-Unique: KpNATzolPLCCDYxk6tZ0mg-1
Received: by mail-lf1-f69.google.com with SMTP id
 h40-20020a0565123ca800b00402514d959fso5106906lfv.7
 for <qemu-devel@nongnu.org>; Sun, 28 Nov 2021 19:19:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tXVgwP/VrXO5NZZ+mb7knJMihOq0VhjJrIz/ODU3p0E=;
 b=nouSoyqCPFBXA29bwe9E+CZxwA/bCEuivVCErX6kasId1ocWfJ9XJmfBGHCzx66czu
 QeMgV8A1pAEU39lVfcbvHo0OByzzMT6jidtItIi4nwZRynAHatt8xIvhnpaPp+QgJZGq
 vgLzwNiP6wTxlcXp/MRR+MsZUy6T0Bcp5ySVp+Nt1gNOu893FjhLu9TYanQsTdnme372
 6RapFoB6gBddU8HnNUDwmjMbprKzyQleIcMaa4iW4trqoMzSGRNI4x46D4rkrLRk1veu
 l6fLcINyOtFKjm4wk4LonD/UITj3y+v3MSJk2hmzNHRC6Ohx5VGXJcFBL29TojQb/osI
 tG1Q==
X-Gm-Message-State: AOAM531njaQSNkQkF1WMY9kJxnrNgHQpQfU86Ncf9usf8dxokC9KB2N6
 NskBRNN5FQ6IQ7Pm2PuFvXEx0tnlJJPFOaDUiY0lD3aP8P/SJl3VGmmkpIJSDfT9LIYfumtVwAB
 Bvkj6cFrosCQNHvtCKqAoZOW7UG9J9GI=
X-Received: by 2002:a2e:b742:: with SMTP id k2mr47639984ljo.107.1638155991658; 
 Sun, 28 Nov 2021 19:19:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxu4sNWUblIJTl7yMcdCsWcgwlMjXllxi+Pva814oJGkYseXfbX32NzMKHOYGPC418kWSJ5BWHhk0iL1ya3btk=
X-Received: by 2002:a2e:b742:: with SMTP id k2mr47639964ljo.107.1638155991376; 
 Sun, 28 Nov 2021 19:19:51 -0800 (PST)
MIME-Version: 1.0
References: <20211124060309.6872-1-jasowang@redhat.com>
 <YZ3wXo5XueDtuk8c@xz-m1.local>
 <PH0PR11MB56583B1E05F83EB56C28730BC3629@PH0PR11MB5658.namprd11.prod.outlook.com>
 <YZ8RfrbwXEB2fcJv@xz-m1.local>
 <PH0PR11MB5658E15F420BCBAD2AA58E23C3629@PH0PR11MB5658.namprd11.prod.outlook.com>
 <YZ8pi2ty2Z8wjt9u@xz-m1.local>
 <PH0PR11MB5658CC570A4E5B88CA3464A9C3659@PH0PR11MB5658.namprd11.prod.outlook.com>
 <YaQqjEwDVUGurPD7@xz-m1.local>
 <CACGkMEuz1qyp88igffJM+jQv5DUEnsu2yVmPwW45c8Qxo9hvGg@mail.gmail.com>
 <YaRFbvwR5Q2U6J3H@xz-m1.local>
In-Reply-To: <YaRFbvwR5Q2U6J3H@xz-m1.local>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 29 Nov 2021 11:19:40 +0800
Message-ID: <CACGkMEsO3Z7XqGO+JRTkjapQKN_82JzBGJ69m9B072mvKVs8rA@mail.gmail.com>
Subject: Re: [PATCH] intel-iommu: ignore SNP bit in scalable mode
To: Peter Xu <peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "mst@redhat.com" <mst@redhat.com>, "Liu, Yi L" <yi.l.liu@intel.com>,
 "yi.y.sun@linux.intel.com" <yi.y.sun@linux.intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 29, 2021 at 11:14 AM Peter Xu <peterx@redhat.com> wrote:
>
> On Mon, Nov 29, 2021 at 10:28:42AM +0800, Jason Wang wrote:
> > > I think we can still have Jason's patch continued because the kernel commit to
> > > apply SNP bit is merged in v5.13, so we may need the qemu change to let it
> > > still work with v5.13-v5.15+ guest kernels.  We'll loose the resv bit check a
> > > bit, but looks worthwhile.  Jason?
> >
> > Yes, I agree. The only thing that may worry me is the migration
> > compatibility. If we migrate from new to old we may break the guests,
> > we probably need compatibility props for that.
>
> Hmm.. How important is new->old migrations?  Is that normally for the
> old->new->old migration so that users can always fallback to the old hosts?

I meant e.g migrating from new qemu with machine=6.3 to old qemu with
machine=6.3.

So guest works on the src but not dst.

>
> If that's the case then IMHO we're fine here, since the new binary check less
> on resv bits than the old binary, then if the guest code can work with the old
> binary already then migrating back to old binary should work too.  Changing
> guest OS during migration of new->old can have a problem but hopefully rare.
>
> OTOH - do you know any of the real enterprise user that uses scalable mode yet?
> To my own understanding it's still mostly "experimental", then hopefully we can
> avoid worrying on that too much?

Probably, it has an "x" prefix.

>
> >
> > And in the future, it could be even more troublesome,e.g there's one
> > day we found another bit that needs not to be checked. Maybe we should
> > even remove all the rsvd bits checks?
>
> When a real hardware sees any of the reserved bits set, it'll bail out and
> raise an error, right?

To say the truth I don't know (though spec said that).

>
> If that's the case, I'm wondering whether we should always follow the hardware
> behavior as an emulator.
>
> Now I'm trying to remember normally how a spec could re-use a bit that was used
> to be reserved: should the hardware bumps the version of the version reg in so
> that softwares will know what to expect?

I think so or at least some kind of negotiation.

>
> So I'm thinking whether the emulator code can identify the version bump by
> "scalable mode enabled", if so we know some resved bits are "ignored" now, and
> IIUC that's mostly the original proposal to add a quirk when scalable mode in
> vtd_init().
>
> But again, I really think it should be the spec owner who should have
> considered all these.. e.g. explicitly document "this bit was used to reserved,
> but when scalable mode enabled it's ignored and programmable by the guest
> driver", or something like that.

I fully agree, we've learnt a lot when dealing with migration
compatibility in the past decade.

I will prepare a V2, it was basically what you suggested. And we can
leave the rest for future investigation. The motivation is prototyping
PASID support for virtio, it's sufficient for this patch to unblock
the work.

Thanks

>
> Thanks,
>
> --
> Peter Xu
>


