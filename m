Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEACE37F736
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 13:54:23 +0200 (CEST)
Received: from localhost ([::1]:40654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh9v4-00076a-Tg
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 07:54:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lh9tt-0005T1-Ee
 for qemu-devel@nongnu.org; Thu, 13 May 2021 07:53:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lh9tq-0001pp-Fh
 for qemu-devel@nongnu.org; Thu, 13 May 2021 07:53:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620906785;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xHfguJS5CiAeuR4dtqkVOtr4MYxcKyiHc/0NEM05Nto=;
 b=QZdZSsWFyJG1kjysaqGwGi8O829omEvz0rubjUGRjREbC+wBhzM+d0N4aJLDcW/5JGlf6V
 A1T9MlMY+6cWE4j6MbLuCbho/BKfihCrSsknIVjj00LA0jZrbWumvBk4X1VnQMgQLu70Tx
 dlpoa/5HOCBMtnj0j8fu+D7v55Pp9h4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34-jsd3EyKRNP6kRL6hnrw0Xg-1; Thu, 13 May 2021 07:53:03 -0400
X-MC-Unique: jsd3EyKRNP6kRL6hnrw0Xg-1
Received: by mail-wr1-f70.google.com with SMTP id
 h104-20020adf90710000b029010de8455a3aso11420822wrh.12
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 04:53:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xHfguJS5CiAeuR4dtqkVOtr4MYxcKyiHc/0NEM05Nto=;
 b=sNaaWjk1j15/FgJL5tmcnGAbXHsEKOphU4uUVOrYqDKw1bYjTISWlgOlsBD/XpAo8i
 QSw9L6pY5Re0QLrPxAIYBO72wbJ/7dS3VbPDJzF+dNzFUnu02spUiDqB/6EuCkHTYIQR
 +qUw0rkSHG+wMRcUL/mkY90u0UNTbgkZU2oqVi+PGi9mYn/5/D8iTJIZPbGQaymztsn2
 SVmc+XpgR1uFzUPBTDkUkbEKyStRp2CsYyyEzNgE1LBl7nKxH1xx+qsbG+3G/iIHIWUa
 EgoZhy/t/1FpQMlLp1Ctmp06XfsdtuFRSogEEkfFx63tTmo+qWxK1E82FC1bJwg1iNxB
 sYvA==
X-Gm-Message-State: AOAM531ys4Y8Sqy+wGhiU0cjr1HKGStjVI6TGj1k5aeU7wO4UVupHWSg
 8ZrP4YjQVyXO2QVKtIDWYgJPOJPIEFwjMUICa8ocRIwfSPIRP5y9wiXdJm+nTXKEdFVZz7qvhpn
 kk0A9fnooXkRANi/+tPRUiORqNWXnWt9mvC9nuFLE76GyhF0pL8rp8HIDaF/K3jc=
X-Received: by 2002:a05:6000:1012:: with SMTP id
 a18mr51814441wrx.68.1620906782145; 
 Thu, 13 May 2021 04:53:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxxDKlRGJ9j8Nd4aGyVlGs1r3MWxhSWkG/7iFC0DnDi6wxUPksWB6SEkpCF05UMsvR9XRQLAw==
X-Received: by 2002:a05:6000:1012:: with SMTP id
 a18mr51814412wrx.68.1620906781880; 
 Thu, 13 May 2021 04:53:01 -0700 (PDT)
Received: from thuth.remote.csb (pd9e832bb.dip0.t-ipconnect.de.
 [217.232.50.187])
 by smtp.gmail.com with ESMTPSA id b81sm1074354wmd.18.2021.05.13.04.53.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 May 2021 04:53:01 -0700 (PDT)
Subject: Re: [PULL 0/5] Miscellaneous patches for 2021-05-12
To: Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
References: <20210512162412.338120-1-armbru@redhat.com>
 <CAFEAcA8MzER8PCJiiRJv0R3ydbGgCHdAthS-TXE=W6meYGQVJQ@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <7405bb26-e58c-e32f-01e4-f00666481b6b@redhat.com>
Date: Thu, 13 May 2021 13:53:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8MzER8PCJiiRJv0R3ydbGgCHdAthS-TXE=W6meYGQVJQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/05/2021 18.33, Peter Maydell wrote:
> On Wed, 12 May 2021 at 17:24, Markus Armbruster <armbru@redhat.com> wrote:
>>
>> The following changes since commit a5ccdccc97d6e0d75282ede5b866cf694e9602b0:
>>
>>    Merge remote-tracking branch 'remotes/kraxel/tags/vga-20210510-pull-request' into staging (2021-05-12 14:45:21 +0100)
>>
>> are available in the Git repository at:
>>
>>    git://repo.or.cz/qemu/armbru.git tags/pull-misc-2021-05-12
>>
>> for you to fetch changes up to 4369223902a79b7fc56ca076d99b88ff14964ddd:
>>
>>    Drop the deprecated unicore32 target (2021-05-12 18:20:52 +0200)
>>
>> ----------------------------------------------------------------
>> Miscellaneous patches for 2021-05-12
>>
>> ----------------------------------------------------------------
>> Markus Armbruster (3):
>>        block: Drop the sheepdog block driver
>>        Drop the deprecated lm32 target
>>        Drop the deprecated unicore32 target
>>
>> Stefan Reiter (1):
>>        monitor/qmp: fix race on CHR_EVENT_CLOSED without OOB
>>
>> Thomas Huth (1):
>>        Remove the deprecated moxie target
> 
> The moxie removal failed to build on an incremental build
> when Thomas submitted it in his pullreq:
> https://lore.kernel.org/qemu-devel/CAFEAcA8k1DnOFT+5pjQ4ytene3asVDKB7TUOZgGhucTp_ypz2g@mail.gmail.com/
> 
> Does this pull include a fix for that ?

This patch series contains changes to the "configure" script, so I assume 
this will work-around the problem and trigger a proper rebuild...?

  Thomas


