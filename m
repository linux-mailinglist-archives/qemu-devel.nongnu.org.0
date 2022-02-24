Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E86C24C3068
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 16:55:34 +0100 (CET)
Received: from localhost ([::1]:41552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNGSs-0002js-0v
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 10:55:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nNGRH-0000je-Py
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 10:53:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nNGRE-0001fE-QN
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 10:53:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645718032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AVqHEInD43RWbcJxfP53gjmmo1cwvqtGX5DObB+rBbg=;
 b=AJC0zN97S6KkaAPQooO798sEmjVqiYOseXGwTjn/ortJysJv8etLVQ909ASsPde8QmGwlN
 u6SvxIRDlBjIcp11CptskupH4oFY8MjFci9TS4VjSYgjirbCfEvC6mcR0KIO8cS1SadAxG
 GqSyOCx7j5ewlbUgzjdU2LlH85d9Xak=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-142-5c2H1iwAOKiaNpj9KombAg-1; Thu, 24 Feb 2022 10:53:46 -0500
X-MC-Unique: 5c2H1iwAOKiaNpj9KombAg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5004D80D6A7;
 Thu, 24 Feb 2022 15:53:45 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.240])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A22211077C8C;
 Thu, 24 Feb 2022 15:53:36 +0000 (UTC)
Date: Thu, 24 Feb 2022 09:53:34 -0600
From: Eric Blake <eblake@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH 7/8] Drop qemu_foo() socket API wrapper
Message-ID: <20220224155334.e2jqp77rzvia6osb@redhat.com>
References: <20220222194008.610377-1-marcandre.lureau@redhat.com>
 <20220222194008.610377-8-marcandre.lureau@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220222194008.610377-8-marcandre.lureau@redhat.com>
User-Agent: NeoMutt/20211029-364-42e4ad
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 22, 2022 at 11:40:07PM +0400, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> The socket API wrappers were initially introduced in commit
> 00aa0040 ("Wrap recv to avoid warnings"), but made redundatant with

redundant

> commit a2d96af4 ("osdep: add wrappers for socket functions") which fixes
> the win32 declarations and thus removed the earlier warnings.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


