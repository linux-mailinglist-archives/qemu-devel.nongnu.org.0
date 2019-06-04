Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9015F348C2
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jun 2019 15:32:18 +0200 (CEST)
Received: from localhost ([127.0.0.1]:52761 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hY9Y1-0007Lj-Q0
	for lists+qemu-devel@lfdr.de; Tue, 04 Jun 2019 09:32:17 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52824)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1hY9Uy-0005Vv-Mx
	for qemu-devel@nongnu.org; Tue, 04 Jun 2019 09:29:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1hY9Uw-0001NZ-Ve
	for qemu-devel@nongnu.org; Tue, 04 Jun 2019 09:29:08 -0400
Received: from mail-wr1-f46.google.com ([209.85.221.46]:39380)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hY9Uw-0001KA-KB
	for qemu-devel@nongnu.org; Tue, 04 Jun 2019 09:29:06 -0400
Received: by mail-wr1-f46.google.com with SMTP id x4so15843881wrt.6
	for <qemu-devel@nongnu.org>; Tue, 04 Jun 2019 06:29:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=w43Jb7h23jtaW99y+wJT93dyU7nE2P8hurZWjwCsfTs=;
	b=KBY8KODptyMZD8BJjQ4+lR3hZ2uAkYeWC+hWJ5foREO2PhPFu5sXoe+ptmxIprY4X2
	EuSHMdKzwEhXyB82Co8VAsUPx6NWBl/FEH0Q+K8m3DkGuX+BYKmWmRfgejprrcYUUTjr
	xP5LCIqaaIk33FA2NdRrYTjAhthLgkcJ7E7A1bGwcqmD8ft+koRJ4PR75M+v+ao1541p
	o6idHVK8uxdw8T9d7LsInG/BlmrKU0vXR6M7M6v7v0oYZNfOstB/Px+yIRFP1T/1JC9D
	nNcIAgtMtnMntZXWWZ97+C8CpzD7WSs7wxOWwSLS+KN6eUEaDhW9qNUMh+2Dfl4U7ijH
	e9GA==
X-Gm-Message-State: APjAAAVG9qekKAU9Csv5z+ak3EzrEcooT8ULnC9VrN1lc4RTnKz8Pz0F
	0vH/Wc3uAzARo4Cf0DeYt9NqQpxTYnMCMw==
X-Google-Smtp-Source: APXvYqwlVKaihLn80Q/nmRDA2zoaD7LhKb+iu40fTS76AMFhyEr2j4TmfXCJLQAftPybgOrZXNnCLQ==
X-Received: by 2002:adf:ea4a:: with SMTP id j10mr179561wrn.114.1559654943448; 
	Tue, 04 Jun 2019 06:29:03 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:657f:501:149f:5617?
	([2001:b07:6468:f312:657f:501:149f:5617])
	by smtp.gmail.com with ESMTPSA id x16sm5377075wmj.4.2019.06.04.06.29.02
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Jun 2019 06:29:02 -0700 (PDT)
To: Markus Armbruster <armbru@redhat.com>,
	Michal Privoznik <mprivozn@redhat.com>
References: <20190311220843.4026-1-armbru@redhat.com>
	<20190311220843.4026-23-armbru@redhat.com>
	<76d4a7b2-3c13-beea-2dc0-4fda7025030b@redhat.com>
	<878sv6tyjy.fsf@dusky.pond.sub.org>
	<ea01ee11-8888-444d-1f51-387dc73464f5@redhat.com>
	<87zhmysh2n.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <92a2f965-0d17-b6bc-fcfd-2cc088fb77da@redhat.com>
Date: Tue, 4 Jun 2019 15:29:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <87zhmysh2n.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.46
Subject: Re: [Qemu-devel] [PULL 22/27] vl: Create block backends before
 setting machine properties
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/06/19 19:40, Markus Armbruster wrote:
> 
> Paolo, why is pr-manager-helper a delayed object?  Why this hunk of
> commit 7c9e527659c:
> 
>     diff --git a/vl.c b/vl.c
>     index 9bb5058c3a..a121a65731 100644
>     --- a/vl.c
>     +++ b/vl.c
>     @@ -2893,7 +2893,8 @@ static int machine_set_property(void *opaque,
>       */
>      static bool object_create_initial(const char *type)
>      {
>     -    if (g_str_equal(type, "rng-egd")) {
>     +    if (g_str_equal(type, "rng-egd") ||
>     +        g_str_has_prefix(type, "pr-manager-")) {
>              return false;
>          }
> 

I don't think there was any particular reason.  Change it back to
normal, I can send a pull request today for that.

Paolo

