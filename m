Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AAA1497839
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 05:34:55 +0100 (CET)
Received: from localhost ([::1]:46158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBr49-0004l2-Lm
	for lists+qemu-devel@lfdr.de; Sun, 23 Jan 2022 23:34:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nBr2P-00044q-5t
 for qemu-devel@nongnu.org; Sun, 23 Jan 2022 23:33:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29104)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nBr2L-00053p-S8
 for qemu-devel@nongnu.org; Sun, 23 Jan 2022 23:33:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642998780;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ywVkSjYqwGhEXuzDaFXOjbRRmnLvl8ZmyDiptv9Gj0o=;
 b=Rb6SBG59Yyl6AWwqBwebj8tcEhZ99/HRO5NofXmLcUEas65iieVdfl5N4rfCA0tTRRdJpT
 lWcyQo20Qxa8w44UDk7fJdmIFjOTKxpqPLGdbTOQFm2ujW81f4CzbOyVBBac82HR13njt7
 QH8K6kwLDtd4Mh2V6mZczYHJ8/sxwcg=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-481-ariVSaTTMYuvtwoXct17TQ-1; Sun, 23 Jan 2022 23:32:58 -0500
X-MC-Unique: ariVSaTTMYuvtwoXct17TQ-1
Received: by mail-pl1-f198.google.com with SMTP id
 q21-20020a170902edd500b0014ae79cc6d5so2899381plk.18
 for <qemu-devel@nongnu.org>; Sun, 23 Jan 2022 20:32:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ywVkSjYqwGhEXuzDaFXOjbRRmnLvl8ZmyDiptv9Gj0o=;
 b=iuiNuxzz/BVJDXYZknxzw5d0aiEJ0I1z3j1OIiAxv0GgMvRfC2MpVmPMO+IK8spu++
 edCAKpg3NVkVpY/OogMjg03HkAEpwx1gFeNBp9/n1Iw5dI71EssXfsiqPTxuqQYlGs0j
 5Io+zQo5CMFFe5jn6uaMnaszKjvfzDCwkGEzpVTP+O+LDmiuxt1hiUv5ltbfjhTVRJSh
 QnVjcoTvp6GVYvWmy5MmDQWa1sdO15wqEsXo//WCnDxt/1lcBKUFDxA1IynsFb96vE3s
 2Y2S7Th8LqRLsvVQrYa0S9z6jObcU0UVdWIKkEyCmaebwCzPmV3Oup9bL9m/92hYioK6
 yYxw==
X-Gm-Message-State: AOAM531t9beeo6fep1GoolUGkh8i7Gb3kfuAkVgR2w1n8aWY4aOWBf9b
 5RdM5kL8jKRWaNbeHWT5zRcH5e/SAGJgMHqxc0BshtL7kIpLYBwbAfkm16R94lDPKuz/oSIC1pZ
 5Rj9Ag9wv0nUXcv4=
X-Received: by 2002:a17:90a:de0f:: with SMTP id
 m15mr239248pjv.86.1642998777723; 
 Sun, 23 Jan 2022 20:32:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxmjGFIoJVqeqwAWMaE4+RtrcG9zQLuG9z0Loa5SLrS4BNNb3F3WCc9CHZeL4zodWm9EXdc1w==
X-Received: by 2002:a17:90a:de0f:: with SMTP id
 m15mr239234pjv.86.1642998777471; 
 Sun, 23 Jan 2022 20:32:57 -0800 (PST)
Received: from xz-m1.local ([94.177.118.73])
 by smtp.gmail.com with ESMTPSA id g22sm14229089pfj.99.2022.01.23.20.32.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jan 2022 20:32:57 -0800 (PST)
Date: Mon, 24 Jan 2022 12:32:47 +0800
From: Peter Xu <peterx@redhat.com>
To: Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>
Subject: Re: [PATCH 21/31] util: Add iova_tree_alloc
Message-ID: <Ye4r7tKFhP9VaT5/@xz-m1.local>
References: <20220121202733.404989-1-eperezma@redhat.com>
 <20220121202733.404989-22-eperezma@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220121202733.404989-22-eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Gautam Dawar <gdawar@xilinx.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 virtualization@lists.linux-foundation.org, Eric Blake <eblake@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 21, 2022 at 09:27:23PM +0100, Eugenio Pérez wrote:
> +int iova_tree_alloc(IOVATree *tree, DMAMap *map, hwaddr iova_begin,
> +                    hwaddr iova_last)
> +{
> +    const DMAMapInternal *last, *i;
> +
> +    assert(iova_begin < iova_last);
> +
> +    /*
> +     * Find a valid hole for the mapping
> +     *
> +     * TODO: Replace all this with g_tree_node_first/next/last when available
> +     * (from glib since 2.68). Using a sepparated QTAILQ complicates code.
> +     *
> +     * Try to allocate first at the end of the list.
> +     */
> +    last = QTAILQ_LAST(&tree->list);
> +    if (iova_tree_alloc_map_in_hole(last, NULL, iova_begin, iova_last,
> +                                    map->size)) {
> +        goto alloc;
> +    }
> +
> +    /* Look for inner hole */
> +    last = NULL;
> +    for (i = QTAILQ_FIRST(&tree->list); i;
> +         last = i, i = QTAILQ_NEXT(i, entry)) {
> +        if (iova_tree_alloc_map_in_hole(last, i, iova_begin, iova_last,
> +                                        map->size)) {
> +            goto alloc;
> +        }
> +    }
> +
> +    return IOVA_ERR_NOMEM;
> +
> +alloc:
> +    map->iova = last ? last->map.iova + last->map.size + 1 : iova_begin;
> +    return iova_tree_insert(tree, map);
> +}

Hi, Eugenio,

Have you tried with what Jason suggested previously?

  https://lore.kernel.org/qemu-devel/CACGkMEtZAPd9xQTP_R4w296N_Qz7VuV1FLnb544fEVoYO0of+g@mail.gmail.com/

That solution still sounds very sensible to me even without the newly
introduced list in previous two patches.

IMHO we could move "DMAMap *previous, *this" into the IOVATreeAllocArgs*
stucture that was passed into the traverse func though, so it'll naturally work
with threading.

Or is there any blocker for it?

Thanks,

-- 
Peter Xu


