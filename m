Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5334047D5
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 11:34:09 +0200 (CEST)
Received: from localhost ([::1]:42254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOGRc-0006px-BF
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 05:34:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mOGQT-0005zO-L5
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 05:32:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mOGQR-0000kL-7C
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 05:32:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631179974;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UTYvK/Zm8B6epjcRuntjpiHsGd5WoA4pX1nBqfIv23w=;
 b=aCKoy4jYnSr0R/km3APzP7jF+dSJ5q3qE/ZTwVO3yC0FmWqoxyKS4TtVsCSSPHCSq4J8Ce
 FmwnTBRqOQF0IH3jO6T47OFPQcPgSaqGBpaQcbEFxNJkECatNDB/xs7me4OfqmzEprzcse
 rEHsE2t6ZReUxmtqqT131w1h2HHywK8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-Dflz9AObMGedPxaRslpSwg-1; Thu, 09 Sep 2021 05:32:51 -0400
X-MC-Unique: Dflz9AObMGedPxaRslpSwg-1
Received: by mail-wr1-f71.google.com with SMTP id
 s13-20020a5d69cd000000b00159d49442cbso316118wrw.13
 for <qemu-devel@nongnu.org>; Thu, 09 Sep 2021 02:32:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UTYvK/Zm8B6epjcRuntjpiHsGd5WoA4pX1nBqfIv23w=;
 b=Aj0/Bx8/bFQEZa/vj3XtpYB6x/RfdptfneA0MPXvFRYYEWQnWDhGJ2/ukFYKH/SsjV
 cMaIoxDdV+3FWlcW6+IgsswGeGPKNfQ+mrqqE7jiFzARexroNIValu/VfdYneBw6LLP+
 8XKt0XCRa5eQlA5PDUF4lYsQ2m8LhYdvTZdkir1rjfBBOzoHQFIPhtTWYLVtZmqqX6RG
 X1+S9Jv3X9NWfSpCf0CiYnRRzySfA/Rnyqw4ENYZXCGzrOynCsF1NMMqGerxgn3xL7cz
 g4vxQejp9RyRskGpAN8h/9DZ9kiEKaVSvIYjXguuyj3CH65+pmyqSYvdmWhCb0izBI6s
 HUjQ==
X-Gm-Message-State: AOAM530rxG6cow9teZXjXGbp6WQscpjIQ01Bd2Tz5mo3vMDauKRhXgWr
 jWztw4m1Iy5lj2yFO75cK/xHDPL3mzFdnWj8RIo+FURj131uL6QDZkyGR0K9EOLUd7EMDKyM8Zo
 Idy1TU6e9bV8J6P8=
X-Received: by 2002:a05:600c:3542:: with SMTP id
 i2mr1901237wmq.170.1631179969879; 
 Thu, 09 Sep 2021 02:32:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyEY0azQ8p8dr7DcoW3JeisAr8XksaZc3Oe0jqqEz32qDszQN2PmzR5R49PBKRS1vmehNfh5w==
X-Received: by 2002:a05:600c:3542:: with SMTP id
 i2mr1901211wmq.170.1631179969672; 
 Thu, 09 Sep 2021 02:32:49 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id c4sm1099165wme.14.2021.09.09.02.32.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Sep 2021 02:32:49 -0700 (PDT)
Subject: Re: [PATCH] hw/display/ati_2d: Fix buffer overflow in ati_2d_blt
 (CVE-2021-3638)
To: Mauro Matteo Cascella <mcascell@redhat.com>
References: <20210906153103.1661195-1-philmd@redhat.com>
 <CAA8xKjXkDwPYxSAeRb+2mfHRrbiL_kh9unVkemFXLfF68UXePA@mail.gmail.com>
 <3ef43b0d-4b89-85a4-f2bf-b7f8a256d1db@redhat.com>
 <bb39ee8c-a567-591a-a1c4-822683bb723@eik.bme.hu>
 <8ba32305-3e9f-a770-0406-7612ed4aeece@redhat.com>
 <3ee3ca31-0d6c-a439-74c0-6397c3492893@redhat.com>
 <CAA8xKjWiRn5a9a1oTX7gpZ3k867sO-nqMB_V5oJQNhwPSWZyrg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <df8963c3-3485-af97-6589-02032fde11f8@redhat.com>
Date: Thu, 9 Sep 2021 11:32:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAA8xKjWiRn5a9a1oTX7gpZ3k867sO-nqMB_V5oJQNhwPSWZyrg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.922, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Qiang Liu <qiangliu@zju.edu.cn>, Prasad J Pandit <pjp@fedoraproject.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Alexander Bulekov <alxndr@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Gaoning Pan <pgn@zju.edu.cn>,
 Ziming Zhang <ezrakiez@gmail.com>, Salvatore Bonaccorso <carnil@debian.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/9/21 11:16 AM, Mauro Matteo Cascella wrote:
> On Tue, Sep 7, 2021 at 8:22 AM Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>> On 9/7/21 7:38 AM, Philippe Mathieu-Daudé wrote:
>>> On 9/6/21 9:52 PM, BALATON Zoltan wrote:
>>>> I don't think assigning a CVE to a bug that is in an experimental and
>>>> largely unused part and happens when one enables debug code really worth
>>>> the hassle, this could be handled as a normal bug. As long as the
>>>
>>> CVE assignment can happens outside of QEMU community, we try to make it
>>> clear what is the "security boundary" but researchers filling CVEs
>>> might not understand it well.
>>
>> BTW see commit b317006a3f1 ("docs/secure-coding-practices: Describe how
>> to use 'null-co' block driver") which is related to your suggestion.
> 
> I agree we can avoid assigning CVEs to ati-vga and similar
> experimental devices that are not intended to be used in production,
> even if they fall under the virtualization use case. Maybe we can
> improve the documentation
> (https://qemu-project.gitlab.io/qemu/system/security.html) to clearly
> state that some devices are not security supported? Would it be
> possible/feasible to get a list of such devices? Or maybe the other
> way around, document the list of devices that are undeniably security
> supported (e.g., virtio*, *hci, e1000, etc.)?

I just posted a suggestion as RFC but forgot to Cc you:
"security: Introduce qemu_security_policy_taint() API"
https://lore.kernel.org/qemu-devel/20210908232024.2399215-1-philmd@redhat.com/
In particular for the ati-vga device:
https://lore.kernel.org/qemu-devel/20210908232024.2399215-8-philmd@redhat.com/


