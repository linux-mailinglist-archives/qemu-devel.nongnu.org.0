Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6BE409C55
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 20:33:36 +0200 (CEST)
Received: from localhost ([::1]:54830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPqls-0005g6-21
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 14:33:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mPqht-00049k-On
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 14:29:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mPqhr-0003r7-R4
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 14:29:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631557767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=G0XnA3m9jeAHMBzET7n3ccVcsmpKog23x+N4B8d9PJE=;
 b=HH5V5dO9vwhm7n+DBFl+jLtQFTv9oZlnavPA397f6DCVkYlf9eVraMrWbf2p+jYP7m2E7J
 OShKaFTrnXmAuaBpwmR747ajuhfPiXG69lWm2SqCMov65FyYGXjuSEcU/MsaLsgDxvzfIS
 77gXzChFXgh8CLneh+Oc2swAUx252L4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-84-DDGkAe4ENcOQQePctB3eKw-1; Mon, 13 Sep 2021 14:29:23 -0400
X-MC-Unique: DDGkAe4ENcOQQePctB3eKw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F30608010F4;
 Mon, 13 Sep 2021 18:29:22 +0000 (UTC)
Received: from redhat.com (ovpn-113-222.phx2.redhat.com [10.3.113.222])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 99DAE2B399;
 Mon, 13 Sep 2021 18:29:19 +0000 (UTC)
Date: Mon, 13 Sep 2021 13:29:17 -0500
From: Eric Blake <eblake@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 2/5] qapi: Drop Indentation.__bool__()
Message-ID: <20210913182917.2ys7xzfk2ntmu6fg@redhat.com>
References: <20210908045428.2689093-1-armbru@redhat.com>
 <20210908045428.2689093-3-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210908045428.2689093-3-armbru@redhat.com>
User-Agent: NeoMutt/20210205-772-2b4c52
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: marcandre.lureau@redhat.com, jsnow@redhat.com, qemu-devel@nongnu.org,
 michael.roth@amd.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 08, 2021 at 06:54:25AM +0200, Markus Armbruster wrote:
> Intentation.__bool__() is not worth its keep: it has just one user,

Indentation

> which can just as well check .__str__() instead.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  scripts/qapi/common.py | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


