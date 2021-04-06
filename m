Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C00355BB5
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 20:52:43 +0200 (CEST)
Received: from localhost ([::1]:42398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTqoc-0005Zl-7m
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 14:52:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lTqnE-00058d-FJ
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 14:51:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lTqn6-0003Px-GG
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 14:51:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617735066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=kCRRLDF4nEKsp2dnhJ32Khw6YkBfP484my1001agRhc=;
 b=YgReb/rySgPo5WJrzswn/JFkUzzdMbV4lPzx8tVlvx3pbiiKDkswGyqObnX2zFvrFMdtc2
 Yd87UsqnfLjkeQ/jWrZGrffjaDq97m2no3V4QfVXg/KSt/aT1G+tvm2KwcbJEp+rbGyl7E
 eWiBoqa8V4X5kqSQ+5bTzSRA406dk1A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-PMdgdf0dPFGcBBheMq7KGQ-1; Tue, 06 Apr 2021 14:50:42 -0400
X-MC-Unique: PMdgdf0dPFGcBBheMq7KGQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E123C1018F64;
 Tue,  6 Apr 2021 18:50:40 +0000 (UTC)
Received: from work-vm (ovpn-114-244.ams2.redhat.com [10.36.114.244])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 01688196E3;
 Tue,  6 Apr 2021 18:50:39 +0000 (UTC)
Date: Tue, 6 Apr 2021 19:50:37 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: tsimpson@quicinc.com, jsnow@redhat.com
Subject: dectree.py uses env python3 rather than configured python
Message-ID: <YGys2+lETQO5havV@work-vm>
MIME-Version: 1.0
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Taylor,
  I tripped over dectree.py using 'env python3'; the qemu configure
script lets you specify a python with e.g.:
    --with-python=/usr/libexec/platform-python

and I think everywhere else in qemu uses the configured python.
(This host, like most standard rhel8, doesn't have a python3 binary out
of the box)

Dave

-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


