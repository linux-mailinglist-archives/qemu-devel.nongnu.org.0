Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8655E8A24
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Sep 2022 10:24:05 +0200 (CEST)
Received: from localhost ([::1]:41604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oc0SC-0000Uh-2g
	for lists+qemu-devel@lfdr.de; Sat, 24 Sep 2022 04:24:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oc0FK-00069i-G6
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 04:10:46 -0400
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736]:40722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oc0FH-0005Dt-My
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 04:10:45 -0400
Received: by mail-qk1-x736.google.com with SMTP id c19so1425228qkm.7
 for <qemu-devel@nongnu.org>; Sat, 24 Sep 2022 01:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=OVexJjHNT2Z4AA6mC4KIs4hL2BuP7gp5SRlGRPtdaY4=;
 b=P+nRX8kB0mZvZeMNRpUMjvVz2mBWBIMVKbdisaEGDLrjQbINhl0JpAx0bCPz1c3/+x
 wJJnPat5YZ8ndTVKTmROGx/iOkjU3Fx8TjD+GWV70Jc2IIfE7nbq1gICkbTNIsqXRnMk
 nmHxI1L96Fq1CBPREeO98z5XWHH0pUxvYXKf5z2iJTjBAsMVIIkH+V118Arh0kbFwnBg
 fs60Yg7GBV/rcHr67NHUPvrH3r5QKgVpuWLmoH35ySEPpctDMSur7lYpBiZDwf7AOppi
 huQlxZxSvDqKbFAMZiek1jRMaqT86A6rVUcX9alhQqPKBQMrOGYLYOL3X9DNA20SsUqU
 21wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=OVexJjHNT2Z4AA6mC4KIs4hL2BuP7gp5SRlGRPtdaY4=;
 b=mgjJ9cL1Lq27N+D4aQKkSuunKiS+NWwwWRKnQEdlOSRhJxx5nYgB2XgI41S+L5oLII
 6YdnKMd2CFtA0Sf2wxTNVxLX6DT4b4WgR0LaM+2a9yr7dhDRK5grq0+FnaBqkM15owJf
 WZzfsZ1zEcsPSYjCdozzI3tmdlZwSKFEsn3LSvrX5Qgrj7HBPGgW3Dk1oJDH4Nhw3iil
 1eXkKBkuCLmqmvmSpFIZJr/wFPyxhJrWdxozcjSNYU+BnXq2IMOHVG61fgEpa164ucK5
 9yX48exROSIrXs6WF4AyRFwTfSodvehc9wPLerQCVint2Qq4yfEJp6pD13X4R6KfFwqc
 48Fw==
X-Gm-Message-State: ACrzQf2EDowlwj2MO5YjRK39QZfu3C6r56Wns7yV0ksFDpoqUqYhXPiO
 g5RwIOnxha6YHveFnH1Jz+x6CNnjUPH8GtXkQ99yWhVY
X-Google-Smtp-Source: AMsMyM5TcEHfTuf8ipa2IgvFzeWYiXFRpbJYkC7klBRXMBnY1zF/qagtMgZS8PFM59zRnwu3xB0Blb7WCvNG+itAvr8=
X-Received: by 2002:a05:620a:19a5:b0:6cf:4a24:cccb with SMTP id
 bm37-20020a05620a19a500b006cf4a24cccbmr8142098qkb.376.1664007041013; Sat, 24
 Sep 2022 01:10:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220920103159.1865256-1-bmeng.cn@gmail.com>
 <20220920103159.1865256-26-bmeng.cn@gmail.com>
 <CAJ+F1C+oUW0Cj4BxH_HecV=b+ZA_LtOZDULWQYd4rHjwE_29eg@mail.gmail.com>
In-Reply-To: <CAJ+F1C+oUW0Cj4BxH_HecV=b+ZA_LtOZDULWQYd4rHjwE_29eg@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 24 Sep 2022 16:10:30 +0800
Message-ID: <CAEUhbmX6t_QAOOu2KFCaK63ykNJNBkW-vMa1uUsbXo=KfGmEvw@mail.gmail.com>
Subject: Re: [PATCH v2 25/39] chardev/char-file: Add FILE_SHARE_WRITE when
 openning the file for win32
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>, 
 Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::736;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qk1-x736.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Fri, Sep 23, 2022 at 4:09 AM Marc-Andr=C3=A9 Lureau
<marcandre.lureau@gmail.com> wrote:
>
> Hi
>
> On Tue, Sep 20, 2022 at 2:33 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>>
>> From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
>>
>> The combination of GENERIC_WRITE and FILE_SHARE_READ options does
>> not allow the same file to be opened again by CreateFile() from
>> another QEMU process with the same options when the previous QEMU
>> process still holds the file handle opened.
>>
>> This was triggered by running the test_multifd_tcp_cancel() case on
>> Windows, which cancels the migration, and launches another QEMU
>> process to migrate with the same file opened for write. Chances are
>> that the previous QEMU process does not quit before the new QEMU
>> process runs hence the old one still holds the file handle that does
>> not allow shared write permission then the new QEMU process will fail.
>>
>> As per [1] we should add FILE_SHARE_WRITE to the share mode to allow
>> such use case. This change makes the behavior be consistent with the
>> POSIX platforms.
>>
>> [1] https://docs.microsoft.com/en-us/windows/win32/fileio/creating-and-o=
pening-files
>>
>> Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
>> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>> ---
>>
>> Changes in v2:
>> - Update commit message to include the use case why we should set
>>   FILE_SHARE_WRITE when openning the file for win32
>
>
> As discussed in v1, I would rather leave that patch out of this series, s=
ince the visible issue is solved differently elsewhere.
>
> Also, I disagree with the approach to make windows behaviour consistent w=
ith posix here, since I consider the windows behaviour (exclusive write acc=
ess) superior. I would rather teach the posix implementation about exclusiv=
e write access.
>

Okay, will drop this patch in v3.

Regards,
Bin

