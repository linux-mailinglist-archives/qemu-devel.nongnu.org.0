Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D4D40040F
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 19:23:09 +0200 (CEST)
Received: from localhost ([::1]:57278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMCuC-0000uL-HF
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 13:23:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mMChs-0007L4-NM
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:10:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48165)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mMCho-0004g4-On
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:10:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630689020;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ov5rv3A6ter6wNpEKGjXrXiwjQ8ijppg8NoIE1q3PLc=;
 b=IsYpuzjfMmmpkkVTKd/W3zngMP7oqE71mo3Sfo0xNhoY2bmpS7qZYNXFHtb2ubpanlaXbB
 rByyHXKaGNoqsea3uLTAQlpvnIhemWSp1gP/+eCe0duAC/61how9egrSZbyMboLAKn4vb2
 87IpfpGK0l71wRCycepcZIZ82+aoVxI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-gQN-rJ8DOB21MjeeJJ4n_w-1; Fri, 03 Sep 2021 13:10:16 -0400
X-MC-Unique: gQN-rJ8DOB21MjeeJJ4n_w-1
Received: by mail-wr1-f70.google.com with SMTP id
 r11-20020a5d4e4b000000b001575c5ed4b4so1796101wrt.4
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 10:10:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ov5rv3A6ter6wNpEKGjXrXiwjQ8ijppg8NoIE1q3PLc=;
 b=HD25TqCVLxB7tbb8enGrHT5qkRIksLU4SU8W2j+EOHtk804CGxv3Kx7IBIZFs/aRxM
 5Oig09Kvx4iKzZKEaqahq/Ce26t/6V6OhWdMV1AGqqBf5Ue5Pz2MJ6Dav1I3n4adeuLy
 269gs0tlQI6i+m5rswcr96LzIKwe/JDNmeJqY8ESAvop/9QtUbTf7SYGKq87b8VSfyr+
 +msC0KSyB6bydXQHmOOT1O2TFUtFmdXRBN6jG5SAmdUzw4uLLeTeX3nB4Z+59VzfLzRn
 Wzy7TM96VNPMX3QWHXwnoWTFbeAi04hpVFrHMEZgqTMfRrZwFFtKJKddBviFE8ORuiU1
 UeDw==
X-Gm-Message-State: AOAM532/BbA1D+lSyLl6p4ryFATRQxv+a2VroDtXSJqX7FSXpPbGEInF
 6OuCEQEWKwUgnavYjtuof+fUgZuURwR1NxOCYOqkPaMOEA6NeWqrKDPzsWVksb0SHWYfLs1dBC5
 erbm/anmrf5Bn8j8=
X-Received: by 2002:a05:600c:2056:: with SMTP id
 p22mr1471861wmg.8.1630689015822; 
 Fri, 03 Sep 2021 10:10:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyRC0qABYGoGmoTtEu3cqoUlhFs3pT4MgS9ipLww83nIN0/tBwtv6ckmcG2ixvIOOrNwunL5g==
X-Received: by 2002:a05:600c:2056:: with SMTP id
 p22mr1471828wmg.8.1630689015615; 
 Fri, 03 Sep 2021 10:10:15 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id d24sm4629020wmb.35.2021.09.03.10.10.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 10:10:15 -0700 (PDT)
Subject: Re: [PATCH 03/28] qapi: Replace g_memdup() by g_memdup2_qemu()
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210903110702.588291-1-philmd@redhat.com>
 <20210903110702.588291-4-philmd@redhat.com> <YTIEeO5udKWuqE6H@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <674f9eb9-7bc2-f7f9-d36d-a6d7da3bac80@redhat.com>
Date: Fri, 3 Sep 2021 19:10:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YTIEeO5udKWuqE6H@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.888, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>,
 John Snow <jsnow@redhat.com>, Helge Deller <deller@gmx.de>,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 Michael Roth <michael.roth@amd.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Richard Henderson <richard.henderson@linaro.org>,
 Greg Kurz <groug@kaod.org>, Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Laurent Vivier <laurent@vivier.eu>, Zhang Chen <chen.zhang@intel.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/3/21 1:18 PM, Daniel P. Berrangé wrote:
> On Fri, Sep 03, 2021 at 01:06:37PM +0200, Philippe Mathieu-Daudé wrote:
>> Per https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-memdup2-now/5538
>>
>>   The old API took the size of the memory to duplicate as a guint,
>>   whereas most memory functions take memory sizes as a gsize. This
>>   made it easy to accidentally pass a gsize to g_memdup(). For large
>>   values, that would lead to a silent truncation of the size from 64
>>   to 32 bits, and result in a heap area being returned which is
>>   significantly smaller than what the caller expects. This can likely
>>   be exploited in various modules to cause a heap buffer overflow.
>>
>> Replace g_memdup() by the safer g_memdup2_qemu() wrapper.
> 
> This and all following patches should directly use "g_memdup2"
> rather than the wrapper which is supposed to remain "secret"
> in the glib-compat.h header.

Yep, got it, thanks for the quick review!


