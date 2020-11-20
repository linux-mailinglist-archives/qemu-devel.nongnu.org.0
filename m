Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5812BAA5A
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 13:45:04 +0100 (CET)
Received: from localhost ([::1]:48954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg5mh-0007i6-Sn
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 07:45:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kg5lE-00075y-5C
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 07:43:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kg5l8-0000Xl-QO
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 07:43:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605876205;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=J6kjgyha5TS2nJLIOhc87kL/atbg2xYhSyW137Tezsk=;
 b=fD/ddqm5J1WvvAlPS9JF2BzGQGuk/UR3ngEHzanSjDDQw1kcWD1MURKATaE4wj0OG04YXd
 YiopySdlsx3RZx9slZnqtKhGzGKXCy3Ym9OyMRvzXgdlQ6eRoJGu+N7NGqZ7Fx230Dfi8j
 5JPLDzkj6Fl8QhTHb7yCvkbabVRZiTQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-100-5VWnJoxPMGK0ihuac1edDw-1; Fri, 20 Nov 2020 07:43:21 -0500
X-MC-Unique: 5VWnJoxPMGK0ihuac1edDw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9B9F51DDFC;
 Fri, 20 Nov 2020 12:43:19 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.192.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2050C5D9C6;
 Fri, 20 Nov 2020 12:43:16 +0000 (UTC)
Date: Fri, 20 Nov 2020 13:43:13 +0100
From: Andrew Jones <drjones@redhat.com>
To: Ying Fang <fangying1@huawei.com>
Subject: Re: [RFC PATCH v3 01/13] hw/arm/virt: Spell out smp.cpus and
 smp.max_cpus
Message-ID: <20201120124313.5pcljtoj7ocu56k7@kamzik.brq.redhat.com>
References: <20201109030452.2197-1-fangying1@huawei.com>
 <20201109030452.2197-2-fangying1@huawei.com>
 <1ed3b150fb3d4a96ab15638e89422f3c@huawei.com>
 <900b570d-735f-8303-833a-44babe0addb1@huawei.com>
MIME-Version: 1.0
In-Reply-To: <900b570d-735f-8303-833a-44babe0addb1@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 Salil Mehta <salil.mehta@huawei.com>,
 Zhanghailiang <zhang.zhanghailiang@huawei.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "alistair.francis@wdc.com" <alistair.francis@wdc.com>,
 "imammedo@redhat.com" <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 17, 2020 at 06:27:54PM +0800, Ying Fang wrote:
> 
> 
> On 11/9/2020 6:45 PM, Salil Mehta wrote:
> > Hi Fangying,
> > A trivial thing. This patch looks bit of a noise in this patch-set. Better
> > to send it as a separate patch-set and get it accepted.
> > 
> Hmm, this patch looks like a code reactor for the somewhat confusing
> *smp_cpus* which will tidy the code. Maybe Andrew could do that.
>

Sure. I can post the first two patches of this series after the 5.2
release.

Thanks,
drew


