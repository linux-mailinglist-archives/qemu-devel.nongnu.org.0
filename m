Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D66741E264
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 21:47:36 +0200 (CEST)
Received: from localhost ([::1]:57764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mW21n-0007z7-9E
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 15:47:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mW1zK-0005pg-OE
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 15:45:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mW1zI-00061N-D0
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 15:45:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633031099;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8r1te2BKW6ODWO45so0vZcXxWEAZs+lVvQ4gx2CjNK0=;
 b=iUKNYSmdzZcojZnzu7q3lFE6pfy+CpE5DpqJdEzzYx+yxbQPW167rHOG/6nrOfN4G+bGO+
 jRt3EZ9gV+DQ5EjfiL6FVuRIB3IbqdOtRu+MUDdt1A9YVTlDhLqdwdZPGiQqLrg5dw7NYS
 HiE7N+loaFnZCmOW2d01yD4BfY5yeww=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-513-oXHR0U7EOragsfV9jHiDvw-1; Thu, 30 Sep 2021 15:44:57 -0400
X-MC-Unique: oXHR0U7EOragsfV9jHiDvw-1
Received: by mail-wr1-f69.google.com with SMTP id
 w2-20020a5d5442000000b0016061c95fb7so2060439wrv.12
 for <qemu-devel@nongnu.org>; Thu, 30 Sep 2021 12:44:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8r1te2BKW6ODWO45so0vZcXxWEAZs+lVvQ4gx2CjNK0=;
 b=mL9mASt7PBD05ctS+djPCtR4Q3whjaYpIwZ6C6QbQkZAog6SrPZzeQpCz1vs6KTvsu
 Cf6CfTSqvLIsWWxymjFAoSro+a13cn6eEMAfOdZteXbms5FpLAyhyacCENo78KG89B8y
 EUtMhdcytH28+WoH4Ei7rG1GUrWZV45nScQg2Igm5fHFsyEO23uRyUryISWun8Atog3w
 CEEwbiI+2Dx9eUpnbMhaT5cbljDVTMP4CmaD7WF2YL5ed8jMN44lTaiAQRllYBBmT9jO
 sj6eqloVpxWDU01TkXaZHn5ooPYys5R0h+VosD4FsJA+gTWfBAVNrExM3n+1g3L9eYjq
 uusw==
X-Gm-Message-State: AOAM532TIW2GmuMSJgHdTrdyOK6V3PBYgr4oVac+GxJZ9pmDZHglO/06
 zLmm88JZUJrjTqiPSep1N/sXY416/U1PJ79JJ3k77fXu0/kfwWLezyJ6nWm7gItdSkzf8CZygNW
 MZtGazV5BUiiXDP0=
X-Received: by 2002:a05:600c:4fd2:: with SMTP id
 o18mr875846wmq.126.1633031095997; 
 Thu, 30 Sep 2021 12:44:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxW+EN9LDX48fbKWSQNgdrpJSOiOFTOc0RTqjOcJ2ODOroIxZaGnvQF/9nyA93UZDNfgDPkwg==
X-Received: by 2002:a05:600c:4fd2:: with SMTP id
 o18mr875820wmq.126.1633031095831; 
 Thu, 30 Sep 2021 12:44:55 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id k1sm3944342wrl.33.2021.09.30.12.44.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Sep 2021 12:44:54 -0700 (PDT)
Message-ID: <86a0ea6b-132d-3b97-4943-8d2fb661c919@redhat.com>
Date: Thu, 30 Sep 2021 21:44:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 14/16] tests/acceptance/ppc_prep_40p.py: NetBSD 7.1.2
 location update
To: Reinoud Zandijk <reinoud@NetBSD.org>
References: <20210924185506.2542588-1-crosa@redhat.com>
 <20210924185506.2542588-15-crosa@redhat.com>
 <f21bc338-f0e1-e32f-980b-e40806a99555@redhat.com>
 <YVYN3zEeg3Wyf04t@gorilla.13thmonkey.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <YVYN3zEeg3Wyf04t@gorilla.13thmonkey.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.127, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, Greg Kurz <groug@kaod.org>,
 Auger Eric <eric.auger@redhat.com>, Kamil Rytarowski <kamil@netbsd.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Ryo ONODERA <ryoon@netbsd.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/30/21 21:19, Reinoud Zandijk wrote:
> On Mon, Sep 27, 2021 at 05:26:43PM +0200, Philippe Mathieu-Daudé wrote:
>> On 9/24/21 20:55, Cleber Rosa wrote:
>>> The NetBSD-7.1.2-prep.iso is no longer available on the CDN, but it's
>>> still available in the archive.
>>>
>>> Let's update its location so that users without the file on cache can
>>> still fetch it and run the test.
>>>
>>> Signed-off-by: Cleber Rosa <crosa@redhat.com>
>>> ---
>>>  tests/acceptance/ppc_prep_40p.py | 4 ++--
>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> No objections but is there a reason why it is still using NetBSD 7.1.2?  I am
> not a ppc guy but as a NetBSD developer just curious.

We know that QEMU 40p machine successfully boots NetBSD 7.1.2 and
we don't want regression with it.

It could boot more recent versions but I haven't tested. Tests
are welcome :) There should be quite easy to add.

Regards,

Phil.


