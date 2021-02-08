Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E256D3143DD
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 00:36:01 +0100 (CET)
Received: from localhost ([::1]:37996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9G4W-0007ED-Sn
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 18:36:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1l9BEy-0005sZ-QV
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:26:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1l9BEs-0007FL-1r
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:26:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612808774;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z7FdUlhMPjpzR/t7B1GY1ToR2TK9IRsEns0OwcdrA08=;
 b=C/CAPA28gTBhNOBVZnvgvlPRhJnxOZTS8XZQ0nMNbWKRGHVwxHvcYHH6WgfMgwE/m/IKSC
 ktYHQPxRxKiVzcT1KQ+3Ol5qjUKcaxcZCKqpj/UvRG6N8NvRtpGJ4x1xI6t9Vdlo1o3tEa
 YRA/8aNPyzjS3qyns09vQq1U2oeO/MI=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-hBcHXnG1OSirQzNOI5ia5w-1; Mon, 08 Feb 2021 13:26:10 -0500
X-MC-Unique: hBcHXnG1OSirQzNOI5ia5w-1
Received: by mail-qk1-f197.google.com with SMTP id b20so12000618qkg.0
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 10:26:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=z7FdUlhMPjpzR/t7B1GY1ToR2TK9IRsEns0OwcdrA08=;
 b=Doauw+IzwmfBF7M4xwmDDNkty3GNXxd+9o6TboTFalZ0Y0VkUCSob1ygikjKbYAv4z
 Gy6hB7lzW5t9HX+0+yi5iOb17QWWWYWgOrnT+P+nwUw6xHmQ2LWy7DF1ILE8Rb4mxrYm
 JU7SsXb4K06y7BfvCKDzX+SMqxIf77PdN1DHyzKPnUp8M7/tU/pXWTM/CSQMGNLpja/A
 CpXjOZvrAofrIcA2xOp6d1blme1k0WJAlZG1xFqk8qqdGVBM+oR5IyDtFylLeZKW9Kgs
 P4NeqeZ7X2U+Zjr0iQiw/iY/R0art5MKk36bGjbDKM+3YN5Ml/R3OjysIzDdQJ7Zgoud
 BxuQ==
X-Gm-Message-State: AOAM531cWykUnI1CJO2SAa3ujOtpF4tO8xEmNx9aeyzvByGpsefgPguB
 n4x/Ht38g5gCP3Qb9gvn5k54jsCNXFTBE1rdtqKiG7IMg2BpOUf6bnjjU2Fq+BSZhkdP9WfwoBX
 t01MJVJCu6PhE+k0=
X-Received: by 2002:a05:6214:a66:: with SMTP id
 ef6mr16849519qvb.14.1612808770152; 
 Mon, 08 Feb 2021 10:26:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxyrZCxKciWKQYN70VnBqeKMEA1A7SUUC377j/Vx7aWpc9hf++4jOgqiTg2lmEd/S7aXmcY7Q==
X-Received: by 2002:a05:6214:a66:: with SMTP id
 ef6mr16849493qvb.14.1612808769897; 
 Mon, 08 Feb 2021 10:26:09 -0800 (PST)
Received: from xz-x1
 (bras-vprn-toroon474qw-lp130-20-174-93-89-182.dsl.bell.ca. [174.93.89.182])
 by smtp.gmail.com with ESMTPSA id f26sm4969895qkh.80.2021.02.08.10.26.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 10:26:09 -0800 (PST)
Date: Mon, 8 Feb 2021 13:26:07 -0500
From: Peter Xu <peterx@redhat.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH] vhost: Unbreak SMMU and virtio-iommu on dev-iotlb support
Message-ID: <20210208182607.GA68242@xz-x1>
References: <20210204191228.187550-1-peterx@redhat.com>
 <2382a93d-41c1-24fd-144f-87ee18171bc9@redhat.com>
 <213acf9a-d1c0-3a1d-4846-877d90fadc03@redhat.com>
 <20210205153107.GX6468@xz-x1>
 <MWHPR11MB1886DACA066190C94FD2C27F8CB09@MWHPR11MB1886.namprd11.prod.outlook.com>
 <20210207144715.GG3195@xz-x1>
 <MWHPR11MB1886766DF6F20BC4153918C08C8F9@MWHPR11MB1886.namprd11.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <MWHPR11MB1886766DF6F20BC4153918C08C8F9@MWHPR11MB1886.namprd11.prod.outlook.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 Jean-Philippe Brucker <Jean-Philippe.Brucker@arm.com>,
 Jason Wang <jasowang@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Auger Eric <eric.auger@redhat.com>, Eugenio Perez Martin <eperezma@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kevin,

On Mon, Feb 08, 2021 at 07:03:08AM +0000, Tian, Kevin wrote:
> It really depends on the definition of dev-iotlb in this context. To me the
> fact that virtio-iommu needs to notify the kernel for updating split cache
> is already sort of dev-iotlb semantics, regardless of whether it's delivered 
> through a iotlb message or dev-iotlb message in a specific implementation. 😊

Yeah maybe it turns out that we'll just need to implement dev-iotlb for
virtio-iommu.

I am completely fine with that and I'm never against it. :) I was throwing out
a pure question only, because I don't know the answer.

My question was majorly based on the fact that dev-iotlb and iotlb messages
really look the same; it's not obvious then whether it would always matter a
lot when in a full emulation environment.

One example is current vhost - vhost previously would work without dev-iotlb
(ats=on) because trapping UNMAP would work too for vhost to work.  It's also
simply because at least for VT-d the driver needs to send both one dev-iotlb
and one (probably same) iotlb message for a single page invalidation.  The
dev-iotlb won't help a lot in full emulation here but instead it slows thing
down a little bit (QEMU has full knowledge as long as it receives either of the
message).

Thanks,

-- 
Peter Xu


