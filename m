Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE463B80EF
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 12:46:09 +0200 (CEST)
Received: from localhost ([::1]:52526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyXjM-0005HT-UB
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 06:46:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lyXiX-0004VO-J5
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 06:45:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lyXiV-0001Lr-NP
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 06:45:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625049914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aYL5dPrkdsGQyuIBb9fqljj0fl0RxCeXgZ6slZtL+Yg=;
 b=ZE8ISslqrOqzuF94m8ZmK5kabk5ycqZBQHsTQ7r9Qh9+3WRM06xbjlj9C6UkghBQk66Dja
 9OZ22CLQFCWmZaB1lyiHRjyZlV1ZEbu4/HEPfz0cNAr1ki7zaSxIaqy+mdhFo+33LfXy7f
 0H6oA2SnNl82WZBYF+0piVpSysSRyok=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-328-HYNnQON6NpSBdXnAyVdqfQ-1; Wed, 30 Jun 2021 06:45:13 -0400
X-MC-Unique: HYNnQON6NpSBdXnAyVdqfQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 i17-20020a5d43910000b02901258b767ad5so721449wrq.2
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 03:45:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aYL5dPrkdsGQyuIBb9fqljj0fl0RxCeXgZ6slZtL+Yg=;
 b=iECkoQJWSCgk9TwEMxVDyZqR4tS/JwssbtkyjVe7IrJxYpfvrzOogZJ/Wi8YhyxQul
 x2lnNIVUUJVwq+bDbNjahpoZWq0lTP26wVG4py1uW13qmYLFjqSfvYp+PJyogYiQXkp0
 M4kNLLMQWsjqO7UtH6Ko0PwG0giMoKbhY1WjmqRn5WptQXGe5QhoOt3oo7fbV4kdqCnm
 PZFDyw/mvrtE3oUKUIgOKS595xxBG9pxlapVSUSLyC7Kt28kMoc2iXa1smu5MKFi+qUp
 OgMLpe/nofkqwnRvcdsiyWeNknui+uaRbQ5vbpL5qa53goODloIu6kUrQ5Q0Dwj7aQJo
 rJug==
X-Gm-Message-State: AOAM533fzEe/aFfG0Th3YWzZ3tAa7b0s0w9oPqJugHzCLemg4+mxLPeg
 a5M+jb6R6lrZVSQLDmVGcXWOXFGLMhjAii7c0K6WyQtPxB4L8icxZOJl9WjQGUoJ5TeBRKsqnvL
 nniUPA8WnoMcHc38=
X-Received: by 2002:a5d:4f01:: with SMTP id c1mr14540776wru.266.1625049912254; 
 Wed, 30 Jun 2021 03:45:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzaxAEvth5+DlcVv55GLFx03sZvj5nwrICxxUHNu2WDTwVAYltRrwF1haDIHRJ3IniZgJ2eVQ==
X-Received: by 2002:a5d:4f01:: with SMTP id c1mr14540742wru.266.1625049911893; 
 Wed, 30 Jun 2021 03:45:11 -0700 (PDT)
Received: from thuth.remote.csb (pd9575ed8.dip0.t-ipconnect.de.
 [217.87.94.216])
 by smtp.gmail.com with ESMTPSA id y3sm21846150wru.78.2021.06.30.03.45.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jun 2021 03:45:11 -0700 (PDT)
Subject: Re: [PATCH] ui: Mark the '-no-quit' option as deprecated
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210630092127.374720-1-thuth@redhat.com>
 <CAFEAcA_XDvTxRHWE3TwP-hZk_DeS-AUCyv9-WZCYKE3zQtSU6Q@mail.gmail.com>
 <e67d70cd-1e0c-5618-2572-3e0aa95049ff@redhat.com>
Message-ID: <7b179fa2-d014-6563-86ad-d2c628653b47@redhat.com>
Date: Wed, 30 Jun 2021 12:45:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <e67d70cd-1e0c-5618-2572-3e0aa95049ff@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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
Cc: Libvirt <libvir-list@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30/06/2021 12.16, Thomas Huth wrote:
> On 30/06/2021 12.01, Peter Maydell wrote:
>> On Wed, 30 Jun 2021 at 10:22, Thomas Huth <thuth@redhat.com> wrote:
>>>
>>> It's just a cumbersome wrapper around the -display ...,window_close=off
>>> parameter, so we should rather tell our users to use that instead.
>>
>> This is an interesting definition of "cumbersome" -- personally
>> I would say the long -display option is the cumbersome one :-)
> 
> The cumbersome was rather meant from a code / maintenance side of view. But 
> I think the naming of this parameter is also quite misleading. It really 
> just blocks the closing button of the window, you can still quit QEMU by 
> other means (e.g. with the "Quit" menu item in the GTK menu or by shutting 
> down the guest), so the "window_close=off" wording is certainly more 
> understandable.
> 
> ... and by the way, I think the documentation in qemu-options.hx is 
> inaccurate, too, it only talks about SDL, but it seems like this option is 
> also available with GTK. So this -no-quit option really seems like old cruft 
> to me which we should try to get rid of...

Drat. It's either "-display sdl,window_close=off" or
"-display gtk,window-close=off" (note the underscore vs. minus between 
"window" and "close"). Please disregard this patch, that "underscore vs. 
minus" problem should get fixed first, so we can point the users to the 
parameter with the right syntax. I'll try to come up with some patches...

  Thomas


