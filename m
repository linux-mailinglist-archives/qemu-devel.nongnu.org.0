Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 304E2406D94
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 16:23:36 +0200 (CEST)
Received: from localhost ([::1]:43558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOhRG-0001e1-Mu
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 10:23:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mOhPq-0000te-Nn
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 10:22:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mOhPk-0002xo-TH
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 10:22:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631283719;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=1/5ZLGmnqn7oqbd0wVLHciv8RT6UWr29utFGJx5vfSk=;
 b=SWCyd1qGSzwOdWwdBjYD0ThLmU6IH+1aDVt0jYnyaycCfyXEDJkb9B/mCi7DEzvmPIRgLK
 KeZ0VopNMoJviPoRi9XyKgXJY2nGGhXlkjqmTxAIZjNHeeq+Mwf4QPdPSUOvTQ9y0VuG85
 7I0ygPgVD7o2L5hyU8BjWyMySdR1rfU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-205-rI61xKDZObG9SPn9GGIQrg-1; Fri, 10 Sep 2021 10:21:58 -0400
X-MC-Unique: rI61xKDZObG9SPn9GGIQrg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 821AEA0CAB;
 Fri, 10 Sep 2021 14:21:57 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.181])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2119919D9B;
 Fri, 10 Sep 2021 14:21:55 +0000 (UTC)
Date: Fri, 10 Sep 2021 15:21:53 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 0/3] The HMP/QMP interfaces in Qemu SGX
Message-ID: <YTtqAUAyFR3ENdsY@redhat.com>
References: <20210910102258.46648-1-yang.zhong@intel.com>
 <91c0fa12-1191-ddae-efb4-35dc1eb61d39@redhat.com>
MIME-Version: 1.0
In-Reply-To: <91c0fa12-1191-ddae-efb4-35dc1eb61d39@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Yang Zhong <yang.zhong@intel.com>, philmd@redhat.com, eblake@redhat.com,
 qemu-devel@nongnu.org, seanjc@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 10, 2021 at 04:15:21PM +0200, Paolo Bonzini wrote:
> On 10/09/21 12:22, Yang Zhong wrote:
> > This patchset supply HMP/QMP interfaces to monitor and Libvirt, with
> > those interfaces, we can check the SGX info from VM side or check
> > host SGX capabilities from Libvirt side.
> > 
> > This patchset is splitted from below link(from patch26 to patch30):
> > https://patchew.org/QEMU/20210719112136.57018-1-yang.zhong@intel.com/
> > 
> > The rest patches are being pulled by Paolo's below link and this new
> > patchset is based on it.
> > https://gitlab.com/bonzini/qemu.git tags/for-upstream
> 
> Queued 1-2, thanks.

I had just posted a bunch of comments on patch 1 ...


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


