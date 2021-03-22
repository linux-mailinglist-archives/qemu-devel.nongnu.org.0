Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 167B7344B71
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 17:34:49 +0100 (CET)
Received: from localhost ([::1]:34094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lONVw-0003za-4G
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 12:34:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lONOE-00070F-V4
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 12:26:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lONO8-0005be-T9
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 12:26:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616430402;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZosqkRNGzh+a2kf+44LGFVj4VC6dALmVVWBFPynEob0=;
 b=HP1TX0f6EXqeROukj6JvvU3KMc+zj3YnBrlusjPHolC2gBY5m7DT3XDZ+EAcKKhHRRWLUO
 R9RmaAExI2JXP3TLYCBfsC/l6Od0TPpVjRVI324VjW+xrKsONTcVyB64wUl051Jl8P7f8y
 fBoTbIPUfsJJasJPe1CqFn4nf+CUG70=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-451-SX57OH6GOguI-wGyfiE75A-1; Mon, 22 Mar 2021 12:26:39 -0400
X-MC-Unique: SX57OH6GOguI-wGyfiE75A-1
Received: by mail-wr1-f72.google.com with SMTP id h5so26311254wrr.17
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 09:26:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZosqkRNGzh+a2kf+44LGFVj4VC6dALmVVWBFPynEob0=;
 b=qJDOewgEDubs7a2/9CAPtz6zD1RDkiw7praIqI6sI3/66tWpxjlAK4gO1M9Lg4c+qh
 s2+nHiEA3e8JMLA412hG0OgQmaF4rOV1fEkhEwhnseChbnn7+Pv+Lb0padSnRjF3e9Px
 oitvDK3Nl5mZP51i8pA3JiN8WMNg1ObN4CIYamIAxhzpWaZxnfXnS/YUantcwO/cYPTA
 HmDJWruf3XAyb+EGVXI7ifOtpTwDmK4nFnyydXdo7XQaPFhpsrxNPgwzGNW7Pjh48df5
 +xaHybXaAfaAdM1WojY7eUxMPYqWVTisnXMWbp3enslq8crYesg7IyXqXwDtxjqv3FaC
 VfHA==
X-Gm-Message-State: AOAM531qCmNItslHIH/0KH/ti3iTwmWzupsyT0FhJlR1GX6r+t3mkWPf
 +RgoIywzXiZqoS3aAkxJSk4I45RW5Mot0LuHo9JXl7ho7/zU/RXnXAOGxMUviQHW3RyRfZikMug
 i1CB1JH1YCNcKSSqmW9oOhES4ckrhAaLp6hJvvI8dxqHyTq9rQibsDUmY4/8suvxunL0=
X-Received: by 2002:a1c:bc82:: with SMTP id m124mr599095wmf.118.1616430397911; 
 Mon, 22 Mar 2021 09:26:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyEsBkk72yzhEdmqNIVFNMZ2VfzWeaxRL1HzGLuYF/FoiTEH4RA6BUdje+BR9XL9Aq6S59m4g==
X-Received: by 2002:a1c:bc82:: with SMTP id m124mr599085wmf.118.1616430397696; 
 Mon, 22 Mar 2021 09:26:37 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id t14sm20139394wru.64.2021.03.22.09.26.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Mar 2021 09:26:37 -0700 (PDT)
Subject: Re: [Qemu-devel] [PULL 18/76] optionrom: add new PVH option rom
To: Stefano Garzarella <sgarzare@redhat.com>
References: <1549390526-24246-1-git-send-email-pbonzini@redhat.com>
 <1549390526-24246-19-git-send-email-pbonzini@redhat.com>
 <e3d925e6-a48e-07b9-6418-05c5a4d2cd36@redhat.com>
 <f33bf6fa-1fa3-4e33-bd8e-843bec2d5638@redhat.com>
 <20210319173524.rnrxslpmdjck6uxv@steredhat>
 <CABgObfZHP1aSMpbdWh6TwCN_D5gy5TS5+Q7-La8d7E5czvn7Rg@mail.gmail.com>
 <20210319182022.veha5gbcg3p4idgk@steredhat>
 <CAGxU2F7hNoJeDpsCtU0ypKd=3+3mrxcc3QU6Yx9SK9e_7y6Khw@mail.gmail.com>
 <CAGxU2F5x_TNQZJ3f+baam3pHzzP+0k57FFNB5ms-qt3B25gSVQ@mail.gmail.com>
 <c7f0fb65-5d9b-9b38-8348-30eaa5ff5594@redhat.com>
 <20210322135719.z34fei3aawcr4x7z@steredhat>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <e4697232-0547-890f-4794-00a357f10902@redhat.com>
Date: Mon, 22 Mar 2021 17:26:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210322135719.z34fei3aawcr4x7z@steredhat>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/03/21 14:57, Stefano Garzarella wrote:
> On Mon, Mar 22, 2021 at 12:52:37PM +0100, Paolo Bonzini wrote:
>> On 22/03/21 11:59, Stefano Garzarella wrote:
>>>
>>> If I build with gcc 10.2.1 20210313 (Alpine 10.2.1_pre2) uint64_t and
>>> UINT64_C(1) have a size of 4 bytes, while UINT64_C(0x2052545020445352)
>>> has a size of 8 bytes:
>>>
>>>    warning: initialization of ‘char (*)[4]’ from ‘int’ makes pointer 
>>> from integer without a cast [-Wint-conversion]
>>>    74 |     char (*__size1)[sizeof(uint64_t)] = 1;
>>>       |                                         ^
>>>    warning: initialization of ‘char (*)[4]’ from ‘int’ makes pointer 
>>> from integer without a cast [-Wint-conversion]
>>>    75 |     char (*__size2)[sizeof(UINT64_C(1))] = 1;
>>>       |                                            ^
>>>    warning: initialization of ‘char (*)[8]’ from ‘int’ makes pointer 
>>> from integer without a cast [-Wint-conversion]
>>>    76 |     char (*__size3)[sizeof(UINT64_C(0x2052545020445352))] = 1;
>>
>> Looks like long is 4 bytes long with -m16 and -m32, but 8 bytes with 
>> -m64.  The large constant is extended to long long because it's the 
>> only way to fit it.
> 
> Yeah, but I expected uint64_t to always be on 8 bytes, regardless of the 
> architecture.

It's somehow using the -m64 definition (long int) instead of the -m32 
definition (long long int), even though -m16 is basically "same as -m32 
but emitting 16-bit encoded instructions".

Paolo


