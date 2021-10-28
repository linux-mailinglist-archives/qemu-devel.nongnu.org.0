Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B218F43DF91
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 12:56:20 +0200 (CEST)
Received: from localhost ([::1]:48972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg351-0006BY-R2
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 06:56:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mg2nE-0005EO-K5
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 06:37:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mg2nC-0004YQ-Or
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 06:37:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635417474;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PtRz8i36cmmttj4mRYzg0FDAKy9gGWgfDlR67OZH8xo=;
 b=Hak7ke130uAEo0LwSgWk0a+IuT51eJ6ON0CBEYOA+GOpTr5aTsfN5EvhisdAIGdHGDO8FM
 JBy5Shu5ny1keXFf0lIsdiCCcrwf1cEl9IL6ilqVdGOdoIYoR0QOBsiaL3omJQltHmlTMY
 T0VNf2qbzvwyOdRsVGF0UhRpyGzJXxI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-VXC_MUrLNw6hK5bnzuqcYA-1; Thu, 28 Oct 2021 06:37:50 -0400
X-MC-Unique: VXC_MUrLNw6hK5bnzuqcYA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A430B10B3943;
 Thu, 28 Oct 2021 10:37:49 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.202])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 119E960854;
 Thu, 28 Oct 2021 10:37:47 +0000 (UTC)
Date: Thu, 28 Oct 2021 12:37:46 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v5 0/8] Switch iotests to using Async QMP
Message-ID: <YXp9eqW+bJlB4R2K@redhat.com>
References: <20211026175612.4127598-1-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211026175612.4127598-1-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 26.10.2021 um 19:56 hat John Snow geschrieben:
> GitLab: https://gitlab.com/jsnow/qemu/-/commits/python-aqmp-iotest-wrapper
> CI: https://gitlab.com/jsnow/qemu/-/pipelines/395925703
> 
> Hiya,
> 
> This series continues where the last two AQMP series left off and adds a
> synchronous 'legacy' wrapper around the new AQMP interface, then drops
> it straight into iotests to prove that AQMP is functional and totally
> cool and fine. The disruption and churn to iotests is pretty minimal.
> 
> In the event that a regression happens and I am not physically proximate
> to inflict damage upon, one may set the QEMU_PYTHON_LEGACY_QMP variable
> to any non-empty string as it pleases you to engage the QMP machinery
> you are used to.

I obviously haven't reviewed systematically that AQMP is actually
correctly implemented and does what this series expects it to do, but
treating it as a black box should be good enough for this series:

Reviewed-by: Kevin Wolf <kwolf@redhat.com>


