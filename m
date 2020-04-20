Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FEC1B06A6
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Apr 2020 12:33:39 +0200 (CEST)
Received: from localhost ([::1]:32970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jQTkA-0000MT-8I
	for lists+qemu-devel@lfdr.de; Mon, 20 Apr 2020 06:33:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55994 helo=eggs1p.gnu.org)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <qemu_oss@crudebyte.com>) id 1jQTiX-0007kj-7H
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 06:31:57 -0400
Received: from Debian-exim by eggs1p.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <qemu_oss@crudebyte.com>) id 1jQTiW-00062p-EN
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 06:31:56 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:54955)
 by eggs1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1jQTiV-0005us-Mr
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 06:31:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=3s7xzu1kv9L9aUYmFMnnuT8ibJFovZEePj1+HYcVsvs=; b=eOxCBK3e6iEfTa4JIzuYYbpqPD
 7Kzg13S67D91vH5ooalsxhMgUpcalEsNntDjux2q1fDKwKIwKj8+UksCihTB+I2sKP3gprIgNiISV
 xZEUkyw/qr9S/Mb178COJ9FQTDiTaAmLa0rN2V9/QORBMZapXWADguQiUS5UdSGSm2cCXapp5pPOD
 OZykjGIZypzCzu9Pcvjkuh01mlmV7cmAp0O9VNJCd6GKzhmeVSq3dFyUSlTFOS2gPi+bfS5aYGujL
 i7FGkDe0yWFxfSUeW3S6KXsEgiJy3FxAsg9N0Yk8BaagOKH3zYsD8bGbza/VfGaLT078P/oVuVNir
 2BGuukGvNC072SwVVv4J+jszwqldHBaL9vcghEowF1MFXr+KjSfPtn5oF2V+fs6s8vZBciBnALl4z
 byaxIw4cVHeZi6Bx6lf++WlqeWdDKDIN05NxXpAuS9NZFiTOasWk6ldr8lniVyd+OZnvHLytI0pGz
 MxdycTEiOSr270zIB1dA49c6j/N2qfvhwymfcF62dgkuMNGv4z6qLpgf7CEzQ6kIF0q9ssJKlMkUu
 plwQV4ftvAHm6NRJCkQ/8v491bT4KhF7K4iOgGlLAmbfWV1Lw8WkuXtN3p671YS/HwJ8WTtE4WaxH
 FSLmnOxdS1e+hv/LaGbMsxSlfO3FZWhIl5HB9yidU=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] MAINTAINERS: Upgrade myself as 9pfs co-maintainer
Date: Mon, 20 Apr 2020 12:31:50 +0200
Message-ID: <1683308.1S1Sy810dK@silver>
In-Reply-To: <20200420113959.2c98e63d@bahia.lan>
References: <E1jEYz4-0004pt-Cs@lizzy.crudebyte.com>
 <20200420113959.2c98e63d@bahia.lan>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-detected-operating-system: by eggs1p.gnu.org: First seen = 2020/04/20
 06:31:52
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
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

On Montag, 20. April 2020 11:39:59 CEST Greg Kurz wrote:
> On Wed, 18 Mar 2020 14:33:44 +0100
> 
> Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > As suggested by Greg, let's upgrade myself as co-maintainer of 9pfs.
> > 
> > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > ---
> 
> Applied to 9p-next.
> 
> 
> Hi Peter,
> 
> Christian has been contributing to and reviewing 9pfs patches for some
> time now. I'm glad he's now volunteering for maintainership. The next
> step is to be able to send PRs that have a chance to be accepted by you.
> Christian told me he would need to start with a brand new GPG key. Because
> of the confinement, it is very unlikely he has a chance to get this key
> signed by anybody *in person* as described in [1]... if I try to make sure
> Christian's key fingerprint is valid in a "best effort" way, e.g. multiple
> messages using different media or channels, would it be acceptable for you
> that I'm the only signer for his key ?

Well, I probably could meet somebody in person, however since I am not allowed 
to cross borders (i.e. leave Germany) that would be limited to developer(s) in 
Germany. And even within Germany there are certain restrictions (e.g. entering 
Bavaria or Mecklenburg-Vorpommern is problematic/restricted right now).

I don't have a crystal ball, but it does not seem likely that the border 
restrictions are going to be lifted in the next few weeks or so.

Best regards,
Christian Schoenebeck



