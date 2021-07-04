Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 791093BADE1
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Jul 2021 18:52:28 +0200 (CEST)
Received: from localhost ([::1]:33564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m05M3-0005nl-HS
	for lists+qemu-devel@lfdr.de; Sun, 04 Jul 2021 12:52:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m05L2-00055m-1Y
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 12:51:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m05Ky-0004sH-PG
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 12:51:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625417478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i8BzZZDFV1gkbG0r0zSRWJQsnG6ApkZB3EcEyUS2jrY=;
 b=OqkKQMdMz8ZgMa/Ed8QXreez/EHtKBGrq6TAITCxyMe89ytkEVo/GvFf6enzTeKFHcK6Pz
 G+HOnOb7YywbdOxH84JktOwVqyBmHHN0GZ6kPGTdW9OvPoMBdvXrobW74HjFZ2QWNz8/vD
 OyPfMnMwGot6HL7v64X0EV0ypbN/+iM=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-21-z0PRMkvcPTuh30VyF6PqwQ-1; Sun, 04 Jul 2021 12:51:16 -0400
X-MC-Unique: z0PRMkvcPTuh30VyF6PqwQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 p19-20020aa7c4d30000b0290394bdda6d9cso7826549edr.21
 for <qemu-devel@nongnu.org>; Sun, 04 Jul 2021 09:51:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=i8BzZZDFV1gkbG0r0zSRWJQsnG6ApkZB3EcEyUS2jrY=;
 b=ao/RdSb/NKdt2YDyqLUoiqHfIES2k2lA9NZBPJLJir6jWhJtYLRTGe3hDRj3J9/2RM
 FKbZ5v2pGrsifKnkH7CeKA/gZR+SlTboKFEHhuSgnqJyInSedc4ma9yc8XHWwYlzs1pL
 2ESMNm7C9CH/7LJ3UcDHSXFr7mqt+pPg07wx6VZoC0diS4xyfEt59K+f/5BI4MEg7ZKN
 UQ2PyQ0p/wVNOMtOQFvG3VjOqHZSCBgTxSh1D6B9luE9tv4igRrPVAvLGNhpzLq+LeUk
 EFoxH5IY8T353wYxYRB4Di5TY1H/N2uuU+e7hgEFaVEwYpSBp0V9RTvMbuoASwqs6ER0
 J9jA==
X-Gm-Message-State: AOAM5325QAso73iza7UXVt72e3f0dBTkZahHvVgrvgYixqGViLILgppi
 9ADEORB+TIgjCfz9roiMbPBE4KPjX9CFgk+NjPoh7kal9Q7OcSNkr5yW1md0V5oR62Tveo1Xreu
 +sczcdgPOx6m22cM=
X-Received: by 2002:a05:6402:c91:: with SMTP id
 cm17mr11374111edb.123.1625417474863; 
 Sun, 04 Jul 2021 09:51:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyoAaVmjBk7n3JllUwCw+WSAXhZJzgO9PydyJutSMO+fcQCCMifinl1RFqbM6/AeYIgvl3XKQ==
X-Received: by 2002:a05:6402:c91:: with SMTP id
 cm17mr11374100edb.123.1625417474677; 
 Sun, 04 Jul 2021 09:51:14 -0700 (PDT)
Received: from thuth.remote.csb (p5791d89b.dip0.t-ipconnect.de.
 [87.145.216.155])
 by smtp.gmail.com with ESMTPSA id j19sm4183508edw.43.2021.07.04.09.51.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 04 Jul 2021 09:51:14 -0700 (PDT)
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
From: Thomas Huth <thuth@redhat.com>
Message-ID: <ec113b7f-781d-43f1-ace3-78ae6c114207@redhat.com>
Date: Sun, 4 Jul 2021 18:51:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAOakUfNZ5K-tVNQZZZWQ2U7-fbw_4TnFSfKXXV2nRpTGVC-LLA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
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

On 04/07/2021 18.39, Richard Zak wrote:
> Regarding upside down text, where did that occur? I certainly didn't do that 
> intentionally. Maybe an encoding error somewhere?

That was meant as a humorous way to say that you should avoid top posting, 
but apparently it was just confusing instead. Sorry for that. Anyway, we use 
interleaved posting on qemu-devel. See e.g.:

https://en.wikipedia.org/wiki/Posting_style#Interleaved_style

  Thomas


