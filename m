Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E666ADBAC
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 11:21:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZUQw-0005QI-5g; Tue, 07 Mar 2023 05:20:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pZUQu-0005Po-Ml
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 05:20:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pZUQs-00031T-MD
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 05:20:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678184433;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PlASGKMroC6y4++8KpPhEVqfL2F0sWlrwdI9GhUBe1Q=;
 b=RPKvEgbF4RGeo5voJCiS5nozxRBkRkw+jcZ0R4nGXUYBA1BZULFjMZORVwC7BQMLxZx5Nd
 MFuwESKgORHShd0cgLeyyraNKmvejiKDRhCgMlePcyAajjuF620pAhdGq3XLYdMFqhAJWw
 rSbbOcYJkwsjosaMvNI8hLawOmr+VWM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-647-1D5He4LaMryoQNjOPUBwGg-1; Tue, 07 Mar 2023 05:20:32 -0500
X-MC-Unique: 1D5He4LaMryoQNjOPUBwGg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2D4CB85A5B1;
 Tue,  7 Mar 2023 10:20:32 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 94CAD492C14;
 Tue,  7 Mar 2023 10:20:31 +0000 (UTC)
Date: Tue, 7 Mar 2023 10:20:29 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Ross Lagerwall <ross.lagerwall@citrix.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH] ps2: Don't send key release event for Lang1, Lang2 keys
Message-ID: <ZAcP7XocJnIdubp+@redhat.com>
References: <20230227173308.3944546-1-ross.lagerwall@citrix.com>
 <Y/zritfojBdlHWaz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y/zritfojBdlHWaz@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

We don't have any nominated maintainer for this ps2.c file. Unless
anyone objects, i'll pick this patch up into my next set of misc
fixes to be sent for this release.

On Mon, Feb 27, 2023 at 05:42:34PM +0000, Daniel P. Berrangé wrote:
> On Mon, Feb 27, 2023 at 05:33:08PM +0000, Ross Lagerwall wrote:
> > The scancodes for the Lang1 and Lang2 keys (i.e. Hangeul, Hanja) are
> > special since they already have the 0x80 bit set which is commonly used
> > to indicate a key release in AT set 1. Reportedly, real hardware does
> > not send a key release scancode. So, skip sending a release for these
> > keys. This ensures that Windows behaves correctly and interprets it as a
> > single keypress rather than two consecutive keypresses.
> 
> A reference for this assertion would be:
> 
>   https://www.win.tue.nl/~aeb/linux/kbd/scancodes-9.html
> 
>    "The Korean keyboard has two keys, the Korean/Chinese and
>     the Korean/English toggles, that generate scancodes f1
>     and f2 (respectively) when pressed, and nothing when
>     released."
> 
> > 
> > Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> > ---
> >  hw/input/ps2.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> 
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> 
> > 
> > diff --git a/hw/input/ps2.c b/hw/input/ps2.c
> > index 3253ab6a92..45af76a837 100644
> > --- a/hw/input/ps2.c
> > +++ b/hw/input/ps2.c
> > @@ -402,6 +402,9 @@ static void ps2_keyboard_event(DeviceState *dev, QemuConsole *src,
> >                      ps2_put_keycode(s, 0xaa);
> >                  }
> >              }
> > +        } else if ((qcode == Q_KEY_CODE_LANG1 || qcode == Q_KEY_CODE_LANG2)
> > +                   && !key->down) {
> > +            /* Ignore release for these keys */
> >          } else {
> >              if (qcode < qemu_input_map_qcode_to_atset1_len) {
> >                  keycode = qemu_input_map_qcode_to_atset1[qcode];
> > @@ -497,6 +500,9 @@ static void ps2_keyboard_event(DeviceState *dev, QemuConsole *src,
> >                      ps2_put_keycode(s, 0x12);
> >                  }
> >              }
> > +        } else if ((qcode == Q_KEY_CODE_LANG1 || qcode == Q_KEY_CODE_LANG2) &&
> > +                   !key->down) {
> > +            /* Ignore release for these keys */
> >          } else {
> >              if (qcode < qemu_input_map_qcode_to_atset2_len) {
> >                  keycode = qemu_input_map_qcode_to_atset2[qcode];
> > -- 
> > 2.31.1
> > 
> 
> With regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
> 
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


