Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B50F5146F3E
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 18:11:09 +0100 (CET)
Received: from localhost ([::1]:33080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iug0a-0004XX-BB
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 12:11:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34156)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1iudYf-0004pV-Oq
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 09:34:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1iudYe-0005DJ-MM
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 09:34:09 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:44880
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1iudYe-0005DB-JF
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 09:34:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579790048;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q5MJw6ZlFfVGKbGIOuSLqhrNYk2iMNDQRPDZKzMVHFM=;
 b=cznwys2d3Y6xQX5BZ90MhAKDAxfUZqAudCbp0VNr6lnlRWDFNUrDKkDT+Nd9n97xRNF2NH
 /kYZKyM6oahdAwgZhHJjvRtTvLEJBcfUu8+PcAOky6GK8hiuWCyF9BX10Gg/hYIDik1NCq
 J3gYNq/A9knWYFHIhTmjGQqEikZO+hc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-97-JMepEPxNOwyxyyFJDheveA-1; Thu, 23 Jan 2020 09:34:05 -0500
Received: by mail-wr1-f69.google.com with SMTP id r2so1828216wrp.7
 for <qemu-devel@nongnu.org>; Thu, 23 Jan 2020 06:34:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hKKYyCHnsUNr8LFSAsqf4z3fS2YTHL+mtXNacVxOOQg=;
 b=LEn6Ui4WjZL2QmFqu91QtKpvJaAs0cS3KoyVzSw9Ft5s6/X9hYzuzupmkKnqYpvxn/
 JRtGbxJTdWwgu82DUbNM0OiQvH4Kip/3zmyCWQywlmb1nUj2tCHUbt17buckhDtZOKap
 PkDN4WNBUcOC47mc/cGgj3PF9a/qaVQbvzJV09J21fcTanbViJOr6B2HV9w28eix8/Pt
 ikd84SFM3hHT9jf320swpKvpCJPHo+k3bfj+2Cs7dYJ3bvj5cIZXVl2sWmB9bP4PWq+k
 c8Ijkd+pNazkONACE300lNQ0mlMIu/2c25/qXYE5nPDdn3PnsADJ5mrDii6M38y47fNY
 h+RA==
X-Gm-Message-State: APjAAAWTbrS9qCrjudDFHvEEN+IE3c8JiFDviVge0xb6ger92BWMVh2j
 QwOXgaJhOpD3cgooBXSWebN3qrKaQoqMoTjxU7r9LGrl+aL+67Her404PZ51fBOM1mZuvAzK6oN
 ZfKw5S/PDGgqW3v4=
X-Received: by 2002:a7b:c317:: with SMTP id k23mr4513308wmj.75.1579790044433; 
 Thu, 23 Jan 2020 06:34:04 -0800 (PST)
X-Google-Smtp-Source: APXvYqzK7E9QeWh1RZFfuRKM3VYcJ8tQTF65A7khD63c1tMtD0WCbtaRMjWbA6PvHluF+Eaow9UBUw==
X-Received: by 2002:a7b:c317:: with SMTP id k23mr4513295wmj.75.1579790044249; 
 Thu, 23 Jan 2020 06:34:04 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:b8fe:679e:87eb:c059?
 ([2001:b07:6468:f312:b8fe:679e:87eb:c059])
 by smtp.gmail.com with ESMTPSA id g9sm3250535wro.67.2020.01.23.06.34.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jan 2020 06:34:03 -0800 (PST)
Subject: Re: [PATCH 10/26] object: add object_property_set_defaut_{bool, str, 
 int, uint}()
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
References: <20200110153039.1379601-1-marcandre.lureau@redhat.com>
 <20200110153039.1379601-11-marcandre.lureau@redhat.com>
 <2a3b0024-fb80-c34d-16fd-78f8bc722807@redhat.com>
 <CAJ+F1CJBFT7j6qenmD-C053dN4p3YgXFzi3ed=e9vXzr4Hr_ng@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <4b16b6d0-ff8d-5810-b49c-c0d2f1e0d7c0@redhat.com>
Date: Thu, 23 Jan 2020 15:34:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAJ+F1CJBFT7j6qenmD-C053dN4p3YgXFzi3ed=e9vXzr4Hr_ng@mail.gmail.com>
Content-Language: en-US
X-MC-Unique: JMepEPxNOwyxyyFJDheveA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/01/20 12:39, Marc-Andr=C3=A9 Lureau wrote:
> Hi
>=20
> On Thu, Jan 23, 2020 at 3:29 PM Paolo Bonzini <pbonzini@redhat.com> wrote=
:
>>
>> This patch caught my attention because of the typo in the function, but
>=20
> Ah! a french "d=C3=A9faut".

I suspected that. :)

>> I also noticed that get_default is never set to anything but
>> object_property_get_defval.
>>
>> What do you think about removing the method and just relying on defval?
>> In practice there would be a new patch that squashes 7, 10 and the thing
>> after my signature.
>=20
> Indeed, we could remove the get_default callback. I can't find the
> reason I added it now.
>=20
> Are you resending the series then?

I have already sent a pull request.  In the end even
object_property_get_default was only used once so I just inlined it and
dropped patch 7.

Paolo


