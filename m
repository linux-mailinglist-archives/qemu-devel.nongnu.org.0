Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8AA3030B9
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 01:02:13 +0100 (CET)
Received: from localhost ([::1]:39674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4BoD-0005ID-1A
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 19:02:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1l4BnJ-0004rb-My
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 19:01:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54055)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1l4BnC-0004r4-FL
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 19:01:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611619268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nbvz0YKVlTvPvu1tvmrz/Qz6VlfSPpuFjsqRzT9jBSw=;
 b=ErUs4nqXHGAj6MKUw8Ee8z/B3WUJovE8hBiH+XfM8T66cgksz1WtynQNO+qdhDUWXH342J
 aPTRXWJUAwpkbUrO/H0B5W0fQDUA1WmeL3C4m/YVa+14L1WOMilPRYNz8oEwvph1J2mHaI
 9sGaS2Qphqx8reZ0y0rzboQjdQ2nqD8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-574-qyvyrXpANwWhWQTPHgfbag-1; Mon, 25 Jan 2021 19:01:06 -0500
X-MC-Unique: qyvyrXpANwWhWQTPHgfbag-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA14E180A0A2
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 00:01:05 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-112-67.ams2.redhat.com
 [10.36.112.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 23A2D6F45C;
 Tue, 26 Jan 2021 00:01:01 +0000 (UTC)
Subject: Re: [PATCH v2 0/2] vnc: unbreak older gtk-vnc
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20210125104041.495274-1-kraxel@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <20179070-a63d-f55d-a6bd-11b5c10e2ea1@redhat.com>
Date: Tue, 26 Jan 2021 01:01:01 +0100
MIME-Version: 1.0
In-Reply-To: <20210125104041.495274-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/25/21 11:40, Gerd Hoffmann wrote:
> 
> 
> Gerd Hoffmann (2):
>   Revert "vnc: move initialization to framebuffer_update_request"
>   vnc: send extended desktop resize on update requests
> 
>  ui/vnc.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 

I didn't test desktop resize, but I can confirm the regression is gone.

Tested-by: Laszlo Ersek <lersek@redhat.com>

Thanks!
Laszlo


