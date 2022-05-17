Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57AE2529EC8
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 12:06:20 +0200 (CEST)
Received: from localhost ([::1]:43340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqu5q-0001lm-Sz
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 06:06:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqtpn-00055G-Uh
 for qemu-devel@nongnu.org; Tue, 17 May 2022 05:49:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqtpk-0007Lr-Sf
 for qemu-devel@nongnu.org; Tue, 17 May 2022 05:49:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652780980;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bf651JlNFvQFBfRSfM668uEwaY3mIpp4kHCyPK89Ftw=;
 b=KiD/g6JBkcx0cI2pTm9J3ZaFYvD6d+u0b4qvgRT+djhNxvmFv7lK5H5+ob9XQ3mHg16poV
 32OB71WFUuBDUk+CqT9IjokFko5nxEPpofDcw0YHvkbenJp3e0rWN5JAeWU1ipAIUjhmxl
 aaM/JehackCf0dEdC+jAZuUjD5Cvvf4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-106-CKbKYqreNA6s-yfW8CJ6Sw-1; Tue, 17 May 2022 05:49:38 -0400
X-MC-Unique: CKbKYqreNA6s-yfW8CJ6Sw-1
Received: by mail-ed1-f72.google.com with SMTP id
 f20-20020a50d554000000b0042abba35e60so2416908edj.15
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 02:49:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=Bf651JlNFvQFBfRSfM668uEwaY3mIpp4kHCyPK89Ftw=;
 b=DqzwEmEu113sufMR0r7lq4ZPuudDIOf3qvIqwYNDnuuThtDCP+HDqgy3CIWXclFCH2
 C/B7OP3PJVF5Twz3KCUienFQ+pOsdJSkT285rpudCSpcJ2rN6LwGH9X7d/cja+ZW7Wcc
 c1nKRAx41i/IrqqNGHjB8de+AfRRNXQo/1hb9OsiH0v6GEKODj2BXb93M0naA9QZbsP8
 jXLqPoUVf9uuiq/OBBOKeXCkoDo4MFXcCzedKmMi9SrxrrKzEaKjWvql/c82QYtw41LU
 wB0hORGNyS+b7mvn3zhAFEkJ7JA2n2/ltpGAkcdBYT2GehPvYqBdzA7Wrfb2S2cL6ZUy
 z7sA==
X-Gm-Message-State: AOAM530TIpLheiLQhNaU5F3CZ4ImUtcTSV5ai0+N4PS827Dau7to7//S
 Aic9bewHsVNbRJfTA70rPvd0hRKhq0uHdt2RwjiszLMAsOhbv7ugQ+rbI3UKdmGXV9EhuYydQbl
 N9keecw0qDc2DPDs=
X-Received: by 2002:a17:906:99c2:b0:6f4:a99c:8dfc with SMTP id
 s2-20020a17090699c200b006f4a99c8dfcmr20557078ejn.386.1652780977422; 
 Tue, 17 May 2022 02:49:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxsK3KqbQe8apIx2A2K5SuFyV6W+YEcfiGnCsR9nbGPPO1miw1Aspk8i0o/6Y8BYSkh/ZtpPQ==
X-Received: by 2002:a17:906:99c2:b0:6f4:a99c:8dfc with SMTP id
 s2-20020a17090699c200b006f4a99c8dfcmr20557059ejn.386.1652780977146; 
 Tue, 17 May 2022 02:49:37 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 b19-20020aa7dc13000000b0042a6d0508a9sm4991271edu.73.2022.05.17.02.49.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 02:49:36 -0700 (PDT)
Message-ID: <a0c572b3-243a-2ee7-67c6-47744a5ac330@redhat.com>
Date: Tue, 17 May 2022 11:49:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Eric Blake <eblake@redhat.com>, libvir-list@redhat.com
References: <20220511175147.917707-1-thuth@redhat.com>
 <20220511175147.917707-3-thuth@redhat.com> <878rr77xpn.fsf@pond.sub.org>
 <870d24be-6c37-ff3d-616b-68255345ebb9@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 2/3] ui: Switch "-display sdl" to use the QAPI parser
In-Reply-To: <870d24be-6c37-ff3d-616b-68255345ebb9@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On 5/17/22 10:34, Thomas Huth wrote:
>> This remains, and that's fine.  One step at time.
> 
> Not sure how we want to proceed with that in the long run, though ... 
> IIRC clearly, Paolo once said that it doesn't really belong into 
> "-display" anyway and should be handled with the separate "-vnc" option 
> instead?

Not me, Gerd 
(https://lore.kernel.org/all/20210825092023.81396-2-thuth@redhat.com/T/#e8c4f826cc8ff48b9afad37703e11704137f540c8):

> Other way around, -display vnc should be dropped.  -display is about
> local displays, and there can be only one instance.  -vnc / -spice
> enable remote access, and this can be done in addition to a local
> display.
> 
> not possible:
>  -display gtk + -display sdl
> 
> possible:
>  -display gtk + -vnc
>  -display gtk + -vnc + -spice
>  -display none + -vnc + -spice

For what it's worth, Libvirt uses both -vnc and -spice, so we might very 
well proceed with Gerd's idea.  If we don't like -vnc and -spice then it 
may be possible to QOMify them and go with -object.

Thanks,

Paolo


