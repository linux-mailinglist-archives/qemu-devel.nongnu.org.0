Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B011E65FB
	for <lists+qemu-devel@lfdr.de>; Thu, 28 May 2020 17:27:34 +0200 (CEST)
Received: from localhost ([::1]:47598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jeKRR-0000kf-N5
	for lists+qemu-devel@lfdr.de; Thu, 28 May 2020 11:27:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jeKQ7-0008Lc-On
 for qemu-devel@nongnu.org; Thu, 28 May 2020 11:26:11 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:26789
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jeKQ7-0004nB-0p
 for qemu-devel@nongnu.org; Thu, 28 May 2020 11:26:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590679570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=WxlaOktZDbz7a7W/ScR6lX9w+5Tfo6ZFRwnuHWIPNmM=;
 b=YlbgkYB+sHJtP+6BdugU2mKjrx+jp/cpfA73CkCTO5Iyhg+MGlLLLBcKIHojb/G2mVCm2u
 cwVKRmdR9jbeBdEo/nJYEcTKO3uHqJ9g0RKhLMvq4+sTU4HVkzsClnyUs7hYrors+E457Q
 tSWKYDXkC30FOZjf+2bdH//YwJsYp8w=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-275-fqso9oiOPvaZmsxR-ubQXw-1; Thu, 28 May 2020 11:26:08 -0400
X-MC-Unique: fqso9oiOPvaZmsxR-ubQXw-1
Received: by mail-wr1-f72.google.com with SMTP id w4so7074496wrl.13
 for <qemu-devel@nongnu.org>; Thu, 28 May 2020 08:26:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=WxlaOktZDbz7a7W/ScR6lX9w+5Tfo6ZFRwnuHWIPNmM=;
 b=c8fsMOvjgQYjGcbbK7IuWCJnbLz8Aze5cLVbLsbI4uKTZbPowdUw4SnpD2VeYAID8u
 lm5IhFlWKlF2jXyV0+nsHZxDZXcGvf+sO2fcdYOL/dKf5kRgTjj8Wx24ohsuQSJwmzMC
 Tl2XhT8YWD2s06s80Gt9uUcB9jABREEVb9PRZVCQ9iH0iDBLqYurRT/7IbOTL7PURAQP
 zIYIAiPeblj+tdglI46f1S29/9iNSTlp/1iwt2uZRI2vxMPB+oroZe4MMie7cuG0WaqE
 eMOAn94XjS02R51btm8dzzjvNt7xJtlvnB4xuoJQR76Hp4PQHsE3XYd2mG5dumMXV3L+
 6ItQ==
X-Gm-Message-State: AOAM532JZFszFkd+bdW1HcTsc+eQ6d0WUqVHeZ0MTXznDjlR2CTCR21X
 XwImkPLaf3GL/Q7nsq3g2OkyiGHtLBlGgf7LVFoditayyig+8pwqbAe/2siBG9VnNXNAobsTVAe
 HvxRu/lp04KypITY=
X-Received: by 2002:a5d:4948:: with SMTP id r8mr3939732wrs.290.1590679567728; 
 Thu, 28 May 2020 08:26:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxM20bVr944+BMymySWkegxi3H1PPr0hUP2enbi3mB4F71Qvk08gMPM3j+3W0jsA8MPh+xIsw==
X-Received: by 2002:a5d:4948:: with SMTP id r8mr3939718wrs.290.1590679567497; 
 Thu, 28 May 2020 08:26:07 -0700 (PDT)
Received: from [192.168.1.36] (71.red-88-21-204.staticip.rima-tde.net.
 [88.21.204.71])
 by smtp.gmail.com with ESMTPSA id j18sm6477052wrn.59.2020.05.28.08.26.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 May 2020 08:26:07 -0700 (PDT)
Subject: Re: [PULL 00/12] testing and plugin fixes
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200527145455.2550-1-alex.bennee@linaro.org>
 <CAFEAcA_LrZjBY_y3UR=fdOtDvnY=zGG-10Yeq0ZjbBc=EsvRfw@mail.gmail.com>
 <87blm83y5v.fsf@linaro.org>
 <CAFEAcA_QTkWA7eBwORWMmpcH1E5bF4A3mFtkzdstkucd-2+p3A@mail.gmail.com>
 <591d2690-c2e7-98aa-8569-5f99737c5f71@redhat.com>
 <CAFEAcA-EZ_c01599j+NJH1Vd0aJ4cQzwPYynx=rBZP7x_3h3jg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <72395696-4b12-b843-901e-c0db34d6c2d8@redhat.com>
Date: Thu, 28 May 2020 17:26:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-EZ_c01599j+NJH1Vd0aJ4cQzwPYynx=rBZP7x_3h3jg@mail.gmail.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/28 03:11:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/28/20 5:20 PM, Peter Maydell wrote:
> On Thu, 28 May 2020 at 16:18, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>
>> +Gerd
>>
>> On 5/28/20 5:09 PM, Peter Maydell wrote:
>>> Yes. I see them also now on the next pullreq I'm trying to
>>> process. How do I get back to an environment that doesn't
>>> produce all these warnings?
>>
>> Maybe building back NetBSD 8.1?
> 
> Did that change not itself trigger the VM to be rebuilt ?
> If not, can we make it so that updates to the images always
> do trigger rebuilds, so that we can catch new warnings
> that they introduce at the time rather than later?

This is how it should work... How do you run your VM builds?


