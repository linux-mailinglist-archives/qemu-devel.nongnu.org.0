Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E622D8066
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 22:06:49 +0100 (CET)
Received: from localhost ([::1]:34212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knpcl-0000Kh-OC
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 16:06:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1knpWM-0006r3-2C
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 16:00:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1knpW7-0001NJ-45
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 16:00:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607720393;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hhuONaV9pi8q48FHh7XPeaEV5jJtcCYJrJQMRek0zTs=;
 b=VmCNHYfomKX4rHQFCVJKHGIhhBy97J+JWJ8w34NvOqjCIFwvGxe8A1Kj1JsC8Dw9/2F9yj
 JiJIoKcNCzMfvCk2CP0AKxJBxoH5SPTg6qDF7XqAmJuN7U3MsXtEBDAE08wKS7he4fYAdf
 C6plH1IfuJjc2K+J5SViIC0W8pBOZSw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-220-vBkNlJ6fN6ewmur_5pbyqw-1; Fri, 11 Dec 2020 15:59:52 -0500
X-MC-Unique: vBkNlJ6fN6ewmur_5pbyqw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A564659;
 Fri, 11 Dec 2020 20:59:50 +0000 (UTC)
Received: from localhost (ovpn-116-160.rdu2.redhat.com [10.10.116.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4E3276F999;
 Fri, 11 Dec 2020 20:59:50 +0000 (UTC)
Date: Fri, 11 Dec 2020 15:59:49 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: "Zhang, Chen" <chen.zhang@intel.com>
Subject: Re: [PATCH v2 09/12] colo: Use class properties
Message-ID: <20201211205949.GG1289986@habkost.net>
References: <20201111183823.283752-1-ehabkost@redhat.com>
 <20201111183823.283752-10-ehabkost@redhat.com>
 <3ee0a0cdbdca455384114c8c2dfb251e@intel.com>
MIME-Version: 1.0
In-Reply-To: <3ee0a0cdbdca455384114c8c2dfb251e@intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, Jason Wang <jasowang@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 13, 2020 at 03:04:55AM +0000, Zhang, Chen wrote:
> Looks good for me, but Qemu still have lots of parts use
> object_property_add, do you have plan to change it?

Thanks!

The plan is to minimize usage of object_property_add(), but
that's a huge task.  We're doing it gradually when it is more
useful (like on user-visible devices or backend objects).

-- 
Eduardo


