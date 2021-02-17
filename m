Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3330631DA45
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 14:23:34 +0100 (CET)
Received: from localhost ([::1]:45982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCMnl-0008VO-AP
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 08:23:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lCMm0-0007e3-Kc
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 08:21:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lCMlx-0001TB-KE
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 08:21:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613568100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uT1QGP4bIhOu8XD3vSeD3V27/SyVzNdZI0fJFdBP66k=;
 b=g3jcVqEzSWujps5rTSfWu3aIn2PtfslSpMFbmqe50kdsSn1g9sFx77izKeEGUVSzao/3WZ
 oiTW0KoR645m/70/x4TNUcAmdxfl+aPbfMsdUaIl0cKCsdZBYM9x45hazDywlxR6GkGlWr
 hsU0derw7L6gFskIOEL3kBsXrePZxwg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-5-aW34IPN5qAIPcMz2_hAA-1; Wed, 17 Feb 2021 08:21:36 -0500
X-MC-Unique: 5-aW34IPN5qAIPcMz2_hAA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4637386A06A;
 Wed, 17 Feb 2021 13:21:35 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-184.ams2.redhat.com
 [10.36.114.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B20CC77BE5;
 Wed, 17 Feb 2021 13:21:34 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 490D71800398; Wed, 17 Feb 2021 14:21:32 +0100 (CET)
Date: Wed, 17 Feb 2021 14:21:32 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Zihao Chang <changzihao1@huawei.com>
Subject: Re: [PATCH v3 3/3] qmp: add new qmp display-reload
Message-ID: <20210217132132.3lnzqbnnvqrdqey4@sirius.home.kraxel.org>
References: <20210207074710.1029-1-changzihao1@huawei.com>
 <20210207074710.1029-4-changzihao1@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210207074710.1029-4-changzihao1@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: berrange@redhat.com, oscar.zhangbo@huawei.com, qemu-devel@nongnu.org,
 xiexiangyou@huawei.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> +##
> +# @DiaplayReloadInfo:

Display

> +{ 'struct': 'DiaplayReloadInfo',

Same here.

take care,
  Gerd


