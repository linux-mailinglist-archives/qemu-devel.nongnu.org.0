Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2446B285DD1
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Oct 2020 13:07:22 +0200 (CEST)
Received: from localhost ([::1]:37204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQ7Hy-0007Yx-Ow
	for lists+qemu-devel@lfdr.de; Wed, 07 Oct 2020 07:07:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kQ7Ai-0000Iq-Ms
 for qemu-devel@nongnu.org; Wed, 07 Oct 2020 06:59:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kQ7Ag-0002bN-3d
 for qemu-devel@nongnu.org; Wed, 07 Oct 2020 06:59:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602068385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oOy4O1UwZobf1uUybuoIsEhybk6aRb20+iM6pu2V2pE=;
 b=R2jkS1SuxU5Ijp962ZYCRXw4P/XEL5gveJSdPJpk5xzZfcDd1Sepchy9J0NqBoNWZuqS+T
 QzoHYX7LBfAOWhIn/TyITBHUwsuxiUaOYslieleQsVAsB1d442bSlBHS/As6hD5Wtfkmc0
 FmFAS/K54XgqCojQ8FBo6LARV5am1BE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-gi_CaBpRP9qNMPLMePmo8Q-1; Wed, 07 Oct 2020 06:59:43 -0400
X-MC-Unique: gi_CaBpRP9qNMPLMePmo8Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 288BA81F000;
 Wed,  7 Oct 2020 10:59:42 +0000 (UTC)
Received: from linux.fritz.box (ovpn-113-169.ams2.redhat.com [10.36.113.169])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CB46C5D9DD;
 Wed,  7 Oct 2020 10:59:40 +0000 (UTC)
Date: Wed, 7 Oct 2020 12:59:39 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 14/20] python/qemu/console_socket.py: Clarify type of
 drain_thread
Message-ID: <20201007105939.GH7212@linux.fritz.box>
References: <20201006235817.3280413-1-jsnow@redhat.com>
 <20201006235817.3280413-15-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201006235817.3280413-15-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 07.10.2020 um 01:58 hat John Snow geschrieben:
> Mypy needs just a little help to guess the type here.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>

Reviewed-by: Kevin Wolf <kwolf@redhat.com>


