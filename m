Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 980D9DC5AE
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Oct 2019 15:03:27 +0200 (CEST)
Received: from localhost ([::1]:39622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iLRug-00010f-JE
	for lists+qemu-devel@lfdr.de; Fri, 18 Oct 2019 09:03:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46548)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <qemu_oss@crudebyte.com>) id 1iLRtC-0000Xi-Hr
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 09:01:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <qemu_oss@crudebyte.com>) id 1iLRtB-0005hU-Ej
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 09:01:54 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:45635)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <qemu_oss@crudebyte.com>)
 id 1iLRtB-0005fa-0M
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 09:01:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=lUZTiIFncHJeXOi5J/2VZFEf12AQC20Mmsmwws0C28s=; b=M3uWcrV1kKukO3IRe0FA5G4QKH
 S+3vDcD0d+gPj82rZOFjrQmgL4nhd1APMpUtSwno10OsIv34z/y7ir3vzkjrvvXi8pL2dphGrx64O
 gvHykdcGYDpprnIIqe92aFZ7aFMPsYF3NsC5PKRUXGI6srTRIU2DpiVkHsS1UmEF275BrVUuF1HwS
 FcvZNiVYY9JhokUx0tAbp1oZ3Skh1kzRVrZ2qquQtasbRIse/bwItOiklsHy2JhYNjrXpdrms+JbF
 LsqQ76pNbJZO0VUyj3mapNzfPc5PjsijLPYQlBgYKINLSERzQRB2G7iSVrU8HGa4pdbJeTQVC1GHV
 N3CoibwNv1boz4FVn6J9iSyzuhpArcOEAFPwKZmj5L3AnjVh6OH0SFugRdDBCw6O8f9ywVtLzwzMD
 7mtwFqT6D2r15vURRcgLqmM8jtTHL87I28OzvsYA+VvYaAgQ/iuznRBcM/eJMT12h2rzJQW+oEZJq
 xFwl9gHTp/uXYa22Q9/TLV4kWuoHGi2tvrt/HPrrw7jeP916mvI2/lAvZnYdOajOUSI1Bl1h6Gyt8
 WwQZKq36yj+NQQ2oQO76P4nUrZhYLQjr0axmNyp1e3l6wjsfP4kGsMUh471lmZE0Hmw3X5hgMw0Rn
 Ji6O0yFIqtw2YIbn6dPcek5INFz7cY9BNOvmA/J8w=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hikaru Nishida <hikarupsp@gmail.com>
Subject: Re: [PULL 1/4] ui: Fix hanging up Cocoa display on macOS 10.15
 (Catalina)
Date: Fri, 18 Oct 2019 15:01:50 +0200
Message-ID: <2488172.SrBWvpgbjs@silver>
In-Reply-To: <20191018101711.24105-2-kraxel@redhat.com>
References: <20191018101711.24105-1-kraxel@redhat.com>
 <20191018101711.24105-2-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 5.189.157.229
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

On Freitag, 18. Oktober 2019 12:17:08 CEST Gerd Hoffmann wrote:
> From: Hikaru Nishida <hikarupsp@gmail.com>
> 
> macOS API documentation says that before applicationDidFinishLaunching
> is called, any events will not be processed. However, some events are
> fired before it is called in macOS Catalina.

Even though fixed now on qemu side, I filed a bug report with Apple to let 
them know, since this indeed looks like unintended behaviour change a.k.a. bug 
in Catalina.

Best regards,
Christian Schoenebeck




