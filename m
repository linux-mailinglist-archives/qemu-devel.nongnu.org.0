Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D016EF145
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 11:36:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prbXz-0002qJ-1A; Wed, 26 Apr 2023 05:34:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1prbXw-0002q7-G5
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 05:34:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1prbXu-0007wk-Jk
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 05:34:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682501681;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=v6WBc9k5uJaVm/KRKtUSGuPPnfV6TO4l8cztJEWPyL4=;
 b=SFAqB9iKtrQj0wMJEq+90/xbKZzm7xnzmq0WE2fa9D3ltPNd8oYz7tVP87A2W/5nbhGw77
 aZ9tK6Da77tMZU5Uerm9q2GV0B6MK6Q3VMg8cBeMcaaAfsDtHll9Xz5HZlG5BkpV/G5DY7
 SCFVUcpt78JH8m0nRVE28YC/S9w6w84=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-556-2qHahlWXPr2ixCINd4Njbg-1; Wed, 26 Apr 2023 05:34:37 -0400
X-MC-Unique: 2qHahlWXPr2ixCINd4Njbg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 74F0A101A555;
 Wed, 26 Apr 2023 09:34:37 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.194.1])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EA467492C13;
 Wed, 26 Apr 2023 09:34:36 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 509611800632; Wed, 26 Apr 2023 11:34:35 +0200 (CEST)
Date: Wed, 26 Apr 2023 11:34:35 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org, marcel.apfelbaum@gmail.com, mst@redhat.com, 
 philmd@linaro.org, david@redhat.com, peterx@redhat.com, pbonzini@redhat.com, 
 den-plotnikov@yandex-team.ru, lersek@redhat.com
Subject: Re: [PATCH v2 0/3] ROM migration
Message-ID: <ff2mkitasvnqmqujfpj654hnfz6txhiouwzcigkqbcgx4wkv2q@m7hszpppkk7w>
References: <20230425161434.173022-1-vsementsov@yandex-team.ru>
 <17200eef-53c0-71c2-6b7b-0f16514b223d@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17200eef-53c0-71c2-6b7b-0f16514b223d@yandex-team.ru>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

  Hi,

> As I understand, netcard ROM file is needed only for network boot. So,
> it's absolutely correct to use romfile="" option: network boot will
> not work, but everything else will work correctly. Is that right?

In most cases yes.

The exception to the rule is virtio-net with UEFI firmware.  OVMF and
ArmVirt images ship with a virtio-net driver included, so network
booting works without a nic rom.

take care,
  Gerd


