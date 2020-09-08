Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF82260F0C
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Sep 2020 11:55:11 +0200 (CEST)
Received: from localhost ([::1]:55094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFaLG-0002b5-2H
	for lists+qemu-devel@lfdr.de; Tue, 08 Sep 2020 05:55:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1kFaKc-0002Ce-Gq
 for qemu-devel@nongnu.org; Tue, 08 Sep 2020 05:54:30 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:39459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1kFaKa-0004Ql-Bd
 for qemu-devel@nongnu.org; Tue, 08 Sep 2020 05:54:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=nc+r9JLLF/EvLZ2kXIt2Y2VFqkhQLUySDBZzHJVUPzs=; b=ha/BdUIeItrkb9FASeMAMLhEx+
 7BMcF7m6S/cglMtrtEp4AU83Fz3ZExyeNGQ+h1Vaydf92J5QaYhv/+ZM2xUZiUG85E9/pVzjY6C+Y
 FTjcQRawu9nlnsdOOzsIbNjCqCUd2YsijoFgdrtddyX/eUpKdoo20Qqv0mtfDb04zVX/zN8+M2kEb
 IwNKMvEoNt23XzqytxIyW1bbkHq0pDzM1qcWHbRqAsqAPvAAVnQrhTn/zsjg6RW8CP+u1vN8HsYcL
 vsHU5B3e69SRmeTMmKhnVwyJ28nYnyd4FTXzc+kE5K3g4oosmm8nF6JasaWQEQ7sDAbL7hJZ4HLYG
 hstkISxQ==;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH] 9pfs: disable msize warning for synth driver
Date: Tue, 08 Sep 2020 11:54:23 +0200
Message-ID: <20249333.xS2xAJuZbs@silver>
In-Reply-To: <4834247.Ya9cJq7G5r@silver>
References: <E1kEyDy-0006nN-5A@lizzy.crudebyte.com>
 <20200908101036.6b3a76db@bahia.lan> <4834247.Ya9cJq7G5r@silver>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Patchwork-State: Queued
Received-SPF: pass client-ip=91.194.90.13; envelope-from=qemu_oss@crudebyte.com;
 helo=lizzy.crudebyte.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/08 05:01:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Dienstag, 8. September 2020 11:01:15 CEST Christian Schoenebeck wrote:
> The command to change a patch state is, e.g.:
> 
> 	pwclient update -s Queued 11759645
> 
> When I do that I get this error:
> 
> 	The update action requires authentication, but no username or password
> 	is configured
> 
> So looks like it would require somebody to create an account somewhere,
> wherever that is.
> 
> Best regards,
> Christian Schoenebeck

This is just a test email to set patch state by X-Patchwork-State header, as 
documented here:

https://patchwork.readthedocs.io/_/downloads/en/latest/pdf/

Best regards,
Christian Schoenebeck



