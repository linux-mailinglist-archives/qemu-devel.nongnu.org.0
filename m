Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C760D3FEEEE
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 15:46:39 +0200 (CEST)
Received: from localhost ([::1]:37488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLn38-0005zK-Pp
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 09:46:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mLmYp-0007Oq-UN
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 09:15:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mLmYo-0006sb-5l
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 09:15:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630588517;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HSC2mmCk9EzK+vzTm0FupuuEt/8AOL1Z8+xPWJuiMdI=;
 b=BYklyhgzjTAbiuRXKXYviPfubEcfHuKKy9w0mcUeLQrKyT1NWwuhC+ZvxyeyhegifDZtRg
 1qcr02/IsPydcxzh5kENC+lhEZ8WRcimXTweQRQtiaMvHFsh5NnJbyHW7WHcgYPc1wbgLz
 oczSp+TRXFb0Y2RqeH6zDezMhsDZD/4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-188-Y15GxreCNJuRYU-2catKVA-1; Thu, 02 Sep 2021 09:15:16 -0400
X-MC-Unique: Y15GxreCNJuRYU-2catKVA-1
Received: by mail-wm1-f69.google.com with SMTP id
 f19-20020a1c1f13000000b002e6bd83c344so684582wmf.3
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 06:15:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HSC2mmCk9EzK+vzTm0FupuuEt/8AOL1Z8+xPWJuiMdI=;
 b=ZjzxMCuW1EWnV7SLEb24OymlY7XoJjURBDcpzwi4iixNFpTKy0CiIuguHCxMhVLjTN
 sijFaVtm3jNu/JbXe8fZgHSQn30kNoK3LT5shb/aZ/gkmZgVoNbXWeuU6f0puM8KZiUX
 /h+NlnjDCCwlKRPTOALRa869kHxx1WmTdDUxq1Tiwyh+RARn7+UYVOhzrMgbmLRjxOKA
 H86kVI+YoApbyhM3DYIpehb6EsnlhpN2Vi4sy8JyWNLGO0T/K8VNIrrLexa1wqeiOn7v
 WU0HBo4+EW2MaHxWcuARw20MbKxSUKn+CJdWIT8Ta9pgble7memNvad/yNHBRIiNGSxi
 Irfg==
X-Gm-Message-State: AOAM532VGBr+YXJvWYbWmBZD7+moKhY1mraMC6WbFepeKp9RyXAm/50q
 KkaWAa6SFKGK09cZJecSISZ1zsTmQA1NLow5nYhzyl6PXRclkIADW0BNMNTiTbBwbDaB5+t0OUY
 YljwVY4zT1L0Nakw=
X-Received: by 2002:a5d:6085:: with SMTP id w5mr3766432wrt.104.1630588515263; 
 Thu, 02 Sep 2021 06:15:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwZT4p8msI6uAu8mQhOFEmVPRaPEoZjmwS4dpCPplkBWB4NC1bhOYFzgSVtJdkDJ414odcxug==
X-Received: by 2002:a5d:6085:: with SMTP id w5mr3766393wrt.104.1630588515038; 
 Thu, 02 Sep 2021 06:15:15 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id i5sm1462495wmq.17.2021.09.02.06.15.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Sep 2021 06:15:14 -0700 (PDT)
Subject: Re: Guest Agent issue with 'guest-get-osinfo' command on Windows
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Konstantin Kostiuk <konstantin@daynix.com>,
 Developers <qemu-devel@nongnu.org>
References: <CAJ28CFSFEatxgfvUE3gvnFBVX7GrqMwk0+t1foFfNzDu7bwv3A@mail.gmail.com>
 <b09b85ed-1c7a-72fc-b4fa-7930f8c44c9f@redhat.com>
Message-ID: <de8cdbfe-446c-e777-7190-0961a30d0abe@redhat.com>
Date: Thu, 2 Sep 2021 15:15:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <b09b85ed-1c7a-72fc-b4fa-7930f8c44c9f@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.225, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Michael Roth <michael.roth@amd.com>, "Richard W.M. Jones" <rjones@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Tomas Golembiovsky <tgolembi@redhat.com>, Yan Vugenfirer <yan@daynix.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Forgot to Cc Richard & Daniel.

On 9/2/21 3:11 PM, Philippe Mathieu-Daudé wrote:
> On 9/2/21 2:36 PM, Konstantin Kostiuk wrote:
>> Hi Team,
>>
>> We have several bugs related to 'guest-get-osinfo' command in Windows
>> Guest Agent:
>> https://bugzilla.redhat.com/show_bug.cgi?id=1998919
>> <https://bugzilla.redhat.com/show_bug.cgi?id=1998919>
>> https://bugzilla.redhat.com/show_bug.cgi?id=1972070
>> <https://bugzilla.redhat.com/show_bug.cgi?id=1972070>
>>
>> This command returns the following data:
>> {
>> "name": "Microsoft Windows",
>> "kernel-release": "20344",
>> "version": "N/A",
>> "variant": "server",
>> "pretty-name": "Windows Server 2022 Datacenter",
>> "version-id": "N/A",
>> "variant-id": "server",
>> "kernel-version": "10.0",
>> "machine": "x86_64",
>> "id": "mswindows"
>> }
>>
>> The problem is with "version" and "pretty-name". Windows Server
>> 2016/2019/2022 and Windows 11 have the same MajorVersion
>> ("kernel-version") = 10, so to get pretty-name the guest agent uses a
>> conversion matrix between Windows build and name
>> (https://github.com/qemu/qemu/blob/59a89510b62ec23dbeab8b02fa4e3526e353d8b6/qga/commands-win32.c#L2170
>> <https://github.com/qemu/qemu/blob/59a89510b62ec23dbeab8b02fa4e3526e353d8b6/qga/commands-win32.c#L2170>).
>>
>> This solution has several problems: need to update the conversion matrix
>> for each Windows build, one Windows name can have different build
>> numbers. For example, Windows Server 2022 (preview) build number is
>> 20344, Windows Server 2022 build number is 20348.
>>
>> There are two possible solutions:
>> 1. Use build number range instead of one number. Known implementation
>> issue: Microsoft provides a table
>> (https://docs.microsoft.com/en-Us/windows-server/get-started/windows-server-release-info
>> <https://docs.microsoft.com/en-Us/windows-server/get-started/windows-server-release-info>)
>> only with stable build numbers. So, we exactly don't know the build
>> number range.
> 
> Sounds good, start with low=high limit then if someone reports
> out-of-range we adapt the limit.
> 
> BTW instead of burying this in C, I'd store this information in a JSON
> file to ease updates.
> 
>> 2. We can read this string from the registry
>> (HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion). Known
>> implementation issues: ProductName value is localized (in a Russian
>> version of Windows, the word "Microsoft' is translated), so we should
>> ignore it. ReleaseId value does not equal to Windows Server version (for
>> Windows Server 2019, ReleaseId is 1809)
> 
> Could this work?
> 
>   if ReleaseId:
>     return ProductName[ReleaseId];
>   else:
>     return ProductName[release_id_by_buildnumber(BuildNumber)];
> 
>> In conclusion, I have the next questions:
>> What solution we should implement to get the Windows release name?
>> Does someone know how end-users use this information? Should it be
>> English only or it can be localized? Should we have exactly the same
>> output as now?
>> What should we do with the 'Standard' server edition? Currently, the
>> guest agent always returns 'Datacenter'.
>>
>> Best wishes,
>> Kostiantyn Kostiuk
> 


