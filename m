Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB8A2F3C9E
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 00:46:50 +0100 (CET)
Received: from localhost ([::1]:41110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzTNA-0006op-Jj
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 18:46:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kzTKf-00069X-2A
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 18:44:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kzTKa-0005xL-VB
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 18:44:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610495047;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QDrioUtuAXaCd3qT+0Mb32n3ptJffjZBhBjYAiKMGAY=;
 b=O/gIacCKWfZgHTgCmzMcOa3zTYbmvgJ3ZnM/qAYKcx0wH0eN9HKuV71rT2DYQJhBoDrHHw
 g4a+FzslZH6kOzFg8bWUtiiCERqTv9SmVlu24yZbwBBqFJpzNosbC7sVP1Yp6Pv4SIbp1k
 aIHD33hY/OnXD0ezL64mcmQCWCKdeA8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-483-ndCOLiQGNAmOdaBUT4uqLA-1; Tue, 12 Jan 2021 18:44:05 -0500
X-MC-Unique: ndCOLiQGNAmOdaBUT4uqLA-1
Received: by mail-wr1-f71.google.com with SMTP id 4so54508wrb.16
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 15:44:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QDrioUtuAXaCd3qT+0Mb32n3ptJffjZBhBjYAiKMGAY=;
 b=leBikwcIi6VkpnZN7e0WFtv5z720rfvNOH2Ip0HuD/8PZrTow9zo0rC+jdt5qaPqkz
 S8y08RIxBZ+jH/HFv7Qlz+fvRSRUNzJytnbTq0cBwYkh1ZKGcOeiM7MLOEebtWD6wKby
 kdXOQ2xE5XBEooPv2IbStoduotAQ/rVt+ASCDJRvIOhPti6Z5tCz2s4CXwU5D0YKaw29
 kMQ+avdEZAXrGQyGednQ1HtB3vyDy7Kb1WsrJ+p/+vqeqFihh4jQ0WHgp0rFHqehZ+CV
 po/q7ivq/ovEMez++KuXTp2EPpynkjY97zXo3yDlTxRGdh6QJNiQe4szjheeFTbX3CGn
 cWEw==
X-Gm-Message-State: AOAM533djwhSdxqMgvblevfm5TRLXS7yvCPMPjltw7PCtfpefZhsRkzk
 Do7DUf4Kzwe1+H6A7i7Z8+JgIflrVaGcIdMi4UFoKbQ1TXCN/6UsUTkcZp8q8TkOzLtwjEbLmTy
 2kWQJqzhVVpAOCiQ=
X-Received: by 2002:a5d:4a06:: with SMTP id m6mr1138509wrq.189.1610495044283; 
 Tue, 12 Jan 2021 15:44:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw03P23J62nkdOBJT9Y00W6PzvKX4ZcxN8vRbmebn0FHN6M6hMJkP4KsIRmlfaXIkpeYg0wdA==
X-Received: by 2002:a5d:4a06:: with SMTP id m6mr1138485wrq.189.1610495044056; 
 Tue, 12 Jan 2021 15:44:04 -0800 (PST)
Received: from [192.168.1.36] (190.red-83-57-173.dynamicip.rima-tde.net.
 [83.57.173.190])
 by smtp.gmail.com with ESMTPSA id j9sm76291wrm.14.2021.01.12.15.44.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jan 2021 15:44:03 -0800 (PST)
Subject: Re: [PATCH] decodetree: Open files with encoding='utf-8'
To: John Snow <jsnow@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Daniele Buono <dbuono@linux.vnet.ibm.com>
References: <20210108151632.277015-1-f4bug@amsat.org>
 <2cde5504-9df6-93fb-a014-daee2b907fde@linux.vnet.ibm.com>
 <20210112211127.GC4161@habkost.net>
 <f3fe6cae-41bc-31b9-c26f-893c78a8c9b0@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <2b372459-7818-4390-fca9-87735f7fa98c@redhat.com>
Date: Wed, 13 Jan 2021 00:44:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <f3fe6cae-41bc-31b9-c26f-893c78a8c9b0@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/13/21 12:35 AM, John Snow wrote:
> On 1/12/21 4:11 PM, Eduardo Habkost wrote:
>> [CCing John, Wainer]
>>
>> On Fri, Jan 08, 2021 at 05:51:41PM -0500, Daniele Buono wrote:
>>> I had a similar issue in the past with the acceptance tests.
>>> Some VMs send UTF-8 output in their console and the acceptance test
>>> script would bail out if the locale was not UTF-8.
>>>
>>> I sent a patch on the ml but it probably got lost:
>>> https://lists.gnu.org/archive/html/qemu-devel/2020-07/msg06086.html
>>>
>>> I can re-spin it if you guys are interested
>>
>> The mbox at
>> https://lore.kernel.org/qemu-devel/20200721125522.20511-1-dbuono@linux.vnet.ibm.com/
>>
>> can still be applied cleanly, I don't think you need to resubmit.
>>
>> However, we have no owner for tests/acceptance/avocado_qemu in
>> MAINTAINERS.  Is anybody currently taking care of
>> tests/acceptance patches and making sure they are merged?

[1] The answer to this question is below in [2]...

> I touch these tests sometimes, but I know very little about avocado
> overall, so I don't think it's going to be me taking point here.
> 
> (I don't mind taking a reviewer stanza for something like *.py, though.)
> 
> Acceptance (Integration) Testing with the Avocado framework
> W: https://trello.com/b/6Qi1pxVn/avocado-qemu
> R: Cleber Rosa <crosa@redhat.com>
> R: Philippe Mathieu-Daudé <philmd@redhat.com>
> R: Wainer dos Santos Moschetta <wainersm@redhat.com>
> S: Odd Fixes
> F: tests/acceptance/
> 
> Why is this only "Odd Fixes"? Isn't it new within the last ~2y? The
> avocado_qemu module itself was largely written by Cleber, Philippe and
> Caio.

[2] The answer to this question is above in [1] :)

> 
> --js
> 
> 


