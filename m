Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C00C361AE9
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 09:58:06 +0200 (CEST)
Received: from localhost ([::1]:58450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXJMb-0005sF-Ms
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 03:58:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lXJL9-0005B6-EW
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 03:56:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lXJL6-0000Gs-7b
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 03:56:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618559790;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R5+dOJPMObpw2n9X1COWkwn2FTUDTJXzfscMuq92GqA=;
 b=USHudTYOUgM0fBLmfGHmGxRDtgrVVjtuXZkcs2B4pFNiCbqyAK+eGIdaODwUycyGxE7IX8
 qCxvVqlZut0Pi6Ry9s2IFQF8Et1WONg2JkyrxpYaVOiRqdp/LgBd2LjLdda0WG7kc10JWk
 +5AcKw8e+tz9EVinfn/4G9bpojgYjis=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-GRSC1InmOMCLcWOjLTbxwQ-1; Fri, 16 Apr 2021 03:56:28 -0400
X-MC-Unique: GRSC1InmOMCLcWOjLTbxwQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 699F7802575;
 Fri, 16 Apr 2021 07:56:27 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-165.ams2.redhat.com
 [10.36.114.165])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 55695610A8;
 Fri, 16 Apr 2021 07:56:23 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C90541800933; Fri, 16 Apr 2021 09:56:21 +0200 (CEST)
Date: Fri, 16 Apr 2021 09:56:21 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Subject: Re: [PATCH 00/11] Add support for Blob resources feature
Message-ID: <20210416075621.5vqswywu25ta7lu5@sirius.home.kraxel.org>
References: <20210331031001.1564125-1-vivek.kasireddy@intel.com>
 <58a1404f12d9434bae1d336f6553279e@intel.com>
 <20210414094502.krykle6fcv2ehkvg@sirius.home.kraxel.org>
 <ad10ac98a4f141e599c177bbab62982e@intel.com>
 <20210415074307.6uohri7zjbiwjilm@sirius.home.kraxel.org>
 <d2ae38a134674dbba47b95c3bcf2fc2a@intel.com>
MIME-Version: 1.0
In-Reply-To: <d2ae38a134674dbba47b95c3bcf2fc2a@intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
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
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>, "Zhang,
 Tina" <tina.zhang@intel.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "Kim, Dongwon" <dongwon.kim@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> > Marc-André has experimental code for a dbus-based UI for qemu.  It doesn't use pipewire
> > as data transport though.  At least the first version posted a while ago @ qemu-devel
> > doesn't.
> [Kasireddy, Vivek] What is the main motivation for a new dbus-based UI for Qemu?

Having UI and qemu run in separate processes has serveral advantages,
for starters the VM is independent from the desktop session.  Today you
can use vnc or spice, the dbus UI should allow better performance and
integration than that.  If it works out well we maybe we can even drop
the sdl/gtk UIs.

> Also, would you be able to review the patches in this series soon?

I expect there will be a v2 anyway due to the kernel-side changes?

take care,
  Gerd


