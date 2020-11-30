Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B73C82C80CE
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 10:21:05 +0100 (CET)
Received: from localhost ([::1]:49032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjfMk-0001QM-D6
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 04:21:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kjfKm-0000QD-I0
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 04:19:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kjfKl-0005yN-4d
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 04:19:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606727938;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=U08jMYLmHIHDtNg+YDOX18otqk+jPv6EFMEEuUBWOKY=;
 b=bWwhC/iHKS6FytwaQh8ql6UPW6awa4VWldCxDZxMQkx9jo8bHWTuP8zIwShUt4E2/OOm4+
 IyHFfJ/K+0W0Nvj6egLq4/xB09/fEWbYVoYyjfe5v67QN/HiBO96cbDlENFmT8vLFpGU32
 bRtDioqBQO9emBPAvRwlKur0LZOw9PA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-127-5AtBbtzCOi-jK7YaSYfG5w-1; Mon, 30 Nov 2020 04:18:54 -0500
X-MC-Unique: 5AtBbtzCOi-jK7YaSYfG5w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E4F11005E42;
 Mon, 30 Nov 2020 09:18:53 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-94.ams2.redhat.com
 [10.36.112.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9CD2B19C45;
 Mon, 30 Nov 2020 09:18:52 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D312AA1E2; Mon, 30 Nov 2020 10:18:51 +0100 (CET)
Date: Mon, 30 Nov 2020 10:18:51 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Gan Qixin <ganqixin@huawei.com>
Subject: Re: [PATCH v2 09/12] u2f-passthru: put it into the 'misc' category
Message-ID: <20201130091851.kd2e7yln5tkvfynm@sirius.home.kraxel.org>
References: <20201130083630.2520597-1-ganqixin@huawei.com>
 <20201130083630.2520597-10-ganqixin@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20201130083630.2520597-10-ganqixin@huawei.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: thuth@redhat.com, zhang.zhanghailiang@huawei.com, qemu-trivial@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, kuhn.chenqun@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 30, 2020 at 04:36:27PM +0800, Gan Qixin wrote:
> The category of the u2f-passthru device is not set, put it into the 'misc'
> category.

Acked-by: Gerd Hoffmann <kraxel@redhat.com>


