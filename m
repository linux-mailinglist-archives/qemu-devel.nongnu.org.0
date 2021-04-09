Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C44E35A799
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 22:08:23 +0200 (CEST)
Received: from localhost ([::1]:46018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUxQU-0005BU-EB
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 16:08:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lUxN7-0004CP-J2
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 16:04:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lUxN3-00033M-Jy
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 16:04:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617998688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=R9LK2CvoUi19n2YcHYjSja0IZ31QzQN4HTtLZeaY6yI=;
 b=SKlRHPltHpIResNOa2V+gg3NDRETRgkYDdSC4bJc/bA17q7eWmejX+t0uMx8kWDJtPzaiv
 pOomzCq7I+A+vw6YB99d8icjxcX/reu7znni4No9Dl/GGBoTj4JRcAfZXs2cdZobxNsib+
 QxXus8yc4nkz+Enc18zLk0e+5+0Y22U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-575-plo05MDRMSOPVTFuDER2gw-1; Fri, 09 Apr 2021 16:04:44 -0400
X-MC-Unique: plo05MDRMSOPVTFuDER2gw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A582B107ACCA;
 Fri,  9 Apr 2021 20:04:43 +0000 (UTC)
Received: from localhost (ovpn-118-57.rdu2.redhat.com [10.10.118.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6C82E5C1D5;
 Fri,  9 Apr 2021 20:04:43 +0000 (UTC)
Date: Fri, 9 Apr 2021 16:04:42 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH 2/2] cpu/core: Fix "help" of CPU core device types
Message-ID: <20210409200442.ls2jzd6drgy2l7dn@habkost.net>
References: <20210409160339.500167-1-groug@kaod.org>
 <20210409160339.500167-3-groug@kaod.org>
MIME-Version: 1.0
In-Reply-To: <20210409160339.500167-3-groug@kaod.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: peter.maydell@linaro.org, Thomas Huth <thuth@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 09, 2021 at 06:03:39PM +0200, Greg Kurz wrote:
> Calling qdev_get_machine() from a QOM instance_init function is
> fragile because we can't be sure the machine object actually
> exists. And this happens to break when passing ",help" on the
> command line to get the list of properties for a CPU core
> device types :
> 
> $ ./qemu-system-ppc64 -device power8_v2.0-spapr-cpu-core,help
> qemu-system-ppc64: ../../hw/core/machine.c:1290:
>  qdev_get_machine: Assertion `machine != NULL' failed.
> Aborted (core dumped)
> 
> This used to work before QEMU 5.0, but commit 3df261b6676b
> unwillingly introduced a subtle regression : the above command
> line needs to create an instance but the instance_init function
> of the base class calls qdev_get_machine() before
> qemu_create_machine() has been called, which is a programming bug.
> 
> Use current_machine instead. It is okay to skip the setting of
> nr_thread in this case since only its type is displayed.
> 
> Reported-by: Thomas Huth <thuth@redhat.com>
> Fixes: 3df261b6676b ("softmmu/vl.c: Handle '-cpu help' and '-device help' before 'no default machine'")
> Cc: peter.maydell@linaro.org
> Signed-off-by: Greg Kurz <groug@kaod.org>

Thanks!  I'm queueing this one (without patch 1/2) for QEMU 6.0.

-- 
Eduardo


