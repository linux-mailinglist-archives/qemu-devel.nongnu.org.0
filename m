Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD54B492986
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 16:19:13 +0100 (CET)
Received: from localhost ([::1]:44126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9qGO-0006ZW-Iv
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 10:19:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n9oTt-0003ll-Gg
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 08:25:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n9oTq-0003QY-BC
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 08:25:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642512297;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=dVQmUazxr0xjSVJUl2JL5q5VPHJCuvU5YrVgh98JUQc=;
 b=ZZmL08BS/byz3G06oEzBLD8GXizkOyR1yLKBm4qiJuAMYsYhK82w4vKNfW5DovsWTZyFLR
 fn1sBPqTm+ChiHpC1CQh9wXCvstClBbsuc0kifIqXrrang90JhbM1EkLBbhZfIGUlRr2Kw
 WRSaGO2Awj9fMaDkxilTfODUDTCnWH0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-120-S20nI0rMOjy666nLOfbLUg-1; Tue, 18 Jan 2022 08:24:48 -0500
X-MC-Unique: S20nI0rMOjy666nLOfbLUg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B7083801B0B;
 Tue, 18 Jan 2022 13:24:47 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.32])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0FFE26A023;
 Tue, 18 Jan 2022 13:24:43 +0000 (UTC)
Date: Tue, 18 Jan 2022 13:24:40 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: /usr/shared/qemu binaries
Message-ID: <Yea/mMFP7WW3v42b@redhat.com>
References: <B9A4B86C-4540-486D-A261-876191FA7424@livius.net>
 <CAKmqyKPBDfxKwqcgzjBDEqoWyjjc3g7PiUOEqptL1vfDfh6H8g@mail.gmail.com>
 <D3A93704-3353-4407-9D47-56FF06BDFB87@livius.net>
 <CAKmqyKO-K-GtrHijVW9jVHTtxgeGdOHm7-Y_290HqtNG4k71eg@mail.gmail.com>
 <1E2E0E52-B384-404C-BD72-5697A611EEC5@livius.net>
 <CAFEAcA_vx48ZavZCHD5_=Ajc9zsWS2ieoDXvRzBAEMBjkR3Rrg@mail.gmail.com>
 <7403b918-d2c7-1d3f-8ef8-786db90fcbea@redhat.com>
 <CAFEAcA_qkUPjSz2PQTxtkTFuho=HusONxN56e9z89B8jHrOJag@mail.gmail.com>
 <d9c9de5c-7b33-ea60-4a14-634cdd8f66a2@redhat.com>
MIME-Version: 1.0
In-Reply-To: <d9c9de5c-7b33-ea60-4a14-634cdd8f66a2@redhat.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <alistair23@gmail.com>, Liviu Ionescu <ilg@livius.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 18, 2022 at 01:30:35PM +0100, Paolo Bonzini wrote:
> On 1/13/22 18:23, Peter Maydell wrote:
> > On Thu, 13 Jan 2022 at 17:13, Paolo Bonzini <pbonzini@redhat.com> wrote:
> > > 
> > > On 1/12/22 14:56, Peter Maydell wrote:
> > > > Those are UEFI firmware images which are suitable for using with
> > > > the arm/aarch64 "virt" board. They're only used if the user specifically
> > > > asks to use them on the command line (eg with
> > > > "-drive if=pflash,format=raw,file=pc-bios/edk2-aarch64-code.fd" or
> > > > similar).
> > > 
> > > There must be lots of zeros in there. Maybe we should tell QEMU to
> > > unpack firmware .gz or .lzo files?
> > 
> > Not hugely keen on adding more "do what I mean" behaviour...
> 
> Certainly no autodetection (with writable pflash there's the possibility of
> the guest causing real problems), but we already distribute firmware as
> compressed files so the zeroes _are_ causing problems for us as well.  We
> are just telling the users to deal with it.

I don't think compression will make a meaningful difference here.
The firmware is split with both code and vars files. When booting
a guest the vars file is deep copied. The vars file can't be
compressed because it needs to be writable at runtime.

So for 100 guests, you have  1 x 64 MB of code.fd plus 100 x 64 MB
of vars.fd. If only the code.fd can be compressed, that isn't going
to dent the disk space consumed.

If we want the firmware to be smaller the file could be made sparse
on disk. If the firmware only needs to be used with pflash, then
we could distribute it in qcow2 format instead of raw, which would
get rid of the zeros too.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


