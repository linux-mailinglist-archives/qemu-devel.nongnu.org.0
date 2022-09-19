Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 863365BD4B9
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 20:26:00 +0200 (CEST)
Received: from localhost ([::1]:38420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaLSx-0004xb-2g
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 14:25:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oaLCv-0004p2-4W
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 14:09:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oaLCs-0007wx-Sv
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 14:09:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663610961;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QypTAxQwlIZxCKfCpJ2mPulEqP4o5N1ky60yeNAwcHg=;
 b=ZaQKFMo6WfQwwmzz7bXyG00spsSrwskklajB9L/vrf8utUso3bgIPAxYr6R3Kk2xC8mdaA
 MdbZmj+LmPrjrHN7SYkOzmMI+UgX9yQvukBuYq0QBo2YRQrUkpXzL5Sx8O2bbM6kn8JA1U
 C/j+JLtVXQCtb4bkYUJnEkatQf1DJvE=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-663-udf8d9kaPJ-Plrwok5hwsw-1; Mon, 19 Sep 2022 14:09:20 -0400
X-MC-Unique: udf8d9kaPJ-Plrwok5hwsw-1
Received: by mail-ed1-f69.google.com with SMTP id
 c6-20020a05640227c600b004521382116dso122786ede.22
 for <qemu-devel@nongnu.org>; Mon, 19 Sep 2022 11:09:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=QypTAxQwlIZxCKfCpJ2mPulEqP4o5N1ky60yeNAwcHg=;
 b=Yi58+6QrA07QNi/g4dfVt171F0HC8B8Hd3/mZaob2vEgOA5JIlZD+6OmLiGL+VkJmq
 +OSlW3QIoMvb9rzvPJKtQQh/o3mZAqnTLH1SP0apkhhOcKFzoM1VeF/8DYJlvxfc3mEF
 DEQFzghGbo5/xBIjOJghbuVdPLdY8qUF7koKJ5bhmkZMp+eaHmw7fA2BocVbvXHSxXLr
 Lcwmsn2mqlB20DG44w4ZPPjR08T+YK1AcLk7koGTDhEbDLtLNsZuGxv0OTeNv78CgOat
 +QsyOIikd6BrozMbabHVEvu4kvCmnZh6iRN1fs0lho+urBt85Jo98074j+RuNpolpEpR
 Qisg==
X-Gm-Message-State: ACrzQf3CAjK09JLWoR8VEGj4nlYugQ4cO5vsKoj5rKHnFPAVN7p59WqO
 tSkq34BEsEC3Xj0XR1uw+EM8BUSV67BMQUEPwhayCAlThjNkx9Z73bYe14PVafkciWSLMRtVBpZ
 Shs4YM0I2OpHoo9o=
X-Received: by 2002:a17:906:fd86:b0:777:d739:1ede with SMTP id
 xa6-20020a170906fd8600b00777d7391edemr13319282ejb.576.1663610959235; 
 Mon, 19 Sep 2022 11:09:19 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5HY6YVH2EEegc0L83SsiBAmG+vnPx7X93VE+b+YX/sGnbaVF5U2xS/8r3H/hST0IRvTNRVDQ==
X-Received: by 2002:a17:906:fd86:b0:777:d739:1ede with SMTP id
 xa6-20020a170906fd8600b00777d7391edemr13319269ejb.576.1663610959039; 
 Mon, 19 Sep 2022 11:09:19 -0700 (PDT)
Received: from [192.168.8.103] (tmo-083-219.customers.d1-online.com.
 [80.187.83.219]) by smtp.gmail.com with ESMTPSA id
 i5-20020a170906698500b007081282cbd8sm15956329ejr.76.2022.09.19.11.09.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Sep 2022 11:09:18 -0700 (PDT)
Message-ID: <dbc0fb51-2546-7792-bc7e-b07024f2ede7@redhat.com>
Date: Mon, 19 Sep 2022 20:09:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 0/8] tests: Make expliction defaults for tests
Content-Language: en-US
To: Alexander Bulekov <alxndr@bu.edu>, Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 "Michael S. Tsirkin" <mst@redhat.com>, Fam Zheng <fam@euphon.net>,
 Gerd Hoffmann <kraxel@redhat.com>, Bandan Das <bsd@redhat.com>,
 Hannes Reinecke <hare@suse.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org
References: <20220902165126.1482-1-quintela@redhat.com>
 <20220902171640.qki2azr6qffhj6lp@mozz.bu.edu>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220902171640.qki2azr6qffhj6lp@mozz.bu.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.952, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On 02/09/2022 19.16, Alexander Bulekov wrote:
> On 220902 1851, Juan Quintela wrote:
>> Hi
>>
>> For a long, long time I have had local hacks on my tree to be able to
>> run "make tests" when I have a minimal configure guest.  This is a
>> first try to upstream some of it.
>>
>> - by default we always setup -display none (it already was the
>>    default, but some places added it anyways)
>>
>> - by default we always setup -net none.  Not clear what was the
>>    default, but no tests use the default net, so it is safe change and
>>    now it is explicit.
>>
>> - by default we always setup -vga none.  This is a complete difference
>>    can of worms.  Every tests that use vga already set vga correctly,
>>    so this is quite obvious, right?  Now they are acpi tables.  They
>>    are a mess.  And basically this means remove a device for each one
>>    of them.  Why going through all the trouble?  Because while I am
>>    develping, I normall compile out vga.
>>
>> - Fix several error strings that were set with copy paste.
>>
>> - replication test requires CONFIG_REPLICATION.
>> - test-crypto-secret requires CONFIG_SECRET_KEYRING.
>>
>> Please review.  Except for the acpi changes (that I hope I have done
>> right following the instructions) the rest is quite obvious.
> 
> I think this might break some of the fuzz regression tests, because they
> have "baked-in" PCI configuration commands with hard-coded PCI
> addresses, which will shift around if some device is removed (e.g. with
> -net none). Probably the fix is to add addr=... to the -device parameter
> in the fuzz tests to keep the PCI address stable.
> -Alex

The patches to default to -net none and -vga none are a good idea, but I 
agree with Alexander - this needs some careful examination of the fuzz tests 
first to see whether the BARs are changed here or not.

  Thomas


