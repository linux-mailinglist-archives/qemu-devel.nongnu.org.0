Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2274A42A4BA
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 14:41:48 +0200 (CEST)
Received: from localhost ([::1]:54236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maH6H-0003F3-MH
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 08:41:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1maH4d-0001g6-3u
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 08:40:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1maH4a-0008PN-CC
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 08:40:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634042398;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Qm7iXwHYlaE9fJjKzdTjJwpH20T2tMT+BSpuTsNXRkc=;
 b=KN/1UN2U5aY0401rvkBJiGt/2GVvfGZgsQLJgEt1GXXnjDSG3j2xCyam5EX8VDasrUPOka
 /GokMiVnIHAgKLyVIa2gEA0/HaB2/lFmB8ZaCYs1myTU/Z/BD12f6onmuxnx6RFxzogFbA
 knRUcL94Hm/SZ++AsZ8RdJcYpCXQBiA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-175-w2HAg11MMNy0f0LU5yn33Q-1; Tue, 12 Oct 2021 08:39:55 -0400
X-MC-Unique: w2HAg11MMNy0f0LU5yn33Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DF6B01006AAD;
 Tue, 12 Oct 2021 12:39:53 +0000 (UTC)
Received: from angien.pipo.sk (unknown [10.40.208.15])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 39E5260BF4;
 Tue, 12 Oct 2021 12:39:19 +0000 (UTC)
Date: Tue, 12 Oct 2021 14:39:16 +0200
From: Peter Krempa <pkrempa@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v2 0/5] qapi: Add feature flags to enum members
Message-ID: <YWWB9ADfK7uYkOYu@angien.pipo.sk>
References: <20211009120944.2858887-1-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211009120944.2858887-1-armbru@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pkrempa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pkrempa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
 libvir-list@redhat.com, eblake@redhat.com, mdroth@linux.vnet.ibm.com,
 qemu-devel@nongnu.org, marcandre.lureau@redhat.com, jsnow@redhat.com,
 libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Oct 09, 2021 at 14:09:39 +0200, Markus Armbruster wrote:

I've tested this with my libvirt patches which make use of the new way
enum members are returned as well as code which validates whether
libvirt uses deprecated values and everything works as expected, thus

Series:

Tested-by: Peter Krempa <pkrempa@redhat.com>

> Markus Armbruster (5):
>   qapi: Enable enum member introspection to show more than name
>   qapi: Add feature flags to enum members
>   qapi: Move compat policy from QObject to generic visitor
>   qapi: Implement deprecated-input={reject,crash} for enum values
>   block: Deprecate transaction type drive-backup

In addition, libvirt never used 'drive-backup' so an additional

ACKed-by: Peter Krempa <pkrempa@redhat.com>

for the last patch.


