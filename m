Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E697E294931
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Oct 2020 10:09:41 +0200 (CEST)
Received: from localhost ([::1]:40138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kV9Bk-0008KP-Ge
	for lists+qemu-devel@lfdr.de; Wed, 21 Oct 2020 04:09:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kV9B1-0007rn-2D
 for qemu-devel@nongnu.org; Wed, 21 Oct 2020 04:08:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kV9Ay-0008QO-N2
 for qemu-devel@nongnu.org; Wed, 21 Oct 2020 04:08:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603267730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Onb2Y6xea9875P0sZWByZpbrzeK4JFN4m0S9fmtXtOg=;
 b=hbUHGGsKFDviCbAv8H6aLD61DUPgxKuHGekDrGrmSkqAhbOr+57sd4bGiivqBxwD6oXQz6
 FaEebQVXLyxNfSoDEeTMF5MBbPSljZn0UbVVE4RcEBhRcS0cE8SkouCWYvBR06k9YZE2sa
 ZA389EpWs3kOtLLaz8gpGieycFRK2vg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-6-c6ePYk7rOf-ncSeXwb9zUQ-1; Wed, 21 Oct 2020 04:08:48 -0400
X-MC-Unique: c6ePYk7rOf-ncSeXwb9zUQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB9D018A0764;
 Wed, 21 Oct 2020 08:08:47 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 85A205577D;
 Wed, 21 Oct 2020 08:08:44 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 066821132A08; Wed, 21 Oct 2020 10:08:43 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 1/4] qga: Rename guest-get-devices return member
 'address' to 'id'
References: <20201021071520.2168877-1-armbru@redhat.com>
 <20201021071520.2168877-2-armbru@redhat.com>
 <0f29af6e-e134-4ccd-1946-5ababf40eab8@redhat.com>
Date: Wed, 21 Oct 2020 10:08:42 +0200
In-Reply-To: <0f29af6e-e134-4ccd-1946-5ababf40eab8@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Wed, 21 Oct 2020 09:34:35
 +0200")
Message-ID: <87tuuo57cl.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/20 22:12:28
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: marcandre.lureau@redhat.com, tgolembi@redhat.com, qemu-devel@nongnu.org,
 mdroth@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> On 10/21/20 9:15 AM, Markus Armbruster wrote:
>> Member 'address' is union GuestDeviceAddress with a single branch
>> GuestDeviceAddressPCI, containing PCI vendor ID and device ID.  This
>> is not a PCI address.  Type GuestPCIAddress is.  Messed up in recent
>> commit 2e4211cee4 "qga: add command guest-get-devices for reporting
>> VirtIO devices".
>
> Out of curiosity, how did you notice?

I searched for simple unions to remind myself of the size of that
problem, and found a new one, i.e. a problem I can still avoid.  I
started to do PATCH 4, and noticed the other issues.

> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Thanks!


