Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1AF43623B
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 14:59:26 +0200 (CEST)
Received: from localhost ([::1]:41946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdXfJ-0006y7-Ig
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 08:59:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mdXeB-0006Hl-8Y
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 08:58:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mdXe9-00018R-MG
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 08:58:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634821092;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nSPureDd0aXLzDPhTX0jVeRUY/WVdPa6be1bp6HEX/8=;
 b=f/klKC28ozEcwWXeHRYcgHzSMDoB3g3ShE9IxmpaFabEQlu4acPZr+bRsbHC3w6J+KmZQd
 mPhiQpa5iORuUOAkQLcEqXml/Ph+TtSTqMQya5TaFv/OZgM7WHN7BEH2GbeGFnQc8+DGxO
 aaYMZ2MS9NvcmpXeAfmlFXakitixEkk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-519-Ga7YW3GJM-eFCxmJYQGa4w-1; Thu, 21 Oct 2021 08:58:09 -0400
X-MC-Unique: Ga7YW3GJM-eFCxmJYQGa4w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 15C5510D2BED;
 Thu, 21 Oct 2021 12:57:40 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EF29660C49;
 Thu, 21 Oct 2021 12:57:25 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 541BE1800796; Thu, 21 Oct 2021 14:57:24 +0200 (CEST)
Date: Thu, 21 Oct 2021 14:57:24 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH] microvm: add device tree support.
Message-ID: <20211021125724.uvnmb3a4xjnu37au@sirius.home.kraxel.org>
References: <20211014193617.2475578-1-kraxel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211014193617.2475578-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Sergio Lopez <slp@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 14, 2021 at 09:36:17PM +0200, Gerd Hoffmann wrote:
> Allows edk2 detect virtio-mmio devices and pcie ecam.
> See comment in hw/i386/microvm-dt.c for more details.

Anyone picking this up?
Or should I do a one-patch pull request?

take care,
  Gerd


