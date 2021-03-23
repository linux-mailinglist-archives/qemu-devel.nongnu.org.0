Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43041346982
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 21:04:13 +0100 (CET)
Received: from localhost ([::1]:45248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOnG7-0002ce-If
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 16:04:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lOnDh-0000xd-J3
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 16:01:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lOnDb-00022A-Fb
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 16:01:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616529693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5RUl3Eu8H8qOrKLPap+4mNPOGj+2ICZGRyAgmk9UTZ4=;
 b=dpX175iRVv+clpm5nX/m+VP7J85eu7XlJh+gdvQCbjIsq7yIYNQaKDcfSBaoTMVL+iZ6A3
 eS911ANvyhhyjKfLvRVLmOUE7hfKUSCXc00DHVT9pujJT4b7UmsLP1FE7Gjw4jniDVQh+x
 aC7tL9a0pHPIOX8pLfCWtU2qCfgOQdg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-3Mx-6IadM6yAz-2TPoVLiw-1; Tue, 23 Mar 2021 16:01:31 -0400
X-MC-Unique: 3Mx-6IadM6yAz-2TPoVLiw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B1AD28CDE7F;
 Tue, 23 Mar 2021 20:01:29 +0000 (UTC)
Received: from work-vm (ovpn-115-35.ams2.redhat.com [10.36.115.35])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DC5F66F439;
 Tue, 23 Mar 2021 20:01:27 +0000 (UTC)
Date: Tue, 23 Mar 2021 20:01:25 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Zhang Chen <chen.zhang@intel.com>
Subject: Re: [PATCH V4 1/7] qapi/net.json: Add IP_PROTOCOL definition
Message-ID: <YFpJFahbhS+cVZvT@work-vm>
References: <20210319035508.113741-1-chen.zhang@intel.com>
 <20210319035508.113741-2-chen.zhang@intel.com>
MIME-Version: 1.0
In-Reply-To: <20210319035508.113741-2-chen.zhang@intel.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
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
 Markus Armbruster <armbru@redhat.com>, Zhang Chen <zhangckid@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Zhang Chen (chen.zhang@intel.com) wrote:
> Add IP_PROTOCOL as enum include TCP,UDP, ICMP... for other QMP commands.
> 
> Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> ---
>  qapi/net.json | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/qapi/net.json b/qapi/net.json
> index 87361ebd9a..498ea7aa72 100644
> --- a/qapi/net.json
> +++ b/qapi/net.json
> @@ -794,3 +794,34 @@
>  #
>  ##
>  { 'command': 'query-netdev', 'returns': ['NetdevInfo'] }
> +
> +##
> +# @IP_PROTOCOL:
> +#
> +# Transport layer protocol.
> +#
> +# Just for IPv4.
> +#
> +# @tcp: Transmission Control Protocol.
> +#
> +# @udp: User Datagram Protocol.
> +#
> +# @dccp: Datagram Congestion Control Protocol.
> +#
> +# @sctp: Stream Control Transmission Protocol.
> +#
> +# @udplite: Lightweight User Datagram Protocol.
> +#
> +# @icmp: Internet Control Message Protocol.
> +#
> +# @igmp: Internet Group Management Protocol.
> +#
> +# @ipv6: IPv6 Encapsulation.
> +#
> +# TODO: Need to add more transport layer protocol.
> +#
> +# Since: 6.1
> +##
> +{ 'enum': 'IP_PROTOCOL', 'data': [ 'tcp', 'udp', 'dccp', 'sctp', 'udplite',
> +    'icmp', 'igmp', 'ipv6' ] }

Isn't the right thing to do here to use a string for protocol and then
pass it to getprotobyname;  that way your list is never out of date, and
you never have to translate between the order of this enum and the
integer assignment set in stone.

Dave

> +
> -- 
> 2.25.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


