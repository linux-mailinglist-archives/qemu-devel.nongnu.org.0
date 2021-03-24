Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 223CA3471F1
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 07:58:18 +0100 (CET)
Received: from localhost ([::1]:40464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOxT7-0008Gg-8j
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 02:58:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOxRS-0007oT-30
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 02:56:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOxRQ-0000Pb-IF
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 02:56:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616568990;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Dyt9VnHWQ8S5oewAwSXKh+O245ZCQFiCL3PgBwLG1tI=;
 b=ardZlMpmSMLVZN9OKUQQfSyR+2KuCtIdRDL/2j9igjSpkPJQJK4XiCMVd7EKnrJEqFRs7Z
 V6cnAVLJOoTF4wueVgSd8nscdvSr4kLNU1vTPA5eiVvJa384YjzBuA0iKzQauXV4tvILNQ
 m6+jkt5iEVehVucRa2Cta51mmh//qvw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-VccQZG1KM-2NbVbQmXfHCg-1; Wed, 24 Mar 2021 02:56:29 -0400
X-MC-Unique: VccQZG1KM-2NbVbQmXfHCg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE8EC1005D4E;
 Wed, 24 Mar 2021 06:56:27 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A0D35DEAD;
 Wed, 24 Mar 2021 06:56:27 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2CCD511327E1; Wed, 24 Mar 2021 07:56:26 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Zhang Chen <chen.zhang@intel.com>
Subject: Re: [PATCH V4 2/7] qapi/net.json: Add L4_Connection definition
References: <20210319035508.113741-1-chen.zhang@intel.com>
 <20210319035508.113741-3-chen.zhang@intel.com>
Date: Wed, 24 Mar 2021 07:56:26 +0100
In-Reply-To: <20210319035508.113741-3-chen.zhang@intel.com> (Zhang Chen's
 message of "Fri, 19 Mar 2021 11:55:03 +0800")
Message-ID: <877dlxdopx.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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
Cc: Lukas Straub <lukasstraub2@web.de>, Li Zhijian <lizhijian@cn.fujitsu.com>,
 Jason Wang <jasowang@redhat.com>, qemu-dev <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Zhang Chen <zhangckid@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Zhang Chen <chen.zhang@intel.com> writes:

> Add L4_Connection struct for other QMP commands.
> Except protocol field is necessary, other fields are optional.
>
> Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> ---
>  qapi/net.json | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>
> diff --git a/qapi/net.json b/qapi/net.json
> index 498ea7aa72..cd4a8ed95e 100644
> --- a/qapi/net.json
> +++ b/qapi/net.json
> @@ -825,3 +825,29 @@
>  { 'enum': 'IP_PROTOCOL', 'data': [ 'tcp', 'udp', 'dccp', 'sctp', 'udplite',
>      'icmp', 'igmp', 'ipv6' ] }
>  
> +##
> +# @L4_Connection:
> +#
> +# Layer 4 network connection.
> +#
> +# Just for IPv4.
> +#
> +# @protocol: Transport layer protocol like TCP/UDP...
> +#
> +# @id: For specific module with Qemu object ID, If there is no such part,
> +#      it means global rules.
> +#
> +# @src_ip: Source IP.
> +#
> +# @dst_ip: Destination IP.
> +#
> +# @src_port: Source port.
> +#
> +# @dst_port: Destination port.
> +#
> +# Since: 6.1
> +##
> +{ 'struct': 'L4_Connection',
> +  'data': { 'protocol': 'IP_PROTOCOL', '*id': 'str', '*src_ip': 'str', '*dst_ip': 'str',
> +    '*src_port': 'int', '*dst_port': 'int' } }
> +

Please use '-' instead of '_' in member names.  Patches to enforce this
rule just landed in master.

We tend to avoid abbreviations like src and dst in QMP.  Consider
spelling them out, except when it makes things less consistent.


