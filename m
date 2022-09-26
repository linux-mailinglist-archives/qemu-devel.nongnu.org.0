Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E30575E9E9D
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 12:07:51 +0200 (CEST)
Received: from localhost ([::1]:59282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocl1i-0002qw-Vj
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 06:07:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ockfC-0000oB-9h
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 05:44:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ockf9-00029I-L9
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 05:44:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664185470;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=x/gwWoyKlAtWeHq/pp2RXh2UPcHjGAhSoCtrr9IPhmE=;
 b=KLrOIvr29C+BJQ816+HKisUwVyqS1jAqPgc5Z/cuhwn/a/2kUWRaNEYtIrg2w/lH3CE11s
 oziF2dNzp4uww5zFPZ3Zc72KGNi9Hra2ogINDuH4A0gEU58UswrwjFl3PJMo4mYtrwKD5o
 3fgTmJ7dgouzZ2h8w0iMyhTeUp6xJ0Q=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-335-W_Q0DKufPAiOBv-bGZVIOw-1; Mon, 26 Sep 2022 05:44:27 -0400
X-MC-Unique: W_Q0DKufPAiOBv-bGZVIOw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E9C9E29AB44C;
 Mon, 26 Sep 2022 09:44:26 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B39902087442;
 Mon, 26 Sep 2022 09:44:26 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 555391803097; Mon, 26 Sep 2022 11:44:25 +0200 (CEST)
Date: Mon, 26 Sep 2022 11:44:25 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Antonio Caggiano <antonio.caggiano@collabora.com>
Cc: qemu-devel@nongnu.org, gert.wollny@collabora.com,
 dmitry.osipenko@collabora.com, "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2 2/2] virtio-gpu: Resource UUID
Message-ID: <20220926094425.abjquh3gcijnk3w5@sirius.home.kraxel.org>
References: <20220923134350.324402-1-antonio.caggiano@collabora.com>
 <20220923134350.324402-3-antonio.caggiano@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220923134350.324402-3-antonio.caggiano@collabora.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Fri, Sep 23, 2022 at 03:43:50PM +0200, Antonio Caggiano wrote:
> Enable resource UUID feature and implement command resource assign UUID.
> This is done by introducing a hash table to map resource IDs to their
> UUIDs.

It starts to become a bit messy with all the patches floating around
where the dependencies are not fully clear.  I think it makes sense to
put them all into a single virtio-gpu patches series, in correct order.

They also need more testing.  I had to kick out the patches I've queued
up because they broke 'make check'.  Both gl and non-gl variants of the
virtio-gpu devices need testing.

thanks,
  Gerd


