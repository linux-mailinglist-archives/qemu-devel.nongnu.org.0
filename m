Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C8A241AB0
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Aug 2020 13:57:17 +0200 (CEST)
Received: from localhost ([::1]:41590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k5Su4-0004JK-H3
	for lists+qemu-devel@lfdr.de; Tue, 11 Aug 2020 07:57:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1k5StD-0003uI-8R
 for qemu-devel@nongnu.org; Tue, 11 Aug 2020 07:56:23 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:21496
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1k5St9-0001VY-Qj
 for qemu-devel@nongnu.org; Tue, 11 Aug 2020 07:56:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597146977;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q/Y33Y1tb3OpjBnHaSAoYOTGur43M0ptPZChxK8FFdE=;
 b=UxY4p57X7SjHcf/hHFQf8R3j4gi/xT1HFy0tX/v7G7smllbEJUHuXyxfh6FQMb/sfrppka
 UvSBS8grEqF2x2r4h/5cdxxbPeHmG+X8xHzOB/2SFxd4cDLjy79fq3OJ3ytwF67I2sLbw2
 Mbn+OILlS44MbMqIVM636L9rXLQxcS4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-243-INCGrHK2Ot-9alSumIfDMA-1; Tue, 11 Aug 2020 07:56:16 -0400
X-MC-Unique: INCGrHK2Ot-9alSumIfDMA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1FCA21800D41;
 Tue, 11 Aug 2020 11:56:15 +0000 (UTC)
Received: from gondolin (ovpn-113-33.ams2.redhat.com [10.36.113.33])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 499EE5FC2F;
 Tue, 11 Aug 2020 11:56:14 +0000 (UTC)
Date: Tue, 11 Aug 2020 13:56:11 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>
Subject: Re: [PATCH v2] CODING_STYLE.rst: flesh out our naming conventions.
Message-ID: <20200811135611.488581c8.cohuck@redhat.com>
In-Reply-To: <87zh711jzd.fsf@linaro.org>
References: <20200810105147.10670-1-alex.bennee@linaro.org>
 <20200811090828.12307821.cohuck@redhat.com>
 <87zh711jzd.fsf@linaro.org>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.120; envelope-from=cohuck@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/11 04:41:55
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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

On Tue, 11 Aug 2020 12:48:38 +0100
Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:

> If I re-arrange slightly we can roll from qemu_ to public functions:
>=20
>   Function Naming Conventions
>   ---------------------------
>=20
>   The ``qemu_`` prefix is used for utility functions that are widely
>   called from across the code-base. This includes wrapped versions of
>   standard library functions (e.g. ``qemu_strtol``) where the prefix is
>   added to the library function name to alert readers that they are
>   seeing a wrapped version.
>=20
>   Public functions from a file or subsystem (declared in headers) tend
>   to have a consistent prefix to show where they came from. For example,
>   ``tlb_`` for functions from ``cputlb.c`` or ``cpu_`` for functions
>   from cpus.c.
>=20
>   If there are two versions of a function to be called with or without a
>   lock held, the function that expects the lock to be already held
>   usually uses the suffix ``_locked``.
>=20
> What do you think?

There naturally are places that don't follow the convention (for
example, hw/intc/s390_flic.c is using the qemu_ prefix to mark the
non-kvm functions), but this makes sense for new code. Looks good to me.


