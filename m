Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 685186CC1AC
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 16:04:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ph9u8-0004di-CL; Tue, 28 Mar 2023 10:02:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ph9u3-0004da-Qm
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 10:02:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ph9tu-00025e-PR
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 10:02:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680012132;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=7xSxDCviZJlx9OnwGRV9Wjnsh2nspO4Yd6jt/dfpPF4=;
 b=MMVcfi7yQGkSAWBU2J1D3gkDEV4oKPLznojL4M7e4KjNCq/tov/rB5NVmV0JZaf0moFWBy
 VBKld80mSelJzLG9gxvwUeGvkd+ROyJH5tasOXUFS3GR0z7ROQeqw/8+NlmT+39sxj498K
 6cbDY9RrawLnDHzL0ryTFLOZUeBKHOU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-67-9ikzmnfLPkSXWIPo0ehuFA-1; Tue, 28 Mar 2023 10:02:07 -0400
X-MC-Unique: 9ikzmnfLPkSXWIPo0ehuFA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5CF941C09506;
 Tue, 28 Mar 2023 14:01:59 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6CAC2492B01;
 Tue, 28 Mar 2023 14:01:58 +0000 (UTC)
Date: Tue, 28 Mar 2023 15:01:55 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Henrik Carlqvist <hc981@poolhem.se>
Cc: mark.cave-ayland@ilande.co.uk, hc1245@poolhem.se, qemu-devel@nongnu.org
Subject: Re: [PATCH v5] Emulate dip switch language layout settings on SUN
 keyboard
Message-ID: <ZCLzUyiDeKLfQqWT@redhat.com>
References: <167305907804.10652.2746409341903316717-1@git.sr.ht>
 <d2850ef0-d825-bb03-09d4-0d1427cf6577@ilande.co.uk>
 <20230123200937.32eb19eb.hc981@poolhem.se>
 <20230304220754.0c6ae562.hc981@poolhem.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230304220754.0c6ae562.hc981@poolhem.se>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Sat, Mar 04, 2023 at 10:07:54PM +0100, Henrik Carlqvist wrote:
> On Wed, 1 Mar 2023 11:52:42 +0000
> Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk> wrote:
> > Another aspect to consider is whether keyboard_layout should just use
> > standard strings, in which case it may not make sense to accept numeric hex
> > values. 
> 
> I agree that those standard strings will make most sense to most people.
> 
> However, as the choices of valid keyboard layouts are limited by the 64 values
> allowed by the 6 bits on the dip switch I initially did choose to also truly
> emulate the dip switch value as decimal or hexadecimal number to the -k
> option. It might also be worth noting that the sun keyboard layouts have
> multiple dip switch settings for a single language, probably with some minor
> differences in keyboard layout or keyboard type. So both value 8 and 40 (0x28)
> will give some norwegian keyboard layout. if someone, for some reason, would
> want to emulate for example one of the four possible US keyboard layouts (0x0,
> 0x1, 0x21 or 0x22) it would be harder to do without being able to give those
> numerical values to the -k switch.

This is another reason why use of the '-k' switch is a bad idea. Its
range of permissible values / vocabulary does not match the range of
values / vocabulary needed for this hardware device.

In https://docs.oracle.com/cd/E19683-01/806-6642/new-43/index.html
the keyboard layouts have distinct names

"Norway4" vs "Norway5" and "US4" vs  "US5" vs "US_UNIX5"

I'd suggest a property to the escc device should take the names
given by that reference page above. eg

  -global escc.sunkbd_layout=Norway4

the only ambguity I see is that 0x0 and 0x1 both have the same
name (US4), which could be resolved by handling 0x0 as the default
with an empty string perhaps.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


