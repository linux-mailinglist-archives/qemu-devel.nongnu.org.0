Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F093D3DAC
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 18:36:30 +0200 (CEST)
Received: from localhost ([::1]:44790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6yA1-00032n-D0
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 12:36:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m6y8K-0000OW-EU
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 12:34:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m6y8I-00074F-Vw
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 12:34:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627058082;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Rh+MXpU6QdIYDZM4TF1eoJE14yYVPDfmiIgvFbAasow=;
 b=cwOA6kAJiPvS78vXFy9TC2bbL7BeDyZcz7PfsjNBe5OHqQyoVo5+M3lSLkdA1n1ZB0ZYlv
 8EVgSr5bHhay12vg/7TRat7uYjmKv0sVcVaauQjkUU1sjCk0z9dK4sUi5r6VTeuHxl97iU
 7aODw5R3Qp6BAINgmBdpB8TvVh6kw+U=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-153-tkjq5iesOhKrJrDk1BYBQQ-1; Fri, 23 Jul 2021 12:34:38 -0400
X-MC-Unique: tkjq5iesOhKrJrDk1BYBQQ-1
Received: by mail-qv1-f69.google.com with SMTP id
 h12-20020a0562140dacb029030449450d37so2091346qvh.14
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 09:34:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Rh+MXpU6QdIYDZM4TF1eoJE14yYVPDfmiIgvFbAasow=;
 b=haf5+vXjgXqlx+MjH1LjOYn7iHLcGXVCuP14cTvFR2T0xlWTEnw/KLD2yBIRY6HqfI
 UUHc5ZZE2EUpVqLfK8pGmDE6uzUJjtKNDy1cf9WR+XJmTobIQvV7ME+zY2ZpwNxpHtVe
 fPavMFpdUdBIkPVnA5uYL2vaQDQp/xqhq2qKZAAFY4iaucbwJG7AnnbfvzaK5tQ/2lkl
 LKae17TladlpNvRWxt8q1HQmNQvA90+6A85xo5pAjZmw2RfntbO43vHaMAq9OJSllmT2
 2ajy8Stff7xB1a6O7onIIPO8ID0vn2mm6o0hYdcTyXT6vbm9mIBWUhp10UFV2jVg1yy5
 ZfAQ==
X-Gm-Message-State: AOAM531207DrcyWnDTQ1GjkMgNfJ0fos9Z9+8DZa4d+WJ7HbvxM7fRqi
 7DXWu8VhwTbT644cbIdEgVOeCy64O9lXX3/TMv0N1y3nkpT/QzNwxSvPERrb8lCds0ZdSkku0TD
 FouQYtqjIhTxphLY=
X-Received: by 2002:ac8:7482:: with SMTP id v2mr4707714qtq.84.1627058078521;
 Fri, 23 Jul 2021 09:34:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyoTTu+B0sIrbx0fCxXh+9ePfTqyx2+LkornJVWZoLDkvgGskL8Fb5MqwKsc9BkvukSCJAYSg==
X-Received: by 2002:ac8:7482:: with SMTP id v2mr4707695qtq.84.1627058078342;
 Fri, 23 Jul 2021 09:34:38 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id h16sm6228869qtx.23.2021.07.23.09.34.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 09:34:37 -0700 (PDT)
Date: Fri, 23 Jul 2021 12:34:35 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2 1/6] memory: Introduce replay_discarded callback for
 RamDiscardManager
Message-ID: <YPrvm+ChrMg9qt5X@t490s>
References: <20210721092759.21368-1-david@redhat.com>
 <20210721092759.21368-2-david@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210721092759.21368-2-david@redhat.com>
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

On Wed, Jul 21, 2021 at 11:27:54AM +0200, David Hildenbrand wrote:
> Introduce replay_discarded callback similar to our existing
> replay_populated callback, to be used my migration code to never migrate
> discarded memory.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>

Acked-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


