Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9E02ED3E9
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 17:05:50 +0100 (CET)
Received: from localhost ([::1]:59206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxXnJ-0002a7-Qo
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 11:05:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kxXls-00023X-Le
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 11:04:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kxXlo-00082A-N2
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 11:04:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610035455;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HKdzL7pINdeOdtlmnhS2o4l0bZJsyEjIhHBiHnana/k=;
 b=CaC8jolONlHQ/D38NIZWthMHPKZ4GZ/qdxMVZp9aSE0xOhKAW4IsG8dwrfqRgUmOzxF7HG
 +HRAsCfg169C7IFKQe5xVpssr72WoBwJJ/zJONeWZ80SRj5+C58Zj3LLTyeX4eb5MD0zZF
 6Din0oVLHYxsbO/BA/mrVweN5BygQFo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-482-VgMi55auMsOrxpnOz80pDQ-1; Thu, 07 Jan 2021 11:04:13 -0500
X-MC-Unique: VgMi55auMsOrxpnOz80pDQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B3829B8100;
 Thu,  7 Jan 2021 16:04:12 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-197.ams2.redhat.com
 [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4CBA460C9C;
 Thu,  7 Jan 2021 16:04:12 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 740BD180061B; Thu,  7 Jan 2021 17:04:10 +0100 (CET)
Date: Thu, 7 Jan 2021 17:04:10 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Zihao Chang <changzihao1@huawei.com>
Subject: Re: [PATCH] vnc: add qmp to support change authz
Message-ID: <20210107160410.bh27ibafc2szsayh@sirius.home.kraxel.org>
References: <20210107124657.650-1-changzihao1@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210107124657.650-1-changzihao1@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.246,
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
Cc: oscar.zhangbo@huawei.com, qemu-devel@nongnu.org, xiexiangyou@huawei.com,
 armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> This patch add a new qmp 'change-vnc-authz' to support change the
> tls/sasl authz of vm. If index='', unset tlsauthzid/sasl.authzid
> {
>    "execute":"change-vnc-authz",
>    "arguments":{
>       "index":"object-authz-id",
>       "type":"tls/sasl"
>    }
> }

> +##
> +# @change-vnc-authz:
> +#
> +# Change the VNC server authz.
> +#
> +# @type:  the new authz type to use with VNC authentication
> +# @index:  the new authz object index to use with VNC authentication
> +#
> +# Since: 5.2
> +#
> +##
> +{ 'command': 'change-vnc-authz',
> +  'data': { 'type' : 'str',
> +            'index': 'str'},
> +  'if': 'defined(CONFIG_VNC_SASL)' }

type should be an enum I think.

Also index should be an int (and possibly an optional argument so you
can just not specify index to unset).

take care,
  Gerd


