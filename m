Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 815506A69E5
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 10:38:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXIv6-0005OM-N0; Wed, 01 Mar 2023 04:38:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pXIv4-0005Nj-7R
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 04:38:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pXIv2-0000Uu-Kv
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 04:38:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677663519;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pe5sg4B0TwwX6VbLvXlIqguHHJDvQm/tYa2J1Tj7us4=;
 b=Rat5IE4D9IljOcweYGUNucpNemSfUf4OuFsy01zLSIx+Cqq4k8IL4fB6aevvhr0zu+o1jA
 yM7IWQG7uKjNUfLCvO1WTULlkF7d6qRhDPzSJ5g6ZQuQfeoStl/kg+4h04U1tYgUES+9DF
 MrXw7kAhm9IYXLSbFDakTAqW+GWtzCk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-563-HJjZX7E6NvGy_379SKqe9w-1; Wed, 01 Mar 2023 04:38:36 -0500
X-MC-Unique: HJjZX7E6NvGy_379SKqe9w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3A8C33815EEF;
 Wed,  1 Mar 2023 09:38:36 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.74])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 088AF2166B26;
 Wed,  1 Mar 2023 09:38:34 +0000 (UTC)
Date: Wed, 1 Mar 2023 09:38:32 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: zhenwei pi <pizhenwei@bytedance.com>
Cc: mst@redhat.com, arei.gonglei@huawei.com, dgilbert@redhat.com,
 pbonzini@redhat.com, armbru@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH v5 07/12] hmp: add cryptodev info command
Message-ID: <Y/8dGElFM/1m+vw7@redhat.com>
References: <20230301025124.3605557-1-pizhenwei@bytedance.com>
 <20230301025124.3605557-8-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230301025124.3605557-8-pizhenwei@bytedance.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Mar 01, 2023 at 10:51:19AM +0800, zhenwei pi wrote:
> Example of this command:
>  # virsh qemu-monitor-command vm --hmp info cryptodev
> cryptodev1: service=[akcipher|mac|hash|cipher]
>     queue 0: type=builtin
> cryptodev0: service=[akcipher]
>     queue 0: type=lkcf
> 
> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> ---
>  backends/cryptodev-hmp-cmds.c | 54 +++++++++++++++++++++++++++++++++++
>  backends/meson.build          |  1 +
>  hmp-commands-info.hx          | 14 +++++++++
>  include/monitor/hmp.h         |  1 +
>  4 files changed, 70 insertions(+)
>  create mode 100644 backends/cryptodev-hmp-cmds.c

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


