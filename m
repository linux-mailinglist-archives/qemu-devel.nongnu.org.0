Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 048D22D2BC8
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 14:19:06 +0100 (CET)
Received: from localhost ([::1]:46808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmctU-0004lA-R4
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 08:19:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kmclu-0000YR-Pw
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 08:11:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26255)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kmclr-0005U5-F3
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 08:11:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607433066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rEtHXsvTR6uWa3IMx4m8/Acx3l/Z7YwRZI9J/1ZYt4Q=;
 b=BPY1kdKlM2XiBTW8cbTE/FkjzjL0iCYFuf+aC96j8TqN8XLze2HZ09kAei5qKrIF2WYHtl
 y8x2HpFFwhK9uGpuWgfRDUkHstSlsTc1gFEayqx1azNCoIm/jjDas40ozu7P2yzeIvnM6c
 ojwNtE6BIxPD3thC+5jNuN+MrhA1j2M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-70Y3A0Y0N5CW3-OeKcqWWQ-1; Tue, 08 Dec 2020 08:11:04 -0500
X-MC-Unique: 70Y3A0Y0N5CW3-OeKcqWWQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5ABDC1006C85;
 Tue,  8 Dec 2020 13:11:03 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-38.ams2.redhat.com [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C02285D9DD;
 Tue,  8 Dec 2020 13:10:56 +0000 (UTC)
Subject: Re: [PATCH v3] tests/acceptance: test hot(un)plug of ccw devices
To: Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20201208122843.147186-1-cohuck@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <dc13ec34-3524-a590-2d38-2f471e15b282@redhat.com>
Date: Tue, 8 Dec 2020 14:10:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201208122843.147186-1-cohuck@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/12/2020 13.28, Cornelia Huck wrote:
> Hotplug a virtio-net-ccw device, and then hotunplug it again.
> 
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
> v2->v3:
> - do the dmesg cleanout and waiting for messages properly [Thomas]
> 
> Wainer: I dropped your r-b, as there had been too many changes for
>         me to be comfortable with retaining it
> 
> ---
>  tests/acceptance/machine_s390_ccw_virtio.py | 24 +++++++++++++++++++++
>  1 file changed, 24 insertions(+)

Reviewed-by: Thomas Huth <thuth@redhat.com>


