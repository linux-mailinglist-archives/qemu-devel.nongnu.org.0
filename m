Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3961D31B803
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 12:32:18 +0100 (CET)
Received: from localhost ([::1]:49844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBc6z-0006oF-9b
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 06:32:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lBc56-0005jX-K4
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 06:30:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lBc53-00021a-Jj
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 06:30:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613388616;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RyRlUoReAHafYbS01wYdEGuMn5hbjAPH6kIk7mPKL3E=;
 b=HpOzl5lyuS/B7lOTXuSURv+Orc9iydNRolJb9N5aAdSHQbuJ5wQK3pv31YFn/i3F2SnShQ
 AejbwzSpH4fFSlkDxqHHOVgQy7L9uJJzjKnWz8Q1Sfn8Vdv1T0E8HBdcRTFgx7Q/Q81OmS
 4TNjGzVb08mnv2/CZ3VBuXkC94/qBi8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-11-OLw7WqlzPAig9hR9lDq_5Q-1; Mon, 15 Feb 2021 06:30:14 -0500
X-MC-Unique: OLw7WqlzPAig9hR9lDq_5Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5C7861E561;
 Mon, 15 Feb 2021 11:30:13 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-113-28.ams2.redhat.com [10.36.113.28])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D38C60C5F;
 Mon, 15 Feb 2021 11:30:12 +0000 (UTC)
Date: Mon, 15 Feb 2021 12:30:10 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] tests/qemu-iotests: Remove test 259 from the "auto" group
Message-ID: <20210215113010.GH7226@merkur.fritz.box>
References: <20210215103835.1129145-1-thuth@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210215103835.1129145-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 15.02.2021 um 11:38 hat Thomas Huth geschrieben:
> Tests in the "auto" group should support qcow2 so that they can
> be run during "make check-block". Test 259 only supports "raw", so
> it currently always gets skipped when running "make check-block".
> Let's skip this unnecessary step and remove it from the auto group.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

And it's only nbd, too.

Thanks, applied to the block branch.

Kevin


