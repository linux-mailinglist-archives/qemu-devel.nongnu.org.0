Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E272D74DE
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 12:47:15 +0100 (CET)
Received: from localhost ([::1]:58180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kngtG-0001EJ-Ss
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 06:47:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kngsF-0000Qy-9M
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 06:46:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kngsD-00035m-B2
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 06:46:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607687168;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qYS6UumXg+2ci0IkBEkONNEK4Y9P/mTh3oCe8At9G84=;
 b=P2LpwiyDfg+aeG3YifRwvCpZqBykaqbvno/b9YVnSOGDAISuGfeNV5wmpE/zJihesXuPLj
 i3TLvboP58NbJGqEvf89/+RG+DOkO2IvX2XUXEyo570Wdt8tARcJii3TW0wVGP681cNtOg
 EffqpGXB1YUWrxid1LRSN1264Qov9no=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-156-qxHbeBsYN4-2a4h_xV0vlA-1; Fri, 11 Dec 2020 06:46:06 -0500
X-MC-Unique: qxHbeBsYN4-2a4h_xV0vlA-1
Received: by mail-ej1-f71.google.com with SMTP id 2so2675303ejv.4
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 03:46:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qYS6UumXg+2ci0IkBEkONNEK4Y9P/mTh3oCe8At9G84=;
 b=of30xbuLXXZl5J1s6O57HzweF6tvqwgLt3X4q9Qz155JCvZJzVzf8SFD9gR2i49vNz
 m1ov8pffysreSuf1IX5wMND4vg0FDRNAELWbkv5k5ajB6xFeEqjGGxlsAeRaglbgqCHS
 HTnWWG2QaPrkIaAK/oqYxT0o+yTB2Li+8tq8766SR8/q8TN83C27uhd4q573PipP0Nzg
 fDTstG7F0lkYmfbKvgoOLoe46abqr4LacNzlGLA4JpUzxpCh6GVScuat7dJSCxE2R4gE
 JgK8ZAR7V8FgOUlc4P8Ual8BZIXcULMFbJS+YEOPIMUX19lY7x2NbWHKCS9RFSTG1mGH
 TN3A==
X-Gm-Message-State: AOAM531emWi+NhuW1UStIWDMK49HKdyqYlfxsAwtH+bsyuw2wu3NNfIs
 B3vShP16Vk7IV6tEAXZdS5Am9p6kpRgT4ac7npToEChoZdkWJajQq5rvWaDjUGv6VuyKcHU2p17
 3ArSLStCrvwOhzQlMPAmChKHwDBQu/aislA/do45n7e7UR6vR8S+QxQwSM1vu9jm1oNw=
X-Received: by 2002:a17:906:52da:: with SMTP id
 w26mr10695760ejn.347.1607687164834; 
 Fri, 11 Dec 2020 03:46:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyvs7UAqOL7iEZGhwGVQHWMT9gA0DkxbbDRIUCWfNWph5kXuD1ZeCJO9dz6zQCw+jsJ+mtnkg==
X-Received: by 2002:a17:906:52da:: with SMTP id
 w26mr10695739ejn.347.1607687164580; 
 Fri, 11 Dec 2020 03:46:04 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id y17sm6753309ejj.84.2020.12.11.03.46.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Dec 2020 03:46:03 -0800 (PST)
Subject: Re: [PATCH] ide:atapi: check io_buffer_index in
 ide_atapi_cmd_reply_end
To: Wenxiang Qian <leonwxqian@gmail.com>, P J P <ppandit@redhat.com>
References: <20201118142745.112579-1-ppandit@redhat.com>
 <204751s9-11np-413q-q3pr-3o6os86078@erqung.pbz>
 <492170b8-8056-bd65-5150-62c6e89cb3f0@redhat.com>
 <933np1s-8p4p-o74p-rp94-517r98nop2o6@erqung.pbz>
 <a964ffea-ece6-3f33-3dd1-ee9c2b729b75@redhat.com>
 <87sg8o65ys.fsf@dusky.pond.sub.org>
 <212n55r-9n3q-8r4r-85p7-14n495r53s6n@erqung.pbz>
 <CAKZf9JDg=5y=2v=O6ZQjcLCYXXEn2szM_c3rrQgtTHvLsSicww@mail.gmail.com>
 <CAKZf9JCJ6A1XjKVWigXTTT-2Jbcshyct3b9pL+PdOtLHizCFvw@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <9f02571c-5503-5734-b05b-9eaa7e5bcbb1@redhat.com>
Date: Fri, 11 Dec 2020 12:46:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAKZf9JCJ6A1XjKVWigXTTT-2Jbcshyct3b9pL+PdOtLHizCFvw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, John Snow <jsnow@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/12/20 09:32, Wenxiang Qian wrote:
> + The lba is set to -1 to avoid some code paths, to make PoC simpler.
> 
> void ide_atapi_cmd_reply_end(IDEState *s)
> {
>      int byte_count_limit, size, ret;
>      while (s->packet_transfer_size > 0) {
> .....
>          if (s->lba != -1 && s->io_buffer_index >= s->cd_sector_size) { 
> <----- set lba to -1 to avoid this part
>   .....
>          }
>          if (s->elementary_transfer_size > 0) {
> ......
>          } else {
> .......
>              if (s->lba != -1) { <-----
>                  if (size > (s->cd_sector_size - s->io_buffer_index))
>                      size = (s->cd_sector_size - s->io_buffer_index);  
> <-----
>              }
>          }
> 

If the lba is not -1, I don't think bad things can happen on this path. 
  Am I wrong?

Paolo


