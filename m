Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD25E55C0F4
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 14:28:39 +0200 (CEST)
Received: from localhost ([::1]:55952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6AKc-0001Ib-Iz
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 08:28:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o6AIn-0000Tq-30
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 08:26:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o6AIj-00074n-0U
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 08:26:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656419199;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=0WysiotrwMJ1StgMgHrQc8qrfsSMr+oPzRVJwhkPPl4=;
 b=ePjdBWYQc3AcXu+hKF8tczWTB3lTCvsZWQDYTge6xMg5xsvZHE+/fv+WU7wn3BDKS0GxT4
 L3v4opAI0YS9hYsaZ9HrZrE5VMH9tiq5VKhRSGURHLRWr8soWiIHG2G9vreRHUvGVpaHXg
 TM6FX1pKpBO0VQClzTAZVPaqSRbyTNQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-588-uRMCF8vuOGaoQve5j2cm_A-1; Tue, 28 Jun 2022 08:26:36 -0400
X-MC-Unique: uRMCF8vuOGaoQve5j2cm_A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C7B22824067;
 Tue, 28 Jun 2022 12:26:35 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2FAFA2166B26;
 Tue, 28 Jun 2022 12:26:32 +0000 (UTC)
Date: Tue, 28 Jun 2022 13:26:25 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Niklas Cassel <niklas.cassel@wdc.com>
Cc: kbusch@kernel.org, its@irrelevant.dk, qemu-block@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH] hw/nvme: fix example serial in documentation
Message-ID: <YrrzcdBRJ2pe2bcb@redhat.com>
References: <20220627123957.363889-1-niklas.cassel@wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220627123957.363889-1-niklas.cassel@wdc.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 27, 2022 at 02:39:57PM +0200, Niklas Cassel via wrote:
> The serial prop on the controller is actually describing the nvme
> subsystem serial, which has to be identical for all controllers within
> the same nvme subsystem.

Given this description...

>  
>     -device nvme-subsys,id=nvme-subsys-0,nqn=subsys0

...I'm wondering why 'serial' isn't a property of this device..

> -   -device nvme,serial=a,subsys=nvme-subsys-0
> -   -device nvme,serial=b,subsys=nvme-subsys-0
> +   -device nvme,serial=deadbeef,subsys=nvme-subsys-0
> +   -device nvme,serial=deadbeef,subsys=nvme-subsys-0

..rather than requiring it to be redundantly set to the same value here ?

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


