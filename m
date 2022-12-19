Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9005F650A22
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 11:32:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7DHb-0003QX-Jm; Mon, 19 Dec 2022 05:22:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1p7DHY-0003QL-U8
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 05:22:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1p7DHW-0007Y9-9F
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 05:22:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671445320;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Y3iqrAyNzAaFryGW3gROpP5pKiGL/bP20hngRJxegnU=;
 b=IHfIwbLJGM0EGMXiQoxitr00bDy92QKlIRstu/E2PnW0yXHxsYJm5vamtj+Qn1dW7qT9O0
 GOkNWglgsPwM5urPlUM5+gGfN57/D91jxKjNtA60Yjt7tloTpxfY4q5bs2CyDI9AHLjNZm
 4MjV8oxf9lbed5IVPB7ISTyfiPDUI0s=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-472-2bxMKgXTODWaogDJWk3B4w-1; Mon, 19 Dec 2022 05:21:56 -0500
X-MC-Unique: 2bxMKgXTODWaogDJWk3B4w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 926783810D21;
 Mon, 19 Dec 2022 10:21:56 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.198])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5AAAB2026D4B;
 Mon, 19 Dec 2022 10:21:55 +0000 (UTC)
Date: Mon, 19 Dec 2022 10:21:51 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Tom Stellard <tstellar@redhat.com>
Subject: Re: [PATCH 2/2] meson: Set avx512f option to auto
Message-ID: <Y6A7PxZoslDHL1wV@redhat.com>
References: <20221204015123.362726-1-richard.henderson@linaro.org>
 <20221204015123.362726-3-richard.henderson@linaro.org>
 <CABgObfbS3BkDJ=wx38LyJJFs+__07MntKSHb2ZNUo3zo-_=Sjg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CABgObfbS3BkDJ=wx38LyJJFs+__07MntKSHb2ZNUo3zo-_=Sjg@mail.gmail.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sat, Dec 17, 2022 at 12:08:08AM +0100, Paolo Bonzini wrote:
> Because that's what configure used to do (
> https://lists.nongnu.org/archive/html/qemu-devel/2022-02/msg00650.html)...
> 
> It can surely be changed but AVX512 is known to limit processor frequency.
> I am not sure if the limitation is per core or extends to multiple cores,
> and it would be a pity if guests were slowed down even further during
> migration.
> 
> Especially after the bulk phase buffer_is_zero performance matters a lot
> less so you'd pay the price of AVX512 for little gain. After the bulk phase
> it may even make sense to just use SSE, since even AVX requires a voltage
> transition[1] from what I saw at
> https://travisdowns.github.io/blog/2020/01/17/avxfreq1.html.

Note: s/AVX512/Intel's AVX512 impl/

AMD's Zen4 AVX512 is said to behave quite differently from Intel's.
This posting goes into a massive amount of detail:

   https://www.mersenneforum.org/showthread.php?p=614191

[quote]
Since 512-bit instructions are reusing the same 256-bit hardware,
512-bit does not come with additional thermal issues. There is no
artificial throttling like on Intel chips.
[/quote]

[quote]
Overall, AMD's AVX512 implementation beat my expectations. I was
expecting something similar to Zen1's "double-pumping" of AVX
with half the register file and cross-lane instructions being
super slow. But this is not the case on Zen4. The lack of power
or thermal issues combined with stellar shuffle support makes it
completely worthwhile to use from a developer standpoint. If your
code can vectorize without excessive wasted computation, then go
all the way to 512-bit. AMD not only made this worthwhile, but
*incentivizes* it with the power savings. And if in the future
AMD decides to widen things up, you may get a 2x speedup for free.
[/quote]


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


