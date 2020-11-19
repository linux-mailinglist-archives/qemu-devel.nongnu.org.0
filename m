Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA83D2B9AE2
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 19:49:29 +0100 (CET)
Received: from localhost ([::1]:41208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfozo-0004Ly-T9
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 13:49:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kfoy0-00038I-MG
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 13:47:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kfoxy-0002dv-V3
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 13:47:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605811652;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2tmgNhlA8OxpDKIo26Y99bf7mrpPvnce3z0/ghHWpB4=;
 b=Z2uS4QjPXM+qFn6dV/ReB1YrnZhJXM8p3dTltRuFaWFNwuuIkLJAgTy+JujJPIxgtJs8Yn
 I1D+lU+BklRzNfZtZ/KZ7B/og6F9jYGJbABtOKCAYSrFiVLVSAQJbhaEp2+Yn3f5/4OZbm
 mWbCXTCETxEvFLdUSGmZE8tUuHXUdq0=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-z3KFTE55PNKgtAY_d9ugIg-1; Thu, 19 Nov 2020 13:47:30 -0500
X-MC-Unique: z3KFTE55PNKgtAY_d9ugIg-1
Received: by mail-qv1-f70.google.com with SMTP id dp12so5260558qvb.2
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 10:47:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2tmgNhlA8OxpDKIo26Y99bf7mrpPvnce3z0/ghHWpB4=;
 b=eNZp7k4TEKNWsqQ52qDV65uvUQnJIDVjm1gF5KrATFfGsCidTysHtlXMc2TTEj3EqP
 rdSRTreVaD58whmkJaogZq5Amu4DDj+9pjZ8rQXM9DQ7GAKlY6FlPwo56a0RuqKfDc8f
 0JkxmIrOZanrhzfGgo06eGn8+pKil27bw+Utjw7T4uOelI9UoFF4lJepUq/OFsSiLajF
 jVnt1Avqke70qCYzURfjaKTOXQ2KbbViBlqhZCJ+2kWjkuctyWB7qobnNrY5NCpq1Qgq
 71eZR4lw4xtPlvDijKQykn27l+p7tkSZEnN6sO26enWlAUnEfV4/pt0bp/xsDFFk2/6J
 LfoQ==
X-Gm-Message-State: AOAM531oDzDfFDBq7QivrgvHQpgggW5aBKnCLI9a0stwe/N1WThCCini
 yF8nFp53+mT8R/uIeg0KHmU9jdvIj68j5sxlcBZGuadlmUiqjXmYDvzeHl4fLMccdg5ZD7PYLl0
 64n4IgBC8k1J1Uv8=
X-Received: by 2002:a37:444d:: with SMTP id r74mr13119665qka.105.1605811650004; 
 Thu, 19 Nov 2020 10:47:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy285ak9lE0ijO7AN49IMbgyQ5RA8XQBWDv59G4Of/kT1Xnohth4yawSTczCmwodRXFQSiwgw==
X-Received: by 2002:a37:444d:: with SMTP id r74mr13119647qka.105.1605811649822; 
 Thu, 19 Nov 2020 10:47:29 -0800 (PST)
Received: from xz-x1
 (bras-vprn-toroon474qw-lp130-20-174-93-89-196.dsl.bell.ca. [174.93.89.196])
 by smtp.gmail.com with ESMTPSA id z88sm474615qtd.46.2020.11.19.10.47.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 10:47:29 -0800 (PST)
Date: Thu, 19 Nov 2020 13:47:27 -0500
From: Peter Xu <peterx@redhat.com>
To: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: Re: [PATCH v3 4/7] implementation of write-tracking migration thread
Message-ID: <20201119184727.GE6538@xz-x1>
References: <20201119125940.20017-1-andrey.gruzdev@virtuozzo.com>
 <20201119125940.20017-5-andrey.gruzdev@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20201119125940.20017-5-andrey.gruzdev@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Den Lunev <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 19, 2020 at 03:59:37PM +0300, Andrey Gruzdev via wrote:
> Signed-off-by: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>

Some commit message would always be appreciated...  Thanks,

-- 
Peter Xu


