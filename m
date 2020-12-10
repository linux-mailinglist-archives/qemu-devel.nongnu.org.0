Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F532D5C25
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 14:43:30 +0100 (CET)
Received: from localhost ([::1]:47980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knMED-0004YH-1Q
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 08:43:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1knKzZ-0006cx-6Y
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 07:24:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1knKzX-0001f0-B2
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 07:24:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607603054;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ROX+Krznmt559n6QOJxJXGNnPQFmwL3N/4G/KnsWQps=;
 b=IhTol3q4noEHOpBVA8cAHe9/o8RWgKGJjq2MlAeSA22di4+UhTS36wFy5CVg+/e25L3i4C
 EszWzxwzBrgNJqpLGIsM+wqpgSAYJgBoccQa3e5VaeIcbCIJhiDRloqvcekHtzb8eO+nle
 Vy5fULLt3VBHJJ54PGRY9N6NRRFvW3M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-535-ypHwvS4uMoeI6ksSPf0WJg-1; Thu, 10 Dec 2020 07:24:12 -0500
X-MC-Unique: ypHwvS4uMoeI6ksSPf0WJg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A0CCB107ACE6;
 Thu, 10 Dec 2020 12:24:11 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-94.ams2.redhat.com
 [10.36.112.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 173AB60BF1;
 Thu, 10 Dec 2020 12:24:11 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 533CC9D92; Thu, 10 Dec 2020 13:24:10 +0100 (CET)
Date: Thu, 10 Dec 2020 13:24:10 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Nikola Pavlica <pavlica.nikola@gmail.com>
Subject: Re: [PATCH v2 1/1] ui/gtk: Launching GTK UI with OpenGL on causes
 the? refreshrate update to not run
Message-ID: <20201210122410.a6vphl47cg5byk3v@sirius.home.kraxel.org>
References: <3M7XKQ.PR753U54CKM21@gmail.com>
MIME-Version: 1.0
In-Reply-To: <3M7XKQ.PR753U54CKM21@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> /* ui/gtk.c */
> void gd_update_windowsize(VirtualConsole *vc);
> +int gd_refresh_rate_millihz(GtkWidget *window);

Patch is whitespace-mangled.
Can you resend with "git send-email"?

thanks,
  Gerd


