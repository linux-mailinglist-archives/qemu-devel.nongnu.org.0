Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 910CD258C53
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Sep 2020 12:06:50 +0200 (CEST)
Received: from localhost ([::1]:49850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kD3Bh-00022P-JW
	for lists+qemu-devel@lfdr.de; Tue, 01 Sep 2020 06:06:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gson@gson.org>) id 1kD39b-0006Y1-Vo
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 06:04:40 -0400
Received: from gusty.araneus.fi ([185.55.84.130]:56133)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gson@gson.org>) id 1kD39Z-00058I-JI
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 06:04:39 -0400
Received: from guava.gson.org (unknown [10.0.1.131])
 by gusty.araneus.fi (Postfix) with ESMTP id E3647DB77A5;
 Tue,  1 Sep 2020 10:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=gson.org; s=mail;
 t=1598954673; bh=ybb7f8OuvE57phIK1qzUvLKrRkp3UAYsi+L9bropgao=;
 h=Date:To:Cc:Subject:In-Reply-To:References:From;
 b=HH+0AiG5tz62NftrpMcPBpad9HiaZ1F0q17wmCmhUuG14uTZNbiVoCTa8wphmlgeH
 sI8G7jNFU+xIcpTtKmO8PTbEgswFgb1pcCb707CgbVJ4vi6MFBC9C8h55uaKyGTiAa
 hhUECO7xF2DjpRKqaspg4imsa7YruE+/KeGzSkDs=
Received: by guava.gson.org (Postfix, from userid 101)
 id 3AC92253F75; Tue,  1 Sep 2020 13:04:33 +0300 (EEST)
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Message-ID: <24398.7344.766565.660029@guava.gson.org>
Date: Tue, 1 Sep 2020 13:04:32 +0300
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [RFC PATCH v2] hw/display/tcx: Allow 64-bit accesses to
 framebuffer stippler and blitter
In-Reply-To: Re: <5a7d94f9-eaec-c8f6-da4a-3ec0cfc68961@amsat.org>
References: <20200822142127.1316231-1-f4bug@amsat.org>
 <24395.20047.450062.992384@guava.gson.org>
 <5a7d94f9-eaec-c8f6-da4a-3ec0cfc68961@amsat.org>
X-Mailer: VM 8.2.0b under 25.3.1 (x86_64--netbsd)
From: Andreas Gustafsson <gson@gson.org>
Received-SPF: pass client-ip=185.55.84.130; envelope-from=gson@gson.org;
 helo=gusty.araneus.fi
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/01 06:04:34
X-ACL-Warn: Detected OS   = ???
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.13,
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
Cc: Michael Lorenz <macallan@NetBSD.org>, 1892540@bugs.launchpad.net,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=E9 wrote:
> Thanks, can I add "Tested-by: Andreas Gustafsson <gson@gson.org>"
> to the patch=3F

Fine by me.
--=20
Andreas Gustafsson, gson@gson.org

