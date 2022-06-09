Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 733EA544B1F
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 13:58:04 +0200 (CEST)
Received: from localhost ([::1]:46670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzGnb-0008FI-9g
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 07:58:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nzEP0-0005LR-OL
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:24:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48317)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nzEOz-0008Ri-F9
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:24:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654766668;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=weSV4riuwA/1yKba5L1mNdOw/RmXkQhUtB4JZWtu61A=;
 b=bdenuYsUGRdDU8CKCcjr3lSZt/sWIibhy7gEaxmT8vWwumrVaHKGHK8SiROQPkNBmyZpD8
 ngHBNHMPqNCb4/C4xU8G43ZZUwb4O164FUFwaATxgu8upanyQr8jjtKnSQsS7eoi7iiNoF
 N9XNOvqqhQyrUbYz02rgiFR3KPNJEu0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-380-jubZT1EWMAClZSGmwtQXyA-1; Thu, 09 Jun 2022 05:24:25 -0400
X-MC-Unique: jubZT1EWMAClZSGmwtQXyA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C6D10800882;
 Thu,  9 Jun 2022 09:24:24 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8342840E80E0;
 Thu,  9 Jun 2022 09:24:24 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 245691800094; Thu,  9 Jun 2022 11:24:23 +0200 (CEST)
Date: Thu, 9 Jun 2022 11:24:23 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Volker =?utf-8?Q?R=C3=BCmelin?= <vr_qemu@t-online.de>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH 0/2] Fixes for ui/gtk-gl-area
Message-ID: <20220609092423.beoirvkmeextihhp@sirius.home.kraxel.org>
References: <e0db9981-fe2f-67ec-63df-ff0c8e4cd690@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e0db9981-fe2f-67ec-63df-ff0c8e4cd690@t-online.de>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
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

On Sun, Jun 05, 2022 at 10:50:28AM +0200, Volker Rümelin wrote:
> The first patch fixes a GL context leak.
> 
> The second patch fixes a black guest screen on Wayland with OpenGL
> accelerated QEMU graphics devices. This bug doesn't seem to be related to
> issues #910, #865, #671 or #298.

Both queueed up.

thanks,
  Gerd


