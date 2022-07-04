Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72DF0565991
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 17:14:06 +0200 (CEST)
Received: from localhost ([::1]:49918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8Nm1-00042o-JO
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 11:14:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o8Nkz-0003JU-6A
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 11:13:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o8Nkv-0000Ja-Qe
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 11:12:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656947576;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oN2JCFo8qsoFxXoga/Vt7eeGdbyPaih4GyE4dFIXDt4=;
 b=N6pVofGFxAfimKSwPP0QUI6xa2ITZN5Ja7wrYnGfMAIWKH41F07a31D1lSO/7BRRm9o/yO
 0bDLwj8P0GvjO9qXHHThQvp/NwLZ9YkjT3ASYkzSfjFb1k0P/VBbCRXt/gyZMhitGbkzA3
 fuWTYhm8pPSdwiIBLFOBdCAor1V/J7U=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-50-SJYmt5wHNWmiAg-ZoX6-DA-1; Mon, 04 Jul 2022 11:12:55 -0400
X-MC-Unique: SJYmt5wHNWmiAg-ZoX6-DA-1
Received: by mail-wm1-f72.google.com with SMTP id
 r206-20020a1c44d7000000b003a02fa133ceso377361wma.2
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 08:12:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oN2JCFo8qsoFxXoga/Vt7eeGdbyPaih4GyE4dFIXDt4=;
 b=E05AyMKESYk0OOsRY3Ld8CqlKbUKbbAJxsfDplnDJIrlHxT/gl/Hnwg41VJG/Vzxzi
 6m/QG3unHaYH6C7tzFh1kWGu8fB34TS0N5ccQgnkv+TNQHUFPx93fqV93GQduAl9cD0u
 Jgl5SIcrnWbMepeZWk9FtTmRxYLa2z4v+1UzSXbczN6GCAAJpARd5HPW+ydiAMTiRAKI
 SStCL+lpEKSOIbqxsCZwnas0Y30RJ5ZRsv/mk/8iO1o3D7fN0jYbgi5Ud6UG5R2CwDBB
 Zq4BmJP0ynP7LfDN1VU6MtpBCtcCysraiyBmJIy3ILjPgkwrwXgVh/bgU59/SqQ2sDy5
 OC9w==
X-Gm-Message-State: AJIora+lQyz0JTVkVIfLvyY0juV5px6+W5NbiEB+rxOIenLOo8O0ZflV
 5nFPkl6mwFM1VA0CheDKnhx+VmV90wDMHZthUktTq6d3HmkaY+S54ybN9cFWVAWrxTPpqiG5NjS
 8tJFf+c9XHUJAlRQ=
X-Received: by 2002:a05:6000:1883:b0:205:c0cb:33c6 with SMTP id
 a3-20020a056000188300b00205c0cb33c6mr28691359wri.39.1656947574502; 
 Mon, 04 Jul 2022 08:12:54 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tiXiiY6SUOBdrfpSHRndLGb2mco3mTnGaA3GlEbqxbHL2UdXtXRn1GsR+XCLPN1ZFO2QFy4Q==
X-Received: by 2002:a05:6000:1883:b0:205:c0cb:33c6 with SMTP id
 a3-20020a056000188300b00205c0cb33c6mr28691336wri.39.1656947574251; 
 Mon, 04 Jul 2022 08:12:54 -0700 (PDT)
Received: from [192.168.8.104] (tmo-098-39.customers.d1-online.com.
 [80.187.98.39]) by smtp.gmail.com with ESMTPSA id
 p12-20020a5d638c000000b0021d6dad334bsm1819462wru.4.2022.07.04.08.12.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jul 2022 08:12:53 -0700 (PDT)
Message-ID: <feb77ada-131d-4e7a-b2df-cec323829794@redhat.com>
Date: Mon, 4 Jul 2022 17:12:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 0/4] rSTify a few more docs; move them to QEMU Git
Content-Language: en-US
To: Kashyap Chamarthy <kchamart@redhat.com>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, peter.maydell@linaro.org, eblake@redhat.com
References: <20220606164336.245740-1-kchamart@redhat.com>
 <Yp4wKGhyMtAj/Jx2@pinwheel> <Yp4xk2+JeNkZ5eTv@pinwheel>
 <Yr62C1611gbJZshc@pinwheel>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <Yr62C1611gbJZshc@pinwheel>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/07/2022 10.53, Kashyap Chamarthy wrote:
> Ping.
> 
> Thomas/Peter: when you get some time, please have a look at this.

I still had a question/request here that was not answered:

https://lore.kernel.org/qemu-devel/2fca7b7e-f95d-eae1-9973-9ede30cac3c1@redhat.com/

Also, for the first patch, I'd like to see a Reviewed-by by one of the 
security folks whether it's ok for them to move this page to a location that 
has different access rights.

  Thomas


> On Mon, Jun 06, 2022 at 06:55:47PM +0200, Kashyap Chamarthy wrote:
>> On Mon, Jun 06, 2022 at 06:49:49PM +0200, Kashyap Chamarthy wrote:
>>> Oops, messed up v3's cover-letter subject; now fixed.  Sorry.
>>
>> Sigh, instead of "v3", I accidentally wrote "v4" in the cover-letter
>> subject.  Now fix that too; sorry for the noise.
>>
>>> On Mon, Jun 06, 2022 at 06:43:32PM +0200, Kashyap Chamarthy wrote:
>>>> - Add back the "<commit hash/link>" fragment in security-process.rst
>>>>    [Thomas]
>>>> - Add a docs/about/contacting-the-project.rst as per Peter's feedback
>>>>    here:
>>>>    https://lists.nongnu.org/archive/html/qemu-devel/2022-03/msg05178.html
>>>>    [pm215]
>>>> - Keep Thomas' R-by for "docs: rSTify MailingLists wiki; move it to QEMU
>>>>    Git"
>>>>
>>>> v2 cover letter:
>>>> -----------------------------------------------------------------------
>>>> rSTify a few more docs; move them to QEMU Git
>>>>
>>>> This series rST-ifies:
>>>>
>>>>    - security-process[1]
>>>>    - MailingLists[2]
>>>>    - GettingStartedDevelopers[3]
>>>>
>>>> The 'security-process' page is from the QEMU web and is moved to
>>>> docs/devel/ in QEMU Git.  This is based on Paolo's feedback here[4].
>>>> The next two docs are converted from the Wiki.
>>>>
>>>> [1] https://www.qemu.org/contribute/security-process
>>>> [2] https://wiki.qemu.org/Contribute/MailingLists
>>>> [3] https://wiki.qemu.org/Documentation/GettingStartedDevelopers
>>>> [4] https://lists.nongnu.org/archive/html/qemu-devel/2021-11/msg04002.html
>>>> -----------------------------------------------------------------------
>>>>
>>>> Kashyap Chamarthy (4):
>>>>    docs: rSTify "security-process" page; move it to QEMU Git
>>>>    docs: rSTify MailingLists wiki; move it to QEMU Git
>>>>    docs: rSTify GettingStartedDevelopers wiki; move it to QEMU Git
>>>>    Add a new doc "contacting-the-project.rst"
>>>>
>>>>   docs/about/contacting-the-project.rst     |  16 ++
>>>>   docs/about/index.rst                      |   1 +
>>>>   docs/devel/getting-started-developers.rst | 200 ++++++++++++++++++++++
>>>>   docs/devel/index.rst                      |   3 +
>>>>   docs/devel/mailing-lists.rst              |  51 ++++++
>>>>   docs/devel/security-process.rst           | 190 ++++++++++++++++++++
>>>>   6 files changed, 461 insertions(+)
>>>>   create mode 100644 docs/about/contacting-the-project.rst
>>>>   create mode 100644 docs/devel/getting-started-developers.rst
>>>>   create mode 100644 docs/devel/mailing-lists.rst
>>>>   create mode 100644 docs/devel/security-process.rst
>>>>
>>>> -- 
>>>> 2.36.1
>>>>
>>>
>>> -- 
>>> /kashyap
>>
>> -- 
>> /kashyap
>>
>>
> 


