Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1922AEF7C
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 12:21:04 +0100 (CET)
Received: from localhost ([::1]:40038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcoBT-0001tE-Lh
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 06:21:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kcoAG-0001T9-60
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 06:19:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kcoAE-00062q-HO
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 06:19:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605093584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3aytABNXeW6x0yKRKkLyDxB+1/hUsi5YTMFD0qKU8l8=;
 b=MffWDbAMN9j86mIHJjrVKM45lAUzlTcM9qgnxmHPNYTZ5LvF5ytp3H5U75ulsPNXh/LXO5
 I+1G/XL8m1ERMW7f1J0dIOpO8wvizjbRB/K9R0Mi2zOW8Of5lK6Ug+fopU6j8w1gqZlW+E
 sJFYxUqSdKOoAWYgEst2R913P7cUPOU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-540-rFPtJn25OIe74P3qjD4cpw-1; Wed, 11 Nov 2020 06:19:43 -0500
X-MC-Unique: rFPtJn25OIe74P3qjD4cpw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B4D798030D9;
 Wed, 11 Nov 2020 11:19:41 +0000 (UTC)
Received: from gondolin (ovpn-113-72.ams2.redhat.com [10.36.113.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D5C6D5DA79;
 Wed, 11 Nov 2020 11:19:20 +0000 (UTC)
Date: Wed, 11 Nov 2020 12:19:18 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [RFC v3] VFIO Migration
Message-ID: <20201111121918.53e3b2fc.cohuck@redhat.com>
In-Reply-To: <20201110095349.GA1082456@stefanha-x1.localdomain>
References: <20201110095349.GA1082456@stefanha-x1.localdomain>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:42:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: John G Johnson <john.g.johnson@oracle.com>, "Tian,
 Kevin" <kevin.tian@intel.com>, mtsirkin@redhat.com, "Daniel P.
 =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>, quintela@redhat.com,
 Jason Wang <jasowang@redhat.com>, Felipe Franciosi <felipe@nutanix.com>, "Zeng,
 Xin" <xin.zeng@intel.com>, qemu-devel@nongnu.org, "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Christophe de Dinechin <dinechin@redhat.com>, Yan Zhao <yan.y.zhao@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 10 Nov 2020 09:53:49 +0000
Stefan Hajnoczi <stefanha@redhat.com> wrote:

(...)

> The meaning of the migration parameter and its possible values are specific to
> the device, but values are based on one of the following types:
> * bool - booleans (on/off)
> * int - integers (0, 1, 2, ...)
> * str - character strings
> 
> Migration parameters are represented as <name>=<value> in this document.
> Examples include my-feature=on and num-queues=4.
> 
> When a new migration parameter is introduced, its absence must have the same
> effect as before the migration parameter was introduced. For example, if
> my-feature=on|off is added to control the availability of a new device feature,
> then my-feature=off is equivalent to omitting the migration parameter.

Maybe this could be made more clear by using a non-bool parameter as
an example?

For the num-queues parameter used as an example above, if num-queues=2
would lead to the same effect as before, omitting the num-queues
parameter must be treated as if num-queues had been specified as 2.


