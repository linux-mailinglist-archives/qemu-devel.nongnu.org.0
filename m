Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB9B252677
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Aug 2020 07:11:39 +0200 (CEST)
Received: from localhost ([::1]:53236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAnik-00045V-Ko
	for lists+qemu-devel@lfdr.de; Wed, 26 Aug 2020 01:11:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kAnhw-0003fv-Gf
 for qemu-devel@nongnu.org; Wed, 26 Aug 2020 01:10:48 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:26956
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kAnhu-0000VG-9U
 for qemu-devel@nongnu.org; Wed, 26 Aug 2020 01:10:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598418645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=meb/mBcE+sfVkCvoQYTXflHyDQ1I11dvEkapvvwluuA=;
 b=fPrjJo7xrVfJqbuDFvcF8H15v/TM/PR9/qS9jDfJDjrsGf9TUI7gVzOWkqBXavZWdccqBy
 OEx36F9iL8ota2YcySpRyyWOEdKauITv/9QAOpDa/Ad39E65HnnyJiHhT5Z2PbrgxpPz3s
 PmAXKPOeD/wFVYS8N8RQZDnUweqDJqI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-122-8a7w9jy9PpGdMCZH-1kHog-1; Wed, 26 Aug 2020 01:10:42 -0400
X-MC-Unique: 8a7w9jy9PpGdMCZH-1kHog-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E257F8030AC;
 Wed, 26 Aug 2020 05:10:41 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-54.ams2.redhat.com
 [10.36.112.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 904B17C874;
 Wed, 26 Aug 2020 05:10:41 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id BD99F9C86; Wed, 26 Aug 2020 07:10:40 +0200 (CEST)
Date: Wed, 26 Aug 2020 07:10:40 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH v3 14/74] hcd-dwc2: Rename USB_*CLASS macros for
 consistency
Message-ID: <20200826051040.i5rhksiube5zv2ar@sirius.home.kraxel.org>
References: <20200825192110.3528606-1-ehabkost@redhat.com>
 <20200825192110.3528606-15-ehabkost@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200825192110.3528606-15-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/26 01:10:45
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.958,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 25, 2020 at 03:20:10PM -0400, Eduardo Habkost wrote:
> Rename the DWC2_CLASS to DWC2_USB_CLASS and DWC2_GET_CLASS to
> DWC2_USB_GET_CLASS, for consistency with the DWC2_USB macro.
> 
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>


