Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A51792FC4BA
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 00:29:03 +0100 (CET)
Received: from localhost ([::1]:47996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l20Qo-0007ec-NW
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 18:29:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l20Ou-00076T-2i
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 18:27:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28223)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l20Or-0005Y8-NG
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 18:27:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611098820;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Knwk6I7yPQM5FQkUiK8rI8VwKBHQYGXUgeZQ8aDO6a4=;
 b=NIumDbzBmIXcdyJ/wVMuhZwPd9ciIH7szlejwWG1BrQb+U01Ro02w1zmK6ylgU3uZYz1ul
 NHhdUoNQCPIAYRnSsoaE/aPeKpyMQna5etBv8qRwAFA7zcnHH0esEOJTgP1GlYUGojJeaL
 KQBpzzEduGbbgbPIRlcCd97OT2MylZ4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-158-J1HA7UZFPnKe7Z4SNpYscw-1; Tue, 19 Jan 2021 18:26:56 -0500
X-MC-Unique: J1HA7UZFPnKe7Z4SNpYscw-1
Received: by mail-ed1-f69.google.com with SMTP id dg17so9921316edb.11
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 15:26:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Knwk6I7yPQM5FQkUiK8rI8VwKBHQYGXUgeZQ8aDO6a4=;
 b=WMHeFMsavI7b6k1q9S1rwUT4aN5bGDoFqBPZCofWmzd2OoXDGoCEaQIja5XapCk3kO
 FWVrTbsnU0gYKWL+7Yu0Vh6QQ4aZ2ZrAdDdwj7JTi/gagdeoogm6X+Gv3vCB+74FPKXn
 gdU2KIJJBRbJQaK4uGssOop5rLC1/Lvnw4h0KwcP6q0Hcgkq9Da6ZZqsL56Q2rq0oESg
 T6ACxU/fFSUVaIJih5hbnKvhUrrZHr+hx+WcjFcmIuzXtJ6f/BetI6Yem0W9CnhhPrt9
 gCcxcT6isNtM9zmRHivfwx8F4DNCOYfRg0rtJ5rHwCssi1MxO5iDBLgznxMXW0MmkeLP
 jNpA==
X-Gm-Message-State: AOAM5304e7UKdRGLcS7cx4e6wBIw0YcMzpHakB+udsTkfWvW2aADg/lj
 d4VsiNDeqYACnMPBmeEucr3J9kyd/p3eMHLzfWRlbgsrjTVvfOCiaGK87k/fenHRNRlxsZKT5eh
 GwCpwB7KEoyh1oGo=
X-Received: by 2002:a17:906:a84a:: with SMTP id
 dx10mr4510629ejb.13.1611098815237; 
 Tue, 19 Jan 2021 15:26:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxYfOTvQbJiFVaE7msFqR0+0vFjDzh6bKLWDNGZ8hWqoH84tQ27KaFMKPODk/m98xsrGllh3g==
X-Received: by 2002:a17:906:a84a:: with SMTP id
 dx10mr4510613ejb.13.1611098815019; 
 Tue, 19 Jan 2021 15:26:55 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id lv13sm116944ejb.55.2021.01.19.15.26.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jan 2021 15:26:54 -0800 (PST)
Subject: Re: [PATCH] usb: Fix clang build
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
References: <20210119230741.810007-1-eblake@redhat.com>
 <fd1b9e5f-5436-2cd7-d97a-c6136ce43c95@redhat.com>
Message-ID: <b1bbc846-5945-9592-dffb-3d150b762b4b@redhat.com>
Date: Wed, 20 Jan 2021 00:26:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <fd1b9e5f-5436-2cd7-d97a-c6136ce43c95@redhat.com>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Ed Maste <emaste@freebsd.org>, "Daniel P . Berrange" <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Daniele Buono <dbuono@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/20/21 12:20 AM, Philippe Mathieu-Daudé wrote:
> Hi Eric,
> 
> On 1/20/21 12:07 AM, Eric Blake wrote:
>> ../hw/usb/dev-uas.c:157:31: error: field 'status' with variable sized type 'uas_iu' not at the end of a struct or class is a GNU extension [-Werror,-Wgnu-variable-sized-type-not-at-end]
>>     uas_iu                    status;
>>                               ^
>>
>> Fix this by specifying a size for the add_cdb member; and at present,
>> the code does not actually use that field other than for the size
>> chosen for the packed uas_iu_command struct, and the choice of one
>> byte does not change the size of the uas_iu union.
> 
> I sent a maybe safer approach (from the bus PoV):
> https://www.mail-archive.com/qemu-block@nongnu.org/msg79192.html
> 
> Do you mind reviewing it?
> 
>>
>> Signed-off-by: Eric Blake <eblake@redhat.com>
>> ---
>>
>> I'm not sure why none of our CI tools pick up this particular clang
>> build failure; I hit it on Fedora 33 when configuring to build the
>> entire tree with clang.

BTW first report is from 28 Sep 2020 (Ed):
https://www.mail-archive.com/qemu-devel@nongnu.org/msg745525.html

Then on 23 Oct 2020 (Daniele):
https://www.mail-archive.com/qemu-devel@nongnu.org/msg753674.html

Then on 10 Nov 2020 (Han):
https://www.mail-archive.com/qemu-devel@nongnu.org/msg759108.html

> Same issue after upgrading to f33. I sent a patch to bump our CI:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg774117.html
> 
> To track Fedora releases I was thinking about a gitlab job checking
> if we are using the latest, else failing; smth as:
> 
>  $ curl https://getfedora.org/ | grep -q 'Fedora 33 released'
> 


