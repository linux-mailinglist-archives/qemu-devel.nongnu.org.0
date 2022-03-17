Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F35D4DCA9D
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 16:59:40 +0100 (CET)
Received: from localhost ([::1]:55952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUsXL-0004MZ-Gs
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 11:59:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nUsVr-0003Z9-UO
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 11:58:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nUsVp-0007wg-OX
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 11:58:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647532685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eSjd2aWlhwnp2nJUoQ0zBkWkxXZ45ePCvPn3Mbs5j68=;
 b=hFyhKRkilxtk2HX6itUhr1ZoY/SrDTRB+YIHALbLrqimc5owyOSqhZQExUzXi61Dt1LoTB
 vQkss7PM5NZwl57j8c91MU3PHEoSdvdJ5gcYWEMeNpROWzLNvzQcqTHU8bKaRQPTkZfqes
 /gjvstCJQB/0s1QCbJ8irkNe+NNVBno=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-630-JbHyw0OuP4OONA_TaHnFZw-1; Thu, 17 Mar 2022 11:58:04 -0400
X-MC-Unique: JbHyw0OuP4OONA_TaHnFZw-1
Received: by mail-ed1-f71.google.com with SMTP id
 x1-20020a50f181000000b00418f6d4bccbso1654470edl.12
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 08:58:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=eSjd2aWlhwnp2nJUoQ0zBkWkxXZ45ePCvPn3Mbs5j68=;
 b=xU9golE4JOrDVTAtfKMeh2HM3eAH2VPOJrPF4gtuuCwEknD+H4/PH30fCQViazwC2x
 dP9Su3F+xRKNus3z1wUi7IX80eiD/o95EADUVwn7EZlYZ3UgAtWpE7FSC1nMg7JaHtKB
 Z75R/yZlCUqsDgIOaW3G+qyT27OV+SQWIKf1mNOQq55ronqci8gngjhta12wekHij4ny
 g+DscFK6L9YwWYeE6BSQ60uUGjGCZje5EBlIfqOq870yXCt1DeeCMqq3mhuE/J+fk0lU
 q5sctJxarLgj01KrKkWdVEZ6wGe/Z53Vo/0vDlZulY+B5E5pN6Tn/mru1jGURKl3b753
 mQpA==
X-Gm-Message-State: AOAM531q6wat8Lj/5vgolgKFhQsO5ohOLU7/M8oPGw2iJ+XQHuDc1C9m
 5JamLiWWlsvE2tmTc6AUwN9mxGiLmMiE2w/3zEUnjqr0/opvzcTWUgbeHxAYMZ2FIxE7WSfoact
 L5uZtmNJE2SxKTlw=
X-Received: by 2002:a17:907:72d0:b0:6db:4788:66a9 with SMTP id
 du16-20020a17090772d000b006db478866a9mr5327095ejc.516.1647532682764; 
 Thu, 17 Mar 2022 08:58:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw2LZOXCWVUCnYpJwrgjjq5E4spafEjkdrXZbqN2fcTuCiu69YlACVSrMPO7VMtjw+IHriiuw==
X-Received: by 2002:a17:907:72d0:b0:6db:4788:66a9 with SMTP id
 du16-20020a17090772d000b006db478866a9mr5327076ejc.516.1647532682582; 
 Thu, 17 Mar 2022 08:58:02 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 h30-20020a056402095e00b00412b81dd96esm2795862edz.29.2022.03.17.08.58.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Mar 2022 08:58:02 -0700 (PDT)
Message-ID: <7f4e7379-a3e6-31e3-148a-6282b4d87104@redhat.com>
Date: Thu, 17 Mar 2022 16:58:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 4/5] iotests: make qemu_img raise on non-zero rc by
 default
To: John Snow <jsnow@redhat.com>
References: <20220308015728.1269649-1-jsnow@redhat.com>
 <20220308015728.1269649-5-jsnow@redhat.com>
 <e9b98326-1d20-b9fa-0756-42d0ab7f8466@redhat.com>
 <CAFn=p-ZKxZCPSk=jtX76ePntA5Ao1M5q3AsX=P_dKtVpdFrtAg@mail.gmail.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <CAFn=p-ZKxZCPSk=jtX76ePntA5Ao1M5q3AsX=P_dKtVpdFrtAg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17.03.22 16:24, John Snow wrote:
> On Thu, Mar 17, 2022 at 6:25 AM Hanna Reitz <hreitz@redhat.com> wrote:
>> On 08.03.22 02:57, John Snow wrote:
>>> +    if check and subp.returncode or (subp.returncode < 0):
>> I wouldn’t expect these parentheses here in any other language, are they
>> required in Python?
>>
> It's not required, I just find it easier to read this way.

Oh well.

>>> +        raise VerboseProcessError(
>>> +            subp.returncode, full_args,
>>> +            output=subp.stdout,
>>> +            stderr=subp.stderr,
>>> +        )
>> I trust these parameters are correct, because it really sometimes seems
>> like Python doc doesn’t want to tell me about the arguments that
>> constructors take.  (The only thing I found out is that `stdout` works
>> as an alias for `output`, so passing `output` here and reading
>> `self.stdout` in `VerboseProcesError` should(tm) be fine.)
>>
>>>> import subprocess
>>>> help(subprocess.CalledProcessError)
>   |  __init__(self, returncode, cmd, output=None, stderr=None)
>   |      Initialize self.  See help(type(self)) for accurate signature.
>
> It should be fine :tm:

The things you learn...

Hanna


