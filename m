Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B36F50100A
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 16:42:55 +0200 (CEST)
Received: from localhost ([::1]:45968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nf0gQ-000694-5l
	for lists+qemu-devel@lfdr.de; Thu, 14 Apr 2022 10:42:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nf0fJ-0005Kl-Ks
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 10:41:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nf0fG-0005XZ-KU
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 10:41:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649947300;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3+Fwy/oHxej2fSp92chrKp+hxXYvXf0SncBjfpRxmdQ=;
 b=UMLjVax2K02em9d1xOFOG1glKe21HX/I+Z7qSRp7rESK+OcH115kE9dxuOR60zSuoOhdwD
 yz7VhFgqOxQn5o+npkwzkf6K022mQeZQYlQdedJvzj1xXi7jXMqoaR66mvQPFy4n1+DIh5
 8Mc0hcUpobkAQBeyAfC2IMr9XrgeLVA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-524-kyAYK5YhNJubO-5x6U72qA-1; Thu, 14 Apr 2022 10:41:39 -0400
X-MC-Unique: kyAYK5YhNJubO-5x6U72qA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CBE43185A79C;
 Thu, 14 Apr 2022 14:41:37 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.27])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DAD5A111D78E;
 Thu, 14 Apr 2022 14:41:20 +0000 (UTC)
Date: Thu, 14 Apr 2022 16:41:19 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: "Denis V. Lunev" <den@openvz.org>
Subject: Re: [PATCH 1/1] qemu-img: properly list formats which have
 consistency check implemented
Message-ID: <Ylgyj4VtRYkdFDwL@redhat.com>
References: <20220407083932.531965-1-den@openvz.org>
MIME-Version: 1.0
In-Reply-To: <20220407083932.531965-1-den@openvz.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 07.04.2022 um 10:39 hat Denis V. Lunev geschrieben:
> Simple grep for the .bdrv_co_check callback presence gives the following
> list of block drivers
> * QED
> * VDI
> * VHDX
> * VMDK
> * Parallels
> which have this callback. The presense of the callback means that
> consistency check is supported.
> 
> The patch updates documentation accordingly.
> 
> Signed-off-by: Denis V. Lunev <den@openvz.org>
> CC: Kevin Wolf <kwolf@redhat.com>
> CC: Hanna Reitz <hreitz@redhat.com>

Thanks, applied to the block branch.

Kevin


