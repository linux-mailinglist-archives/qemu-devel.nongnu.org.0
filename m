Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E480842D579
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 10:53:39 +0200 (CEST)
Received: from localhost ([::1]:51054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mawUd-0003mw-2k
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 04:53:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1mawTK-000340-Rb
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 04:52:18 -0400
Received: from smtpout30.security-mail.net ([85.31.212.37]:36804
 helo=fx306.security-mail.net)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1mawTH-00069p-9D
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 04:52:18 -0400
Received: from localhost (localhost [127.0.0.1])
 by fx306.security-mail.net (Postfix) with ESMTP id 05375399555
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 10:52:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalray.eu;
 s=sec-sig-email; t=1634201531;
 bh=HB0ot4FIbwsYuLuy4hNQmsbI1SzV2zG/g3uSOs3cqYw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=Iax03nqFRZDWS7gfgnbkZ3FeaUGDjnpqPlxc3FtQeDJQlNqnSmS5WS0//Okonkxac
 0nVkXlDuOvoI1SvBAGqMfZjoV6U40DIbPN5P2Z/jf/QDzoYG5fg+fE6qjagFMUa04j
 O4bW832fzO+mQwIMpcUdT5XwBsV/AQ31kUJ2evCg=
Received: from fx306 (localhost [127.0.0.1]) by fx306.security-mail.net
 (Postfix) with ESMTP id 3D56C3995C7; Thu, 14 Oct 2021 10:52:10 +0200 (CEST)
Received: from zimbra2.kalray.eu (unknown [217.181.231.53]) by
 fx306.security-mail.net (Postfix) with ESMTPS id D407B39957F; Thu, 14 Oct
 2021 10:52:09 +0200 (CEST)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1]) by
 zimbra2.kalray.eu (Postfix) with ESMTPS id B58CC27E035A; Thu, 14 Oct 2021
 10:52:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1]) by zimbra2.kalray.eu
 (Postfix) with ESMTP id 9E5C927E035B; Thu, 14 Oct 2021 10:52:09 +0200 (CEST)
Received: from zimbra2.kalray.eu ([127.0.0.1]) by localhost
 (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026) with ESMTP id
 F5rWqcJyuNj8; Thu, 14 Oct 2021 10:52:09 +0200 (CEST)
Received: from localhost (unknown [192.168.36.68]) by zimbra2.kalray.eu
 (Postfix) with ESMTPSA id 813F827E035A; Thu, 14 Oct 2021 10:52:09 +0200
 (CEST)
X-Virus-Scanned: E-securemail, by Secumail
Secumail-id: <10d70.6167efb9.d2f56.0>
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 9E5C927E035B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
 s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1634201529;
 bh=hPA61M4X6hat9xfCKvQFIJ1/dGFTIHhm0MDxO9XvNwg=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=A+FAwtP5xsVQtaAO5zrEtE4+bCGJgluCMt6b1JMnvD25HOZBKy7U/Tig1otcOt/2L
 ERlBggrElgkIJ0JMxij8fIJ0E6GPz58syGSZ8bd+w6oybe966BySmUBm55mBk0novo
 su6NJ477SGjrnRF0MMdy1tCnR22UKKp/1KfOj/Ko=
Date: Thu, 14 Oct 2021 10:52:09 +0200
From: Luc Michel <lmichel@kalray.eu>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Paolo
 Bonzini <pbonzini@redhat.com>, Philippe =?utf-8?b?TWF0aGlldS1EYXVkw6k=?=
 <f4bug@amsat.org>
Subject: Re: [PATCH] hw/elf_ops.h: switch to ssize_t for elf loader return type
Message-ID: <20211014085209.cb4rm33bd2e7cr4g@ws2101.lin.mbt.kalray.eu>
References: <20211006192839.17720-1-lmichel@kalray.eu>
 <20211014083634.n7bj4rv2gzbgzopg@steredhat>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211014083634.n7bj4rv2gzbgzopg@steredhat>
User-Agent: NeoMutt/20171215
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-ALTERMIMEV2_out: done
Received-SPF: pass client-ip=85.31.212.37; envelope-from=lmichel@kalray.eu;
 helo=fx306.security-mail.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On 10:36 Thu 14 Oct     , Stefano Garzarella wrote:
> On Wed, Oct 06, 2021 at 09:28:39PM +0200, Luc Michel wrote:
> >Until now, int was used as the return type for all the ELF
> >loader related functions. The returned value is the sum of all loaded
> >program headers "MemSize" fields.
> >
> >Because of the overflow check in elf_ops.h, trying to load an ELF bigger
> >than INT_MAX will fail. Switch to ssize_t to remove this limitation.
> >
> >Signed-off-by: Luc Michel <lmichel@kalray.eu>
> >---
> > include/hw/elf_ops.h | 25 +++++++++---------
> > include/hw/loader.h  | 60 ++++++++++++++++++++++----------------------
> > hw/core/loader.c     | 60 +++++++++++++++++++++++---------------------
> > 3 files changed, 74 insertions(+), 71 deletions(-)
> >
> >diff --git a/include/hw/elf_ops.h b/include/hw/elf_ops.h
> >index 1c37cec4ae..5c2ea0339e 100644
> >--- a/include/hw/elf_ops.h
> >+++ b/include/hw/elf_ops.h
> >@@ -310,24 +310,25 @@ static struct elf_note *glue(get_elf_note_type, SZ)(struct elf_note *nhdr,
> >     }
> >
> >     return nhdr;
> > }
> >
> >-static int glue(load_elf, SZ)(const char *name, int fd,
> >-                              uint64_t (*elf_note_fn)(void *, void *, bool),
> >-                              uint64_t (*translate_fn)(void *, uint64_t),
> >-                              void *translate_opaque,
> >-                              int must_swab, uint64_t *pentry,
> >-                              uint64_t *lowaddr, uint64_t *highaddr,
> >-                              uint32_t *pflags, int elf_machine,
> >-                              int clear_lsb, int data_swab,
> >-                              AddressSpace *as, bool load_rom,
> >-                              symbol_fn_t sym_cb)
> >+static ssize_t glue(load_elf, SZ)(const char *name, int fd,
> >+                                  uint64_t (*elf_note_fn)(void *, void *, bool),
> >+                                  uint64_t (*translate_fn)(void *, uint64_t),
> >+                                  void *translate_opaque,
> >+                                  int must_swab, uint64_t *pentry,
> >+                                  uint64_t *lowaddr, uint64_t *highaddr,
> >+                                  uint32_t *pflags, int elf_machine,
> >+                                  int clear_lsb, int data_swab,
> >+                                  AddressSpace *as, bool load_rom,
> >+                                  symbol_fn_t sym_cb)
> > {
> >     struct elfhdr ehdr;
> >     struct elf_phdr *phdr = NULL, *ph;
> >-    int size, i, total_size;
> >+    int size, i;
> >+    ssize_t total_size;
> >     elf_word mem_size, file_size, data_offset;
> >     uint64_t addr, low = (uint64_t)-1, high = 0;
> >     GMappedFile *mapped_file = NULL;
> >     uint8_t *data = NULL;
> >     int ret = ELF_LOAD_FAILED;
> 
> Since we assign `total_size` to `ret` and we return `ret`, `ret` should 
> be ssize_t too, right?
Yes you are right I missed this one. I'll send a v2.
Thanks.
 
Luc

> 
> The rest LGTM.
> 
> Thanks,
> Stefano
> 
> 
> 
> To declare a filtering error, please use the following link : https://www.security-mail.net/reporter.php?mid=7f69.6167ec18.9b19a.0&r=lmichel%40kalray.eu&s=sgarzare%40redhat.com&o=Re%3A+%5BPATCH%5D+hw%2Felf_ops.h%3A+switch+to+ssize_t+for+elf+loader+return+type&verdict=C&c=618071aa1c7ceb467a44ac8717a3e44186291f37
> 

-- 





