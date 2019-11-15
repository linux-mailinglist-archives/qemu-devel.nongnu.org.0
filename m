Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF10FDE37
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Nov 2019 13:44:38 +0100 (CET)
Received: from localhost ([::1]:38434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iVaxp-0001kr-Km
	for lists+qemu-devel@lfdr.de; Fri, 15 Nov 2019 07:44:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46100)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1iVauX-00088q-Cv
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 07:41:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1iVauW-0007Nf-FX
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 07:41:13 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:50263
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1iVauV-0007ND-A3
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 07:41:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573821669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=/rxL5PQG7hu1lqGSO+RDHCoz7xVy1D69GbXWT45lVV0=;
 b=LoCOobBwOCA2LfEmM1wCRyeJxAvWtldW/TOMImnQIkRlvrULFqOK32ufdynhX3xz6NwPEn
 z02761LiURhET2ewAxqY9+HwBkOiouM6H3C81udSfFHlmt5HJzXz3GfQWDgfBCdCanJpJv
 +g1WQNyTswk7V0uyQFj08XbKQkdFeVo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-235-YN8ny7NmNx6deDLFeF6qfw-1; Fri, 15 Nov 2019 07:41:05 -0500
Received: by mail-wm1-f69.google.com with SMTP id x16so6844759wmk.2
 for <qemu-devel@nongnu.org>; Fri, 15 Nov 2019 04:41:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Mc0kjGV/ATYGlJ9RSG+SV2tvcGlzZzOfQOEJjCgoMEo=;
 b=LGfANfXbReIggtxG0GzGFRsUOUde/MbpLrtq2wnncuIpPS8JN+ueDSx3ULQ3AQxPaP
 Errx8jIaos/N5IaaTzFcKhJnhqMcfHEPJdB7qT6VHSE3BQ41u+Mof5c5ARrm+fGT6Kl7
 VxCsUFmDnqoG7XjPW4Sy77/9KvX/IQ2UMOtr4E1ddxMZGUs7EHNUMs8NjDJ8CbEDhL4e
 z/pBp/n9fG73KVyiiyswcTwiNCiYFO3qMKQYxEasxwidIk0D26jMUErQV/fBFgHPnXzJ
 AzR5DDHBUQQBGiU/qRCYGZDjUDt7n2XeFFnUNkHQsLRL33qOx5m51mAgVWkNQYTgmmgW
 qRQg==
X-Gm-Message-State: APjAAAVgXIzTpxZQ6AE4VmnrxE12dTiI0P3BVMp9o2Ydk/rLeiOn69EV
 KU0N1F0P3Qcc3dzYSwNfcZrHqzHN7ToXTH8WsDRPvilaPZmJLKicEwfYE8Ry/Ep06c2fCQeBlXs
 9oqhiFq6GcAKZlx8=
X-Received: by 2002:a05:600c:2944:: with SMTP id
 n4mr14504460wmd.57.1573821664056; 
 Fri, 15 Nov 2019 04:41:04 -0800 (PST)
X-Google-Smtp-Source: APXvYqxhsqTeACViqOWTDMYe3+vcNqNreOumQFWSZMmZvOdn2zJPMpSBlxNJAAeuO51ZHe00Sx0G8A==
X-Received: by 2002:a05:600c:2944:: with SMTP id
 n4mr14504428wmd.57.1573821663755; 
 Fri, 15 Nov 2019 04:41:03 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:a15b:f753:1ac4:56dc?
 ([2001:b07:6468:f312:a15b:f753:1ac4:56dc])
 by smtp.gmail.com with ESMTPSA id g133sm9609391wme.42.2019.11.15.04.41.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Nov 2019 04:41:02 -0800 (PST)
Subject: Re: [PATCH qemu-web] Add a blog post on "Micro-Optimizing KVM
 VM-Exits"
To: Kashyap Chamarthy <kchamart@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <20191108092247.16207-1-kchamart@redhat.com>
 <f8dce546-ea28-0619-a20a-62c762f99721@redhat.com>
 <20191115123754.GT7754@paraplu>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <71a02677-7db7-0ee0-8529-ca59b6bd0ee6@redhat.com>
Date: Fri, 15 Nov 2019 13:41:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191115123754.GT7754@paraplu>
Content-Language: en-US
X-MC-Unique: YN8ny7NmNx6deDLFeF6qfw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: aarcange@redhat.com, vkuznets@redhat.com, qemu-devel@nongnu.org,
 stefanha@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/11/19 13:37, Kashyap Chamarthy wrote:
>> Opinions? Ideas?
> Another _potential_ venue: Given the topic is kernel space-related, it
> is likely to fit in with the LWN audience.  LWN itself says they
> generally look for kernel-related articles.  Although, I'm aware that
> there's already a few LWN articles being written on KVM Forum-based
> talks.  (Perhaps once the "KVM Monolithic" patch series merges, this can
> be reworked into a standalone LWN kernel article =E2=80=94 assuming LWN i=
s
> amenable to it; need to check with LWN.)

Yeah, perhaps later.  For now I guess qemu.org is the best.

Paolo


