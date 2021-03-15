Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABD733C5C8
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 19:37:05 +0100 (CET)
Received: from localhost ([::1]:52236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLs5Q-0000nr-F7
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 14:37:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lLrcX-0004vH-Ee
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:07:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58117)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lLrcT-0002Fm-Vb
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:07:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615831627;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ge/p8g2EqaRVt7hccjxh8XXUKQZlWNvhkbrqirjoUlE=;
 b=R1pigYfyywAaNVKQjIsClxP2EjZKGt9VbwLMyfvEznNBs4LJoIPwcLACSgJPhBEczNnZtG
 FlFrrHPUY3vfCgnL6Juic9puSwaaoDGzkWCJXPjdKY9mJk5CJU0GY4YSoFqqQ466MyLQBa
 1Tz47Vcx3xSH9Fo/QFgt8dBYS78s+kU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-567-AA5eKktxMF60YZBwukuLng-1; Mon, 15 Mar 2021 14:07:03 -0400
X-MC-Unique: AA5eKktxMF60YZBwukuLng-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E19D883DD20;
 Mon, 15 Mar 2021 18:07:01 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-141.ams2.redhat.com
 [10.36.112.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 958CF39A73;
 Mon, 15 Mar 2021 18:07:01 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 081411800614; Mon, 15 Mar 2021 19:07:00 +0100 (CET)
Date: Mon, 15 Mar 2021 19:07:00 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Zihao Chang <changzihao1@huawei.com>
Subject: Re: [PATCH v7 0/3] vnc: support reload x509 certificates
Message-ID: <20210315180700.jbkzd52y2u3vwf55@sirius.home.kraxel.org>
References: <20210315131609.2208-1-changzihao1@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210315131609.2208-1-changzihao1@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
 xiexiangyou@huawei.com, armbru@redhat.com, yebiaoxiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 15, 2021 at 09:16:06PM +0800, Zihao Chang wrote:
> This series supports reload x509 certificates for vnc
> 1. Support reload x509 certificates.
> 2. Support reload vnc certificates.
> 3. Add new qmp display-reload and implement reload x509 certificates
> for vnc.
> 
> Example:
> {"execute": "display-reload", "arguments":{"type": "vnc", "tls-certs": true}}
> 
> Zihao Chang (3):
>   crypto: add reload for QCryptoTLSCredsClass
>   vnc: support reload x509 certificates for vnc
>   qmp: add new qmp display-reload

fails gitlab.com ci (build-disabled test, possibly more, still running).

take care,
  Gerd


