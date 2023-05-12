Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F5D700771
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 14:06:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxRVe-0002cD-VU; Fri, 12 May 2023 08:04:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pxRVT-0002be-MF
 for qemu-devel@nongnu.org; Fri, 12 May 2023 08:04:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pxRVN-0003Zc-JX
 for qemu-devel@nongnu.org; Fri, 12 May 2023 08:04:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683893052;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YZZfMem2ysqUiMSPrUlJfKM8LEL1qy4WhRc+FosBGoQ=;
 b=WYFPrA9mHRg6v0k7h9AidlhRV1dBMkHwTFpr+e/NoCG05tr4SmzBt3W4eBpCC8xZgI5/gm
 kSegNciRYO7lFIgELdzDwp9R+7WpV+Ol7snDDJCKmTEbaq/eYkvq3Q7MAKwXrRKmovfZRj
 XxXm3Gnf2vw8hdgBXpfRzcsPRLJ47Gs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-665--qNPtdCWMF-3d3RHIK6bfQ-1; Fri, 12 May 2023 08:04:10 -0400
X-MC-Unique: -qNPtdCWMF-3d3RHIK6bfQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3062e5d0cd3so3872819f8f.3
 for <qemu-devel@nongnu.org>; Fri, 12 May 2023 05:04:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683893049; x=1686485049;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YZZfMem2ysqUiMSPrUlJfKM8LEL1qy4WhRc+FosBGoQ=;
 b=Tt6fXWMnYJE0oKmRtf1FsOUTaNbI+cLfVzxtnIbkpl6b71dWtP68+3Er03n272+QPY
 v2CzT/xWcBqYvmbfqLoBnAB5/VxuRY0lx+mULnvOFjNRjexVwCG1/0qlLcrBN9aieZpr
 6ndpLpWzHpy78BoCjBYPvnqo/y+VpzwZd5qzt4SPME+W+FUWw+KzKn0sL1U/x+mwYOMu
 hnbHanavUpA6KiXTJcI+IdV7X/lGITywSfC3unxv6q7QKvnpsEfkkMTM2yJQRiwFqaFk
 DtslEMvk21Q//acG+Om77ZMyCUN5MrHRKXTuSSvOIXfF3D76mJADdQahDdUefHZiIT5m
 Aj/w==
X-Gm-Message-State: AC+VfDz16ceoqyoaAzTSjF3FKNHO7Pvfzf4cDwFXPydMOTZXYuSi1CZC
 30voug75bd99dJJ2d+Pw9RNjEy+5BMdDZWY7ItMJ5DJDuN+KinH3jzBGKK7cMSQmmFzDAjYmMVu
 fpS1TBMUBpg9mQXY=
X-Received: by 2002:a5d:688a:0:b0:306:2b53:e7de with SMTP id
 h10-20020a5d688a000000b003062b53e7demr16107103wru.28.1683893049201; 
 Fri, 12 May 2023 05:04:09 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7+avnUQlIFEgS/+jEFMcDNUxfrm/0UJlaJkSZyFoAXywHN8UBDPObzI4rlkHA2LNqNqa9F8Q==
X-Received: by 2002:a5d:688a:0:b0:306:2b53:e7de with SMTP id
 h10-20020a5d688a000000b003062b53e7demr16107066wru.28.1683893048822; 
 Fri, 12 May 2023 05:04:08 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 n2-20020a5d4c42000000b003063db8f45bsm23087904wrt.23.2023.05.12.05.04.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 05:04:08 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Cc: afaerber@suse.de,  ale@rev.ng,  anjo@rev.ng,  bazulay@redhat.com,
 bbauman@redhat.com,  chao.p.peng@linux.intel.com,  cjia@nvidia.com,
 cw@f00f.org,  david.edmondson@oracle.com,  dustin.kirkland@canonical.com,
 eblake@redhat.com,  edgar.iglesias@gmail.com,
 elena.ufimtseva@oracle.com,  eric.auger@redhat.com,  f4bug@amsat.org,
 Felipe Franciosi <felipe.franciosi@nutanix.com>,  "iggy@theiggy.com"
 <iggy@kws1.com>,  Warner Losh <wlosh@bsdimp.com>,  jan.kiszka@web.de,
 jgg@nvidia.com,  jidong.xiao@gmail.com,  jjherne@linux.vnet.ibm.com,
 joao.m.martins@oracle.com,  konrad.wilk@oracle.com,  kvm@vger.kernel.org,
 mburton@qti.qualcomm.com,  mdean@redhat.com,  mimu@linux.vnet.ibm.com,
 peter.maydell@linaro.org,  qemu-devel@nongnu.org,
 richard.henderson@linaro.org,  shameerali.kolothum.thodi@huawei.com,
 stefanha@gmail.com,  wei.w.wang@intel.com,  z.huo@139.com,
 zwu.kernel@gmail.com
Subject: Re: QEMU developers fortnightly call for agenda for 2023-05-16
In-Reply-To: <452B32A5-8C9E-4A61-B14B-C8AB47D0A3ED@gmail.com> (Bernhard
 Beschow's message of "Fri, 12 May 2023 11:41:33 +0000")
References: <calendar-f9e06ce0-8972-4775-9a3d-7269ec566398@google.com>
 <871qjm3su8.fsf@secure.mitica>
 <452B32A5-8C9E-4A61-B14B-C8AB47D0A3ED@gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Fri, 12 May 2023 14:04:07 +0200
Message-ID: <87mt293geg.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Bernhard Beschow <shentey@gmail.com> wrote:
> Am 12. Mai 2023 07:35:27 UTC schrieb Juan Quintela <quintela@redhat.com>:
>>juan.quintela@gmail.com wrote:
>>> Hi If you are interested in any topic, please let me know. Later, Juan.
>>
>>Hi folks
>>
>>So far what we have in the agenda is:
>>
>>questions from Mark:
>>- Update on single binary?
>>- What=E2=80=99s the status on the =E2=80=9Cicount=E2=80=9D plugin ?
>>- Also I could do with some help on a specific issue on KVM/HVF memory ha=
ndling
>>
>>From me:
>>- Small update on what is going on with all the migration changes
>>
>>Later, Juan.
>>
>>
>>> QEMU developers fortnightly conference call
>>> Tuesday 2023-05-16 =E2=8B=85 15:00 =E2=80=93 16:00
>>> Central European Time - Madrid
>>>
>>> Location
>>> https://meet.jit.si/kvmcallmeeting=09
>
> Hi Juan,
>
> Would it be possible to offer a public calendar entry -- perhaps in
> .ics format -- with above information? Which can be conveniently
> subscribed to via a smartphone app? Which gets updated regularly under
> the same link? Which doesn't (needlessly, anyway) require
> authentcation?

This is enough?

https://calendar.google.com/calendar/event?action=3DTEMPLATE&tmeid=3DNWR0NW=
ppODdqNXFyYzAwbzYza3RxN2dob3VfMjAyMzA1MTZUMTMwMDAwWiBlZ2VkN2NraTA1bG11MXRuZ=
3ZrbDN0aGlkc0Bn&tmsrc=3Deged7cki05lmu1tngvkl3thids%40group.calendar.google.=
com&scp=3DALL

If that is not enough, if you know the knob to convince google calendar
to do it I am all ears.

Later, Juan.


