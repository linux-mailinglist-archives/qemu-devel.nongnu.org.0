Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F30B2B0863
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 16:27:47 +0100 (CET)
Received: from localhost ([::1]:39042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdEVm-00059X-KY
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 10:27:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kdEV1-0004bf-40
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 10:26:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kdEUz-0004Hh-Al
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 10:26:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605194816;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YqZGJ1O856sik/5Eu4CLdJLS9iwG0y81oo1dB6lhaQg=;
 b=AQspDKTMVXjbG45aHAWK+7r/DSFatOL6SjWSnK9kvR4DqHNXxpQ3/dtVSTMSPuuVZ89IGu
 mhtkXzqGErl7NEDBqxYn8NUpM90Ju/iC+r2fmixr/dRTmE/PZIXrI+qQe1GTkMw2nXxwUw
 lWnsuRGoDMfmoKw6rK0WziYQiyRnthE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-T9OpRehtOleQziVtrAzp1g-1; Thu, 12 Nov 2020 10:26:54 -0500
X-MC-Unique: T9OpRehtOleQziVtrAzp1g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E882107B26B;
 Thu, 12 Nov 2020 15:26:53 +0000 (UTC)
Received: from gondolin (ovpn-113-69.ams2.redhat.com [10.36.113.69])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D142955765;
 Thu, 12 Nov 2020 15:26:36 +0000 (UTC)
Date: Thu, 12 Nov 2020 16:26:33 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>
Subject: Re: [RFC v3] VFIO Migration
Message-ID: <20201112162633.67a5d8a6.cohuck@redhat.com>
In-Reply-To: <20201111154850.GG906488@redhat.com>
References: <20201110095349.GA1082456@stefanha-x1.localdomain>
 <64fb6a41-fbfa-994c-9619-4df41ac97fde@redhat.com>
 <20201111143615.GA1421166@stefanha-x1.localdomain>
 <20201111154850.GG906488@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 08:00:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: John G Johnson <john.g.johnson@oracle.com>, "Tian,
 Kevin" <kevin.tian@intel.com>, mtsirkin@redhat.com,
 Yan Zhao <yan.y.zhao@intel.com>, quintela@redhat.com,
 Jason Wang <jasowang@redhat.com>, "Zeng, Xin" <xin.zeng@intel.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Kirti Wankhede <kwankhede@nvidia.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Felipe Franciosi <felipe@nutanix.com>,
 Christophe de Dinechin <dinechin@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 11 Nov 2020 15:48:50 +0000
Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:

> In terms of validation I can't help but feel the whole proposal is
> really very complicated.
>=20
> In validating QEMU migration compatibility we merely compare the
> versioned machine type.
>=20
> IIUC, in this proposal, it would be more like exploding the machine
> type into all its 100's of properties and then comparing each one
> individually.
>=20
> I really prefer the simpler model of QEMU versioned machine types
> where compatibility is a simple string comparison, hiding the
> 100's of individual config parameters. =20
>=20
> Of course there are scenarios where this will lead a mgmt app to
> refuse a migration, when it could in fact have permitted it.
>=20
> eg  consider   pc-i440fx-4.0  and pc-i440fx-5.0 machine types,
> which only differ in the value  "foo=3D7" and "foo=3D8" respectively.
>=20
> Now if the target only supported machine type pc-i440fx-5.0, then
> with a basic string comparison of machine type versin, we can't
> migrate from a host uing pc-i440fx-4.0
>=20
> If we exploded the machine type into its params, we could see that
> we can migrate from pc-i440fx-4.0 to pc-i440fx-5.0, simply by
> overriding the value of "foo".
>=20
> So, yes, dealing with individual params is more flexible, but it
> comes at an enourmous cost in complexity to process all the
> parameters. I'm not convinced this is a good tradeoff.=20

For mdev devices, we could have something similar to versioned machine
types by introducing versioned mdev types. (Which would fit well with
mdev types having to match strictly for migration to be possible.)

For other use cases, we would need to introduce a new construct.


