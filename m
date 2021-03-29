Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61CD434DC75
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 01:29:46 +0200 (CEST)
Received: from localhost ([::1]:57854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lR1KK-0004d7-UJ
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 19:29:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lR1JO-00044X-Gy
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 19:28:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lR1JK-0001A7-LL
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 19:28:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617060520;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0O6AZHFP+iIFrEzQvJsAhcQlyfuI6oPGNvLZiIs/bwg=;
 b=iOzR9nJA7bSf4moD0DFDKcDfAy6aI8OucAZVZXry9nBQhBt2Q7YDEmgviqPvo1fuLY1qG+
 eO+bnhRx1ejg+SATcpnXgfSzDj/ChHl4CclVngxnfFxfhLWqcxPQ7dkkKUQG98kGxaiNse
 jpEktNwkK5iyJ8D2Ht4+/CieDkYiMLI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-327-rWkx5gReOM28qKJbsFylEw-1; Mon, 29 Mar 2021 19:28:38 -0400
X-MC-Unique: rWkx5gReOM28qKJbsFylEw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B5E781744F;
 Mon, 29 Mar 2021 23:28:37 +0000 (UTC)
Received: from localhost (unknown [10.40.208.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 60F0D90A09;
 Mon, 29 Mar 2021 23:28:33 +0000 (UTC)
Date: Tue, 30 Mar 2021 01:28:31 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH 0/4] DEVICE_NOT_DELETED/DEVICE_UNPLUG_ERROR QAPI events
Message-ID: <20210330012831.2ce0514c@redhat.com>
In-Reply-To: <ba20de28-d65b-6da4-5bff-92b637cf7a56@gmail.com>
References: <20210312200740.815014-1-danielhb413@gmail.com>
 <YFlAheldkqCkZytI@yekko.fritz.box>
 <b8d96ab9-61e5-b941-6405-5beff5fe0df5@gmail.com>
 <YFqYkuBSD3xPgLVi@yekko.fritz.box>
 <ba20de28-d65b-6da4-5bff-92b637cf7a56@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, groug@kaod.org, qemu-ppc@nongnu.org,
 armbru@redhat.com, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 24 Mar 2021 16:09:59 -0300
Daniel Henrique Barboza <danielhb413@gmail.com> wrote:

> On 3/23/21 10:40 PM, David Gibson wrote:
> > On Tue, Mar 23, 2021 at 02:10:22PM -0300, Daniel Henrique Barboza wrote:  
> >>
> >>
> >> On 3/22/21 10:12 PM, David Gibson wrote:  
> >>> On Fri, Mar 12, 2021 at 05:07:36PM -0300, Daniel Henrique Barboza wrote:  
> >>>> Hi,
> >>>>
> >>>> This series adds 2 new QAPI events, DEVICE_NOT_DELETED and
> >>>> DEVICE_UNPLUG_ERROR. They were (and are still being) discussed in [1].
> >>>>
> >>>> Patches 1 and 3 are independent of the ppc patches and can be applied
> >>>> separately. Patches 2 and 4 are based on David's ppc-for-6.0 branch and
> >>>> are dependent on the QAPI patches.  
> >>>
> >>> Implementation looks fine, but I think there's a bit more to discuss
> >>> before we can apply.
> >>>
> >>> I think it would make sense to re-order this and put UNPLUG_ERROR
> >>> first.  Its semantics are clearer, and I think there's a stronger case
> >>> for it.  
> >>
> >> Alright
> >>  
> >>>
> >>> I'm a bit less sold on DEVICE_NOT_DELETED, after consideration.  Does
> >>> it really tell the user/management anything useful beyond what
> >>> receiving neither a DEVICE_DELETED nor a DEVICE_UNPLUG_ERROR does?  
> >>
> >>
> >> It informs that the hotunplug operation exceed the timeout that QEMU
> >> internals considers adequate, but QEMU can't assert that it was caused
> >> by an error or an unexpected delay. The end result is that the device
> >> is not going to be deleted from QMP, so DEVICE_NOT_DELETED.  
> > 
> > Is it, though?  I mean, it is with this implementation for papr:
> > because we clear the unplug_requested flag, even if the guest later
> > tries to complete the unplug, it will fail.
> > 
> > But if I understand what Markus was saying correctly, that might not
> > be possible for all hotplug systems.  I believe Markus was suggesting
> > that DEVICE_NOT_DELETED could just mean that we haven't deleted the
> > device yet, but it could still happen later.
> > 
> > And in that case, I'm not yet sold on the value of a message that
> > essentially just means "Ayup, still dunno what's happening, sorry".
> >   
> >> Perhaps we should just be straightforward and create a DEVICE_UNPLUG_TIMEOUT
> >> event.  
> > 
> > Hm... what if we added a "reason" field to UNPLUG_ERROR.  That could
> > be "guest rejected hotplug", or something more specific, in the rare
> > case that the guest has a way of signalling something more specific,
> > or "timeout" - but the later *only* to be sent in cases where on the
> > timeout we're able to block any later completion of the unplug (as we
> > can on papr).

Is canceling unplug on timeout documented somewhere (like some spec)?

If not it might (theoretically) confuse guest when it tries to unplug
after timeout and leave guest in some unexpected state. 

> 
> I believe that's already covered by the existing API:
> 
> 
> +# @DEVICE_UNPLUG_ERROR:
> +#
> +# Emitted when a device hot unplug error occurs.
> +#
> +# @device: device name
> +#
> +# @msg: Informative message
> 
> The 'informative message' would be the reason the event occurred. In patch
> 4/4, for the memory hotunplug refused by the guest, it is being set as:
> 
>       qapi_error = g_strdup_printf("Memory hotunplug rejected by the guest "
>                                    "for device %s", dev->id);
>       qapi_event_send_device_unplug_error(dev->id, qapi_error);
> 
> 
> 
> We could use the same DEVICE_UNPLUG_ERROR event in the CPU hotunplug timeout
> case (currently on patch 2/4) by just changing 'msg', e.g.:
> 
> 
>       qapi_error = g_strdup_printf("CPU hotunplug timeout for device %s", dev->id);
>       qapi_event_send_device_unplug_error(dev->id, qapi_error);
> 

lets make everything support ACPI (just kidding).

maybe we can reuse already existing ACPI_DEVICE_OST instead of DEVICE_UNPLUG_ERROR
which sort of does the same thing (and more) but instead of strings uses status codes
defined by spec.

Idea similar to DEVICE_UNPLUG_ERROR was considered back then, but instead of QEMU being
a poor translator of status codes to non machine-readable strings we went with
exposing well documented status codes to user. This way user can implement
specific reactions to particular errors just looking at JSON + spec.

> Thanks,
> 
> DHB
> 
> 
> > 
> > Thoughs, Markus?
> >   
> 


