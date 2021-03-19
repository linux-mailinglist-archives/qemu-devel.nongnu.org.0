Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D62341639
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 08:02:54 +0100 (CET)
Received: from localhost ([::1]:35068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lN99p-0004Ac-Ug
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 03:02:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lN982-0003LS-Ux
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 03:01:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lN97v-0006be-B9
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 03:00:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616137253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T+MfxlqM5KuVZDt0yA3zwg2aSsrzimlyWOOZ2N4LP7w=;
 b=SyP7r8lwMKAEcQ02buNFsYEq7JzIYKARGhZpKeaE1gdqqmfzuSyZPVjPLVdO78qeYqJWn9
 pt9h9LEnpftVSnCS9mqk/1D6eN+QlKlShLJ6b6X93Hhk5c44H5+Ymj4V7Om7BRNF1Psi5n
 nIEKQZ3+Bz9zME5+jsi6uwFyvsii8o8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-508-Wgmv1QirNGesMArLNL-ZmQ-1; Fri, 19 Mar 2021 03:00:52 -0400
X-MC-Unique: Wgmv1QirNGesMArLNL-ZmQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 311AF81431F
 for <qemu-devel@nongnu.org>; Fri, 19 Mar 2021 07:00:51 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-12-239.pek2.redhat.com
 [10.72.12.239])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 99DE75FCA6
 for <qemu-devel@nongnu.org>; Fri, 19 Mar 2021 07:00:50 +0000 (UTC)
Subject: Re: [PULL 0/2] 2021-03-18 COLO proxy patches
To: qemu-devel@nongnu.org
References: <20210318041152.59367-1-chen.zhang@intel.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <09ec3197-01b3-e200-432a-e270ae28645f@redhat.com>
Date: Fri, 19 Mar 2021 15:00:48 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210318041152.59367-1-chen.zhang@intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_CHARSET_FARAWAY=2.45, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


ÔÚ 2021/3/18 ÏÂÎç12:11, Zhang Chen Ð´µÀ:
> Hi Jason, please merge this series to net queue.
>
> Lukas Straub (2):
>    net/colo-compare.c: Fix memory leak for non-tcp packet
>    net/colo-compare.c: Optimize removal of secondary packet
>
>   net/colo-compare.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)


Applied.

Thanks


>


