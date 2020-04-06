Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7801B19F870
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Apr 2020 17:03:55 +0200 (CEST)
Received: from localhost ([::1]:33464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jLTI2-0008Sy-3X
	for lists+qemu-devel@lfdr.de; Mon, 06 Apr 2020 11:03:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39057)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jLTGb-0007N4-Ex
 for qemu-devel@nongnu.org; Mon, 06 Apr 2020 11:02:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jLTGa-00013N-Hm
 for qemu-devel@nongnu.org; Mon, 06 Apr 2020 11:02:25 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:20094
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jLTGa-00012Y-Ec
 for qemu-devel@nongnu.org; Mon, 06 Apr 2020 11:02:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586185343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u/QvjZ9C+nmXyzkOZSsLODxrOi0SdWLy+49O50pCH/Q=;
 b=Mf5GV3eoNsPkFUmzIvry49YYCXL+tpV8rc0eQTYvp+MuQVyqrMTAuN44Ma7q5F8pmQ2OM+
 ZHYX3hwGXmS+9w+8h7ekKH0uVAjHucVL/CWgEM5+wpN0l4VagdIb+IBZpikROkvdTzeSfJ
 RUDp/0N23LTgjiwHQggEvS9QxjrxwzY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-457-_CpqQcfHNvyQaYsltY5hiw-1; Mon, 06 Apr 2020 11:02:19 -0400
X-MC-Unique: _CpqQcfHNvyQaYsltY5hiw-1
Received: by mail-wr1-f71.google.com with SMTP id u16so8533661wrp.14
 for <qemu-devel@nongnu.org>; Mon, 06 Apr 2020 08:02:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3kt479g2qduZv3XAJABz7A0PKnNGh0ECW6vK+JW6CZU=;
 b=kjQnVgU6UME94KdljorKHSctcfob3RU4GDg4VS2MLyKUy9u+hOr/uo8l7uIyTGZn9+
 0vs4XEZuG2zUMM1sI8CIErLh5TiA1qvnqNzCcwEEwF9MwHXR9KT/d9wwIMrIBPQsGljE
 4sEGb5sEdz/XF4QT0O/ot++eeBOEcUbTUjGzOTz6J+BioX3PvXhGtBiltuixHMLU/1Ce
 zaJICjP8G6fXAxzR4Ve7qmJUjmcxUrZD3FoaxYtX03K9+HoSaNVPbLk4vAAmlYfenDgp
 i4FGFw2IXdAfrgLNSRwRy9vRwxXiieZkJmc8FsefZr7bo8737ZpPhq60Zl6CGlG1VZBB
 RBgA==
X-Gm-Message-State: AGi0PuZZDRfrX5hZKww2cDQAiF7lLzSyhGH35GGi5gr4Lqf9yQxY6vGn
 8iqcqBijgCyKALnPRPfx2d5gqqoLLAMW2x0csx3elxhaH3epaAhP7fPw9UgKY7pVDN+IVTKp3NR
 2AzoAHGXKbYbzpAE=
X-Received: by 2002:a5d:68ca:: with SMTP id p10mr12250332wrw.7.1586185338420; 
 Mon, 06 Apr 2020 08:02:18 -0700 (PDT)
X-Google-Smtp-Source: APiQypLzhOWjgnc14RDAdNXci7LQmORhq6n5B5hrsAdHyvTNcxY88bgW2c8t+Ulmv57XOXF/vhhMSw==
X-Received: by 2002:a5d:68ca:: with SMTP id p10mr12250307wrw.7.1586185338181; 
 Mon, 06 Apr 2020 08:02:18 -0700 (PDT)
Received: from [192.168.1.39] (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id b66sm4700900wmh.12.2020.04.06.08.02.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Apr 2020 08:02:17 -0700 (PDT)
Subject: Re: QEMU participation to Google Season of Docs
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <de92e66d-c474-dd1b-ddab-194b2f92d1dd@redhat.com>
 <36614289-5498-7a78-5f8e-1b4da84261ad@redhat.com>
 <20200402090654.GB28280@stefanha-x1.localdomain>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <839ff011-b06a-c13f-1af9-9b19db4b8888@redhat.com>
Date: Mon, 6 Apr 2020 17:02:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200402090654.GB28280@stefanha-x1.localdomain>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Stefan Weil <sw@weilnetz.de>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-discuss@nongnu.org, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/2/20 11:06 AM, Stefan Hajnoczi wrote:
> On Wed, Apr 01, 2020 at 06:46:02PM +0200, Paolo Bonzini wrote:
>> On 01/04/20 18:37, Philippe Mathieu-Daud=E9 wrote:
>>>
>>> * Refactor the open source project's existing documentation to
>>>  =A0 provide an improved user experience or a more accessible
>>>  =A0 information architecture.
>>
>> This kind of project would be indeed very suitable to QEMU.  Stefan,
>> perhaps you could help by providing the text for our Summer of Code
>> submission?
>=20
> Philippe, would you like to be the Google Season of Docs administrator
> for QEMU?  I don't have enough bandwidth to be involved myself.

Thankfully my manager approved this, so I'm in :)

> I can provide you the QEMU's GSoC 2020 application form which might have
> useful snippets you can reuse for building a GSoD application for QEMU.

That might help. I'll start the application draft.

Thanks,

Phil.


