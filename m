Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA7231C9BC
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 12:35:29 +0100 (CET)
Received: from localhost ([::1]:38026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBydc-0001vu-Uc
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 06:35:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lBycE-0001Ry-Jw
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 06:34:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lBycC-0001B5-CZ
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 06:34:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613475237;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5FodiI27MIWJ0YcWtxVijWhG0+h5nrSiF1ctONeHzwM=;
 b=NCFQCyjwVYNjkVH0pcK5WGewVsnklf4oejAK1TZayO0TYo7wvDD8yOcIgWQBNzGk3yZLBt
 GfESsdimXCCOnCSDwmeWmj2CymsFRpmpVWYHnQ40XH54ghD9IQlMfzJJKpq9T+aqJK+5SC
 worHDTgqUD4hnvU8t6s+u70NpNtKugw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-nPoorJXzNXWjpDJcMNYs8Q-1; Tue, 16 Feb 2021 06:33:55 -0500
X-MC-Unique: nPoorJXzNXWjpDJcMNYs8Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 93EB7801962;
 Tue, 16 Feb 2021 11:33:54 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-157.ams2.redhat.com [10.36.112.157])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F2F8F5C661;
 Tue, 16 Feb 2021 11:33:49 +0000 (UTC)
Subject: Re: [PATCH] virtio-ccw: commands on revision-less devices
To: Cornelia Huck <cohuck@redhat.com>, Halil Pasic <pasic@linux.ibm.com>
References: <20210216111830.1087847-1-cohuck@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <534982e2-c8ad-a1bf-9323-dc3e397c1477@redhat.com>
Date: Tue, 16 Feb 2021 12:33:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210216111830.1087847-1-cohuck@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/02/2021 12.18, Cornelia Huck wrote:
> The virtio standard specifies that any non-transitional device must
> reject commands prior to revision setting (which we do) and else
> assume revision 0 (legacy) if the driver sends a non-revision-setting
> command first. We neglected to do the latter.
> 
> Fortunately, nearly everything worked as intended anyway; the only
> problem was not properly rejecting revision setting after some other
> command had been issued. Easy to fix by setting revision to 0 if
> we see a non-revision command on a legacy-capable revision-less
> device.
> 
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>   hw/s390x/virtio-ccw.c | 21 ++++++++++++++-------
>   1 file changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/s390x/virtio-ccw.c b/hw/s390x/virtio-ccw.c
> index 4582e94ae7dc..06c06056814b 100644
> --- a/hw/s390x/virtio-ccw.c
> +++ b/hw/s390x/virtio-ccw.c
> @@ -327,13 +327,20 @@ static int virtio_ccw_cb(SubchDev *sch, CCW1 ccw)
>                                      ccw.cmd_code);
>       check_len = !((ccw.flags & CCW_FLAG_SLI) && !(ccw.flags & CCW_FLAG_DC));
>   
> -    if (dev->force_revision_1 && dev->revision < 0 &&
> -        ccw.cmd_code != CCW_CMD_SET_VIRTIO_REV) {
> -        /*
> -         * virtio-1 drivers must start with negotiating to a revision >= 1,
> -         * so post a command reject for all other commands
> -         */
> -        return -ENOSYS;
> +    if (dev->revision < 0 && ccw.cmd_code != CCW_CMD_SET_VIRTIO_REV) {
> +        if (dev->force_revision_1) {
> +            /*
> +             * virtio-1 drivers must start with negotiating to a revision >= 1,
> +             * so post a command reject for all other commands
> +             */
> +            return -ENOSYS;
> +        } else {
> +            /*
> +             * If the driver issues any command that is not SET_VIRTIO_REV,
> +             * we'll have to operate the device in legacy mode.
> +             */
> +            dev->revision = 0;
> +        }
>       }
>   
>       /* Look at the command. */
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


