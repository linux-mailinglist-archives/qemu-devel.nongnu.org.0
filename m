Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F552004F8
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Jun 2020 11:26:00 +0200 (CEST)
Received: from localhost ([::1]:40008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jmDHb-0006Gh-Js
	for lists+qemu-devel@lfdr.de; Fri, 19 Jun 2020 05:25:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1jmDDY-0007vG-ON
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 05:21:48 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:60711
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1jmDDW-0004Ha-Vz
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 05:21:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592558506;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y5+2ds8JLMOgBUqbhO1NAcCMafBHDLnfz6bxPBNBrLg=;
 b=Hlmyni37Vcgx6LJHuPbOhVx1odsby7kKY+9hOwEuMS97XymJDjJxU0bwuK+MjPwXjE12Xs
 zExdym7UM8cYaZ/lfGMXvDg7mdfOGLPGRYkwidi8KSe5lFUDHPcCNL4KQRcjHu13C+WPMC
 ynQcjn9mGpWUi2OWSYSobmakwHJzOPo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-244-jJnZv0F8PrKFxWrf6RVs4A-1; Fri, 19 Jun 2020 05:21:44 -0400
X-MC-Unique: jJnZv0F8PrKFxWrf6RVs4A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DADDE872FE0
 for <qemu-devel@nongnu.org>; Fri, 19 Jun 2020 09:21:43 +0000 (UTC)
Received: from [10.72.13.155] (ovpn-13-155.pek2.redhat.com [10.72.13.155])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 94C5819C4F;
 Fri, 19 Jun 2020 09:21:36 +0000 (UTC)
Subject: Re: [PATCH v3] docs: vhost-user: add Virtio status protocol feature
To: Maxime Coquelin <maxime.coquelin@redhat.com>, mst@redhat.com,
 lulu@redhat.com, amorenoz@redhat.com, qemu-devel@nongnu.org
References: <20200618134501.145747-1-maxime.coquelin@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <0bfbabc8-37dc-e91a-3126-f87e853172ad@redhat.com>
Date: Fri, 19 Jun 2020 17:21:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200618134501.145747-1-maxime.coquelin@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=jasowang@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/19 05:19:18
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2020/6/18 下午9:45, Maxime Coquelin wrote:
> This patch specifies the VHOST_USER_SET_STATUS and
> VHOST_USER_GET_STATUS requests, which are sent by
> the master to update and query the Virtio status
> in the backend.
>
> Signed-off-by: Maxime Coquelin <maxime.coquelin@redhat.com>
> ---
> Changes since v2:
> =================
> - Typo: fix missing # (Jason)
>
> Changes since v1:
> =================
> - Only keep the spec part in this patch, the implementation will
>    be part of Cindy's Vhost vDPA series it depends on. The goal is
>    to be able to implement it in next DPDK release even if Qemu part
>    is not merged.
> - Add GET_STATUS after discussions with Michael and Jason. It can
>    be used by the master to ensure FEATURES_OK bit set is
>    acknowledged by the backend.
>
>   docs/interop/vhost-user.rst | 24 ++++++++++++++++++++++++
>   1 file changed, 24 insertions(+)
>
> diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
> index 688b7c6900..10e3e3475e 100644
> --- a/docs/interop/vhost-user.rst
> +++ b/docs/interop/vhost-user.rst
> @@ -816,6 +816,7 @@ Protocol features
>     #define VHOST_USER_PROTOCOL_F_RESET_DEVICE         13
>     #define VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS 14
>     #define VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS  15
> +  #define VHOST_USER_PROTOCOL_F_STATUS               16
>   
>   Master message types
>   --------------------
> @@ -1307,6 +1308,29 @@ Master message types
>     ``VHOST_USER_ADD_MEM_REG`` message, this message is used to set and
>     update the memory tables of the slave device.
>   
> +``VHOST_USER_SET_STATUS``
> +  :id: 39
> +  :equivalent ioctl: VHOST_VDPA_SET_STATUS
> +  :slave payload: N/A
> +  :master payload: ``u64``
> +
> +  When the ``VHOST_USER_PROTOCOL_F_STATUS`` protocol feature has been
> +  successfully negotiated, this message is submitted by the master to
> +  notify the backend with updated device status as defined in the Virtio
> +  specification.
> +
> +``VHOST_USER_GET_STATUS``
> +  :id: 40
> +  :equivalent ioctl: VHOST_VDPA_GET_STATUS
> +  :slave payload: ``u64``
> +  :master payload: N/A
> +
> +  When the ``VHOST_USER_PROTOCOL_F_STATUS`` protocol feature has been
> +  successfully negotiated, this message is submitted by the master to
> +  query the backend for its device status as defined in the Virtio
> +  specification.
> +
> +
>   Slave message types
>   -------------------
>   


Acked-by: Jason Wang <jasowang@redhat.com>



