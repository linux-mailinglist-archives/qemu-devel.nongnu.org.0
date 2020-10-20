Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E812938CE
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Oct 2020 12:04:04 +0200 (CEST)
Received: from localhost ([::1]:48572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUoUt-0008Rm-Fx
	for lists+qemu-devel@lfdr.de; Tue, 20 Oct 2020 06:04:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1kUoSv-0006zr-3c
 for qemu-devel@nongnu.org; Tue, 20 Oct 2020 06:02:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1kUoSt-000756-5w
 for qemu-devel@nongnu.org; Tue, 20 Oct 2020 06:02:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603188118;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9UrYtwxmdaBxw1xZHh55rFO9CVWvQ2KtwA674zbLBwU=;
 b=G6dw+Pv8nVxwmNNHTs3kuFUsPD4snlgtLixPIbMmbzFHD0hl8XyMyzaZzabsTbS3uN5lF9
 pOgGcMfXZgc1COV8cnc2ART2efddkDgAIqlO0HsEW9KqqoJR4tQo4EzxylnFPGAyZZ79eF
 EXjZWAPXGAnaNSiSWw47VlyBMTQIYdw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-p6Ujo3QnPBmQusUkgSsP9w-1; Tue, 20 Oct 2020 06:01:56 -0400
X-MC-Unique: p6Ujo3QnPBmQusUkgSsP9w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5F7B1100670B;
 Tue, 20 Oct 2020 10:01:55 +0000 (UTC)
Received: from kaapi (ovpn-112-157.phx2.redhat.com [10.3.112.157])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3789310027A5;
 Tue, 20 Oct 2020 10:01:52 +0000 (UTC)
Date: Tue, 20 Oct 2020 15:31:49 +0530 (IST)
From: P J P <ppandit@redhat.com>
X-X-Sender: pjp@kaapi
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH] net: remove an assert call in eth_get_gso_type
In-Reply-To: <819064ca-8fd2-ebd0-be88-9c5aae111bfb@redhat.com>
Message-ID: <nycvar.YSQ.7.78.906.2010201520190.1506567@xnncv>
References: <20201020081119.1578251-1-ppandit@redhat.com>
 <819064ca-8fd2-ebd0-be88-9c5aae111bfb@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ppandit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed;
 boundary="-1463810047-1265470051-1603188114=:1506567"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ppandit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/20 01:15:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Jason Wang <jasowang@redhat.com>, Gaoning Pan <pgn@zju.edu.cn>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.
---1463810047-1265470051-1603188114=:1506567
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

+-- On Tue, 20 Oct 2020, Philippe Mathieu-Daudé wrote --+
| Maybe LOG_UNIMP with useful fields, so when user send bug report we directly 
| know what has to be implemented.

  qemu_log("Probably not GSO frame, unknown L3 protocol: %hd\n", l3_proto);

Maybe just qemu_log()? LOG_UNIMP seems mismatching.

Thank you.
--
Prasad J Pandit / Red Hat Product Security Team
8685 545E B54C 486B C6EB 271E E285 8B5A F050 DE8D
---1463810047-1265470051-1603188114=:1506567--


