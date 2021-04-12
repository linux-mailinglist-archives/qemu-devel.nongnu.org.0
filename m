Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 319EE35CB17
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 18:23:48 +0200 (CEST)
Received: from localhost ([::1]:51856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVzLm-0007B3-NY
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 12:23:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lVzKE-0006eq-KI
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 12:22:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lVzK6-0002rl-76
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 12:22:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618244520;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2K03+NdU8bzu7vc/nyzlMGkf8DrSeawEoLt/lSX1oW0=;
 b=EtXSTJ4HFVy6+fnG5CeSflPu0kWNb3tVrwVxjN540D4sYme6y6USxvkyNbZ8Oi14ygySeZ
 M9bOWJiIISe2vC1DWBMDF9OTO57eaJY345zaAsAALZ2zYM9TJFqhdncby0cHxeXsRydyej
 7WMd8qB7rEg6Eyt1uwiCI5twafpjtMA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-382-x2sBWKJmM0Ow2pZ7E6ltsw-1; Mon, 12 Apr 2021 12:21:58 -0400
X-MC-Unique: x2sBWKJmM0Ow2pZ7E6ltsw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2FA4F83DD25
 for <qemu-devel@nongnu.org>; Mon, 12 Apr 2021 16:21:58 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-75.ams2.redhat.com [10.36.115.75])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ACABB6062F;
 Mon, 12 Apr 2021 16:21:56 +0000 (UTC)
Date: Mon, 12 Apr 2021 18:21:55 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] qapi/qom.json: Do not use CONFIG_VIRTIO_CRYPTO in common
 code
Message-ID: <YHRzo/LLUJHYH/Cm@merkur.fritz.box>
References: <20210412160710.639800-1-thuth@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210412160710.639800-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
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
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 12.04.2021 um 18:07 hat Thomas Huth geschrieben:
> The ObjectType enum and ObjectOptions are included from qapi-types-qom.h
> into common code. We should not use target-specific config switches like
> CONFIG_VIRTIO_CRYPTO here, since this is not defined in common code and
> thus the enum will look differently between common and target specific
> code. For this case, it's hopefully enough to check for CONFIG_VHOST_CRYPTO
> only (which is a host specific config switch, i.e. it's the same on all
> targets).
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Kevin Wolf <kwolf@redhat.com>


