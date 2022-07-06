Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 052EF567CCD
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 05:49:58 +0200 (CEST)
Received: from localhost ([::1]:56088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8w32-0008OG-LR
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 23:49:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1o8w0V-00078l-Gt
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 23:47:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1o8w0S-0002ca-3G
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 23:47:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657079234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=yNGCa1/5CCrAexalG+Awcyk+LCZ9I/ufSvkVYTvmgF8=;
 b=VaLej/bJA8sRdZNOsP8kDH7c+LdAi/heNt+qgWb5sR1TwKwGGqQ8MpMfDy3SJw2ikJeJAL
 yvZQluGvalebwf/MNx4GhO6rirM83dvr9hO5wV/yBHrdkiA+1XHpPMgxLp7U3WDpxzu7Ym
 AWex/IW2G0MnP7Us4NJaO3u8WjyrOBU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-656-ctQChP_lOPSiPCNYJuUXtg-1; Tue, 05 Jul 2022 23:47:11 -0400
X-MC-Unique: ctQChP_lOPSiPCNYJuUXtg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2B59885A580;
 Wed,  6 Jul 2022 03:47:11 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-233.pek2.redhat.com
 [10.72.12.233])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7DA60140EBE4;
 Wed,  6 Jul 2022 03:47:09 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: Jason Wang <jasowang@redhat.com>
Subject: [PULL 0/2] Net patches
Date: Wed,  6 Jul 2022 11:47:04 +0800
Message-Id: <20220706034706.36620-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The following changes since commit 39e19f5f67d925c60278a6156fd1776d04495a93:

  Merge tag 'pull-xen-20220705' of https://xenbits.xen.org/git-http/people/aperard/qemu-dm into staging (2022-07-05 22:13:51 +0530)

are available in the git repository at:

  https://github.com/jasowang/qemu.git tags/net-pull-request

for you to fetch changes up to a495eba03c31c96d6a0817b13598ce2219326691:

  ebpf: replace deprecated bpf_program__set_socket_filter (2022-07-06 11:39:09 +0800)

----------------------------------------------------------------

----------------------------------------------------------------
Ding Hui (1):
      e1000: set RX descriptor status in a separate operation

Haochen Tong (1):
      ebpf: replace deprecated bpf_program__set_socket_filter

 ebpf/ebpf_rss.c | 2 +-
 hw/net/e1000.c  | 5 ++++-
 2 files changed, 5 insertions(+), 2 deletions(-)



