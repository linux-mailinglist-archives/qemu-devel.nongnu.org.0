Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B689D563108
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 12:10:03 +0200 (CEST)
Received: from localhost ([::1]:54936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7Db8-0000MA-My
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 06:10:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1o7DSW-000114-V9
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 06:01:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1o7DSP-0006DC-QY
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 06:01:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656669661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qbKPe32y9zhn+JidvFLsUW/2UwmTOc0J30C5bZPFTNE=;
 b=gHfEZM9Vt/hngRaecx8JQD9qD2DHCl49GvRc7vj199Rgk8+hWcx/9z/lYGtdv50FQNx+1l
 2c3Kr3qBqigcvp9rOmov6RVEQYWq2kYN1fMPEwi0qwiQ1+ktcphEECPgaiviWY5JO1zr93
 gR7TJMEzQ0tglII2S+CSCxyCMuXNORw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-637-zh9AUvBNMWigZy3DRgoYGw-1; Fri, 01 Jul 2022 06:00:57 -0400
X-MC-Unique: zh9AUvBNMWigZy3DRgoYGw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0D843384F807;
 Fri,  1 Jul 2022 10:00:57 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.27])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BF0FA400DEFC;
 Fri,  1 Jul 2022 10:00:56 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 5231B180091D; Fri,  1 Jul 2022 12:00:55 +0200 (CEST)
Date: Fri, 1 Jul 2022 12:00:55 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Cc: Felix xq =?utf-8?B?UXVlacOfbmVy?= <xq@random-projects.net>,
 qemu-devel@nongnu.org, thuth@redhat.com
Subject: Re: [PATCH] gtk: Add show_tabs=on|off command line option.
Message-ID: <20220701100055.r5abficcxmlc4ppp@sirius.home.kraxel.org>
References: <20220627164404.12137-1-xq@random-projects.net>
 <b7546847-d46a-b62c-f5ff-bd851a8e6ebc@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b7546847-d46a-b62c-f5ff-bd851a8e6ebc@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> But a bit more verbosity might be nice, too.  What about “Display the tab
> bar for switching between the various graphical interfaces (e.g. VGA and
> virtual console character devices) by default”?  (Note the imperative on
> “Display”, I think we generally use the imperative to document options.)

And 'tab bar' is more clear too I think.

take care,
  Gerd


