Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9983B1836
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 12:44:45 +0200 (CEST)
Received: from localhost ([::1]:37738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw0NA-0003QJ-E3
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 06:44:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lw0MC-0002iv-Ga
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 06:43:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lw0M9-0003DJ-Uo
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 06:43:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624445019;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1urjNyEL7OE5X8+4H6ja38MK5LiDOXCKz79fZ2W5fE8=;
 b=QqVfawDiSVg7gvQSra+APMlLzatbmIiyvE3rS5FoujOofywWfB5TxKQTyay63PY3jHaoXa
 rKrq70S0fTNmksfqP3dsPoaUlMm8UoDfn7ctLLSUDeOMtF0mluV6h4Q5GtdMxtwRsSZ00S
 6D2zCKqlIBzZCJ2i1vAT4+Amq2XilEk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-561-K1zQuaQMMl6Yi8V0-v-tJA-1; Wed, 23 Jun 2021 06:43:38 -0400
X-MC-Unique: K1zQuaQMMl6Yi8V0-v-tJA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7BD4C80414B;
 Wed, 23 Jun 2021 10:43:37 +0000 (UTC)
Received: from localhost (ovpn-113-66.ams2.redhat.com [10.36.113.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 41D65421F;
 Wed, 23 Jun 2021 10:43:33 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v1 6/8] tests/tcg: skip the signals test for hppa/s390x
 for now
In-Reply-To: <20210623102749.25686-7-alex.bennee@linaro.org>
Organization: Red Hat GmbH
References: <20210623102749.25686-1-alex.bennee@linaro.org>
 <20210623102749.25686-7-alex.bennee@linaro.org>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Wed, 23 Jun 2021 12:43:31 +0200
Message-ID: <87mtrgn9nw.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.223,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, "open list:S390 TCG
 CPUs" <qemu-s390x@nongnu.org>, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 23 2021, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:

> There are fixes currently in flight but as this is getting in the way
> of a green CI we might as well skip for now. For reference the fix
> series are:
>
>   linux-user: Move signal trampolines to new page
>   20210616011209.1446045-1-richard.henderson@linaro.org
>
> and
>
>   linux-user: Load a vdso for x86_64 and hppa
>   20210619034329.532318-1-richard.henderson@linaro.org
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tests/tcg/hppa/Makefile.target  | 4 ++++
>  tests/tcg/s390x/Makefile.target | 4 ++++
>  2 files changed, 8 insertions(+)

Acked-by: Cornelia Huck <cohuck@redhat.com>


