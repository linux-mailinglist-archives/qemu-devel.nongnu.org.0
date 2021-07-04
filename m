Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFB73BAE54
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Jul 2021 20:35:55 +0200 (CEST)
Received: from localhost ([::1]:52968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m06yA-0000Mp-U9
	for lists+qemu-devel@lfdr.de; Sun, 04 Jul 2021 14:35:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m06x8-00088R-9Z
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 14:34:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m06x2-0004DH-MJ
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 14:34:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625423683;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mQOh2EsVAHje0UjYx5sIP/NsRhVEAJJsHh46R0SffC4=;
 b=HVIfHU6NIew5fZiYUnWZNFv3ptdsuqALZHOZ0qHR171JFdFnShgWdw4HAbKY3ry+NBE1Ak
 0Wbx+dHoD4kgmrLd+clcVRJTuTr+Qcqr5IKCnb2cMtSm7cvuxfQj3o9YC9G3BG1gqV5PeL
 lQAV7APpKQuXZPTV0oq+uElxY0oT/lg=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-518-KBGu6G-rPj2aRySUPf2hpQ-1; Sun, 04 Jul 2021 14:34:41 -0400
X-MC-Unique: KBGu6G-rPj2aRySUPf2hpQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 m15-20020a056402430fb0290399da445c17so56114edc.8
 for <qemu-devel@nongnu.org>; Sun, 04 Jul 2021 11:34:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mQOh2EsVAHje0UjYx5sIP/NsRhVEAJJsHh46R0SffC4=;
 b=tqxS58A8DhbddmNEAvq6b62nZEicSzVRpLF5jhgiozhVFQiYSpEkUGsVGN1UKomd4g
 kmSdDG+o8XM11P/lQh7zoi43iLfamjVZzPjer512CRfalnjdJfxK9kKIF0Kajr6IDvtS
 Lclk1H+gm8kOP0yN2LHEy6DgWnSj4bAQczw37lqXEDGiVBssGrrOP421NvuQrggzgy3E
 0agQMcwDFymq72IdeMS1104tvtQoMHCTYZF6nCpzCN6v7Z3o7rhO4arhP9xZYCmDAcS2
 g6/oG3o6zNbFbU2M13KrPObzLzf222uYehxaTie0/8jVFSBhejL0vwMCUJdE9XptKyt3
 Jjzg==
X-Gm-Message-State: AOAM531Me9wE19iHq6jvNQQDf+V20PSuTENLnW4zIhA0DuhjiMCcuS9g
 cyvGzaaXKh80tEAAfDmFA3G7EobElb3nURGav46dXybRqL+xMViU2t+fYISdgA+5aiwJOhpqnWB
 jiWj4+ox20FD0TNo=
X-Received: by 2002:a17:906:58c7:: with SMTP id
 e7mr6811548ejs.197.1625423679900; 
 Sun, 04 Jul 2021 11:34:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxFQiDAyAupyGBCzvgBgm37B55IZ4rabgcW3q8PTxXF18hT+1xGnlwPXqQOh0NK4/rCArrZyA==
X-Received: by 2002:a17:906:58c7:: with SMTP id
 e7mr6811539ejs.197.1625423679696; 
 Sun, 04 Jul 2021 11:34:39 -0700 (PDT)
Received: from thuth.remote.csb (p5791d89b.dip0.t-ipconnect.de.
 [87.145.216.155])
 by smtp.gmail.com with ESMTPSA id c15sm4181658eds.16.2021.07.04.11.34.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 04 Jul 2021 11:34:39 -0700 (PDT)
Subject: Re: [PATCH 1/2] Fix for Haiku
To: Richard Zak <richard.j.zak@gmail.com>
References: <CAOakUfOhn43BUUGoJPahxmxxTk8vcPeyrgsX0GDmzt46ZriNeA@mail.gmail.com>
 <CAFEAcA-rhL_BEJMi7a2tCoVE61OV2o5QeDdDfz1JXL9fLvM_cQ@mail.gmail.com>
 <CAOakUfNpv_7TE+86R0+Ng=10mXtx2=pyZUZG8jPDgOdLbqrqKQ@mail.gmail.com>
 <5c47cf07-f02e-f7d8-2725-5ae0a240e37b@amsat.org>
 <975f0d41-be4e-7e8c-2fc6-64eafc7c11a8@amsat.org>
 <951cdc26-1f4f-68d0-0187-e31513fa00c9@amsat.org>
 <CAOakUfMmxSrBcQTQaRBB1g3qFCrpm-BLDVvfgoRm2Ww_-Pe3mQ@mail.gmail.com>
 <0a17d006-b1ef-ab1e-8616-50e29681f998@redhat.com>
 <CAOakUfNZ5K-tVNQZZZWQ2U7-fbw_4TnFSfKXXV2nRpTGVC-LLA@mail.gmail.com>
 <ec113b7f-781d-43f1-ace3-78ae6c114207@redhat.com>
 <CAOakUfPchj=rAbtnh+ZUj0CERwgFLKKtzB5ozu4j-b0U6y9V=Q@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <020c0056-deb1-9f2b-29a4-a3c8a7ac266f@redhat.com>
Date: Sun, 4 Jul 2021 20:34:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAOakUfPchj=rAbtnh+ZUj0CERwgFLKKtzB5ozu4j-b0U6y9V=Q@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.441,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/07/2021 18.58, Richard Zak wrote:
> 
> În dum., 4 iul. 2021 la 12:51, Thomas Huth <thuth@redhat.com 
> <mailto:thuth@redhat.com>> a scris:
> 
>     On 04/07/2021 18.39, Richard Zak wrote:
>      > Regarding upside down text, where did that occur? I certainly didn't
>     do that
>      > intentionally. Maybe an encoding error somewhere?
> 
>     That was meant as a humorous way to say that you should avoid top posting,
>     but apparently it was just confusing instead. Sorry for that. Anyway, we
>     use
>     interleaved posting on qemu-devel. See e.g.:
> 
>     https://en.wikipedia.org/wiki/Posting_style#Interleaved_style
>     <https://en.wikipedia.org/wiki/Posting_style#Interleaved_style>
> 
>        Thomas
> 
> Ahh got it. I hadn't done that since Gmail wants to hide the test I'm 
> responding to. I'm assuming that revisions to a patch should still be a new 
> post, not in a reply?

Right, different revisions should go into a new post, with a version 
indication in the subject, e.g:

  [PATCH v3] Fix for Haiku

  Thomas


