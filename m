Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 612755D25C
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jul 2019 17:05:42 +0200 (CEST)
Received: from localhost ([::1]:54286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hiKLk-0003VH-QS
	for lists+qemu-devel@lfdr.de; Tue, 02 Jul 2019 11:05:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56480)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <berto@igalia.com>) id 1hiKFl-0000VF-2F
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 10:59:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berto@igalia.com>) id 1hiKFk-000319-3z
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 10:59:28 -0400
Received: from fanzine.igalia.com ([91.117.99.155]:35662)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <berto@igalia.com>)
 id 1hiKFg-0002vW-V2; Tue, 02 Jul 2019 10:59:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=rs+gluQY9ImyC6JKK87QcTTcQpd0jkUJwAwwGFDRzV4=; 
 b=IyIOeANGikOWUxmBE8iKr17ArOzEFXxodyER89impUEBKp4HFrHuBdxOX+ChUuGdIKlhd1k7WfDgP9uzFbGiyuvFmfptWWWRr1KrEqiPKaCGRYeMoHSVwKGAzDMvFF6Ub0fMS541eaRu4zROu9ce21+mISOBC+snkiYPjtY/o0Bn2R75H/Eq0OpkMbWOGkfcMigmf1Npj1AvhskgSZGfeWEYEUTRzSKKUusO3iTzx2LJYlmDw69KOV0JjZxod5bp038bq9YAxzks1gTpDJJ2rW9e/oDcOfhL4zcSCwqsC7htNb/qJmZfSLHSXNWEXbyJvwkJtQlyIfvs7NKg/pVFmg==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1hiKFe-0007mI-8J; Tue, 02 Jul 2019 16:59:22 +0200
Received: from berto by mail.igalia.com with local (Exim)
 id 1hiKFe-0006QO-58; Tue, 02 Jul 2019 16:59:22 +0200
From: Alberto Garcia <berto@igalia.com>
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
In-Reply-To: <20190627223255.3789-6-mreitz@redhat.com>
References: <20190627223255.3789-1-mreitz@redhat.com>
 <20190627223255.3789-6-mreitz@redhat.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Tue, 02 Jul 2019 16:59:22 +0200
Message-ID: <w51pnms5vp1.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
 timestamps) [generic] [fuzzy]
X-Received-From: 91.117.99.155
Subject: Re: [Qemu-devel] [PATCH 5/5] iotests: Add new case to 030
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri 28 Jun 2019 12:32:55 AM CEST, Max Reitz wrote:
> We recently removed the dependency of the stream job on its base node.
> That makes it OK to use a commit filter node there.  Test that.
>
> Signed-off-by: Max Reitz <mreitz@redhat.com>

Reviewed-by: Alberto Garcia <berto@igalia.com>

Berto

