Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 559392CA0BE
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 12:02:49 +0100 (CET)
Received: from localhost ([::1]:48260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk3Qm-0005bu-Ba
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 06:02:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kk37z-00045e-UA
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 05:43:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kk37y-0006oq-8r
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 05:43:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606819401;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DvY0l/MPFIsJzXsKruBUythyXr/xXiPmS+BhMO7G+Vc=;
 b=Wk0/ZE3QMuTgZ1lMPT9RrYfhlaGvtoCfnfe4GHdmVJKyeDRhnl4K6DZX6p7TCZgl3gNIaq
 Doj/awwAPS47DZg/RBmCWG0IvVLKW/VnkMsMnLAZRpQVzgP4gIL6txT2hNlqEG+S2htrpW
 N28eeYiOxTmj9O3rzQc+KwV3DXLx8TA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-32-g0pqJBVnMDKggpKUG4o53g-1; Tue, 01 Dec 2020 05:43:17 -0500
X-MC-Unique: g0pqJBVnMDKggpKUG4o53g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8ABE2184214F;
 Tue,  1 Dec 2020 10:43:16 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-117.ams2.redhat.com [10.36.112.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A517B60853;
 Tue,  1 Dec 2020 10:43:11 +0000 (UTC)
Subject: Re: [PATCH 1/3] tests/acceptance: test virtio-ccw revision handling
To: Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org
References: <20201130180216.15366-1-cohuck@redhat.com>
 <20201130180216.15366-2-cohuck@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <53b4090d-117e-dcbc-dabc-4ae5c6f3c835@redhat.com>
Date: Tue, 1 Dec 2020 11:43:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201130180216.15366-2-cohuck@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30/11/2020 19.02, Cornelia Huck wrote:
> The max_revision prop of virtio-ccw devices can be used to force
> an older revision for compatibility handling. The easiest way to
> check this is to force a device to revision 0, which turns off
> virtio-1.
> 
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>  tests/acceptance/machine_s390_ccw_virtio.py | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


