Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A23E458A04
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 08:42:50 +0100 (CET)
Received: from localhost ([::1]:48984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp3yT-0008Ds-51
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 02:42:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mp3wT-0007AG-GV
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 02:40:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mp3wR-00063U-0z
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 02:40:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637566842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z5LF6IdWCA+fJgDjp54g5OhsA8mtXINs6wrTk6V9hNc=;
 b=hEZ7lkl/07/T1efN0aL7BTczH953CyBXNjWhllynVN5cyOI1arjfU9WuR9TKUSQHL+E1rk
 5jjh2zPoJKAl865jJmjfnyhCw9AFtqLKtXwtS7/qD0NnKelWoOXgk4Yey71ga7JTOKQ0z8
 RQgJKAOpGALLRZgSLdj/Vq1tINLkzLw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-290-a1qmdww5NiGrCe2faJyEIA-1; Mon, 22 Nov 2021 02:40:37 -0500
X-MC-Unique: a1qmdww5NiGrCe2faJyEIA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7F44E100C664;
 Mon, 22 Nov 2021 07:40:35 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 930E360CC3;
 Mon, 22 Nov 2021 07:40:25 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2E31211380A7; Mon, 22 Nov 2021 08:40:24 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: "Rao, Lei" <lei.rao@intel.com>
Subject: Re: [PATCH 2/2] docs: Use double quotes instead of single quotes
 for COLO
References: <1637554283-11264-1-git-send-email-lei.rao@intel.com>
 <1637554283-11264-2-git-send-email-lei.rao@intel.com>
Date: Mon, 22 Nov 2021 08:40:24 +0100
In-Reply-To: <1637554283-11264-2-git-send-email-lei.rao@intel.com> (Lei Rao's
 message of "Mon, 22 Nov 2021 12:11:23 +0800")
Message-ID: <87h7c4priv.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.709,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: vsementsov@virtuozzo.com, berto@igalia.com, zhang.zhanghailiang@huawei.com,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org, wencongyang2@huawei.com,
 xiechanglong.d@gmail.com, qemu-devel@nongnu.org, chen.zhang@intel.com,
 eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Looks like this is based on your "[PATCH] docs/COLO-FT.txt: Drop
deprecated 'props' from object-add in COLO docs".  To make things easier
for reviewers and maintainers, please resend all three patches together
in a single series.  I'd squash "[PATCH] docs/COLO-FT.txt: Drop
deprecated 'props' from object-add in COLO docs" and "[PATCH 1/2] docs:
Drop deprecated 'props' from object-add" together.

Thanks!


