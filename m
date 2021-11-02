Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD0B442F2E
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 14:42:51 +0100 (CET)
Received: from localhost ([::1]:54592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhu3u-0004lm-TM
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 09:42:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mhtzB-0006qm-L6
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:37:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mhtz9-0004xg-Ih
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:37:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635860274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=H2vUenXGYIVFskHO/YD6T+7fVVRTzq3xuT+VAGNNDXw=;
 b=Ui52QVyBM/6zmlJ2OjcsEc2ik48X4XkBCXNu+KBZ5GCuE2C3VIJ7IneCN5dtwGvl5f4H/K
 rTrdI7+hjLtgFdFMBezyy/scwDRHnL09uR5qVEt9u27brtmpdUlQm1rxkaVJZ13fO6nTII
 t6JmfY+6vkscMihutbYz6P75eE7MmW8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-318-PrTxCLBlNC-24A4QnZmhvA-1; Tue, 02 Nov 2021 09:37:53 -0400
X-MC-Unique: PrTxCLBlNC-24A4QnZmhvA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7FEB7802B61;
 Tue,  2 Nov 2021 13:37:52 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.194.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 48F385C1C5;
 Tue,  2 Nov 2021 13:37:52 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 3CC97180092D; Tue,  2 Nov 2021 14:37:50 +0100 (CET)
Date: Tue, 2 Nov 2021 14:37:50 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Dongwon Kim <dongwon.kim@intel.com>
Subject: Re: [PATCH 1/4] ui/gtk-egl: un-tab and re-tab should destroy egl
 surface and context
Message-ID: <20211102133750.2s5elsswxtkfbn5y@sirius.home.kraxel.org>
References: <20210917001320.6515-1-dongwon.kim@intel.com>
 <20210917001320.6515-2-dongwon.kim@intel.com>
MIME-Version: 1.0
In-Reply-To: <20210917001320.6515-2-dongwon.kim@intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Khairul Anuar Romli <khairul.anuar.romli@intel.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 16, 2021 at 05:13:17PM -0700, Dongwon Kim wrote:
> An old esurface should be destroyed and set to be NULL when doing
> un-tab and re-tab so that a new esurface an context can be created
> for the window widget that those will be bound to.

Fails to build on windows (probably also on --disable-opengl builds).

take care,
  Gerd


