Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8E02FE93A
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 12:49:01 +0100 (CET)
Received: from localhost ([::1]:57802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2YSS-0007PI-1u
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 06:49:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l2YQv-0006y5-3a
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 06:47:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45313)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l2YQs-0000By-TU
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 06:47:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611229640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oJ6EIYUUjxpkQOHztNfaTlQ0w54cM/OP+TCE/3cSv8o=;
 b=A7EABteftffF2HGY9W36mO5ACpBHSdvkzRYsgL90OKsXwuljx/YeBDluK3Dde9uuvVBzrb
 k9CFvlR67NtMoETmZeNoIXTIh4bFXCJjwwgZoL8ezhuiqRGwbwd+Q34zySBs4cnkKXUUyn
 bSAkSjqlVNe1Ku66mHf5L5YQfgOcpYk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-515-wRK7rkXzPku_VA90BJEuww-1; Thu, 21 Jan 2021 06:47:17 -0500
X-MC-Unique: wRK7rkXzPku_VA90BJEuww-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F19D2107ACF8
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 11:47:16 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-82.ams2.redhat.com [10.36.112.82])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 82B5E60CE7;
 Thu, 21 Jan 2021 11:47:09 +0000 (UTC)
Subject: Re: [qemu-web PATCH v3] Add virtio-blk and virtio-scsi configuration
 post
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20210119141511.288131-1-stefanha@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <e08649fb-a5d5-54f9-6b1e-5f0bef2f4eeb@redhat.com>
Date: Thu, 21 Jan 2021 12:47:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210119141511.288131-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>, slp@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/01/2021 15.15, Stefan Hajnoczi wrote:
> The second post in the storage series covers virtio-blk and virtio-scsi.
> It compares the two and offers recommendations that users and tools
> using QEMU can use as a starting point. Graphs are included comparing
> the performance of various options.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
> v3:
>   * Mention guest drivers for other operation systems [Thomas]
>   * Reorder virtio-blk/virtio-scsi key points [Thomas]
>   * Mention that virtio-blk is limited to disk emulation and doesn't
>     handle CD-ROM drivers, for example [Thomas]
> v2:
>   * Mention default storage controllers for non-x86 [danpb]
>   * Remove statement about read-only ISO virtio-blk devices, both Rich
>     Jones and Daniel Berrange commented about this at different times so
>     I decided to drop it completely [danpb]
>   * Clarify PCI slot limits and multi-function discussion for virtio-blk
>     [danpb]
>   * Mention multiple virtio-scsi devices for NUMA tuning and that
>     emulated LUNs can be HDDs or CD-ROMs [danpb]
> ---
>   ...021-01-19-virtio-blk-scsi-configuration.md | 117 ++++++++++++++++++
>   screenshots/2020-09-15-scsi-devices.svg       |   1 +
>   screenshots/2020-09-15-virtio-blk-vs-scsi.svg |   1 +
>   3 files changed, 119 insertions(+)
>   create mode 100644 _posts/2021-01-19-virtio-blk-scsi-configuration.md
>   create mode 100644 screenshots/2020-09-15-scsi-devices.svg
>   create mode 100644 screenshots/2020-09-15-virtio-blk-vs-scsi.svg
> 
> diff --git a/_posts/2021-01-19-virtio-blk-scsi-configuration.md b/_posts/2021-01-19-virtio-blk-scsi-configuration.md
> new file mode 100644
> index 0000000..a9c7a35
> --- /dev/null
> +++ b/_posts/2021-01-19-virtio-blk-scsi-configuration.md
> @@ -0,0 +1,117 @@
[...]
> +Virtual machines that require access to many disks can hit limits based on
> +availability of PCI slots, which are under contention with other devices
> +exposed to the guest, such as NICs. For example a typical i440fx machine type
> +default configuration allows for about 28 disks. It is possible to use
> +multi-function devices to pack multiple virtio-blk devies into a single PCI

Thanks!

I've replaced "devies" with "devices" and pushed it to the repo now.

  Thomas



