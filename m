Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4BA371F8F
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 20:23:32 +0200 (CEST)
Received: from localhost ([::1]:35924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lddEB-00088i-0e
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 14:23:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lddCm-0007jZ-OK
 for qemu-devel@nongnu.org; Mon, 03 May 2021 14:22:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lddCj-0008RH-Re
 for qemu-devel@nongnu.org; Mon, 03 May 2021 14:22:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620066119;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s4HVq9k6OLgO5YfEk0vVF6cynWG4X0k6OKoVyLRdkgs=;
 b=SWRCnDXMu85QkMQK9oBpWp7y2HQYIkJQ+KUBlpjXQZcWoIkPu8oXiztNIdx57J71yg23M9
 Fk14mHZXcXajPn6XaI956kAOsr1WWIfr2R1h5xRnIv3KWQma2LK4ywdepnBPeThqeNIIWf
 POwO5psos0zj6q8jJFlwkrqWAPW00sc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-306-QJ_K76P2M-ufgEFBXWUFAA-1; Mon, 03 May 2021 14:21:55 -0400
X-MC-Unique: QJ_K76P2M-ufgEFBXWUFAA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 96E669F92A
 for <qemu-devel@nongnu.org>; Mon,  3 May 2021 18:21:53 +0000 (UTC)
Received: from [10.3.114.144] (ovpn-114-144.phx2.redhat.com [10.3.114.144])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C7145C1D0;
 Mon,  3 May 2021 18:21:48 +0000 (UTC)
Subject: Re: Let's remove some deprecated stuff
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <87y2d1csxe.fsf@dusky.pond.sub.org>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <ccc48bde-3e8f-3abb-f062-77bd04d6cc93@redhat.com>
Date: Mon, 3 May 2021 13:21:47 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87y2d1csxe.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Krempa <pkrempa@redhat.com>,
 "libvirt-list@redhat.com" <libvirt-list@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/29/21 4:59 AM, Markus Armbruster wrote:
> If you're cc'ed, you added a section to docs/system/deprecated.rst that
> is old enough to permit removal.  This is *not* a demand to remove, it's
> a polite request to consider whether the time for removal has come.
> Extra points for telling us in a reply.  "We should remove, but I can't
> do it myself right now" is a valid answer.  Let's review the file:
> 

[adjusting cc for this response]

> 
> Eric Blake:
> 
>     qemu-img amend to adjust backing file (since 5.1)
>     '''''''''''''''''''''''''''''''''''''''''''''''''
> 
>     The use of ``qemu-img amend`` to modify the name or format of a qcow2
>     backing image is deprecated; this functionality was never fully
>     documented or tested, and interferes with other amend operations that
>     need access to the original backing image (such as deciding whether a
>     v3 zero cluster may be left unallocated when converting to a v2
>     image).  Rather, any changes to the backing chain should be performed
>     with ``qemu-img rebase -u`` either before or after the remaining
>     changes being performed by amend, as appropriate.
> 
>     qemu-img backing file without format (since 5.1)
>     ''''''''''''''''''''''''''''''''''''''''''''''''
> 
>     The use of ``qemu-img create``, ``qemu-img rebase``, or ``qemu-img
>     convert`` to create or modify an image that depends on a backing file
>     now recommends that an explicit backing format be provided.  This is
>     for safety: if QEMU probes a different format than what you thought,
>     the data presented to the guest will be corrupt; similarly, presenting
>     a raw image to a guest allows a potential security exploit if a future
>     probe sees a non-raw image based on guest writes.
> 
>     To avoid the warning message, or even future refusal to create an
>     unsafe image, you must pass ``-o backing_fmt=`` (or the shorthand
>     ``-F`` during create) to specify the intended backing format.  You may
>     use ``qemu-img rebase -u`` to retroactively add a backing format to an
>     existing image.  However, be aware that there are already potential
>     security risks to blindly using ``qemu-img info`` to probe the format
>     of an untrusted backing image, when deciding what format to add into
>     an existing image.

I'm not sure how widely used these were, but I'm game for writing a
patch to drop them.  I'm fairly certain libvirt is not using them.

> 
> Kevin Wolf:
> 
>     ``nbd-server-add`` and ``nbd-server-remove`` (since 5.2)
>     ''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> 
>     Use the more generic commands ``block-export-add`` and ``block-export-del``
>     instead.  As part of this deprecation, where ``nbd-server-add`` used a
>     single ``bitmap``, the new ``block-export-add`` uses a list of ``bitmaps``.

Peter, is libvirt good for this one to go?

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


