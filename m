Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8CB3FB0BC
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 07:13:44 +0200 (CEST)
Received: from localhost ([::1]:57010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKZbx-000326-1J
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 01:13:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mKZaK-0001qm-O3
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 01:11:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mKZaF-0004zJ-7v
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 01:11:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630300304;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uxgE6UZO6oNc4DhgQo47SYnhWr5SBA0yZlwrahWqCuM=;
 b=DD+UN2fc3yDG95Cf5b6r6+QJzYSVe37zmdHTpTuZi46FTZtG6ga/qZr9tA4c3pgyuagsvS
 ROrdzYyaCsxGV5ws127BJ1XA/bVowwJHZgjyB+j12sYHVdIA5D00Iceelp4v4cVVTFajtM
 0FEhyxsqSdGzi4fIoJcLVwTZ3UI+Pxk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-9NvwJcQKNWaSOl8i5FW9Ig-1; Mon, 30 Aug 2021 01:11:39 -0400
X-MC-Unique: 9NvwJcQKNWaSOl8i5FW9Ig-1
Received: by mail-wr1-f69.google.com with SMTP id
 p1-20020adfcc81000000b001576cccf12cso3094311wrj.6
 for <qemu-devel@nongnu.org>; Sun, 29 Aug 2021 22:11:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uxgE6UZO6oNc4DhgQo47SYnhWr5SBA0yZlwrahWqCuM=;
 b=lKRWJhZ54FPb69Pzg+pCrdwu39VoiKD2oTOpGScrEPgm+GFv0kZqb5yb9KmVK+0oJ7
 /oGZ9pDjandhPB245ZRca1LspY0EbtCzAR8++R793dOqpXehYai99+Zx712cEjVNnSNU
 IkccCMl27LfsQtGwgft7BJFKG/gmowUwNSvc2fGhRcovv55jEhBvoNMdKCZhnvl3c5Pu
 dzFwa0rHrCOZv3LTnmDytsqfOvJeOBbX31YB5Afs2AR4DW4+u517DOROm47+IeDcYNuF
 13kBBq4HMYKymLmzKHYaWPzvk2xIF2mfnckMhoVg7lAehdAuwi6wBkPyHBRmsdJHYQIW
 aDhg==
X-Gm-Message-State: AOAM530lCGSTsgnfQ4IrBngS5+f1EjTZTtfH8dqzia+hSySolrXg9CoG
 kNVcMWPM+c0J9/4zV6sgcWyAsvfAyei58+Muw0hKHn4s3NLNgY7e8eIVSoLErIw+qkTE40QVXBS
 sHkri3fRHLKO2MBY=
X-Received: by 2002:adf:ab0e:: with SMTP id q14mr24012101wrc.171.1630300298765; 
 Sun, 29 Aug 2021 22:11:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzZglhT3Y0BjKbvgEjsjmBghej20MOjwtMOPww9fWXaGazm0MhvR47O34iBs57lLDJbbTBTrg==
X-Received: by 2002:adf:ab0e:: with SMTP id q14mr24012089wrc.171.1630300298580; 
 Sun, 29 Aug 2021 22:11:38 -0700 (PDT)
Received: from thuth.remote.csb (pd9e832a5.dip0.t-ipconnect.de.
 [217.232.50.165])
 by smtp.gmail.com with ESMTPSA id g136sm9359730wmg.30.2021.08.29.22.11.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 29 Aug 2021 22:11:37 -0700 (PDT)
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20210829173210.39562-1-thuth@redhat.com>
 <CAMxuvawhwnwWRXAZOJj3SbtHXE8kC89=pHR+2-TD7ByLzoC_Pw@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 0/3] Use meson_options.txt in the configure script
Message-ID: <48ccdd11-5836-5886-f928-95c960fb810a@redhat.com>
Date: Mon, 30 Aug 2021 07:11:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAMxuvawhwnwWRXAZOJj3SbtHXE8kC89=pHR+2-TD7ByLzoC_Pw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.58, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29/08/2021 23.22, Marc-André Lureau wrote:
> Hi Thomas
> 
> On Sun, Aug 29, 2021 at 9:32 PM Thomas Huth <thuth@redhat.com 
> <mailto:thuth@redhat.com>> wrote:
> 
>     It's cumbersome to maintain the build options twice, one time in the
>     configure script and one time in meson_options.txt. Thus let's add some
>     logic to the configure script to look at the meson_options.txt file
>     instead of handling every option twice.
> 
>     Thomas Huth (3):
>        configure: Add the possibility to read options from meson_options.txt
>        configure: Remove options that can be handled via meson_options.txt
>          instead
>        configure: Get help text from meson_options.txt
> 
>       configure         | 429 ++++++----------------------------------------
>       meson_options.txt |   2 +-
>       2 files changed, 53 insertions(+), 378 deletions(-)
> 
> 
> It looks similar to:
> https://patchew.org/QEMU/20210107140039.467969-1-pbonzini@redhat.com/ 
> 
> Isn't it? (I haven't studied in details neither, I may be out of topic).

Oh, right, thanks for the pointer, I wasn't aware of that series yet. It's 
indeed similar to patch 8/8 from Paolo's series. But while Paolo is using an 
additional Perl-script and a json file for handling the configure options, 
my series just uses some lines of shell code in the configure script.

Paolo, why did your patch get stalled? ... my way of parsing is certainly 
way more fragile, but it's less complicated and seems to work as long as all 
the options are written in the same way in meson_options.txt (e.g. as long 
as nobody tries to use multi-line descriptions of the options there etc.)... 
so maybe if the additional Perl script was too much, this could be a good 
compromise?

  Thomas


