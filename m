Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 984753BE6DC
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 13:04:49 +0200 (CEST)
Received: from localhost ([::1]:48700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m15MG-0002b3-LK
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 07:04:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m15LE-00011R-6u
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 07:03:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28062)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m15LB-0003Q4-CM
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 07:03:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625655819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=j4U+phC3k3vxw9Jli1wQyMRJWs0dtiOJ9E2NA3dJJtQ=;
 b=QjvpsAsMawHGdF2Oa8p3jHmgbSoXRUdfCwM2puKPyFXAVelikRJFmItWnC9Ai1+Z5ZWNAC
 eWUfV3dZA0R4jneTO9UusntheGPk8o1HK6qcUi3REPIABW6gX+TiW5EVI6W6EOOeTwwngG
 WwIvJVhqGCBgwSCqtAINjyjox6FMt0g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-Luc6GtdsNq-QRhOr-U0CeQ-1; Wed, 07 Jul 2021 07:03:38 -0400
X-MC-Unique: Luc6GtdsNq-QRhOr-U0CeQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 988B91084F4C;
 Wed,  7 Jul 2021 11:03:37 +0000 (UTC)
Received: from redhat.com (ovpn-112-88.ams2.redhat.com [10.36.112.88])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CA6F95D9D3;
 Wed,  7 Jul 2021 11:03:36 +0000 (UTC)
Date: Wed, 7 Jul 2021 13:03:35 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH v2 0/6] export/fuse: Allow other users access to the export
Message-ID: <YOWKB+88JcLCHhy0@redhat.com>
References: <20210625142317.271673-1-mreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210625142317.271673-1-mreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 25.06.2021 um 16:23 hat Max Reitz geschrieben:
> Max Reitz (6):
>   export/fuse: Pass default_permissions for mount
>   export/fuse: Add allow-other option
>   export/fuse: Give SET_ATTR_SIZE its own branch
>   export/fuse: Let permissions be adjustable
>   iotests/308: Test +w on read-only FUSE exports
>   iotests/fuse-allow-other: Test allow-other

Thanks, fixed up the comments in the test case as indicated and applied
to the block branch.

Kevin


