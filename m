Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D245730A79E
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 13:29:02 +0100 (CET)
Received: from localhost ([::1]:33228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6YKD-0003gB-TR
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 07:29:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l6YJ8-000388-JB
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 07:27:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l6YJ4-0002SI-Ja
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 07:27:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612182470;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VYGIOdWIV0PypYwUveXqIouhJQmoPoE/z2ry2h7Wx6I=;
 b=QetuROECVb9g8uYGbTCxIHD5qctNf/GTQ9AzHUFGuLXzaQ6F44bfYqyphQupEvkmL1WGj3
 os8PO8qOY/NixBtXNfuI0SjZg93O44/2lcJORrJYJ8aAO74plONilvG8jHPUmH9PhdTvnE
 9/TeT2tgU8pRWgL6AgRxXjlmp5bsiiE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-WFoHyZ07PMKL9kCgeUCUMw-1; Mon, 01 Feb 2021 07:27:48 -0500
X-MC-Unique: WFoHyZ07PMKL9kCgeUCUMw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B6A0B9CC00;
 Mon,  1 Feb 2021 12:27:46 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-51.ams2.redhat.com
 [10.36.115.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 727215C1A3;
 Mon,  1 Feb 2021 12:27:46 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0B535113865F; Mon,  1 Feb 2021 13:27:45 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: "zhanghan (J)" <zhanghan64@huawei.com>
Subject: Re: [PATCH 0/4] Fix some style problems in qobject
References: <20201228071129.24563-1-zhanghan64@huawei.com>
 <20201228071129.24563-2-zhanghan64@huawei.com>
 <791fabe6-cdab-2891-0dca-393ade874dfe@redhat.com>
 <e9bf06bb-479c-2991-6d1c-b5410c650448@huawei.com>
 <1b78ab9d-b1c6-5978-35bb-0892617ab2b3@huawei.com>
Date: Mon, 01 Feb 2021 13:27:45 +0100
In-Reply-To: <1b78ab9d-b1c6-5978-35bb-0892617ab2b3@huawei.com> (zhanghan's
 message of "Mon, 1 Feb 2021 14:16:39 +0800")
Message-ID: <871re0m0qm.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: hunongda@huawei.com, zhang.zhanghailiang@huawei.com,
 qemu-trivial@nongnu.org, qemu-devel@nongnu.org, alex.chen@huawei.com,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"zhanghan (J)" <zhanghan64@huawei.com> writes:

> ping=EF=BC=9FThis patch set about code style problem in qobject  receives=
 no replies.
>
> Did I miss any response?

The Christmas break ate your patches.  My apologies!

[...]


