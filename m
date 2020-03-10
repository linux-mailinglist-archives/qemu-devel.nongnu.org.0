Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F50D18042B
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Mar 2020 18:00:19 +0100 (CET)
Received: from localhost ([::1]:37070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jBiEs-0001mA-B5
	for lists+qemu-devel@lfdr.de; Tue, 10 Mar 2020 13:00:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57007)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1jBiDZ-0000G8-KZ
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 12:58:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1jBiDX-0007Ap-NM
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 12:58:56 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:47684
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1jBiDX-00075q-JA
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 12:58:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583859534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7qvpyV2erkC9lJOF+fS1KQMIEU7oYtyY/QEcW4FtBQA=;
 b=RU52fWAEt/+EgWiO+drL4W138ftTWjBaowQjLJG72Fbqb3v4bAQL6cxt+LtZDMm42Rp/ea
 c+SGpjcPTbTwVIYtb9KmCPSJkBxpG1Ig2C+FRuhU6vDMlTHk1UhljYyB0W5KBX203i98cV
 yR0Oei/uTP7OqfQt89LTx3wHBtHSwh8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-ZqkISmC2MMauo88sP3OAdQ-1; Tue, 10 Mar 2020 12:58:53 -0400
X-MC-Unique: ZqkISmC2MMauo88sP3OAdQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EF0DB1937FC0;
 Tue, 10 Mar 2020 16:58:51 +0000 (UTC)
Received: from linux.fritz.box (unknown [10.36.118.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 55FDD5D9C5;
 Tue, 10 Mar 2020 16:58:50 +0000 (UTC)
Date: Tue, 10 Mar 2020 17:58:48 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH] tests/qemu-iotests: Fix socket_scm_helper build path
Message-ID: <20200310165848.GG6926@linux.fritz.box>
References: <20200306165751.18986-1-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200306165751.18986-1-philmd@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 06.03.2020 um 17:57 hat Philippe Mathieu-Daud=E9 geschrieben:
> The socket_scm_helper path got corrupted during the mechanical
> refactor moving the qtests files into their own sub-directory.
>=20
> Fixes: 1e8a1fae7 ("test: Move qtests to a separate directory")
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

Thanks, applied to the block branch.

Kevin


