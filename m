Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 439793D3DB7
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 18:38:12 +0200 (CEST)
Received: from localhost ([::1]:50376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6yBf-0006s2-37
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 12:38:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m6y8Q-0000ge-K4
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 12:34:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m6y8P-000770-5D
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 12:34:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627058088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SqAkq+kIhxlcU9lKo8TEB6+AAhXt/4JRBq/LF9JRbW4=;
 b=QggasS/c5ygskPqTuUnJGr/O3XPCPI1NnpLIjc+0HiTTs6QXL5NzeTIf7RVpzy4zV6/kec
 Fboirhd4fiEfL3fcNr26PCVxN9PBERrALN/tICTBHxZQZRrmRFEsgFRS0POUZW1Y2S2lhw
 Wi4K63Pw5/84d5EUIQ35oIBGyIer19g=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-_zLRlnmZM4OZee5FJ-rTiw-1; Fri, 23 Jul 2021 12:34:47 -0400
X-MC-Unique: _zLRlnmZM4OZee5FJ-rTiw-1
Received: by mail-qk1-f200.google.com with SMTP id
 w2-20020a3794020000b02903b54f40b442so1611697qkd.0
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 09:34:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SqAkq+kIhxlcU9lKo8TEB6+AAhXt/4JRBq/LF9JRbW4=;
 b=Gl6g0IUxTus0ICa/4Jh5sF+akmvBxDvSXNdY5h8Z54W4+/QlTqyd8ifyCbMf0i+bgv
 0jkkSqFL8MAzqfKQoap2L5h4TNhTvPdnWd5gSXWiDiv7KQxzPHiP8mOiscek3OuhvxJA
 i4sXk+QShdrsdAhikkg2nAVj9OV12x+n3cyOl6osbJOzAtUFch+3OdZ+jmCTp1dPoqZc
 6MKv4/eViXdCUj9KixmDE/TIYYs2NZyc10WIXoWxd6f7gHEHfMIqMmXrDGgcJRFzpd4A
 P82DmGuSuyuOvwFq7vWhzZEboI0KCmw66j7KEnDqJ92TiY85NgRdppJ0ZtnPa49lPN9e
 mWFQ==
X-Gm-Message-State: AOAM530d66UnfoqpF6YEFxgfhZ4wOci0ovTzWJwPkyF/fRWe/2/vuoOr
 aRjGO68lOlTE4A6vYQaY16Oa3jUVuZzDsyHDpDcBsC3z2cU1xusWRN1ZPJmot3YjRGlgHyEEl3T
 7S9wB8umdrNGaXJY=
X-Received: by 2002:a05:620a:887:: with SMTP id
 b7mr5345765qka.447.1627058087061; 
 Fri, 23 Jul 2021 09:34:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7N/3QTz7y6m3WjkTmUhaK7SDWfr2AFqRH49Rtf7De113QOUZ5J3oHIUG/Z9dPnA15PjC3BA==
X-Received: by 2002:a05:620a:887:: with SMTP id
 b7mr5345756qka.447.1627058086870; 
 Fri, 23 Jul 2021 09:34:46 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id j5sm4492729qki.80.2021.07.23.09.34.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 09:34:46 -0700 (PDT)
Date: Fri, 23 Jul 2021 12:34:44 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2 2/6] virtio-mem: Implement replay_discarded
 RamDiscardManager callback
Message-ID: <YPrvpNbSVQ+QiIaY@t490s>
References: <20210721092759.21368-1-david@redhat.com>
 <20210721092759.21368-3-david@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210721092759.21368-3-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, teawater <teawaterz@linux.alibaba.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 21, 2021 at 11:27:55AM +0200, David Hildenbrand wrote:
> Implement it similar to the replay_populated callback.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>

Acked-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


