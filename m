Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4871043B5
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Nov 2019 19:54:22 +0100 (CET)
Received: from localhost ([::1]:33584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iXV7N-0003bo-Ri
	for lists+qemu-devel@lfdr.de; Wed, 20 Nov 2019 13:54:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40159)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ehabkost@redhat.com>) id 1iXUyy-0004Sr-UC
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 13:45:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1iXUyx-00061m-QH
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 13:45:40 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:43162
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1iXUyx-00061S-MT
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 13:45:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574275539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z94xinx2+GD6eweKLda0ZSwWRKBK/RFn22QUeVIj6kI=;
 b=BCgT/1ZVHVBlq9+I+bnMbixTHKeqLDlnm81eHeI8/k7avjKKc3Sr+BkQHW9CKZvRmQvoSm
 2OJBkc9gT/aqSC1sFcVK+EoWI8BqOuq32jcoze3uN5KUwEYjwMcSC1bUdGUzq5sp2SukPx
 VrnP8XaPNneCqi3ev1RvzuZkwOEsiNI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-440-ynJftSw6PASW2oYfhQfA4A-1; Wed, 20 Nov 2019 13:45:35 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D459A107ACC5
 for <qemu-devel@nongnu.org>; Wed, 20 Nov 2019 18:45:34 +0000 (UTC)
Received: from localhost (ovpn-116-6.gru2.redhat.com [10.97.116.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6828B68434;
 Wed, 20 Nov 2019 18:45:34 +0000 (UTC)
Date: Wed, 20 Nov 2019 15:45:33 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] target/i386: add VMX features to named CPU models
Message-ID: <20191120184533.GT3812@habkost.net>
References: <20191120173753.8894-1-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191120173753.8894-1-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: ynJftSw6PASW2oYfhQfA4A-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 20, 2019 at 06:37:53PM +0100, Paolo Bonzini wrote:
> This allows using "-cpu Haswell,+vmx", which we did not really want to
> support in QEMU but was produced by Libvirt when using the "host-model"
> CPU model.

I understand guest ABI compatibility is not a concern, but I
don't remember how we guarantee it won't break by accident if
somebody tries to live migrate a VM.

What is supposed to happen today if trying to live migrate a VM
using "-cpu Haswell,+vmx"?

--=20
Eduardo


