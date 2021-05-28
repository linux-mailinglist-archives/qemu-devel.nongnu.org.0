Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 217663947FE
	for <lists+qemu-devel@lfdr.de>; Fri, 28 May 2021 22:35:26 +0200 (CEST)
Received: from localhost ([::1]:57892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmjCX-000254-5D
	for lists+qemu-devel@lfdr.de; Fri, 28 May 2021 16:35:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lmj9Y-0006lH-FG
 for qemu-devel@nongnu.org; Fri, 28 May 2021 16:32:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lmj9W-00030l-0l
 for qemu-devel@nongnu.org; Fri, 28 May 2021 16:32:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622233937;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C1GRP+evFglfolTMo94TAaMLtDCo2lWgnBjaZOeZaN8=;
 b=RPts6n8RwQsVpmDZVO8tfQwZZlQzhxefTEDQmM9Wr6kvmAA8CqtYrFsYvdqfjfQd+Bvx6m
 rU+HUBPJvtwittSUxbpKrxkpAtCFYqD385l4L9UPfiEm+e5xIghVY8HWKd67rV3iz9qBpp
 y05RuOao4V3cUvvvgLuaezTKUhQ/L3Y=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-Gu18HmSDOU-BXyCFEQaMUw-1; Fri, 28 May 2021 16:32:14 -0400
X-MC-Unique: Gu18HmSDOU-BXyCFEQaMUw-1
Received: by mail-ed1-f69.google.com with SMTP id
 h16-20020a0564020950b029038cbdae8cbaso2692284edz.6
 for <qemu-devel@nongnu.org>; Fri, 28 May 2021 13:32:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=C1GRP+evFglfolTMo94TAaMLtDCo2lWgnBjaZOeZaN8=;
 b=L/IH4aUSciHT9fx6oi0XokemXn3ggJ7BJ3aQ1ssS7UwPzQVA0uacRajdmlw9VSpwHG
 Sw8XF05hXOZ66cZckuZE5XN/83Wjaq9NY6hNXT8ebB/Dy3cXwZg+Va1b034c4dazZD2S
 jk2X2lkmJLhc5puRIWp3cB8d3//7R9q9PAOEzPd8C4iy6FCb4+pmoMx60JWLJ2qnLF24
 Fg4t5U801HU7fmzalOUxYGTKfPIqdLvhdizJuF8H5qeNjRJa+sFjlrFIJvF8YIaQcEH4
 cSF9j6MUV/4/qroCKhWHvV+S2bSWcuADuOGtnfxubBIw5I1IYnnSzWyKRIOk0s+a2Ejy
 Rflg==
X-Gm-Message-State: AOAM532s4f2ceOHahiRQ7mT5d9Eh8PWnOPouzLRixroNjL2m2Q32oe/F
 YlJpcEqabMtYH9XaZHsVF9LADYOhRWcFVjXZkgy8zg58LvQUQxg3nSGW+tGvO2Ti/9DTDF4pTTK
 MomvEKyVQ33b2jsQ=
X-Received: by 2002:a17:907:96a4:: with SMTP id
 hd36mr10900545ejc.519.1622233933352; 
 Fri, 28 May 2021 13:32:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyqVZ0Hzb9WzkdK2+5Xgds9qkLefSCpJFsavJ/jv6xrStSJmXAPANAdXHJMGF9FIptT9KMqdQ==
X-Received: by 2002:a17:907:96a4:: with SMTP id
 hd36mr10900527ejc.519.1622233933231; 
 Fri, 28 May 2021 13:32:13 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id
 dn4sm3208953edb.88.2021.05.28.13.32.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 May 2021 13:32:12 -0700 (PDT)
Subject: Re: [PATCH v4 14/15] qemu-iotests: add option to show qemu binary
 logs on stdout
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210520075236.44723-1-eesposit@redhat.com>
 <20210520075236.44723-15-eesposit@redhat.com>
 <21fd6fc2-0715-34dd-c070-696f5f106f87@virtuozzo.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <b943927f-9cb6-cee3-45b3-f1c591bc7e13@redhat.com>
Date: Fri, 28 May 2021 22:32:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <21fd6fc2-0715-34dd-c070-696f5f106f87@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


>> +
>>   imgfmt = os.environ.get('IMGFMT', 'raw')
>>   imgproto = os.environ.get('IMGPROTO', 'file')
>>   output_dir = os.environ.get('OUTPUT_DIR', '.')
>> @@ -614,6 +616,13 @@ def _post_shutdown(self) -> None:
>>           super()._post_shutdown()
>>           self.subprocess_check_valgrind(qemu_valgrind)
>> +    def _pre_launch(self) -> None:
>> +        super()._pre_launch()
>> +        if qemu_print and self._qemu_log_file is not None:
>> +            # set QEMU binary output to stdout
>> +            self._qemu_log_file.close()
>> +            self._qemu_log_file = None
>> +
> 
> So, many use of _private members actually show that proper way of doing 
> this is adding an option to __init__ instead

And then add yet another bool variable in __init__ just to mark when use 
the log file or not? At this point, if we really don't want this here we 
can just create a public function in machine.py and call that...
This can also be shared with machine.py's _post_shutdown().

> 
> Interesting will pylint complain on using _private members outside of 
> the home class?

No, test 297 tests it and prints no warning or error.


Thank you,
Emanuele


