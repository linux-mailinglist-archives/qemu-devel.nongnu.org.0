Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B188285D2A
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Oct 2020 12:48:48 +0200 (CEST)
Received: from localhost ([::1]:57862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQ703-0000Sr-JB
	for lists+qemu-devel@lfdr.de; Wed, 07 Oct 2020 06:48:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kQ6xl-0008Hp-03
 for qemu-devel@nongnu.org; Wed, 07 Oct 2020 06:46:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50087)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kQ6xi-000134-H2
 for qemu-devel@nongnu.org; Wed, 07 Oct 2020 06:46:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602067581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=g8RG2XMWLPHsv0j/sj7MC1OCs4nqNvUs1i8EFwQTFWY=;
 b=NV4HpNq1SDuEJWRgy4RRDKzclFQpzAd45Yg9BRwx94gt8az9jNGPxFvOoon1W0cPj4Tlo/
 X94mVh+KoQoZe+pTFk73fy2UrlNUD0AeQyaRBNTzkhMyR0on2FEv3DjqnnMBUXMAUjPiCR
 RKgQ2qjCnDPjvWYyB633a1qiaa3Iqhc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-BP3fZMvyMMuYOASzA2n2vQ-1; Wed, 07 Oct 2020 06:46:20 -0400
X-MC-Unique: BP3fZMvyMMuYOASzA2n2vQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0C14580400D;
 Wed,  7 Oct 2020 10:46:19 +0000 (UTC)
Received: from linux.fritz.box (ovpn-113-169.ams2.redhat.com [10.36.113.169])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F6E95C1BD;
 Wed,  7 Oct 2020 10:46:17 +0000 (UTC)
Date: Wed, 7 Oct 2020 12:46:16 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 11/20] python/qemu: Add mypy type annotations
Message-ID: <20201007104616.GE7212@linux.fritz.box>
References: <20201006235817.3280413-1-jsnow@redhat.com>
 <20201006235817.3280413-12-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201006235817.3280413-12-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/07 00:44:56
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.733,
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
Cc: qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 07.10.2020 um 01:58 hat John Snow geschrieben:
> These should all be purely annotations with no changes in behavior at
> all. You need to be in the python folder, but you should be able to
> confirm that these annotations are correct (or at least self-consistent)
> by running `mypy --strict qemu`.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>

'mypy --strict qemu' doesn't have clean output after this patch because
ConsoleSocket isn't converted yet. But then, technically the commit
message doesn't make this claim, and you can indeed check the
self-consistency when you ignore the ConsoleSocket related errors, so
probably not a problem.

Reviewed-by: Kevin Wolf <kwolf@redhat.com>


