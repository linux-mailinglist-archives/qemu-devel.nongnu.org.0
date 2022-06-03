Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6564B53C94F
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 13:31:27 +0200 (CEST)
Received: from localhost ([::1]:53688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nx5WX-0001Ds-UD
	for lists+qemu-devel@lfdr.de; Fri, 03 Jun 2022 07:31:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxime.coquelin@redhat.com>)
 id 1nx5SN-0000RQ-Fs
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 07:27:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxime.coquelin@redhat.com>)
 id 1nx5SI-0007eY-Pr
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 07:27:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654255620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RknRKtpHCrCqbKSHuNDnABm63qGMgc50j2RD4PNkbrw=;
 b=KEVgtlO91ThzzFX6lDstojxhIZiYEanVP0g73UFBq8S+Iw40KSIAKNyrWDF7IO68Kj8L4k
 l9oxrkQFogMAbsGbrbB0v2BmF8O7I3cOZ15MxCMmKwL4ir2owR71s970Z8GDcxSQVk3DPv
 5Jks5GNLvQT0FBWBtKr65vipWudg3Qc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-460-DVySPzbhMSyny3H_c5_8sg-1; Fri, 03 Jun 2022 07:25:18 -0400
X-MC-Unique: DVySPzbhMSyny3H_c5_8sg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 605C12806950;
 Fri,  3 Jun 2022 11:25:18 +0000 (UTC)
Received: from [10.39.208.11] (unknown [10.39.208.11])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0AFCF403371;
 Fri,  3 Jun 2022 11:25:14 +0000 (UTC)
Message-ID: <0fec2667-88ce-7388-086f-2dfc7d6bf9d7@redhat.com>
Date: Fri, 3 Jun 2022 13:25:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v6 5/8] libvduse: Add VDUSE (vDPA Device in Userspace)
 library
Content-Language: en-US
To: Xie Yongji <xieyongji@bytedance.com>, mst@redhat.com,
 jasowang@redhat.com, stefanha@redhat.com, sgarzare@redhat.com,
 kwolf@redhat.com, mreitz@redhat.com, mlureau@redhat.com, jsnow@redhat.com,
 eblake@redhat.com, Coiby.Xu@gmail.com, hreitz@redhat.com
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org
References: <20220523084611.91-1-xieyongji@bytedance.com>
 <20220523084611.91-6-xieyongji@bytedance.com>
From: Maxime Coquelin <maxime.coquelin@redhat.com>
In-Reply-To: <20220523084611.91-6-xieyongji@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=maxime.coquelin@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Hi Yongji,

On 5/23/22 10:46, Xie Yongji wrote:
> VDUSE [1] is a linux framework that makes it possible to implement
> software-emulated vDPA devices in userspace. This adds a library
> as a subproject to help implementing VDUSE backends in QEMU.
> 
> [1] https://www.kernel.org/doc/html/latest/userspace-api/vduse.html
> 
> Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
> ---
>   MAINTAINERS                                 |    5 +
>   meson.build                                 |   15 +
>   meson_options.txt                           |    2 +
>   scripts/meson-buildoptions.sh               |    3 +
>   subprojects/libvduse/include/atomic.h       |    1 +
>   subprojects/libvduse/include/compiler.h     |    1 +
>   subprojects/libvduse/libvduse.c             | 1167 +++++++++++++++++++
>   subprojects/libvduse/libvduse.h             |  235 ++++
>   subprojects/libvduse/linux-headers/linux    |    1 +
>   subprojects/libvduse/meson.build            |   10 +
>   subprojects/libvduse/standard-headers/linux |    1 +
>   11 files changed, 1441 insertions(+)
>   create mode 120000 subprojects/libvduse/include/atomic.h
>   create mode 120000 subprojects/libvduse/include/compiler.h
>   create mode 100644 subprojects/libvduse/libvduse.c
>   create mode 100644 subprojects/libvduse/libvduse.h
>   create mode 120000 subprojects/libvduse/linux-headers/linux
>   create mode 100644 subprojects/libvduse/meson.build
>   create mode 120000 subprojects/libvduse/standard-headers/linux
> 

...

> diff --git a/subprojects/libvduse/libvduse.c b/subprojects/libvduse/libvduse.c
> new file mode 100644
> index 0000000000..fa4822b9a9
> --- /dev/null
> +++ b/subprojects/libvduse/libvduse.c
> @@ -0,0 +1,1167 @@

...

> +
> +int vduse_dev_destroy(VduseDev *dev)
> +{
> +    int ret = 0;
> +
> +    free(dev->vqs);
> +    if (dev->fd > 0) {

if (dev->fd >= 0) {

> +        close(dev->fd);
> +        dev->fd = -1;
> +    }
> +    if (dev->ctrl_fd > 0) {

if (dev->ctrl_fd >= 0) {

> +        if (ioctl(dev->ctrl_fd, VDUSE_DESTROY_DEV, dev->name)) {
> +            ret = -errno;
> +        }
> +        close(dev->ctrl_fd);
> +        dev->ctrl_fd = -1;
> +    }
> +    free(dev->name);
> +    free(dev);
> +
> +    return ret;
> +}

Maxime


