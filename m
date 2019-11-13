Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F63FBBD7
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Nov 2019 23:48:57 +0100 (CET)
Received: from localhost ([::1]:51992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iV1RX-0007Qp-Ol
	for lists+qemu-devel@lfdr.de; Wed, 13 Nov 2019 17:48:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59851)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ehabkost@redhat.com>) id 1iV1Q9-0006y3-FX
 for qemu-devel@nongnu.org; Wed, 13 Nov 2019 17:47:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1iV1Q6-0003rK-1Z
 for qemu-devel@nongnu.org; Wed, 13 Nov 2019 17:47:28 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:48571
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1iV1Q5-0003qz-Qy
 for qemu-devel@nongnu.org; Wed, 13 Nov 2019 17:47:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573685245;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rx+W/j7wKqTmWJhjjsIpEsgoEg1LEQ7lkkOPOubL3IQ=;
 b=ApMj0sLk1q9rxZ4yP/f+9AV/LSBKC7sXjQ+3db19UMXJMJcSTfv3BBov87EnuVuFx7vfd9
 Gwtxse2+I+fJ2cF0hQlJjzLC4W0k5VhNK+a7zL15dxDf6oIBrxwUajiNG+bYWBfqAvCAw2
 8sZ17OryT5X9mX+NnyC9QfPw3uhaGuY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-0Rn4M4IBMdKUl4PH-S9W4g-1; Wed, 13 Nov 2019 17:47:22 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC217800EBE;
 Wed, 13 Nov 2019 22:47:19 +0000 (UTC)
Received: from localhost (ovpn-116-59.gru2.redhat.com [10.97.116.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5687369198;
 Wed, 13 Nov 2019 22:47:19 +0000 (UTC)
Date: Wed, 13 Nov 2019 19:47:17 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Tao Xu <tao3.xu@intel.com>
Subject: Re: About MONITOR/MWAIT in i386 CPU model
Message-ID: <20191113224717.GN3812@habkost.net>
References: <d52ddfd1-3d9d-6a3a-5ce9-893df96639cc@intel.com>
MIME-Version: 1.0
In-Reply-To: <d52ddfd1-3d9d-6a3a-5ce9-893df96639cc@intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: 0Rn4M4IBMdKUl4PH-S9W4g-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: "Lai, Paul C" <paul.c.lai@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Guo,
 Xuelian" <xuelian.guo@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 13, 2019 at 04:42:25PM +0800, Tao Xu wrote:
> Hi Eduardo=EF=BC=8C
>=20
> After kvm use "-overcommit cpu-pm=3Don" to expose MONITOR/MWAIT
> (commit id 6f131f13e68d648a8e4f083c667ab1acd88ce4cd), the MONITOR/MWAIT
> feature in CPU model (phenom core2duo coreduo n270 Opteron_G3 EPYC Snowri=
dge
> Denverton) may be unused. For example, when we boot a guest with Denverto=
n
> cpu model, guest cannot detect MONITOR and boot with no warning. Should w=
e
> remove this feature from some CPU model?

Good catch, thanks!

Yes, we should remove them from Opteron_G3, EPYC, Snowridge, and
Denverton, at least.  The other older CPU models can be left
alone: they are more useful for use with TCG than with KVM, and
TCG supports MONITOR/MWAIT.

I would like to understand why this wasn't detected during
testing by Intel.  I suggest always testing CPU models using the
"enforce" flag to make sure warnings don't go unnoticed.

>=20
> Tested by Guo, Xuelian <xuelian.guo@intel.com>
>=20
> Tao Xu
>=20

--=20
Eduardo


