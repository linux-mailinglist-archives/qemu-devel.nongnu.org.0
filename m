Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 841FF44D8A7
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 15:53:39 +0100 (CET)
Received: from localhost ([::1]:52574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlBSM-0007nC-CD
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 09:53:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mlBRF-0005r2-Hd
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 09:52:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mlBRB-0003Vh-Lb
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 09:52:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636642344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/qbZfmAifXB5ON6cAajIYcFGusUrFUDy4nYnqOdWpQU=;
 b=TyLFQA5vflFOnPp70MUZMXdsVSEpJaXcEIJ319pOrEipFfeGBUfoLoKjtOXL/y/gedpr4V
 xsIO0TAvJuosyKy2TxQVxk4Q5bczTaZBMs5dbceVsLuSN3AMamgTUj6q1kC/8nzWn5eenu
 VrisxNsa9mm2+5Jy79Uw6JEWcIetLMo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-522-nLecjbFMO7uixFDyBJBfkw-1; Thu, 11 Nov 2021 09:52:21 -0500
X-MC-Unique: nLecjbFMO7uixFDyBJBfkw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 53F5E804141
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 14:52:20 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2CFDB6418A;
 Thu, 11 Nov 2021 14:52:14 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id AD2A211380A7; Thu, 11 Nov 2021 15:52:12 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH for-6.2] docs: Deprecate incorrectly typed device_add
 arguments
References: <20211111143530.18985-1-kwolf@redhat.com>
Date: Thu, 11 Nov 2021 15:52:12 +0100
In-Reply-To: <20211111143530.18985-1-kwolf@redhat.com> (Kevin Wolf's message
 of "Thu, 11 Nov 2021 15:35:30 +0100")
Message-ID: <87o86qlp7n.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: libvir-list@redhat.com, berrange@redhat.com, eblake@redhat.com,
 qemu-devel@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kevin Wolf <kwolf@redhat.com> writes:

> While introducing a non-QemuOpts code path for device creation for JSON
> -device, we noticed that QMP device_add doesn't check its input
> correctly (accepting arguments that should have been rejected), and that
> users may be relying on this behaviour (libvirt did until it was fixed
> recently).

Actually, we've known this for years.  netdev_add had the same bug, and
we delayed its QAPIfication for fear of breaking stuff relying on the
bug.

commit db2a380c84574d8c76d7193b8af8535234fe5156
Author: Eric Blake <eblake@redhat.com>
Date:   Tue Mar 17 15:17:10 2020 -0500

    net: Complete qapi-fication of netdev_add
    
    We've had all the required pieces for doing a type-safe representation
    of netdev_add as a flat union for quite some time now (since
    0e55c381f6 in v2.7.0, released in 2016), but did not make the final
    switch to using it because of concern about whether a command-line
    regression in accepting "1" in place of 1 for integer arguments would
    be problematic.  Back then, we did not have the deprecation cycle to
    allow us to make progress.  But now that we have waited so long, other
    problems have crept in: for example, our desire to add
    qemu-storage-daemon is hampered by the inability to express net
    objects, and we are unable to introspect what we actually accept.
    Additionally, our round-trip through QemuOpts silently eats any
    argument that expands to an array, rendering dnssearch, hostfwd, and
    guestfwd useless through QMP:
    
    {"execute": "netdev_add", "arguments": { "id": "netdev0",
      "type": "user", "dnssearch": [
        { "str": "8.8.8.8" }, { "str": "8.8.4.4" }
      ]}}
    
    So without further ado, let's turn on proper QAPI.  netdev_add() was a
[...]

Release note for 5.0:

    1.28.1 QMP
    [...]
    * netdev_add improvements:
        - Don't ignore arguments \dnssearch, hostfwd, and guestfwd
        - Drop undocumented and unwanted argument ipv6-net
        - Stricter argument type checking

This is not a demand for a commit message change.

>
> Let's use a deprecation period before we fix this bug in QEMU to avoid
> nasty surprises for users.
>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  docs/about/deprecated.rst | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index 600031210d..c03fcf951f 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -250,6 +250,20 @@ options are removed in favor of using explicit ``blockdev-create`` and
>  ``blockdev-add`` calls. See :doc:`/interop/live-block-operations` for
>  details.
>  
> +Incorrectly typed ``device_add`` arguments (since 6.2)
> +''''''''''''''''''''''''''''''''''''''''''''''''''''''
> +
> +Due to shortcomings in the internal implementation of ``device_add``, QEMU
> +incorrectly accepts certain invalid arguments: Any object or list arguments are
> +silently ignored. Other argument types are not checked, but an implicit
> +conversion happens, so that e.g. string values can be assigned to integer
> +device properties or vice versa.
> +
> +This is a bug in QEMU that will be fixed in the future so that previously
> +accepted incorrect commands will return an error. Users should make sure that
> +all arguments passed to ``device_add`` are consistent with the documented
> +property types.
> +
>  System accelerators
>  -------------------

Reviewed-by: Markus Armbruster <armbru@redhat.com>


