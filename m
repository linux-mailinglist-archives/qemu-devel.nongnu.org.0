Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D869277463
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Sep 2020 16:54:39 +0200 (CEST)
Received: from localhost ([::1]:39420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kLSdq-00085t-Fl
	for lists+qemu-devel@lfdr.de; Thu, 24 Sep 2020 10:54:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kLScM-00078Y-QF
 for qemu-devel@nongnu.org; Thu, 24 Sep 2020 10:53:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kLScL-0007VS-3O
 for qemu-devel@nongnu.org; Thu, 24 Sep 2020 10:53:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600959184;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=j8qJOM7p92nc/Q+DQkYJfcW1e9NDjvCdxLmSh8sQTR0=;
 b=Ry65lQfg4LZWCtdwrDr5bg6pZ6yCrDhR+onjaDxJ/CkHdQolzCz8URDlVDRQhX/3/7wbmx
 P9SXqc+Qd1gc5nMJ8EdFS3lBaAG0exoK6o7m91qWz4e0jNC4Y+aCat3Oco/mHKRfDYU57Y
 G32ez0JlGFugAZqia2vHY3ZCB+4YUl8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-328--eqZqiI4PFyrVRm-XeDDdw-1; Thu, 24 Sep 2020 10:52:56 -0400
X-MC-Unique: -eqZqiI4PFyrVRm-XeDDdw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3858718C89CC;
 Thu, 24 Sep 2020 14:52:55 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-70.ams2.redhat.com
 [10.36.112.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DD94260C04;
 Thu, 24 Sep 2020 14:52:54 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 66888113865F; Thu, 24 Sep 2020 16:52:53 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Amey Narkhede <ameynarkhede03@gmail.com>
Subject: Re: About TODO in nvme emulation
References: <20200924142537.xctoxv7xdr2nab7o@archlinux>
Date: Thu, 24 Sep 2020 16:52:53 +0200
In-Reply-To: <20200924142537.xctoxv7xdr2nab7o@archlinux> (Amey Narkhede's
 message of "Thu, 24 Sep 2020 19:55:37 +0530")
Message-ID: <87imc38bwa.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/24 01:10:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.199,
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
Cc: Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing nvme maintainers.

Amey Narkhede <ameynarkhede03@gmail.com> writes:

> Is there any TODO file/wiki for nvme emulation code?
> I'm a beginner who is interested in getting into
> nvme emulation. I have read nvme v1.4a specification
> and some code in hw/block/nvme.
>
> Regards,
> Amey


