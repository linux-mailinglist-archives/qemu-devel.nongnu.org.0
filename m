Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6DB409792
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 17:39:33 +0200 (CEST)
Received: from localhost ([::1]:43398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPo3Q-0005GU-DR
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 11:39:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mPo1z-0003kE-VR
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 11:38:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23245)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mPo1w-0000hg-V1
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 11:38:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631547480;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=smsX8P0qxjeTed2l1elxgHKticGDe6Tbr0C8XeYiGUQ=;
 b=aW4c0QCvnXDgZDyYNdy50gDFYCcjFfatAMcpzEwl6wCo5GWdi1BYr6LaQCXKcnp0nP6ULW
 2Wlr7jJdDC1TUuX0BDNSrKCiOSK77aTpoxYJRO8+Zn6Oa/4iCWEEo/oBGRMhWPLHc3t+Jz
 I8cO+D9gom4y1DBDZusxQdvhK7ZpB8I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-104--GKPyKOlMRS646HXLrdO_w-1; Mon, 13 Sep 2021 11:37:58 -0400
X-MC-Unique: -GKPyKOlMRS646HXLrdO_w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 00817A40CA
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 15:37:58 +0000 (UTC)
Received: from redhat.com (ovpn-113-222.phx2.redhat.com [10.3.113.222])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 629461000320;
 Mon, 13 Sep 2021 15:37:28 +0000 (UTC)
Date: Mon, 13 Sep 2021 10:37:26 -0500
From: Eric Blake <eblake@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 20/22] tests/qapi-schema: Purge simple unions from tests
Message-ID: <20210913153726.2ptwb2f2ogumujv2@redhat.com>
References: <20210913123932.3306639-1-armbru@redhat.com>
 <20210913123932.3306639-21-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210913123932.3306639-21-armbru@redhat.com>
User-Agent: NeoMutt/20210205-772-2b4c52
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: marcandre.lureau@redhat.com, jsnow@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 13, 2021 at 02:39:30PM +0200, Markus Armbruster wrote:
> Drop tests that are specifically about simple unions:
> 
> * SugaredUnion in doc-good: flat unions are covered by @Object.
> 
> * union-branch-case and union-clash-branches: branch naming for flat
>   unions is enforced for the tag enum instead, which is covered by
>   enum-member-case and enum-clash-member.
> 
> * union-empty: empty flat unions are covered by flat-union-empty.
> 
> Rewrite the remainder to use flat unions: args-union, bad-base,
> flat-union-base-union, union-branch-invalid-dict, union-unknown.
> 
> Except drop union-optional-branch. because converting this one is not
> worth the trouble; we don't explicitly check names beginning with '*'
> in other places, either.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


