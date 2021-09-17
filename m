Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5048740FAF2
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 16:58:20 +0200 (CEST)
Received: from localhost ([::1]:40026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRFJj-0002Q7-DG
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 10:58:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mRF3V-0007dy-PC
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 10:41:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mRF3U-0007Tf-8e
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 10:41:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631889691;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nqgV17GllA0/28ilbYuPsKg6BUQbhYiVz8W1N0/H/Kc=;
 b=efuJTEiJUOpX0g9FMoD1IDpgVx2KQo1N6dxAT3FyF+4lrV/Nb3aisoepvgdHGXIvm+hw1I
 bKj91pJ6PyCafc921HTBp4qHjY/mbJzmqiOdeWN3jfQE3raVPtlEwdMV8JhZKfYgQ0zmEq
 +morIxlI349jjcUyx7QVDABXRP1TVt0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-Ecb35ur5N0eiqxplC8kjwg-1; Fri, 17 Sep 2021 10:41:28 -0400
X-MC-Unique: Ecb35ur5N0eiqxplC8kjwg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2145D36301;
 Fri, 17 Sep 2021 14:41:27 +0000 (UTC)
Received: from redhat.com (ovpn-113-101.phx2.redhat.com [10.3.113.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A7306A900;
 Fri, 17 Sep 2021 14:41:25 +0000 (UTC)
Date: Fri, 17 Sep 2021 09:41:24 -0500
From: Eric Blake <eblake@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH RFC 2/5] qapi: Add feature flags to enum members
Message-ID: <20210917144124.tsl2ebwxmohg5vco@redhat.com>
References: <20210915192425.4104210-1-armbru@redhat.com>
 <20210915192425.4104210-3-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210915192425.4104210-3-armbru@redhat.com>
User-Agent: NeoMutt/20210205-772-2b4c52
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, berrange@redhat.com,
 libvir-list@redhat.com, qemu-devel@nongnu.org, mdroth@linux.vnet.ibm.com,
 pkrempa@redhat.com, marcandre.lureau@redhat.com, jsnow@redhat.com,
 libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 15, 2021 at 09:24:22PM +0200, Markus Armbruster wrote:
> This is quite similar to commit 84ab008687 "qapi: Add feature flags to
> struct members", only for enums instead of structs.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


