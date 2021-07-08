Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FAB03C197D
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 20:58:13 +0200 (CEST)
Received: from localhost ([::1]:54648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1ZDv-0003EQ-W2
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 14:58:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crobinso@redhat.com>)
 id 1m1Z0a-0003gJ-QG
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 14:44:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28104)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crobinso@redhat.com>)
 id 1m1Z0Y-0005Pa-JP
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 14:44:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625769862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NjdoYC2GgJxySN1fuR3PtO/Juo2AljbfXV29oEFdNLA=;
 b=RdKD0IwzVhhaxKpzPhoAAvBgisNXkmt90ZejO77OPaSXC8Pl+MBFW/FTX7txfGyymPI3gs
 R6Md65/60uy3cAADQNksGDxMvd83Nmb7WLuXXaoOVG/goVTQPkOBlFAufKFkrdlRsZn4ot
 nQLm6FJTftyRyUYCftVfDcDmzwjW7/A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-533-uRBdWmdnOui3cGV4e72_0Q-1; Thu, 08 Jul 2021 14:44:19 -0400
X-MC-Unique: uRBdWmdnOui3cGV4e72_0Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C38588042DE
 for <qemu-devel@nongnu.org>; Thu,  8 Jul 2021 18:44:18 +0000 (UTC)
Received: from [10.10.115.15] (ovpn-115-15.rdu2.redhat.com [10.10.115.15])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 77EAA19D9F;
 Thu,  8 Jul 2021 18:44:18 +0000 (UTC)
Subject: Re: [PATCH] contrib: add stub bridge.conf for qemu-bridge-helper
To: qemu-devel@nongnu.org
References: <ee9afe9119004f9208eb0930e02138eed0873f43.1625769632.git.crobinso@redhat.com>
From: Cole Robinson <crobinso@redhat.com>
Message-ID: <c2da0e4b-aefc-fb57-121b-5dd58dd9f544@redhat.com>
Date: Thu, 8 Jul 2021 14:44:18 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <ee9afe9119004f9208eb0930e02138eed0873f43.1625769632.git.crobinso@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crobinso@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crobinso@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: jasowang@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/8/21 2:42 PM, Cole Robinson wrote:
> The comment comes from OpenSUSE's bridge.conf, with some minor tweaks
> 
> Signed-off-by: Cole Robinson <crobinso@redhat.com>
> ---
> Or should this be installed? If so where in git should it live?
> 
>  contrib/bridge.conf | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 contrib/bridge.conf
> 
> diff --git a/contrib/bridge.conf b/contrib/bridge.conf
> new file mode 100644
> index 0000000000..b83e46c34f
> --- /dev/null
> +++ b/contrib/bridge.conf
> @@ -0,0 +1,14 @@
> +# Access control file for qemu-bridge-helper
> +# https://wiki.qemu.org/Features/HelperNetworking
> +#
> +# Syntax consists of:
> +#   # comment (ignored)
> +#   allow all
> +#   allow <bridge_name>
> +#   deny all
> +#   deny <bridge_name>
> +#   include /path/to/additional/ACL/file
> +#
> +# Users are blacklisted by default and 'deny' takes precedence over 'allow'.
> +# Including additional ACL files allows file access permissions to be used as
> +# a component of the policy to allow access or deny access to specific bridges.
> 

Meant to include this too:

diff --git a/MAINTAINERS b/MAINTAINERS
index 684142e12e..dbdf26ade2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2498,6 +2498,7 @@ F: include/net/
 F: qemu-bridge-helper.c
 T: git https://github.com/jasowang/qemu.git net
 F: qapi/net.json
+F: contrib/bridge.conf

 Netmap network backend
 M: Luigi Rizzo <rizzo@iet.unipi.it>

- Cole

- Cole


