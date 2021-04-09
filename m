Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF09C35A2CF
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 18:16:53 +0200 (CEST)
Received: from localhost ([::1]:51622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUtoS-0006oO-7K
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 12:16:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lUtlD-00040c-E8
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 12:13:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lUtl9-00021q-FF
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 12:13:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617984805;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0Ve4nVg8s2s1QT7OA4YuNADg2QlgbN7iU4fcag6o8IQ=;
 b=imfWyLm+vJ3Ceui+WAFw/a7KeW8zN3R+87R5ZzXoXrCeNO0RX13zu86KCZbyi+pxYUaJxP
 qZkZimBwKTrNYYyRss7aqpQGzMpzk84kgV5x7+TLzxZ4qMFmy0QItjumRe7P+ajilSxtHL
 D4QV2f5SQrdNeGuTZzcH70OcPqjJ7Lg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-149-vgZq0QPsNTuWNLo8KqxL2g-1; Fri, 09 Apr 2021 12:13:22 -0400
X-MC-Unique: vgZq0QPsNTuWNLo8KqxL2g-1
Received: by mail-wr1-f71.google.com with SMTP id a15so2484492wrf.19
 for <qemu-devel@nongnu.org>; Fri, 09 Apr 2021 09:13:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0Ve4nVg8s2s1QT7OA4YuNADg2QlgbN7iU4fcag6o8IQ=;
 b=pOJ12Jbpjk444yKA0xvZOU0JcwTaWQ/uM4j4ApSm17Qau2Dkys7eF3JoKMnk7kj2SL
 gkrUYIBm2nwEX4AnShLg5z627QM8+c8oociUrXWiIudTwrRH0eS5skbYVFKGcCvAQpI4
 znamQz3gtlh4dg2DQ3dfSW3RrLcO4nLywkPqicOgSvnHXAQjEFJEoHtFA9WkETawRNzF
 ApPycNyw6oHS7OIMQXcCf/7a1bljB7DdjWddqzGRutBEgVQb1JqG3H4HmH2MpBgK80Ev
 EBeqzay1Uj8AQVE6bVN46lYEQ4d+ZHAW+bQtr1s4uEKBXOuHfuHJHoRQPYyphro71enu
 /TeA==
X-Gm-Message-State: AOAM533ImgmSyIOQl2lAFwWbXwQyU6ynH0d8MuKvDeFWS6eH3IrtXN2V
 gh/R5UBL2JamUmTRRVDDM0q6QLJgtUYoJF+lFhabvbG66eyfYpo4HDvd80ijrS+liGT7XtQjkT9
 C3hCK9vQ0bl7pYoY=
X-Received: by 2002:adf:eec8:: with SMTP id a8mr10073603wrp.382.1617984801313; 
 Fri, 09 Apr 2021 09:13:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzFn4aiCVfr7PHlymozWNHL5wZzUxKjkjEQtYngHBh8+Hy3Vx0chqOqBJsIbSlpk+Wq/2phSg==
X-Received: by 2002:adf:eec8:: with SMTP id a8mr10073581wrp.382.1617984801105; 
 Fri, 09 Apr 2021 09:13:21 -0700 (PDT)
Received: from localhost.localdomain ([194.230.155.173])
 by smtp.gmail.com with ESMTPSA id m5sm4973617wrx.83.2021.04.09.09.13.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Apr 2021 09:13:20 -0700 (PDT)
Subject: Re: [RFC PATCH v2 04/11] qemu-iotests: delay QMP socket timers
To: Paolo Bonzini <pbonzini@redhat.com>
References: <20210407135021.48330-1-eesposit@redhat.com>
 <20210407135021.48330-5-eesposit@redhat.com>
 <ac7c35c0-8597-5450-e80a-cb8adac5d85f@redhat.com>
 <ef103aa2-d585-22ce-0aaf-45a6e190d2ef@redhat.com>
 <CABgObfad1g5n=Ya5+b9m0v_gVbFF1Tbg8Zo+iCuNWsJwiD6oNQ@mail.gmail.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <754ab22c-6432-4713-e375-353361d31f41@redhat.com>
Date: Fri, 9 Apr 2021 18:13:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CABgObfad1g5n=Ya5+b9m0v_gVbFF1Tbg8Zo+iCuNWsJwiD6oNQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
 "open list:Block layer core" <qemu-block@nongnu.org>,
 qemu-devel <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 08/04/2021 21:03, Paolo Bonzini wrote:
> 
> 
> Il gio 8 apr 2021, 18:06 Emanuele Giuseppe Esposito <eesposit@redhat.com 
> <mailto:eesposit@redhat.com>> ha scritto:
> 
> 
> 
>     On 08/04/2021 17:40, Paolo Bonzini wrote:
>      > On 07/04/21 15:50, Emanuele Giuseppe Esposito wrote:
>      >>       def get_qmp_events_filtered(self, wait=60.0):
>      >>           result = []
>      >> -        for ev in self.get_qmp_events(wait=wait):
>      >> +        qmp_wait = wait
>      >> +        if qemu_gdb:
>      >> +            qmp_wait = 0.0
>      >> +        for ev in self.get_qmp_events(wait=qmp_wait):
>      >>               result.append(filter_qmp_event(ev))
>      >>           return result
>      >
>      > Should this be handled in get_qmp_events instead, since you're
>     basically
>      > changing all the callers?
> 
>     get_qmp_events is in python/machine.py, which as I understand might be
>     used also by some other scripts, so I want to keep the changes there to
>     the minimum. Also, machine.py has no access to qemu_gdb or
>     qemu_valgrind, so passing a boolean or something to delay the timer
>     would still require to add a similar check in all sections.
> 
>     Or do you have a cleaner way to do this?
> 
> 
> Maybe a subclass IotestsMachine?
> 

I actually figured that I could override get_qmp_events and put the 
check there. Something like (simplified):

class VM(qtest.QEMUQtestMachine):

	...

	def get_qmp_events(self, wait)
		if qemu_gdb or qemu_valgrind:
			wait = 0.0
		return super().get_qmp_events(wait)

Emanuele


