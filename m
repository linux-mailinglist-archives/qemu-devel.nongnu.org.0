Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1790814CAD6
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jan 2020 13:27:35 +0100 (CET)
Received: from localhost ([::1]:45648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iwmRS-0000Jj-3u
	for lists+qemu-devel@lfdr.de; Wed, 29 Jan 2020 07:27:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52859)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iwmDK-00018n-3E
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 07:13:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iwmDI-0004sm-Rr
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 07:12:57 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:42265
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1iwmDI-0004m5-Mc
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 07:12:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580299975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=xtlpPNteAkIObySpEHC7/JjtpXYOcPDiTSxNaCtK4eA=;
 b=b0qgmYzEj+aEmmTZYb/xChqF3HCriLKYZ/yPWaf3TA3sS6oc8CF8ezPSyYtvflgHlwTbOT
 qAH04gMyF52fJDReocHwZZbsoY/a9U9boKMduXWZ5iNqugqNNMdntJduEGcxcXcAacZTJO
 fYQ4XeXh4bR0Qw9AR8l1hRMMP/FCB6c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-116-juBWDYurOkCTR7_RBJ3uHw-1; Wed, 29 Jan 2020 07:12:53 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B9B36800D55
 for <qemu-devel@nongnu.org>; Wed, 29 Jan 2020 12:12:52 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-210.ams2.redhat.com [10.36.116.210])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B344E6315B;
 Wed, 29 Jan 2020 12:12:44 +0000 (UTC)
Subject: Re: [PATCH 119/142] Aaaaallelujah!
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20200128175342.9066-1-pbonzini@redhat.com>
 <20200128175342.9066-120-pbonzini@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <c6464834-4dba-2ed2-fe67-2a28d128ba21@redhat.com>
Date: Wed, 29 Jan 2020 13:12:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200128175342.9066-120-pbonzini@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: juBWDYurOkCTR7_RBJ3uHw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/01/2020 18.53, Paolo Bonzini wrote:
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>=20
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---

Well, even for an RFC series, you could choose a better patch subject.
And please add a short description what this patch is all about.

 Thanks,
  Thomas


