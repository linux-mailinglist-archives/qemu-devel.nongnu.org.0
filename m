Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF5D2FEB6F
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 14:19:33 +0100 (CET)
Received: from localhost ([::1]:51514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Zs4-0006Ia-Ie
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 08:19:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2Zq3-00058Y-Gv
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 08:17:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39133)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2Zpy-0006q9-5s
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 08:17:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611235037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T6w9/aFgGuB9UH9vwo3wlIPMmR8hr3+NuhkqQoU//zM=;
 b=aAyXgv85SS2bKKV21RRsIlioNM93X3ju8EkxRCTugo6srM05kwlFsQ9XdK2fezLray7gR0
 7OcvKCcbQ2Ieuxx3F4cz4EzGxLhKzbC8qGzUQdiBJGoamPz0MSwNzXeF5Y6UN7NAYO10sk
 kExfaAn2+w8Uyy+GqmMCihZ+OBYoRmU=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-xgdbf7TKNliQhCztzadmZg-1; Thu, 21 Jan 2021 08:17:15 -0500
X-MC-Unique: xgdbf7TKNliQhCztzadmZg-1
Received: by mail-ed1-f70.google.com with SMTP id t9so1119205edd.3
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 05:17:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=T6w9/aFgGuB9UH9vwo3wlIPMmR8hr3+NuhkqQoU//zM=;
 b=fpmCAjLjR9cGowj+SZ3RqfwO/eMvxBnHmG30S//SiLcOaFbiTGXbragwZ/0qNdLd4T
 tescnHyXgmYBr8Xhwdt3BHPk39Mv2QLLma+CeMOPEDYK2g/ISJDYknUGn5I++zsQbWRA
 wLARFB91wsZb+pAq6qaw+cGGSl3Vj3t84Ns3qH4MlJkkTWsLfJX0o3f+OAJDivPHnOA2
 hEOL1F3a40x4lrGC+lQEj/gY0XKKSxr8cblRDPRnyOygePOA5/rX3foLh9caYRfx+92h
 p4N+s5PB4mtg1PQO4nsBhoI8i6Pf3a01FLGu/butFyg6msMpLwkzoqCjg09ZBPYWrGz8
 nvmw==
X-Gm-Message-State: AOAM530YHJ3p8zJT1j5UfE1d0Jz9PWX8gOvNDflvLonOwvFujEOP0g34
 KWevW99Y0Mqlq0hIi6O8oeVLiLpdlXRsKuAqhIuycPJQuKF7WYhIXTVBIB1THUzdYor1p7y1aub
 t4zLFgF9OT+DPRDw=
X-Received: by 2002:a05:6402:2211:: with SMTP id
 cq17mr1788873edb.167.1611235034416; 
 Thu, 21 Jan 2021 05:17:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzmWTyh3L8QXoos10CI0s/waT7Zt/s10IUTe9kAxP4y7Ut1eaPELTPJJEFWWig071VUUi02xA==
X-Received: by 2002:a05:6402:2211:: with SMTP id
 cq17mr1788857edb.167.1611235034233; 
 Thu, 21 Jan 2021 05:17:14 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id m5sm2213779eja.11.2021.01.21.05.17.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jan 2021 05:17:13 -0800 (PST)
Subject: Re: [PATCH v2 3/3] hw/usb/dev-uas: Report command additional adb
 length as unsupported
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20210120153522.1173897-1-philmd@redhat.com>
 <20210120153522.1173897-4-philmd@redhat.com>
 <20210121111426.tcy2fhxzltts2lja@sirius.home.kraxel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <70b42032-c20d-b345-2847-c29d19045e45@redhat.com>
Date: Thu, 21 Jan 2021 14:17:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210121111426.tcy2fhxzltts2lja@sirius.home.kraxel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
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
Cc: Fam Zheng <fam@euphon.net>, Ed Maste <emaste@freebsd.org>,
 qemu-block@nongnu.org, "Gustavo A . R . Silva" <gustavo@embeddedor.com>,
 qemu-devel@nongnu.org, Han Han <hhan@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Daniele Buono <dbuono@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/21/21 12:14 PM, Gerd Hoffmann wrote:
> On Wed, Jan 20, 2021 at 04:35:22PM +0100, Philippe Mathieu-Daudé wrote:
>> We are not ready to handle additional CDB data.
>>
>> If a guest sends a packet with such additional data,
>> report the command parameter as not supported.
>>
>> Specify a size (of 1 byte) for the add_cdb member we
>> are not using, to fix the following warning:
>>
>>   usb/dev-uas.c:157:31: error: field 'status' with variable sized type 'uas_iu' not at the end of a struct or class is a GNU extension [-Werror,-Wgnu-variable-sized-type-not-at-end]
>>       uas_iu                    status;
>>                                 ^
>>
>> Reported-by: Ed Maste <emaste@FreeBSD.org>
>> Reported-by: Daniele Buono <dbuono@linux.vnet.ibm.com>
>> Reported-by: Han Han <hhan@redhat.com>
>> Reviewed-by: Eric Blake <eblake@redhat.com>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>> Cc: Marc-André Lureau <marcandre.lureau@redhat.com>
>> Cc: Paolo Bonzini <pbonzini@redhat.com>
>> Cc: Gustavo A. R. Silva <gustavo@embeddedor.com>
>>
>> v2: include Eric feedbacks
> 
> Queued 2+3, fixup #2 conflicts due to dropping #1.

Thank you!


