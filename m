Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B09664236
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 14:48:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFEIu-0000oD-76; Tue, 10 Jan 2023 08:04:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pFEIs-0000nq-29
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 08:04:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pFEIq-00066Y-Lo
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 08:04:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673355871;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nZTbUXcXXSx5lRk5D1BI0DTEnCL39lt0hlCHMPvghU0=;
 b=MkvnpGz1IM0rzBxiit8A9AEv5qwP9sqRQp6jR/XRAgoA951vjpOY+n6xowK9QlP6qdXg8L
 riY4hEqcKqPBzRiYsDd0Upw1pYEfUXVunjE0vk8/EwNoZUr1CgXIZh07FUvMlVXzv7KUh7
 vxVbEOxl6Q4KhaOm+RC7IxyLW8fChFc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-607-CAw5j2AQO8KILf51GqGfQg-1; Tue, 10 Jan 2023 08:04:28 -0500
X-MC-Unique: CAw5j2AQO8KILf51GqGfQg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D5A37183B3C0;
 Tue, 10 Jan 2023 13:04:27 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D33AA1121314;
 Tue, 10 Jan 2023 13:04:26 +0000 (UTC)
Date: Tue, 10 Jan 2023 14:04:25 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 qemu-devel@nongnu.org, Alberto Garcia <berto@igalia.com>
Subject: Re: [PATCH] tests/qemu-iotests/312: Mark "quorum" as required driver
Message-ID: <Y71iWVtRTtCiVYN8@redhat.com>
References: <20230104114601.269351-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230104114601.269351-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 04.01.2023 um 12:46 hat Thomas Huth geschrieben:
> "quorum" is required by iotest 312 - if it is not compiled into the
> QEMU binary, the test fails. Thus list "quorum" as required driver
> so that the test gets skipped in case it is not available.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Thanks, applied to the block branch.

Kevin


