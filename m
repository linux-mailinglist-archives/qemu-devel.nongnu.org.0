Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28069456D1A
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 11:18:22 +0100 (CET)
Received: from localhost ([::1]:51280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo0yL-0000ES-95
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 05:18:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1mo0vq-0007K3-Nu
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 05:15:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1mo0vk-0004GO-6i
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 05:15:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637316939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JmI3+nns/+dyOS9oWFg+neKj6lEtYVtWQ4LaRPVGB6I=;
 b=NBsJFeLoeA4HYSlap1A+gYRyoUnAKSvLh+FPszTjg8cbRHG31ab0x4SYP8+xwFyrdf6JX0
 1pOW7XQfzW8gp1uqgc9vEr4Hhe+UyntXzdf2ZRcVBzqtUQRuM2A4XWVtMPAuayn6arx7cO
 294ORaOKFLvgukfEslY0ztLdgZFJtPI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-368-PFX85hcZPnCc0eZxH4-SKQ-1; Fri, 19 Nov 2021 05:15:28 -0500
X-MC-Unique: PFX85hcZPnCc0eZxH4-SKQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E121B102C84E
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 10:15:27 +0000 (UTC)
Received: from paraplu (unknown [10.39.192.221])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 91CE110190A7;
 Fri, 19 Nov 2021 10:15:23 +0000 (UTC)
Date: Fri, 19 Nov 2021 11:15:20 +0100
From: Kashyap Chamarthy <kchamart@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Other pages for docs/devel/ [Was: Re: ... Update URLs of
 "SubmitAPatch" ...]
Message-ID: <YZd5OLlyKegEphY9@paraplu>
References: <20211118170028.820558-1-kchamart@redhat.com>
 <99a6b686-c2c4-dd5e-fe8c-9940311cdaca@redhat.com>
MIME-Version: 1.0
In-Reply-To: <99a6b686-c2c4-dd5e-fe8c-9940311cdaca@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kchamart@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kchamart@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 19, 2021 at 10:09:27AM +0100, Paolo Bonzini wrote:

[...]

> Hi, I'm applying instead
> https://lore.kernel.org/r/20211118074702.216951-2-pbonzini%40redhat.com
> (sorry, you couldn't know of the magic redirect since that's done directly
> on shell.qemu.org's Apache configuration).

Ah, no problem; I missed this one.  I sent mine as Thomas mentioned
updating the website on IRC; so I assumed a patch didn't already exist.

> The report-a-bug and security-process pages of the website are also
> candidates for moving to docs/devel, by the way!

Noted; so these two pages:

- https://www.qemu.org/contribute/security-process/
- https://www.qemu.org/contribute/report-a-bug/

What about these two other pages (which are also linked to from the
"contribute"[1] part of the website)?  Do they belong to docs/devel?  If
not, should they be part of 'qemu-web', instead of the wiki?

    - https://wiki.qemu.org/Contribute/FAQ
    - https://wiki.qemu.org/Documentation/GettingStartedDevelopers


[1] https://www.qemu.org/contribute/

[...]

-- 
/kashyap


