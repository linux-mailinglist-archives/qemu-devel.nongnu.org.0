Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E84F03B038F
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 14:03:26 +0200 (CEST)
Received: from localhost ([::1]:59740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvf7l-0007n4-DF
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 08:03:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lvf5g-0006hy-VU
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 08:01:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lvf5a-0000D8-MZ
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 08:01:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624363270;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=QrvVi1mJkDuU4abRLngAAcXU4ya6G5C2QmhJi0Elr8o=;
 b=gULf7OQz36pFDZ9jYXlQXpjLb8U5wGz5nGZmlFlwBe2VolMupIsXPTmVbb7l5Utrin6kOo
 RAsHjyRQPSb9x7mqENGK457yEwclTwME6A59LeAYnReglnsDB+QDUHzyZLTjSAjcMyiVHC
 yD5sZ0t8/7QECGV391NdoHdzPhwcgjw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-62-o2ZovHp-Piq-8UPymUntJg-1; Tue, 22 Jun 2021 08:01:03 -0400
X-MC-Unique: o2ZovHp-Piq-8UPymUntJg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E945E800685;
 Tue, 22 Jun 2021 12:01:02 +0000 (UTC)
Received: from redhat.com (ovpn-114-176.ams2.redhat.com [10.36.114.176])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D6792608BA;
 Tue, 22 Jun 2021 12:01:00 +0000 (UTC)
Date: Tue, 22 Jun 2021 13:00:57 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH RFC] docs: document file-posix locking protocol
Message-ID: <YNHQ+VDwnmMl1nm8@redhat.com>
References: <20210322182738.60395-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210322182738.60395-1-vsementsov@virtuozzo.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.223,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: kwolf@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 mreitz@redhat.com, den@openvz.org, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 22, 2021 at 09:27:38PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> Let's document how we use file locks in file-posix driver, to allow
> external programs to "communicate" in this way with Qemu.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
> 
> Hi all!
> 
> We need to access disk images from non-Qemu code and coordinate with
> Qemu utilities which may use same image. So, we want to support Qemu
> file locking in the external code.
> 
> So, here is a patch to document how Qemu locking works, and make this
> thing "public".
> 
> This is an RFC, because I'm unsure how should we actually document
> different operations we have.
> 
> For example greaph-mod is a strange thing, I think we should get rid
> of it at all.. And at least, no sense in locking corresponding byte in a
> raw file.
> 
> The other thing is write-unchanged.. What it means when we consider a
> raw file opened in several processes? Probably we don't need it too..
> 
>  docs/system/qemu-block-drivers.rst.inc | 55 ++++++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
> 
> diff --git a/docs/system/qemu-block-drivers.rst.inc b/docs/system/qemu-block-drivers.rst.inc
> index b052a6d14e..3cd708b3dc 100644
> --- a/docs/system/qemu-block-drivers.rst.inc
> +++ b/docs/system/qemu-block-drivers.rst.inc
> @@ -952,3 +952,58 @@ on host and see if there are locks held by the QEMU process on the image file.
>  More than one byte could be locked by the QEMU instance, each byte of which
>  reflects a particular permission that is acquired or protected by the running
>  block driver.
> +
> +Image locking protocol
> +~~~~~~~~~~~~~~~~~~~~~~
> +
> +QEMU holds rd locks and never rw locks. Instead, GETLK fcntl is used with F_WRLCK
> +to handle permissions as described below.
> +QEMU process may rd-lock the following bytes of the image with corresponding
> +meaning:
> +
> +Permission bytes. If permission byte is rd-locked, it means that some process
> +uses corresponding permission on that file.
> +
> +Byte    Operation
> +100     read
> +          Lock holder can read
> +101     write
> +          Lock holder can write
> +102     write-unchanged
> +          Lock holder can write same data
> +103     resize
> +          Lock holder can resize the file
> +104     graph-mod
> +          Undefined. QEMU sometimes locks this byte, but external programs
> +          should not. QEMU will stop locking this byte in future
> +
> +Unshare bytes. If permission byte is rd-locked, it means that some process
> +does not allow the others use corresponding options on that file.
> +
> +Byte    Operation
> +200     read
> +          Lock holder don't allow read operation to other processes.
> +201     write
> +          Lock holder don't allow write operation to other processes.
> +202     write-unchanged
> +          Lock holder don't allow write-unchanged operation to other processes.
> +203     resize
> +          Lock holder don't allow resizing the file by other processes.
> +204     graph-mod
> +          Undefined. QEMU sometimes locks this byte, but external programs
> +          should not. QEMU will stop locking this byte in future
> +
> +Handling the permissions works as follows: assume we want to open the file to do
> +some operations and in the same time want to disallow some operation to other
> +processes. So, we want to lock some of the bytes described above. We operate as
> +follows:
> +
> +1. rd-lock all needed bytes, both "permission" bytes and "unshare" bytes.
> +
> +2. For each "unshare" byte we rd-locked, do GETLK that "tries" to wr-lock
> +corresponding "permission" byte. So, we check is there any other process that
> +uses the permission we want to unshare. If it exists we fail.
> +
> +3. For each "permission" byte we rd-locked, do GETLK that "tries" to wr-lock
> +corresponding "unshare" byte. So, we check is there any other process that
> +unshares the permission we want to have. If it exists we fail.

I'd perhaps illustrate the few common scenarios - read-only, shared access,
read-write, exclusive and read-write share access, using C-psuedo-code, from
opening image, locking, doing operations, unlocking and closing image.

This would make it explicit that these locks need to be held open
for the duration of the i/o operations.

I'd also probably warn about the dangers of traditional fcntl locks  in
threaded programs, compared to the saner OFD locks.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


