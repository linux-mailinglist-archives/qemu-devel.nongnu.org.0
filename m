Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1FF144F54
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jan 2020 10:36:58 +0100 (CET)
Received: from localhost ([::1]:39084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iuCRV-00087c-85
	for lists+qemu-devel@lfdr.de; Wed, 22 Jan 2020 04:36:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52735)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kchamart@redhat.com>) id 1iuCQf-0007hp-DM
 for qemu-devel@nongnu.org; Wed, 22 Jan 2020 04:36:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kchamart@redhat.com>) id 1iuCQd-0003qA-HT
 for qemu-devel@nongnu.org; Wed, 22 Jan 2020 04:36:04 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:22385
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kchamart@redhat.com>) id 1iuCQd-0003pL-DS
 for qemu-devel@nongnu.org; Wed, 22 Jan 2020 04:36:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579685762;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8O25dfzJf9MlYrE+F4+xVcQXBQ2bStZjlLQIjNJejM8=;
 b=PpZcCIG4evVlYWBmzyi3p9uFruroD+WxlX4E7LK257Q23OwqLS47psV8ZPQAgC/7PZdGlu
 jCq8+L4a8zyGRfjwkTeU59fxD6DFM7iMCbCryaWV+2G90d/C8JN+PTGop7CKaFvpBA3u0T
 dXEZM3jWGEJ0MCZk+Ge1i4nnCxx9jIA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-aAmINmDuOkO1HglFpaW_GQ-1; Wed, 22 Jan 2020 04:36:00 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C572D107ACC4
 for <qemu-devel@nongnu.org>; Wed, 22 Jan 2020 09:35:59 +0000 (UTC)
Received: from paraplu.localdomain (unknown [10.36.118.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9226760BE0;
 Wed, 22 Jan 2020 09:35:59 +0000 (UTC)
Received: by paraplu.localdomain (Postfix, from userid 1001)
 id 8D4023E0489; Wed, 22 Jan 2020 10:35:57 +0100 (CET)
Date: Wed, 22 Jan 2020 10:35:57 +0100
From: Kashyap Chamarthy <kchamart@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v2] qemu-cpu-models: Document -noTSX, mds-no, taa-no, and
 tsx-ctrl
Message-ID: <20200122093557.GC24159@paraplu>
References: <20200121184940.26520-1-kchamart@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200121184940.26520-1-kchamart@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: aAmINmDuOkO1HglFpaW_GQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: pbonzini@redhat.com, berrange@redhat.com, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 21, 2020 at 07:49:39PM +0100, Kashyap Chamarthy wrote:

[...]

> +@item @code{taa-no}
> +
> +Recommended to inform that the guest that the host is @i{not} vulnerable
> +to CVE-2019-11135, TSX Asyncrnous Abort (TAA).
> +
> +This too is an MSR feature, so it does not show up in the Linux
> +@code{/proc/cpuinfo} in the host or guest.
> +
> +It should only be enabled for VMs if the host reports @code{Not
> +affected} in the
> +@code{/sys/devices/system/cpu/vulnerabilities/tsx_async_abort} file.
> +
> +@item @code{tsx-ctrl}
> +
> +Recommended to inform the guest to @i{disable} the Intel TSX
> +(Transactional Synchronization Extensions) feature.  Expose this to the
> +guest OS if and only if: (a) the host has TSX enabled; and (b) the guest
> +has @code{rtm} CPU flag enabled.
> +
> +By disabling TSX, KVM-based guests can avoid paying the price of
> +mitigting TSX-based attacks.
> +
> +Note that too is an MSR feature,=20

"Note that too" --> "Note that this too"

(Will wait for other feedback.  If there no need to respin, maybe the
pull-req submitter can do the touch-up.)

> so it does not show up in the Linux
> +@code{/proc/cpuinfo} in the host or guest.
> +
>  @end table
> =20
> -
>  @node preferred_cpu_models_amd_x86
>  @subsubsection Preferred CPU models for AMD x86 hosts
> =20
> --=20
> 2.21.0
>=20
>=20

--=20
/kashyap


