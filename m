Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E964F29B1
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 12:16:44 +0200 (CEST)
Received: from localhost ([::1]:37190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbgEs-0000g1-TG
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 06:16:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nbgC5-0008JR-85
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 06:13:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nbgC2-0001hp-9B
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 06:13:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649153624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yg6FE74BO7tuv20rRJcTMxGdvb7mbFR/lILx0DhFy7c=;
 b=X3aX80XguDOZ8Mr8KOycVudlKsFgPip9w1qS/uFQEHfKD3vRzk+1r0g9rJ5Eaa1YgsZkSf
 HHgidA0f2xeLU9liSN+Csd0PGkKm01KtkB90/HEqhfA30C2R850PQXbRlN7WFLx2n2r6Z5
 GoT2aEhOSNBUBhwuWVkOqchLyKNP8po=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-636-AmXSxFwCPFajlXffT7Rtbw-1; Tue, 05 Apr 2022 06:13:43 -0400
X-MC-Unique: AmXSxFwCPFajlXffT7Rtbw-1
Received: by mail-wm1-f69.google.com with SMTP id
 c19-20020a05600c4a1300b0038e6b4a104cso1102249wmp.9
 for <qemu-devel@nongnu.org>; Tue, 05 Apr 2022 03:13:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Yg6FE74BO7tuv20rRJcTMxGdvb7mbFR/lILx0DhFy7c=;
 b=LzUe5wQaFXgCvEkpDnIZqhtuYXB9dUANFFgHoS1LjlSAod7SvN9Vi0lbOTHvy5TJhH
 gBfc4uE7oQrbEdgnM0d/9AGAKT0l3aR/NuwtiORVgtJP4FFP1KBHfyGUG787117zICd/
 s+EaPkppbQ5jtL5A7Mo583dKXDxAPwplG5JGH8t5+V3OshxjYlqfEy4COjZKnUoYDmw2
 zRZFBoJ+/Ak1McKBzDBZSnVHIb4kUrPYO9SODcBYUZtfEGTuszHClsNfmVFb4spd+qkV
 Ts6L0Cq/g13IhoPKIMen6uE5fNwQl16VunWB6MXJTbwg++LDm4ZbTtFfsEIBgW6RWUao
 qiHg==
X-Gm-Message-State: AOAM5327gHCaLYxjaPo/ucNHLwTEIVcATYvUdK87lNi6QffY+o8KJp3z
 VoMpzlM6hXZAgT2qTf6G4W/OSABUG3fsMnEyHTPIhIt78eAQUtuUu125J1yUJObCVDc1IVhHw2K
 tGuiAQb+1FCzMvuI=
X-Received: by 2002:a5d:6d8a:0:b0:204:909:2d9a with SMTP id
 l10-20020a5d6d8a000000b0020409092d9amr2153815wrs.435.1649153621432; 
 Tue, 05 Apr 2022 03:13:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyzOVyFuXWssBHGhLgMoX+/ycrhM6R6qUFRD1Fui1Q7hVnoCvmOhVUVU5Nhd6PBrSoQdpoKTQ==
X-Received: by 2002:a5d:6d8a:0:b0:204:909:2d9a with SMTP id
 l10-20020a5d6d8a000000b0020409092d9amr2153790wrs.435.1649153621115; 
 Tue, 05 Apr 2022 03:13:41 -0700 (PDT)
Received: from ?IPV6:2003:cb:c707:c900:f06e:62c8:b5ce:6d27?
 (p200300cbc707c900f06e62c8b5ce6d27.dip0.t-ipconnect.de.
 [2003:cb:c707:c900:f06e:62c8:b5ce:6d27])
 by smtp.gmail.com with ESMTPSA id
 b1-20020adfd1c1000000b002058537af75sm12135007wrd.104.2022.04.05.03.13.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Apr 2022 03:13:40 -0700 (PDT)
Message-ID: <654b2fcd-0532-4484-d9cf-f875acedf7ee@redhat.com>
Date: Tue, 5 Apr 2022 12:13:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v4 10/11] tests/tcg/s390x: Tests for Vector Enhancements
 Facility 2
To: Christian Borntraeger <borntraeger@linux.ibm.com>,
 David Miller <dmiller423@gmail.com>
References: <20220322000441.26495-1-dmiller423@gmail.com>
 <20220322000441.26495-11-dmiller423@gmail.com>
 <c3bb72da-c390-f9b5-5254-f8c16df21427@redhat.com>
 <6409f049-d938-0e06-3cea-5877b31fce00@redhat.com>
 <95ad366c-509d-d41f-209b-dc66054de4b8@redhat.com>
 <CAEgyohVUHa+yd-inLOv3zTf143-_2Z35+K_XatUz74bqxDK9CA@mail.gmail.com>
 <CAEgyohWR6C1z8OyuGwkv8LT-P5fR9eVsCFw4LmGUxZCDNszoSg@mail.gmail.com>
 <58110f3f-3190-7af4-6839-9a30fce05855@linux.ibm.com>
 <CAEgyohUqmHrbQC5yqAtuhcqmnx-q5YxE+6xctbCVROGz+cqrqw@mail.gmail.com>
 <05661926-6d26-9d78-b576-a33391e25c24@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <05661926-6d26-9d78-b576-a33391e25c24@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: farman@linux.ibm.com, cohuck@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org, pasic@linux.ibm.com,
 qemu-s390x@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01.04.22 17:25, Christian Borntraeger wrote:
> Am 01.04.22 um 17:02 schrieb David Miller:
>> vrr is almost a perfect match (it is for this, larger than imm4 would
>> need to be split).
>>
>> .long : this would be uglier.
>> use enough to be filled with nops after ?
>> or use a 32b and 16b instead if it's in .text it should make no difference.
> 
> I will let Richard or David decide what they prefer.
> 

I don't particularly care as long as there is a comment stating why we
need this hack.

-- 
Thanks,

David / dhildenb


