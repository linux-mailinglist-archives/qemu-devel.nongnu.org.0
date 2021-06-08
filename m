Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6626939F980
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 16:47:24 +0200 (CEST)
Received: from localhost ([::1]:47464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqd0j-0002NB-LH
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 10:47:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lqczI-0001Ju-6G
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 10:45:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lqczF-0004Zl-MT
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 10:45:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623163549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0bZrE+OSi9x7BhqGIg9fwu44BYqgDsQKTFFG1rxVLQM=;
 b=ZXiyxBlIfj+iZ/A3mwuFcrYrY2vt2JKofRUlQQgjdSvPJg9tZWWuUFInMxDv0OA7bZyEve
 Qbi3QZUJw1G6Jnd7owpJPVNO42150Pa+Z6+iNDly/4lgjc4403RxUQebC1dkWjugnibKFH
 6SxEGl8wv3jgyA21UuOIf0Fc2O5pamQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-Fmjek2pKPQiB_dkNNOLnDQ-1; Tue, 08 Jun 2021 10:45:47 -0400
X-MC-Unique: Fmjek2pKPQiB_dkNNOLnDQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 u5-20020adf9e050000b029010df603f280so9539718wre.18
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 07:45:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0bZrE+OSi9x7BhqGIg9fwu44BYqgDsQKTFFG1rxVLQM=;
 b=j2fRJ6IiKZ6WvdpRU8xjEAhfIpNz/aBWtwZty8mAsZ9L/ZBVexQm1My7AQslDyOt47
 Vrlci6CUXdl2p0CnCv0N7xAGgwsraXtbBdOXJicoO+HaOF7PkEXmSR9x34IJ2O3+FygP
 vbkgqochYVYJuLP3SQ+MXhBHtWRl+HTTqa0kw7ktPAd4ch99K7S3iX/7K+9FousFi8eU
 miazakMgL6FYWDOrjWt1y8fbeO4n5LOTh7fYOGeD85U6EUBIRNhKFfVhhGt9W7SyDS4b
 8vjwBoMyeUD3kgg06EV+8tdXHBdwPdUTCNUA4DFEhHRzK0T5SbwIO4ZUnfWAdPubwg+i
 pHiw==
X-Gm-Message-State: AOAM533ctnMUIka13PgptC6peOpFsUr3BQhL5iWxdQdxSW/lvItK0mk0
 vumf+b5T/+dNgi8dF4FwawPG48wpeHecVR5myoMJE0+h3zAbJ3O/dpEAPFZ8b1U3iRaOYMi1FlW
 35AGm4dXUxDgPBb0=
X-Received: by 2002:a05:6000:1847:: with SMTP id
 c7mr23339956wri.368.1623163546573; 
 Tue, 08 Jun 2021 07:45:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwyMfsVEl/d1XhVdvMNZhfMAff/c0zINoVwjs5UaYhkZztzJxxUH6EXEm3u5wAnxThrm4Y+EA==
X-Received: by 2002:a05:6000:1847:: with SMTP id
 c7mr23339940wri.368.1623163546454; 
 Tue, 08 Jun 2021 07:45:46 -0700 (PDT)
Received: from thuth.remote.csb (pd9e83d80.dip0.t-ipconnect.de.
 [217.232.61.128])
 by smtp.gmail.com with ESMTPSA id m21sm3058601wms.42.2021.06.08.07.45.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 07:45:46 -0700 (PDT)
Subject: Re: [PATCH v16 96/99] tests/qtest: split the cdrom-test into
 arm/aarch64
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-97-alex.bennee@linaro.org>
 <83b32ad3-18a6-c9d4-6561-c3c880234e09@redhat.com>
 <8f6c0b14-16da-4699-a279-fcbacd1e862d@redhat.com> <87fsxsl8o8.fsf@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <471ef045-3097-97de-0629-cce8f4cab235@redhat.com>
Date: Tue, 8 Jun 2021 16:45:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <87fsxsl8o8.fsf@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 "open list:IDE" <qemu-block@nongnu.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/06/2021 16.41, Alex Bennée wrote:
> 
> Thomas Huth <thuth@redhat.com> writes:
> 
>> On 08/06/2021 15.42, John Snow wrote:
>>> On 6/4/21 11:53 AM, Alex Bennée wrote:
>>>> The assumption that the qemu-system-aarch64 image can run all 32 bit
>>>> machines is about to be broken and besides it's not likely this is
>>> What's changing? I'm not deeply familiar with aarch64. Why is this
>>> assumption about to be broken?
>>
>> That's also quite a surprise to me. Do you have any pointers?
> 
> It's at the top of the series. If you build qemu-system-aarch64 with a
> custom config you won't be able to instantiate those machines. Ideally
> it would probe and maybe fail safe if the binary doesn't support the
> model. Is that possible in qtest?

Not yet. You'd need to do something similar like Philippe did in patch 
03/99, but instead of running query-accel, you have to run query-machines 
instead.

  Thomas


