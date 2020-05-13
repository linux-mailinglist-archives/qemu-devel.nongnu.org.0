Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E9A1D1B97
	for <lists+qemu-devel@lfdr.de>; Wed, 13 May 2020 18:52:24 +0200 (CEST)
Received: from localhost ([::1]:52126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jYucJ-0005g1-Iz
	for lists+qemu-devel@lfdr.de; Wed, 13 May 2020 12:52:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jYuMj-0007TM-Mc
 for qemu-devel@nongnu.org; Wed, 13 May 2020 12:36:18 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:55992
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jYuMh-0003pv-Pr
 for qemu-devel@nongnu.org; Wed, 13 May 2020 12:36:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589387774;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=50PuHA4JM4XL74iXVrE7Y8fFE/UKLm67BKTWSCZZmFg=;
 b=VccKjAkW0rOhbuVf+9pDWjmCJhH626RJnUDhW/b8jLsAm8mIS4qWmYavw0y8akzUHW7aMF
 J+o4ub/B9aMLsVXdos15piprmTIdNQdd74jfAYZ4p4t9NEe57GkslNSWv06zHFZ5B39oS2
 tOHyzOB12X1HVzxtVjzlWGlDnDYguBY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-236-ejETFgczMA2xfzfOpO3n_Q-1; Wed, 13 May 2020 12:36:12 -0400
X-MC-Unique: ejETFgczMA2xfzfOpO3n_Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 45DCE107ACF2;
 Wed, 13 May 2020 16:36:11 +0000 (UTC)
Received: from linux.fritz.box (ovpn-114-80.ams2.redhat.com [10.36.114.80])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4747260C87;
 Wed, 13 May 2020 16:36:10 +0000 (UTC)
Date: Wed, 13 May 2020 18:36:08 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH v4 00/34] block: Introduce real BdrvChildRole
Message-ID: <20200513163608.GK6202@linux.fritz.box>
References: <20200513110544.176672-1-mreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200513110544.176672-1-mreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/13 01:56:38
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 13.05.2020 um 13:05 hat Max Reitz geschrieben:
> Based-on: <20200429141126.85159-1-mreitz@redhat.com>
> (“block: Do not call BlockDriver.bdrv_make_empty() directly”)

I was just ready to apply the series, but alas, then I saw this
notice...

So for now, you'll have to make do with:

Reviewed-by: Kevin Wolf <kwolf@redhat.com>


