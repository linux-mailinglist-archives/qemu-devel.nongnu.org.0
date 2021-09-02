Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8F23FED07
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 13:33:27 +0200 (CEST)
Received: from localhost ([::1]:56862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLkyE-00024b-9V
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 07:33:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mLkmb-0003An-LV
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 07:21:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mLkmY-0001sZ-GS
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 07:21:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630581681;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lxgHw5M5kAxfFKWZn3nnI4t421bixUReD8Bk/uf9tgY=;
 b=dzFYvex9qRt6jkgGbMt1WWADX1pp53vG4WNbFowDPK2cxFTUOK8u1skgXn6guDlu4QnZkv
 Mg7mGn33uSpyAXmqfpANVDfooFtjAxijvvdOULqzp0rk/Atrb7d0Wtz5/MsVEtJDxxbSi/
 QdXbwqDYP13wvGI1sZB8XaXcwkY/n1Q=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-168-rjwaDK1rPF-UstRQrlfqwQ-1; Thu, 02 Sep 2021 07:21:19 -0400
X-MC-Unique: rjwaDK1rPF-UstRQrlfqwQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 w25-20020a1cf6190000b0290252505ddd56so578904wmc.3
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 04:21:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lxgHw5M5kAxfFKWZn3nnI4t421bixUReD8Bk/uf9tgY=;
 b=nGrECy7PdHEhdCOHHrLclEhmZK8F+20tk7vQpJxUerVZW7QExbpZJv3Jlrtazeiwmu
 oRuUm7V6EwzCOm1jjrT/aNm7MSYwE/DbeGGxYCP+T7L2fuXtWAMbYQY41n/Pm3kHV7jy
 9O4lzmDArQ5bAnYT81hk+Dgvyndkfe01XEpAzyjM8xMtIqmCmoLiOnmrQY7exhN7uofF
 oZqKhO54C55EOe6yF8ZK3nKDHVYLisCNkWSdVXbOAMRUjWK8aRbUzLWGSOwPWwgVgxCZ
 X9oCubCrkycjddtDv2XsUdPS/lOF5mfRSHelIvg0JMJTUeTqztuoy7JEsgLkCyxhqb94
 5Hjw==
X-Gm-Message-State: AOAM530vXE6PFwYix0gUI688fgiXSZcyfDbCDKKUCnbZMDCA8ZLCP4/n
 /WlZLZChOQ01BAJM+LBjHVNaoNwQwsJKZcJStZ2E1rzWrmw+OARaRSL23LmwT8z8KOCGy5m7MmB
 4Fk0Ete5q9SkP54I=
X-Received: by 2002:a5d:44c8:: with SMTP id z8mr3136435wrr.332.1630581678058; 
 Thu, 02 Sep 2021 04:21:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwQJx4vCQ6VJQZbB+ijB8QgBwja+ZfYMdHneaK6fqFMLCWL0MJ3/PG1+SV5LxPo08Ft6oeANQ==
X-Received: by 2002:a5d:44c8:: with SMTP id z8mr3136418wrr.332.1630581677881; 
 Thu, 02 Sep 2021 04:21:17 -0700 (PDT)
Received: from thuth.remote.csb (pd9575431.dip0.t-ipconnect.de. [217.87.84.49])
 by smtp.gmail.com with ESMTPSA id b24sm1316264wmj.43.2021.09.02.04.21.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Sep 2021 04:21:17 -0700 (PDT)
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210825092023.81396-1-thuth@redhat.com>
 <20210825092023.81396-4-thuth@redhat.com>
 <CABgObfb8GHK0F=GCmDtaB=RqZT9+JnG+RRfNK+4XQ-ofoOxumA@mail.gmail.com>
 <a03ba523-ac40-3090-442e-7cc38022a2cc@redhat.com>
 <YTCuQB5dWMhYC3fW@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2 3/3] softmmu/vl: Deprecate the -sdl and -curses option
Message-ID: <001e7034-86a3-31a9-c93f-4c72385235e6@redhat.com>
Date: Thu, 2 Sep 2021 13:21:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YTCuQB5dWMhYC3fW@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.225, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Armbruster, Markus" <armbru@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/09/2021 12.58, Daniel P. Berrangé wrote:
> On Thu, Sep 02, 2021 at 12:51:02PM +0200, Thomas Huth wrote:
>> On 31/08/2021 15.53, Paolo Bonzini wrote:
>>> As an alternative, you may want to turn it into "-display sdl" rather
>>> than poke at dpy. This isn't much more code, but it keeps the shortcut
>>> isolated within a single "case". This follows a lot of recently cleaned
>>> up command line parsing code such as -no-hpet, -enable-kvm, -smp etc.
>>>
>>> In the end (spoiler alert for my upcoming KVM Forum presentation—slides
>>> are already on sched.com <http://sched.com> :)) what really produces
>>> complexity is the lack of isolation/modularity. As long as UI code
>>> doesn't care about command line parsing, and command line parsing
>>> doesn't care about global variables from all over the place, the cost of
>>> shortcuts is so small that it may tilt in favor of keeping them.
>>
>> Honestly, I'd rather like to see them removed in the end. Our user interface
>> is so terribly inconsistent here that I think that these options are rather
>> confusing for the users than helpful. For example, why do we have -sdl and
>> -curses, but no -gtk ? And as a normal user, I'd also always wonder what's
>> the difference between "-display sdl" and "-sdl", since the difference in
>> the amount of characters that you have to type here is not that much that it
>> justifies the shortcut option. So IMHO let's rather clean this up completely
>> than dragging the shortcut options along forever.
> 
> There's also the elephant in the room "-vnc" which has never been mapped
> into -display, but which is also one of the most widely used options for
> display backends :-(

Yeah, for -vnc, it likely makes sense to keep the shortcut since it's in 
wide use and also takes additional parameters ... but -sdl and -curses? They 
are IMHO rather niche, and don't take additional parameters, so it should be 
ok to mark them as deprecated. We can still reconsider in case anybody 
complains about the deprecation later.

  Thomas


