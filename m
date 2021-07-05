Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A77F13BC0DF
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 17:37:04 +0200 (CEST)
Received: from localhost ([::1]:35258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0Qed-0006ow-P8
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 11:37:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1m0QcX-0004yN-Ei
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 11:34:53 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:47531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1m0QcT-0003mu-JA
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 11:34:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=l1+TwGAsvbDwEsOFrBik37j/0Vnt8JfV+VCa9f9fPB0=; b=YsuGb8sA0tCqHhVs5NwKi5e/pe
 zWd8KJ2CHfcEKJ1YTW29oMJMPubhWoTcDM1Ny2FnfVRjvPZppsn8Kqlhwl9b0ph3/IxE7NJSespKU
 vQqZuUPMZlmFZ4WC/PNEMi5nESYAKxMidzzPtS7G0NPC1iQaw370b/Pn544tfDrVcxWRo+LJK4SB9
 4dsXKtjYHmld9VrixGwZ9rWnb09XS5Lp+j+30QojNI5WkGtviuzjscD4SzxENdNeVWGz0lZgcj1iH
 TA5++w/Xfg+u3hBf9gZ6dF6Rh6owLyzLR/Oez5LlHq6hFtTTN66l6Ifd6dwB5paolLCdQjkcEPBOJ
 V0wDQuLnSrnDT9qSGdNU7pshDqc4/Fggglf+EXAtW0EstmLDGGVuLTc4qpabXFPeAsXo+oFzHW+fh
 CzsQzCITe/qemCgforLGX3SidfPMf58A9F4Ux/MOnF2/+Ojsoa0nfXdYP+jwuBJjx5dxsLE3XnB14
 PSQwWvBzqMnIOO4O1MWxr+nm/WS8QtEcnhVCiVNUKfgRciKe73NLYN0neVszqtxK8ma1yJhHy1y9Y
 KGfw+A0kpZwYFrqzY7YaX9dCBBFGFyh/z6ys+qEMv6z7BGQa5BjaWIEnkqJympsjINhATE5ToHDSs
 zM8UWtZo17hPmTO81uM6K4H8S9VBRklbCl+0B+bOg=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Greg Kurz <groug@kaod.org>
Subject: Re: [PULL 0/8] 9p queue 2021-07-05
Date: Mon, 05 Jul 2021 17:34:45 +0200
Message-ID: <2066764.2AXzDdBHVr@silver>
In-Reply-To: <CAFEAcA-uHfJrJc9JcVRZ7x9WG1sY0C+zbC=m5gzyRdVG+TL49Q@mail.gmail.com>
References: <cover.1625483630.git.qemu_oss@crudebyte.com>
 <CAFEAcA-uHfJrJc9JcVRZ7x9WG1sY0C+zbC=m5gzyRdVG+TL49Q@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
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

On Montag, 5. Juli 2021 15:57:41 CEST Peter Maydell wrote:
> On Mon, 5 Jul 2021 at 12:24, Christian Schoenebeck
> 
> <qemu_oss@crudebyte.com> wrote:
> > The following changes since commit 711c0418c8c1ce3a24346f058b001c4c5a2f0f81:
> >   Merge remote-tracking branch 'remotes/philmd/tags/mips-20210702' into
> >   staging (2021-07-04 14:04:12 +0100)> 
> > are available in the Git repository at:
> >   https://github.com/cschoenebeck/qemu.git tags/pull-9p-20210705
> > 
> > for you to fetch changes up to 8d6cb100731c4d28535adbf2a3c2d1f29be3fef4:
> >   9pfs: reduce latency of Twalk (2021-07-05 13:03:16 +0200)
> > 
> > ----------------------------------------------------------------
> > 9pfs: misc patches
> > 
> > * Add link to 9p developer docs.
> > 
> > * Fix runtime check whether client supplied relative path is the export
> > 
> >   root.
> > 
> > * Performance optimization of Twalk requests.
> > 
> > * Code cleanup.
> 
> GPG tells me the key you signed this with has expired. Can you point
> me at a keyserver I can download an updated version of the key from,
> please?
> 
> thanks
> -- PMM

Hi Peter,

I must have done something wrong when I sent out the updated, prolonged key 
info couple weeks ago.

I just sent it out again to couple key servers now. They are all still the
same key IDs BTW, I just prolonged their expiration dates. Looks fine now:

https://keyserver.ubuntu.com/pks/lookup?search=qemu_oss%40crudebyte.com&op=vindex&fingerprint=on
http://pgp.mit.edu/pks/lookup?op=vindex&search=0x30DB47C3A012D5F4
https://github.com/cschoenebeck/qemu/releases/tag/pull-9p-20210705

sec#  rsa4096/30DB47C3A012D5F4 2020-05-28 [SC] [expires: 2024-05-16]
      ECAB1A4540141413BA38492630DB47C3A012D5F4
uid                 [ultimate] Christian Schoenebeck <qemu_oss@crudebyte.com>
ssb   rsa4096/C64F2382FC0F4C5E 2020-05-28 [E] [expires: 2022-11-08]
ssb   rsa4096/34C2B58765A47395 2020-05-28 [S] [expires: 2022-11-08]

Best regards,
Christian Schoenebeck



