Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF3637391E
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 13:14:28 +0200 (CEST)
Received: from localhost ([::1]:58846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leFU3-0008JH-IN
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 07:14:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrezanin@redhat.com>)
 id 1leFSM-0007iW-IL
 for qemu-devel@nongnu.org; Wed, 05 May 2021 07:12:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrezanin@redhat.com>)
 id 1leFSJ-0002Zf-QW
 for qemu-devel@nongnu.org; Wed, 05 May 2021 07:12:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620213158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OQ8hU2qDytOQT1swiFPFstOEyr/YVyoFXhfnteBde80=;
 b=hKBOBN+W1mYZRW9eLy7OJgRGc3Cayo04Yfgd2eL9et7TyMnYn94xaItWPHSxBOeEw3KM50
 ISpYgWtQrk4sZtTE8h88WCnfK/k16C1MP8qmcNeNwHaBHp8ZHnUvXwiD34+Mf+z0zKdLD4
 gXkX9fZItDzO84kV5Avo063J6ZdoiEE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-112-1HgUByiSPaGZA90BuOPs5Q-1; Wed, 05 May 2021 07:12:36 -0400
X-MC-Unique: 1HgUByiSPaGZA90BuOPs5Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D11011006C80;
 Wed,  5 May 2021 11:12:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C7EFB5C5B5;
 Wed,  5 May 2021 11:12:35 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 93B6C85CD;
 Wed,  5 May 2021 11:12:35 +0000 (UTC)
Date: Wed, 5 May 2021 07:12:35 -0400 (EDT)
From: Miroslav Rezanina <mrezanin@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <1691168205.17503177.1620213155446.JavaMail.zimbra@redhat.com>
In-Reply-To: <CAFEAcA9mZfuSYsEK-TcERB+8yTnq_Qhn7HwRGvCnE7_DMfAXyQ@mail.gmail.com>
References: <603798381.17174916.1620200426349.JavaMail.zimbra@redhat.com>
 <1162368493.17178530.1620201543649.JavaMail.zimbra@redhat.com>
 <CAFEAcA9mZfuSYsEK-TcERB+8yTnq_Qhn7HwRGvCnE7_DMfAXyQ@mail.gmail.com>
Subject: Re: Prevent compiler warning on block.c
MIME-Version: 1.0
X-Originating-IP: [10.40.192.172, 10.4.195.16]
Thread-Topic: Prevent compiler warning on block.c
Thread-Index: yTgQvcpIyuAgj99B+cUmdNHc62gLlA==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mrezanin@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mrezanin@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



----- Original Message -----
> From: "Peter Maydell" <peter.maydell@linaro.org>
> To: "Miroslav Rezanina" <mrezanin@redhat.com>
> Cc: "QEMU Developers" <qemu-devel@nongnu.org>, "Vladimir Sementsov-Ogievskiy" <vsementsov@virtuozzo.com>,
> "Qemu-block" <qemu-block@nongnu.org>
> Sent: Wednesday, May 5, 2021 12:43:44 PM
> Subject: Re: Prevent compiler warning on block.c
> 
> On Wed, 5 May 2021 at 09:06, Miroslav Rezanina <mrezanin@redhat.com> wrote:
> >
> > Commit 3108a15cf (block: introduce bdrv_drop_filter()) introduced
> > uninitialized
> > variable to_cow_parent in bdrv_replace_node_common function that is used
> > only when
> > detach_subchain is true. It is used in two places. First if block properly
> > initialize
> > the variable and second block use it.
> >
> > However, compiler treats this two blocks as two independent cases so it
> > thinks first
> > block can fail test and second one pass (although both use same condition).
> > This cause
> > warning that variable can be uninitialized in second block.
> >
> > To prevent this warning, initialize the variable with NULL.
> 
> If fixing compiler warnings, please quote the compiler name/version
> in the commit message. (This helps with understanding whether the issue
> is because of an older and not-smart-enough compiler or a new bleeding-edge
> compiler with extra checking.)

Hi Peter,

sorry for missing version. I was going to put the version in but got distracted when checking versions.

This warning occurs using GCC 8.4.1 and 11.0.1.

Mirek

> 
> thanks
> -- PMM
> 
> 

-- 
Miroslav Rezanina
Software Engineer - Virtualization Team Maintainer


