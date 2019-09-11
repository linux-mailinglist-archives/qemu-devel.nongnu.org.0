Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FFF8B001F
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Sep 2019 17:34:04 +0200 (CEST)
Received: from localhost ([::1]:52602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i84d9-0001kF-51
	for lists+qemu-devel@lfdr.de; Wed, 11 Sep 2019 11:34:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52545)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@gmail.com>) id 1i84NH-0006P0-Lu
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 11:17:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@gmail.com>) id 1i84NA-0003U6-Ef
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 11:17:39 -0400
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835]:33669)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <stefanha@gmail.com>) id 1i84N5-0003Qp-MV
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 11:17:28 -0400
Received: by mail-qt1-x835.google.com with SMTP id r5so25717638qtd.0
 for <qemu-devel@nongnu.org>; Wed, 11 Sep 2019 08:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ynD14thOR9g6jAfylfDW/JweKGG1XGPTbwbsdfT+g+w=;
 b=VWqd0yo2CcJmPcJDB/lSumJGCrpRVKABOVy/U1TdLz+37OXK0IxIfNVLlbfvonGhfy
 mPkCItYUp3k2aVyfqSu2zxm0xYiLJOy/mgh8TLsR5Klg7QWJZbKR1/edpRXtF9irRcYS
 U6F+ZwqEMUN9S1TzLOiez4o6KSRnCVM6ADHjaixCWFw3UG0t4j0uWXxSOsWKyybtME9c
 /66dQ1lHEUio2EBp02lepnuGyKZ/3KiVNzf25UNInwcE0fI528JTwxf5BdRfTfydb4+F
 97C5MVz+Qic/rIXwy19pahdFHIYgRwHNA1Nh6uaXSPHOr/EVqL3tdM3CliKwnK43MFww
 hTAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ynD14thOR9g6jAfylfDW/JweKGG1XGPTbwbsdfT+g+w=;
 b=VwjH8yYQ/xKgJMy8YjADLfo14nY7uj5JOJ3d2QaQfTyxS6d5Q1APR4H8UxZdLsANoM
 7MT8TEMEExmlS2yfBuLYrFZAt2Mt0X8aB3pkkldsBJV2/nj8+bkWUy70AHttOKurTzIP
 NUjOiQ2kzcPP+5UnYlR2oEpprI02AC+PL9xllEC7H3pbvnsyn3CBx2xssT+8hYMi8n1e
 5JsAbPBbrYXt1/jDR5XlGhUA/LF217OYHbFRtEyt7kwktVJ+0cX21urvmFA1/bMa53ck
 lXIdawtpNSPj2QF6ZX4IPUvVLIZbc8gSrYTWeGJGb+aE/uWpmEC5uGRx7xICqKWqGFoJ
 LtGg==
X-Gm-Message-State: APjAAAXtVTnsCRCd/8f0HGXG1+Ld4CYs1cF9j+IAnwlXDcXtISzGncr0
 qG7kWjI/QWCFxWju3It9XmYV5+bPGWaGfTlNY42/mA==
X-Google-Smtp-Source: APXvYqySFgDZlBvEMacfDXq/NRi7dmzO/Cn/kvUDEU93UNPcpa+EpQ1f/DXb6Jx/r7dwhnzdOBeZeD+KKGLKvIuW6FU=
X-Received: by 2002:ac8:38ef:: with SMTP id g44mr36089137qtc.277.1568215042621; 
 Wed, 11 Sep 2019 08:17:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190902121233.13382-1-johannes@sipsolutions.net>
 <20190902121233.13382-2-johannes@sipsolutions.net>
 <fe517ef6c6a8e2df9675388be9454b5863c7fc55.camel@sipsolutions.net>
 <20190909160039.GC20875@stefanha-x1.localdomain>
 <d095bafedcd4bcc5d76279785e5bd523aef62b58.camel@sipsolutions.net>
 <20190910150319.GB31674@stefanha-x1.localdomain>
 <e114b68dffecd9b4c4666327b15a28098c83f7ec.camel@sipsolutions.net>
 <20190911073503.GB4181@stefanha-x1.localdomain>
 <bc3409f2f0df110ff0d795ad72b5bb5b29e2b5a6.camel@sipsolutions.net>
In-Reply-To: <bc3409f2f0df110ff0d795ad72b5bb5b29e2b5a6.camel@sipsolutions.net>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Wed, 11 Sep 2019 17:17:11 +0200
Message-ID: <CAJSP0QWwL3-XiB4jFKLxXjeDwpyaDj4NS6j2FQ3Rg_k6YVC=3Q@mail.gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::835
Subject: Re: [Qemu-devel] [RFC] docs: vhost-user: add in-band kick/call
 messages
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
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 11, 2019 at 11:13 AM Johannes Berg
<johannes@sipsolutions.net> wrote:
> On Wed, 2019-09-11 at 09:35 +0200, Stefan Hajnoczi wrote:
> > On Tue, Sep 10, 2019 at 05:14:36PM +0200, Johannes Berg wrote:
> > > On Tue, 2019-09-10 at 17:03 +0200, Stefan Hajnoczi wrote:
> > I'm suggesting this because it seems like a cleaner approach than
> > exposing the calendar concept to the vhost-user devices.
>
> As I argue above, for all intents and purposes that only works for
> extremely trivial devices, to the extent that I'd rather exclude them
> than risk unexpected behaviour.

That makes sense, I think a vhost-user protocol extension is necessary
here.  Thanks for explaining.

Stefan

