Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB601EE136
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Jun 2020 11:25:46 +0200 (CEST)
Received: from localhost ([::1]:55208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jgm8A-0001kY-00
	for lists+qemu-devel@lfdr.de; Thu, 04 Jun 2020 05:25:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jgm71-0000x8-Ty
 for qemu-devel@nongnu.org; Thu, 04 Jun 2020 05:24:35 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:21822
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jgm71-00085a-Bu
 for qemu-devel@nongnu.org; Thu, 04 Jun 2020 05:24:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591262674;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tbPtuMvv0oavvIzT4keeWlLmvVUtvAkrTlrYvbow350=;
 b=B9jsk04o2xmzp1aZoSy45At2i40cxCRtyrVVt+vS1xh+R2yYUmzyXMMLnHIDUf/+2C2lyW
 1Vph36h9WTcjk6POQ189cynbt8eDI4cJHlrabvzjgZ/KYWJ+R8duLm0Kqv4p+UFye7Z7eE
 s2E/Z39bw/Iu26vord68sr5c3XY8QZM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-4j9qn9cYM62YUeDe2upkCg-1; Thu, 04 Jun 2020 05:24:31 -0400
X-MC-Unique: 4j9qn9cYM62YUeDe2upkCg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0720F835B41;
 Thu,  4 Jun 2020 09:24:30 +0000 (UTC)
Received: from linux.fritz.box (ovpn-112-65.ams2.redhat.com [10.36.112.65])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DDD35610AF;
 Thu,  4 Jun 2020 09:24:27 +0000 (UTC)
Date: Thu, 4 Jun 2020 11:24:26 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH RFC v2 5/5] iotests: add 287 for
 block-dirty-bitmap-populate
Message-ID: <20200604092426.GD4512@linux.fritz.box>
References: <20200514034922.24834-1-jsnow@redhat.com>
 <20200514034922.24834-6-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200514034922.24834-6-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/04 01:08:38
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: pkrempa@redhat.com, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, vsementsov@virtuozzo.com,
 Cleber Rosa <crosa@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 14.05.2020 um 05:49 hat John Snow geschrieben:
> Give block-dirty-bitmap-populate a workout.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>

I think it would be good to test on-error behaviour, too. Maybe that
would be a different test file, though, considering that the output for
this one is already huge?

Kevin


