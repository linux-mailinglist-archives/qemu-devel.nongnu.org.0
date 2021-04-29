Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA9A36EDA5
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 17:50:29 +0200 (CEST)
Received: from localhost ([::1]:42412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc8vs-0002hs-4y
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 11:50:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lc8u6-0001yp-KX
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 11:48:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lc8u3-0005zQ-Da
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 11:48:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619711314;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/gMFmdEugAYzvRlwf9gJGWoC8aMbOnKlV7++YJJOj9o=;
 b=NudZvec82dGSxDLcTDv0K+3RsJJfTPhtZKVDUaNrIdpUfd3tecrDxEChvjc5g4VuYOSHJB
 mdtdMV8F6amZR093acnhaleH1myiEaxmF3rpRlDdy+ShgmrCXD28IgdxklYvclMsZe9SPp
 ED/k8r8zPQWah29aHPCSXQxjiOmoUtw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-554--kvrj40CNv64AyMXEAZXeg-1; Thu, 29 Apr 2021 11:48:30 -0400
X-MC-Unique: -kvrj40CNv64AyMXEAZXeg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EFDF0802938;
 Thu, 29 Apr 2021 15:48:29 +0000 (UTC)
Received: from work-vm (ovpn-114-250.ams2.redhat.com [10.36.114.250])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C797C100760B;
 Thu, 29 Apr 2021 15:48:21 +0000 (UTC)
Date: Thu, 29 Apr 2021 16:48:19 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, vgoyal@redhat.com, stefanha@redhat.com,
 groug@kaod.org, chirantan@chromium.org
Subject: Re: [PATCH v3 06/26] DAX subprojects/libvhost-user: Add virtio-fs
 slave types
Message-ID: <YIrVQ8TUkgropuOw@work-vm>
References: <20210428110100.27757-1-dgilbert@redhat.com>
 <20210428110100.27757-7-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210428110100.27757-7-dgilbert@redhat.com>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: virtio-fs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Dr. David Alan Gilbert (git) (dgilbert@redhat.com) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> Add virtio-fs definitions to libvhost-user
> 
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

I'm going to need to rework this

> +/* Structures carried over the slave channel back to QEMU */
> +#define VHOST_USER_FS_SLAVE_MAX_ENTRIES 32
> +
> +/* For the flags field of VhostUserFSSlaveMsg */
> +#define VHOST_USER_FS_FLAG_MAP_R (1u << 0)
> +#define VHOST_USER_FS_FLAG_MAP_W (1u << 1)
> +
> +typedef struct {
> +    /* Offsets within the file being mapped */
> +    uint64_t fd_offset;
> +    /* Offsets within the cache */
> +    uint64_t c_offset;
> +    /* Lengths of sections */
> +    uint64_t len;
> +    /* Flags, from VHOST_USER_FS_FLAG_* */
> +    uint64_t flags;
> +} VhostUserFSSlaveMsgEntry;
> +
> +typedef struct {
> +    /* Number of entries */
> +    uint16_t count;
> +    /* Spare */
> +    uint16_t align;
> +
> +    VhostUserFSSlaveMsgEntry entries[];
> +} VhostUserFSSlaveMsg;
> +
>  typedef struct VhostUserMemoryRegion {
>      uint64_t guest_phys_addr;
>      uint64_t memory_size;
> @@ -197,6 +224,7 @@ typedef struct VhostUserMsg {
>          VhostUserConfig config;
>          VhostUserVringArea area;
>          VhostUserInflight inflight;
> +        VhostUserFSSlaveMsg fs;
>      } payload;
>  
>      int fds[VHOST_MEMORY_BASELINE_NREGIONS];

This fails Clang's build; because 'fs' is part of a union and
given it's entries[] is a variable length type, and is not
at the end of the union.   It's got a good point - I really don't know
how gcc copes here; but also, what are vhost-user's rules
on the length of 'payload' - it looks like me putting
a larger message in there will break other demons.

I'd changed it from a fixed size array to variable size based
on Chirantan's comments on v1; but now I'm not even convinced
the fixed size was right, given that I'm not convinced I'm
allowed to change the length of payload.

Dave

> @@ -693,4 +721,16 @@ void vu_queue_get_avail_bytes(VuDev *vdev, VuVirtq *vq, unsigned int *in_bytes,
>  bool vu_queue_avail_bytes(VuDev *dev, VuVirtq *vq, unsigned int in_bytes,
>                            unsigned int out_bytes);
>  
> +/**
> + * vu_fs_cache_request: Send a slave message for an fs client
> + * @dev: a VuDev context
> + * @req: The request type (map, unmap, sync)
> + * @fd: an fd (only required for map, else must be -1)
> + * @fsm: The body of the message
> + *
> + * Returns: 0 or above for success, nevative errno on error
> + */
> +int64_t vu_fs_cache_request(VuDev *dev, VhostUserSlaveRequest req, int fd,
> +                            VhostUserFSSlaveMsg *fsm);
> +
>  #endif /* LIBVHOST_USER_H */
> -- 
> 2.31.1
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


