Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF40933DC4D
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 19:13:03 +0100 (CET)
Received: from localhost ([::1]:37892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMEBi-0006aD-JJ
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 14:13:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lMDXx-000713-Pf
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 13:31:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59229)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lMDXw-0004mf-Cy
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 13:31:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615915915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3iARsQbW6p6L+3hyqHohuQgFwOwPg/C747kSBd9xUF8=;
 b=YhjewvdjfU4DzSTONIgHJTivgZ4+Q7n2/O+b1rLpBkjtDPeaEAWSQ3E8zj1gqF2TrvuRTz
 MGUADD9s/d1TgcLOTTr7wid6va5XcRb3N7MVomC/tQUuo7rcUijzdkcFjkFL2CaYPWOAJs
 RAZwzy0AT7d7OJXgPL4IFghYYyJVrk0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-32-ndDyAW2oMiyAlzRgvjlrcQ-1; Tue, 16 Mar 2021 13:31:54 -0400
X-MC-Unique: ndDyAW2oMiyAlzRgvjlrcQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 013EF69726
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 17:31:53 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-112-216.ams2.redhat.com [10.36.112.216])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C3865D9C0;
 Tue, 16 Mar 2021 17:31:49 +0000 (UTC)
Date: Tue, 16 Mar 2021 18:31:47 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 0/3] vl: QAPIfy -object
Message-ID: <YFDrg8r6yK7BwN2z@merkur.fritz.box>
References: <20210312173547.1283477-1-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210312173547.1283477-1-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 12.03.2021 um 18:35 hat Paolo Bonzini geschrieben:
> This is a replacement for -object QAPIfication that keeps QemuOpts
> in order to not break some of the CLI parsing extensions that OptsVisitor
> includes.  Since keyval is not used, support for directly passing
> JSON syntax to the option must be added manually, which is what patch
> 3 does.  However, both the QemuOpts and the JSON paths go through
> the new ObjectOptions interface, just with two different visitors,
> so we can reuse all the new type-safe code that Kevin has added.
> 
> Patch 1 is a patch that I already had lying around, which I included
> to be able to remove user_creatable_add_opts completely in patch 2.
> 
> Paolo
> 
> Based-on: <20210311144811.313451-1-kwolf@redhat.com>

Thanks, applied to the block branch.

Kevin


