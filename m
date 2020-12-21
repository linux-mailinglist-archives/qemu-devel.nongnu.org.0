Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0222DFDD6
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 17:00:36 +0100 (CET)
Received: from localhost ([::1]:58926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krNbv-0007Z3-RW
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 11:00:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1krNal-00076T-EH
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 10:59:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1krNai-0007dG-MN
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 10:59:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608566359;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5BW6xAf4DiWT8qPwH2L0dCQcufMQqH1Gbaq7tytDUjw=;
 b=g2blCikuEFLbzQWfZpGN4oX1db/UJsfVzz2cTEkhnPHTBnO3hbMMWy0xJ2+y3TTLSZ3CqR
 Mi2JbuLTsXyTSLo82o5/jkJkdXaKIL6zWo/4BdVgBx2lytHEs2UDADW/ZKo492nsyHQ43Y
 LmpizOtg9z3IhRLioNIaF92/Ood/Vfw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-422-L5RS944oMmKRoWixWn4ybw-1; Mon, 21 Dec 2020 10:59:17 -0500
X-MC-Unique: L5RS944oMmKRoWixWn4ybw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 857D8100B71C;
 Mon, 21 Dec 2020 15:59:16 +0000 (UTC)
Received: from gondolin (ovpn-113-49.ams2.redhat.com [10.36.113.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8A1705D969;
 Mon, 21 Dec 2020 15:59:14 +0000 (UTC)
Date: Mon, 21 Dec 2020 16:59:11 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v4] tests/acceptance: Add a test with the Fedora 31
 kernel and initrd
Message-ID: <20201221165911.5a0bbeb7.cohuck@redhat.com>
In-Reply-To: <20201221143423.23607-1-thuth@redhat.com>
References: <20201221143423.23607-1-thuth@redhat.com>
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
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Willian Rampazzo <willianr@redhat.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 21 Dec 2020 15:34:23 +0100
Thomas Huth <thuth@redhat.com> wrote:

> This initrd contains a virtio-net and a virtio-gpu kernel module,
> so we can check that we can set a MAC address for the network device
> and whether we can hot-plug and -unplug a virtio-crypto device.
> But the most interesting part is maybe that we can also successfully
> write some stuff into the emulated framebuffer of the virtio-gpu
> device and make sure that we can read back that data from a screenshot.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  v4:
>  - Run lscss twice, just to be sure
> 
>  tests/acceptance/machine_s390_ccw_virtio.py | 110 ++++++++++++++++++++
>  1 file changed, 110 insertions(+)

LGTM; but can I entice anyone to (re-)add a T-b/R-b before I queue this?


