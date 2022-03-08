Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A204D1B87
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 16:19:29 +0100 (CET)
Received: from localhost ([::1]:37226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRbcW-0005pj-Qd
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 10:19:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nRbZL-0003ZU-Iy
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 10:16:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nRbZE-0004Ht-9a
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 10:16:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646752562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iJBo0c3EwQf/sEPKzgbxJ3/cHwrbDoPfVn42bIaRt/s=;
 b=QfHjWK1/a0W9ki88O90Zc69/GRYswobUWxaDM6vCUI7SEjuXgC6/zM0I1QWAksHQFg7tYv
 nwUWBsv8Q4/Mi7Glr6tPY8Icy14jxKcyuPxHEcni4Mya1sNExEx+qEqSDXjc2EdBxDZkj8
 gAXdijUR0LYLF77+7MjjZFIlmcfN3J8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-634-sUNm3Qa4NjWimGf56DIdzw-1; Tue, 08 Mar 2022 10:15:58 -0500
X-MC-Unique: sUNm3Qa4NjWimGf56DIdzw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F3CBC1854E2B;
 Tue,  8 Mar 2022 15:15:57 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.5])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DBB9526DC9;
 Tue,  8 Mar 2022 15:15:56 +0000 (UTC)
Date: Tue, 8 Mar 2022 09:15:54 -0600
From: Eric Blake <eblake@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v3 3/5] iotests: Remove explicit checks for qemu_img() == 0
Message-ID: <20220308151554.tvew6nriqpt5i2vq@redhat.com>
References: <20220308015728.1269649-1-jsnow@redhat.com>
 <20220308015728.1269649-4-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220308015728.1269649-4-jsnow@redhat.com>
User-Agent: NeoMutt/20211029-383-c6e293
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 07, 2022 at 08:57:26PM -0500, John Snow wrote:
> qemu_img() returning zero ought to be the rule, not the
> exception. Remove all explicit checks against the condition in
> preparation for making non-zero returns an Exception.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---

Reviewed-by: Eric Blake <eblake@redhat.com>

As this is a testsuite improvement rather than a new feature, I think
it's fine for the series to go in during soft freeze.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


