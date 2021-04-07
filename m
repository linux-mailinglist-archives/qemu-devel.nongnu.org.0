Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE043569BD
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 12:32:20 +0200 (CEST)
Received: from localhost ([::1]:41094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lU5Tw-0001aG-0s
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 06:32:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lU5Ly-0003ti-9w
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 06:24:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46066)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lU5Lv-0004PQ-0r
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 06:24:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617791042;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dkOHccb7P/TcmsY4HqLoxWgO86npAegzSxtH68x9nL4=;
 b=YRBJxNLVAY8a8DRp1AtG+TXZ3+zbo+EVoot+gzb2cqr/WEl5xLPkS6RZjPUzlorTPwaw8E
 6QR2gS3lbDtfIHIiVjImEhWpl66mDEMYWNmUpj/jFdAP/cfCD5QMynZGIFaLfJ32h3gpaA
 wlISHWAyWMNlvx5oZ0RIMc9zPj9mrl8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-568-Idi8Dv_jMgWfiI-fNHEDUw-1; Wed, 07 Apr 2021 06:23:58 -0400
X-MC-Unique: Idi8Dv_jMgWfiI-fNHEDUw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0F28E8B064D;
 Wed,  7 Apr 2021 10:23:57 +0000 (UTC)
Received: from gondolin (ovpn-113-88.ams2.redhat.com [10.36.113.88])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2BC071C4;
 Wed,  7 Apr 2021 10:23:50 +0000 (UTC)
Date: Wed, 7 Apr 2021 12:23:48 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: "Tarun Gupta (SW-GPU)" <targupta@nvidia.com>
Subject: Re: [PATCH v3 1/1] docs/devel: Add VFIO device migration documentation
Message-ID: <20210407122348.134c7b69.cohuck@redhat.com>
In-Reply-To: <178048b3-8197-856e-af81-66920e60a4d1@nvidia.com>
References: <20210326131850.149337-1-targupta@nvidia.com>
 <20210401130522.1e9c2871.cohuck@redhat.com>
 <178048b3-8197-856e-af81-66920e60a4d1@nvidia.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=cohuck@redhat.com;
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
Cc: kevin.tian@intel.com, cjia@nvidia.com, quintela@redhat.com,
 alex.williamson@redhat.com, qemu-devel@nongnu.org, yan.y.zhao@intel.com,
 lushenming@huawei.com, kwankhede@nvidia.com, dnigam@nvidia.com,
 berrange@redhat.com, philmd@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 5 Apr 2021 22:32:47 +0530
"Tarun Gupta (SW-GPU)" <targupta@nvidia.com> wrote:

> On 4/1/2021 4:35 PM, Cornelia Huck wrote:
> > 
> > On Fri, 26 Mar 2021 18:48:50 +0530
> > Tarun Gupta <targupta@nvidia.com> wrote:

> >> +
> >> +Similarly, a migration state change notifier is registered to get a
> >> +notification on migration state change. These states are translated to the
> >> +corresponding VFIO device state and conveyed to the vendor driver.  
> > 
> > "Similarly, a migration state change handler is used to transition the
> > VFIO device state back to _RUNNING in case a migration failed or was
> > canceled."  
> 
> I wanted to keep the statement generic because the VFIO device state can 
> be _RUNNING, _SAVING, _RESUMING. I can use your statement as an example 
> as to how the migration state can be changed back to _RUNNING in case of 
> migration failure or cancel. Does that work?

So, maybe:

"Similarly, a migration state change handler is used to trigger a
transition of the VFIO device state when certain changes of the
migration state occur. For example, the VFIO device state is
transitioned back to _RUNNING in case a migration failed or was
canceled."


