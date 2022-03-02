Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E37DD4CAB6B
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 18:21:14 +0100 (CET)
Received: from localhost ([::1]:36676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPSf3-0002La-Up
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 12:21:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nPSd6-0000Mq-FK; Wed, 02 Mar 2022 12:19:12 -0500
Received: from [2607:f8b0:4864:20::635] (port=45806
 helo=mail-pl1-x635.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nPSd4-0006pa-UV; Wed, 02 Mar 2022 12:19:12 -0500
Received: by mail-pl1-x635.google.com with SMTP id s1so2108187plg.12;
 Wed, 02 Mar 2022 09:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=osi9O0VV1sOz8Hi7PeR3obUSFPu9+F2zWbPoIlHuOlU=;
 b=ZRKhXBAcKjsGbAdq1wmYgrE+k6hxDe3EZJu1mRhb8+JyAGF3ywfTNCafRZJp97UWL1
 6y++snXIzl86zSeQVHRMdKKtKoP/FYzYl5z38L8R+M8ALlximDMvi3h3HS0Hd76MdgEj
 TIEJ1PaaWSkizU6C8SjXfTECCvq024QgNdPIdVdQw+sZW+tNljlmOJ1wnTwy3Tl8reCX
 Xhwk3h32nJwkGUS27IpQfCJ7KNMvKSH1NP6Dy7pv0bjxJ9f/z+rPJpbde0wxw1Pq1+Oi
 Du9QH+ww3jX+CA4yrNX9FsI9OhmR1miUJr5KHIWOsZVy8V7OxowS95AOQUKNNLFAxKQ3
 1KRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=osi9O0VV1sOz8Hi7PeR3obUSFPu9+F2zWbPoIlHuOlU=;
 b=f2PvNsw+J3eICMfyF9noJVk1AmhesXcGhrVJN1CJKA9Za4IsOgH0Rzn1gdwl7aXc/d
 NiEz2idIoQsl3ZtuxPs5RZmNIAAExEhCIJXgMZvxBYLZbQymxX03NqSqgJe0spkVNXvy
 e0tyg22NGEsxsdpoLP5aRCxcj4Ygq9pMcFY/KehlBP9U7WP3VNXmbWof0ub8XmvxwlGY
 HmyrnvbzCZCuIXO3TRm/6QOY5PQAVSVtca+ssAUd2q4kvO8C4dZMST6njAtPOhtOj/fA
 g2DJDtJ/SVLK96WCtM63M5eK0RarfTksAmgstFemUDbZiukktR4BImt45Mjrdjzp9bn7
 4dng==
X-Gm-Message-State: AOAM531g7B1JgcfCWjZinAAMWjk9ygEMuuxZ0+5f1Kd+xGg9JuYMGhbu
 yH6iFhxd3jsnXZ7w1usSSUw=
X-Google-Smtp-Source: ABdhPJyB5MLRYKAl+2/w1OwwNzXz0ex2//9FEpEJe1Su5thGMrlaQQQNCGD7Ft8PtuTn7UhgorxRFw==
X-Received: by 2002:a17:902:c111:b0:14f:c841:66e2 with SMTP id
 17-20020a170902c11100b0014fc84166e2mr31827638pli.92.1646241548513; 
 Wed, 02 Mar 2022 09:19:08 -0800 (PST)
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71]) by smtp.gmail.com with ESMTPSA id
 d17-20020a056a00245100b004c283dcbbccsm21324325pfj.176.2022.03.02.09.19.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Mar 2022 09:19:07 -0800 (PST)
Message-ID: <8dfc9854-4d59-0759-88d0-d502ae7c552f@gmail.com>
Date: Wed, 2 Mar 2022 18:18:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH 2/2] Allow building vhost-user in BSD
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, Sergio Lopez <slp@redhat.com>,
 qemu-devel@nongnu.org
References: <20220302113644.43717-1-slp@redhat.com>
 <20220302113644.43717-3-slp@redhat.com>
 <66b68bcc-8d7e-a5f7-5e6c-b2d20c26ab01@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <66b68bcc-8d7e-a5f7-5e6c-b2d20c26ab01@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::635
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 kvm@vger.kernel.org, John G Johnson <john.g.johnson@oracle.com>,
 David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, vgoyal@redhat.com,
 Eric Farman <farman@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/3/22 18:10, Paolo Bonzini wrote:
> On 3/2/22 12:36, Sergio Lopez wrote:
>> With the possibility of using pipefd as a replacement on operating
>> systems that doesn't support eventfd, vhost-user can also work on BSD
>> systems.
>>
>> This change allows enabling vhost-user on BSD platforms too and
>> makes libvhost_user (which still depends on eventfd) a linux-only
>> feature.
>>
>> Signed-off-by: Sergio Lopez <slp@redhat.com>
> 
> I would just check for !windows.

What about Darwin / Haiku / Illumnos?

