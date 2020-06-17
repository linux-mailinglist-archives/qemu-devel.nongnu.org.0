Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6501FCC7C
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Jun 2020 13:38:59 +0200 (CEST)
Received: from localhost ([::1]:47936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlWPC-0000ov-Vu
	for lists+qemu-devel@lfdr.de; Wed, 17 Jun 2020 07:38:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jlWOB-0000I6-ND
 for qemu-devel@nongnu.org; Wed, 17 Jun 2020 07:37:55 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:38910
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jlWOA-0002EJ-6n
 for qemu-devel@nongnu.org; Wed, 17 Jun 2020 07:37:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592393873;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=bMeBFPHVw4Cbd/cLPE0sWMo4aXX4YbicI1SJvPES9/Q=;
 b=AJlHfis+aepkjfr/oF6MF42d9XYpkbnOD1C1U2958HQWJViR1f+uuE99lpT1JFSBTC4aDj
 oh/+6wY591953m2Rfu5h+twMHre29a6xG16UhChcw0VzScY59o2tsNRj5rDyUlL7Lm352/
 2gD0RLb8iNkSn3WTu90MZiXbN+Yfl4o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-66-HMQkIK-YNhS4tGb-fdc4eg-1; Wed, 17 Jun 2020 07:37:50 -0400
X-MC-Unique: HMQkIK-YNhS4tGb-fdc4eg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8525B18A266A;
 Wed, 17 Jun 2020 11:37:49 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-131.ams2.redhat.com [10.36.112.131])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A57BC79302;
 Wed, 17 Jun 2020 11:37:48 +0000 (UTC)
Subject: Re: [PATCH 1/5] iotests.py: Add skip_for_formats() decorator
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20200617104822.27525-1-mreitz@redhat.com>
 <20200617104822.27525-2-mreitz@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <198df3fc-ba6b-0032-4abc-48e7b5c04c5f@redhat.com>
Date: Wed, 17 Jun 2020 13:37:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200617104822.27525-2-mreitz@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/17 02:02:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/06/2020 12.48, Max Reitz wrote:
> Sometimes, we want to skip some test methods for certain formats.  This
> decorator allows that.
> 
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>  tests/qemu-iotests/118        |  7 +++----
>  tests/qemu-iotests/iotests.py | 13 +++++++++++++
>  2 files changed, 16 insertions(+), 4 deletions(-)

Tested with:

 for i in raw bochs cloop parallels qcow qcow2 qed vdi vpc vhdx \
  vmdk luks dmg ; do ./check -makecheck -$i 118 ; done

Works fine for me, so:

Tested-by: Thomas Huth <thuth@redhat.com>


