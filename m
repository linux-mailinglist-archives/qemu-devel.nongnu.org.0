Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE212FB5A1
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 12:20:35 +0100 (CET)
Received: from localhost ([::1]:46714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1p3q-0007Ck-BS
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 06:20:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l1p2E-0006hx-Vz
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 06:18:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44287)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l1p2C-00063E-EQ
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 06:18:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611055130;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KqjblKATciVbcmXh0EX89PlgzFqZ48UIOZmfI5D3tRY=;
 b=KU3pi080bx66D87YnmDX/av5+rCrYu0dzHd+qlGoAm7Vg8dmhtwOcJLjC37BLwRWkGmE2y
 8dh2lkNDJmbVMiXMjQHYL/PWlUOQbFbSGGvQGA9wQTf718MV43DVy/4Dm8Z2N2U3a41t/I
 eg8X89JPBkIM6mx9/bwS8gSRtYfbK8g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-351-56ubQlbvPaecmHdkUMaq7Q-1; Tue, 19 Jan 2021 06:18:48 -0500
X-MC-Unique: 56ubQlbvPaecmHdkUMaq7Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D98F802B45
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 11:18:47 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-157.ams2.redhat.com [10.36.112.157])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 739995D9F8;
 Tue, 19 Jan 2021 11:18:46 +0000 (UTC)
Subject: Re: [qemu-web PATCH v2 04/16] Make page header nav narrower
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20201027132015.621733-1-berrange@redhat.com>
 <20201027132015.621733-5-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <47b63ceb-007a-4456-d6be-4ead80953eab@redhat.com>
Date: Tue, 19 Jan 2021 12:18:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201027132015.621733-5-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.175,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.194, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27/10/2020 14.20, Daniel P. Berrangé wrote:
> When the browser window is narrow, but not yet switched into the mobile
> layout, the page header nav will line wrap. This breaks layout
> assumptions resulting in overlapping/obscured text.
> 
> This deals with the probem by reducing padding between the links, and
> shortening "Documentation" to just "Docs".
> 
> This avoids the line wrapping, as well as making room for new links in
> the future.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   _includes/nav.html           | 2 +-
>   assets/css/style-desktop.css | 3 ++-
>   2 files changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>

... and pushed it already (I used this patch to test my access to the new 
repo on gitlab.com instead the old one at qemu.org)


