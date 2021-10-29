Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B45F44403F1
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 22:17:17 +0200 (CEST)
Received: from localhost ([::1]:35228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgYJQ-0002Jf-Kc
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 16:17:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mgXgl-00022d-4u; Fri, 29 Oct 2021 15:37:19 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:52653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mgXge-0003HM-9M; Fri, 29 Oct 2021 15:37:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=2KNddeTD+CWgs1+PSrpbsXo9+GhqSIdPn89WwLFtkEM=; b=SPZgo7UACadlKzajs1oVG3X0QH
 p6JQHmbCDN/D/HXmZ7keFP6eq+FJgrp9qcbNDDdsfmt6PWGojr61t9YKoBQjmJiX+PNcfHXyIJ4j5
 b+wagOsdCti/9LM2r+LFQzQVsK8UY22qtNmQ4c0H6jwVV2r0jnzv8fhO2UwHiLSMjzEsVf3QCwWvM
 ivAYiqTf6q5FwfUvoGrd6u27JPqXnaza4WV32dnI/QycOhSCCLOWmgizMmwhH6Efh6ZXXUEX5h0iZ
 TU6ZKXtuC9pgxJR/gI22iKKcZEVWjNQiEhUTH7J2PwVahCn56b8T+BvMmVo5GMXbBJszWsvMg6AI2
 wvpqN8Ewi4+Elub5P4wtkQL5W2My5mfmt7tKEWGSR+ODyvXSo5QWvZoid54l7Su8Fl2TsCBws1EMO
 ampQtRBSs1IuupJN0YqMAGkFCZHx+F8zZuE3mK61Kwnc1IwFj2/CQG5l0/hJuUtRKVVbUq1VuZDiW
 QTuNswo8K8ovMxUnteQghOewIfqCv0LkqYb2Sem1Pch0UA2Rclh77+WuQyMR0hZt8CUK3e2+Xj7pI
 JYRw4mOkoAc+XzsFthflKaZobN4q0Ch7LMdBpx6AOtYRjTWkaJKGS05MzXrS3l/O+rJP9mMbz9yFb
 2m6AknHmRoOsq+LlGVcpjpbnaXr/oCsXtUbvfQ6uo=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>,
 Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH] MAINTAINERS: add myself as partial audio reviewer
Date: Fri, 29 Oct 2021 21:37:07 +0200
Message-ID: <3098986.y1qXEgzS8n@silver>
In-Reply-To: <E1mMVca-0005ZJ-Lo@lizzy.crudebyte.com>
References: <E1mMVca-0005ZJ-Lo@lizzy.crudebyte.com>
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
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Samstag, 4. September 2021 15:13:46 CEST Christian Schoenebeck wrote:
> Volunteering as reviewer for some of the audio backends; namely
> ALSA, CoreAudio and JACK.
> 
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> ---
>  MAINTAINERS | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5d923a6544..f018c1891a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2289,11 +2289,13 @@ F: qapi/audio.json
> 
>  ALSA Audio backend
>  M: Gerd Hoffmann <kraxel@redhat.com>
> +R: Christian Schoenebeck <qemu_oss@crudebyte.com>
>  S: Odd Fixes
>  F: audio/alsaaudio.c
> 
>  Core Audio framework backend
>  M: Gerd Hoffmann <kraxel@redhat.com>
> +R: Christian Schoenebeck <qemu_oss@crudebyte.com>
>  S: Odd Fixes
>  F: audio/coreaudio.c
> 
> @@ -2304,6 +2306,7 @@ F: audio/dsound*
> 
>  JACK Audio Connection Kit backend
>  M: Gerd Hoffmann <kraxel@redhat.com>
> +R: Christian Schoenebeck <qemu_oss@crudebyte.com>
>  S: Odd Fixes
>  F: audio/jackaudio.c

Ping

I just realized this patch was never queued. Could this go through the trivial 
branch maybe, please?

I should have probably CCed qemu-trivial right from the start, sorry.

Best regards,
Christian Schoenebeck



