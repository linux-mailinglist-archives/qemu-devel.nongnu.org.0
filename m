Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA7536CD5D
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 22:57:28 +0200 (CEST)
Received: from localhost ([::1]:59370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbUlr-0001K9-0z
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 16:57:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lbUkQ-0000Ni-Dv
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 16:55:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57341)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lbUkN-0001Q9-6L
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 16:55:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619556953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AFog9yoc5Bp9xer/Z5AFg0mqcUR+pdP3JZIUEH6IYB4=;
 b=gUjVLZ3+mvNn9EcUmsvbF+Bzp0kYVNmCtkM9fLC8sI2AfnHlqbHuu+Nq2Sep94RqGSThYo
 Bh5ACAaxjbMkSviPKEJZ8So0G4FmGiS2d/iiCnsuHektJBUVcIOEpvlGYqKePzCXJAw+2t
 VruAqj0gXc/G7jejK50zzWkLOQJOL+o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-571-lRltGzYIPWKMl7JRzGYbwA-1; Tue, 27 Apr 2021 16:55:51 -0400
X-MC-Unique: lRltGzYIPWKMl7JRzGYbwA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 51774803620;
 Tue, 27 Apr 2021 20:55:50 +0000 (UTC)
Received: from localhost (ovpn-116-230.rdu2.redhat.com [10.10.116.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E640E6064B;
 Tue, 27 Apr 2021 20:55:49 +0000 (UTC)
Date: Tue, 27 Apr 2021 16:55:49 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Robert Hoo <robert.hu@linux.intel.com>
Subject: Re: [PATCH] i386/cpu: Remove the deprecated cpu model 'Icelake-Client'
Message-ID: <20210427205549.lcrl3rm3d5xgg44p@habkost.net>
References: <1619084536-89845-1-git-send-email-robert.hu@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <1619084536-89845-1-git-send-email-robert.hu@linux.intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.218,
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
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 robert.hu@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 22, 2021 at 05:42:16PM +0800, Robert Hoo wrote:
> As it's been marked deprecated since v5.2, now I think it's time remove it
> from code.
> 
> Signed-off-by: Robert Hoo <robert.hu@linux.intel.com>

Thanks!  There's only one issue: we need to update
docs/system/deprecated.rst and docs/system/removed-features.rst
when removing the CPU model.

-- 
Eduardo


