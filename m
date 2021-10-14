Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BEF342DA65
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 15:29:04 +0200 (CEST)
Received: from localhost ([::1]:41260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb0n9-0000aN-GC
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 09:29:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mb0kJ-0003VV-Ll
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 09:26:08 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:38075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mb0kE-0003sN-As
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 09:26:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=pp9PD/BZpyBpwLmAbbqVa0y8B95vTtj572dxSozM+aE=; b=Zc5dZ9oFZ1i5SimZ/IVcwOzT5v
 IBRlVk/fb1tFyVQbheW3CtrIMNLGM94xFVCOuRldJ4beTguUrDpmoT5NkvkNZ8TSEIVp8iKM4/IBp
 yX8157c5HDQbwvBqKNs0TjF7fLwxVLchjfzPu6v3kBZYkrQKBv6UInEKEHh8+IiTzgbnrMqP6HWTL
 weOmOrIOxbAqBw0S0kIv5arXJHjZLJLjUKt9A0VoskhLIEIxIZu+C/oQOlj0Pqf98i+spgINzYJSD
 pqdFm9jnpQdJIA28f/IWEyw3XDI7dfQxF9a9yTlFv7T9Mb53hCmZ7X2tNEZhFV0hXD6K/LtsKKtOY
 MiqqmY9zhS6irtBFTTkqMPL0torbQcqnFCthfBSDVh+9GghgPSALEefU2Wg3OrTX8DgJN75J0awq4
 eAq+3wuql4MXpQvTvBNqQsEWw9fumyoQvt5OB/szkwsikhnQfR8vCWFEnU5WU8XSzAmo7RNeT9iV/
 kqRFtJ7/4QvKrORP7QEm7vIUqZEMmtoLdS0zGLvdg32dgYF0fV+Rtrj2zTmfvj6Ea4Kf7YfP60e/W
 8kwC5ngGlKupF/ffTl9C6r1r8ErzV8ID9tcp4Nm1mnbcl5HMVdBKufL7kR8FpzB/dhRlr4bS6oMOm
 2spQLpC0eEd+cdVznD1dGPol3X9MGXvICuzPOYvcw=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Daniel =?ISO-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH 0/5] 9pfs: introduce P9Array
Date: Thu, 14 Oct 2021 15:25:59 +0200
Message-ID: <2973052.dVDylayGH2@silver>
In-Reply-To: <cover.1633097129.git.qemu_oss@crudebyte.com>
References: <cover.1633097129.git.qemu_oss@crudebyte.com>
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

On Freitag, 1. Oktober 2021 16:25:22 CEST Christian Schoenebeck wrote:
> This is simply a refactored follow-up of the following previous series
> ("introduce QArray"):
> https://lists.gnu.org/archive/html/qemu-devel/2021-08/msg04530.html
> 
> There was no consensus about a project wide "QArray" shared utility code,
> nor does there seem to be a need for a project wide code, so let's just
> refactor QArray -> P9Array and make it a 9P local type for now:
> https://lists.gnu.org/archive/html/qemu-devel/2021-09/msg07743.html
> 
> Changes QArray v3 -> P9Array v1:
> 
>   * Moved header file, i.e. include/qemu/qarray.h -> fsdev/p9array.h
> 
>   * Refactored *QArray* -> *P9Array*
> 
>   * Refactored P9ARRAY_CREATE -> P9ARRAY_NEW and
>     p9array_create_* -> p9array_new_* accordingly
> 
>   * Refactored DECLARE_P9ARRAY_TYPE -> P9ARRAY_DECLARE_TYPE
> 
>   * Refactored DEFINE_P9ARRAY_TYPE -> P9ARRAY_DEFINE_TYPE
> 
>   [No behaviour changes whatsoever]
> 
> Christian Schoenebeck (5):
>   9pfs: introduce P9Array
>   fsdev/p9array.h: check scalar type in P9ARRAY_NEW()
>   9pfs: make V9fsString usable via P9Array API
>   9pfs: make V9fsPath usable via P9Array API
>   9pfs: use P9Array in v9fs_walk()
> 
>  fsdev/9p-marshal.c |   2 +
>  fsdev/9p-marshal.h |   3 +
>  fsdev/file-op-9p.h |   2 +
>  fsdev/p9array.h    | 160 +++++++++++++++++++++++++++++++++++++++++++++
>  hw/9pfs/9p.c       |  19 ++----
>  5 files changed, 174 insertions(+), 12 deletions(-)
>  create mode 100644 fsdev/p9array.h

Queued on 9p.next:
https://github.com/cschoenebeck/qemu/commits/9p.next

Thanks!

Best regards,
Christian Schoenebeck

Best regards,
Christian Schoenebeck



