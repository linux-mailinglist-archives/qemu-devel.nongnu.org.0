Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E24C31DA59
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 14:27:06 +0100 (CET)
Received: from localhost ([::1]:51080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCMrB-0002L0-Fn
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 08:27:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lCMoZ-0001JY-OF
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 08:24:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lCMoY-00028j-B3
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 08:24:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613568261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sLqoNpsUYCeJNc37kmW/SK51MFkh4Rrz7WbfCc+Kvq8=;
 b=g35GZ8tGF+ckalfr3ifzDoZschjIRT5es6wnqLaEGH6Yrm18bPVwlvg/KRRYKBjt238uZe
 4Uu0dju913nInBB+jqt4+eFWtIl7g5zerRlukBLBe/gifMVRJAJIObccHikUYx6GW2wqLS
 BKOD11ftt3LeuipxGR4fiExy9j2eG9c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-rQJD3c_XMvOnAA5q_zC-4g-1; Wed, 17 Feb 2021 08:24:19 -0500
X-MC-Unique: rQJD3c_XMvOnAA5q_zC-4g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 83396106BAE3;
 Wed, 17 Feb 2021 13:24:18 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-184.ams2.redhat.com
 [10.36.114.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 36BB35D719;
 Wed, 17 Feb 2021 13:24:17 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 4773C1800398; Wed, 17 Feb 2021 14:24:11 +0100 (CET)
Date: Wed, 17 Feb 2021 14:24:11 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Zihao Chang <changzihao1@huawei.com>
Subject: Re: [PATCH v3 2/3] vnc: support reload x509 certificates for vnc
Message-ID: <20210217132411.krosii5gn6wj3652@sirius.home.kraxel.org>
References: <20210207074710.1029-1-changzihao1@huawei.com>
 <20210207074710.1029-3-changzihao1@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210207074710.1029-3-changzihao1@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
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
Cc: berrange@redhat.com, oscar.zhangbo@huawei.com, qemu-devel@nongnu.org,
 xiexiangyou@huawei.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> +    if (!vd) {
> +        error_setg(errp, "Can not find Vnc Display");

Can we make this "vnc display" please?

> +        error_setg(errp, "Vnc tls is not enable");

Same.

thanks,
  Gerd


