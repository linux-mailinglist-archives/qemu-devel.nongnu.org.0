Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0933DFEB5
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 12:02:06 +0200 (CEST)
Received: from localhost ([::1]:58574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBDiv-0008DX-Nl
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 06:02:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mBDSn-0002wP-VW
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 05:45:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mBDSk-00031h-TZ
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 05:45:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628070321;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YOtBB8L/lLFT+1+MycaSD1kpUCpdts5+/1MnFLQff0A=;
 b=ZPfSKC5gq0lAkfxQcLb/umsA8iSDi66PziBNYPQH6Tik+gKSUZ+xzXQAzmfU+TCVWm9UoL
 x+Zi6Z+ygMRDw37Hbu4KwHpGJT1oQAdD+0PbcCyQcuevPhhS6XFu+uegrDb7GVFHxO6etE
 7x+LT49FKjED9F2MdHancFhuGinS/xI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-340-zsCkvgXpO3qp-9zea8oCKQ-1; Wed, 04 Aug 2021 05:45:20 -0400
X-MC-Unique: zsCkvgXpO3qp-9zea8oCKQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 g187-20020a1c20c40000b02902458d430db6so211940wmg.9
 for <qemu-devel@nongnu.org>; Wed, 04 Aug 2021 02:45:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YOtBB8L/lLFT+1+MycaSD1kpUCpdts5+/1MnFLQff0A=;
 b=iukiPonXxtzQnIxBxRiWLkm86KzhLgRO3OWlh2KTfVcdXFEPsV7yYPVUh4ghNdy55p
 YX4lZXA5nY7X46DouPIN9uGHWf+PZSbWeXCNf9bmHVKYDj4JL++p2tI/4PkIWU8xrv/A
 d4y75TNiZBL1BH2hLWlZs3YmiN/53WJBTKoi32tXgLqYsDnON5wh+NGVMf7whc8V+B4r
 0zjYitrcI1tyK/5Y83v7kdHNrfev9HkRPDLwcmd6pf2gl3HRUzJMxvsLzp97WuaWUllw
 boyHBjvpYohPDzjb2LIp47K6rFHv+E2A4wk4/wvBaMi42Wa+xEHX9UbzrRJaP091Salh
 OQ7w==
X-Gm-Message-State: AOAM530scZFeSu0yzhMkTXuyfjmloNkRaOwxYBbdFyoP3joUeqRUFTOr
 TaMnFKOMCFKOftscDplA9ahRDyk/Dg9IBcrwLSjyqSWAcmpYXKEaVPzkHUcbX/+J6i0U0eWlM/L
 z5lE94T8MCZcujoQ=
X-Received: by 2002:a5d:49c8:: with SMTP id t8mr27319065wrs.365.1628070319237; 
 Wed, 04 Aug 2021 02:45:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzWLcYKO+3o0WQQlp3lSCPi+Xam4opDfRb9lmB1qlrLKupXV1geyZohIK0BFEvisKe1Ol31zA==
X-Received: by 2002:a5d:49c8:: with SMTP id t8mr27319031wrs.365.1628070319031; 
 Wed, 04 Aug 2021 02:45:19 -0700 (PDT)
Received: from [192.168.43.238] (106.red-95-127-187.staticip.rima-tde.net.
 [95.127.187.106])
 by smtp.gmail.com with ESMTPSA id c15sm1876757wrw.93.2021.08.04.02.45.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Aug 2021 02:45:18 -0700 (PDT)
Subject: Re: [PATCH 2/2] Acceptance Tests: updates to the MAINTAINERS file
To: Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>
References: <20210803193447.3946219-1-crosa@redhat.com>
 <20210803193447.3946219-3-crosa@redhat.com>
 <CAKJDGDYPqySobBWrRyU=0NaSnRQp5voFQHDFoDUbkoAb21fkfQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <352cfbf4-4162-8863-a544-51ff04032d7b@redhat.com>
Date: Wed, 4 Aug 2021 11:45:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAKJDGDYPqySobBWrRyU=0NaSnRQp5voFQHDFoDUbkoAb21fkfQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Auger Eric <eric.auger@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/3/21 10:09 PM, Willian Rampazzo wrote:
> On Tue, Aug 3, 2021 at 4:35 PM Cleber Rosa <crosa@redhat.com> wrote:
>>
>> The tests/acceptance directory is currently lacking a maintainer
>> entry, even though I've been performing that role (of course with help
>> from many others).  Thus, its status is, even more now, Maintained.
>>
>> This also removes the currently broken Trello board link, which was
>> make unavailable unintentionally by a third party.
>>
>> Signed-off-by: Cleber Rosa <crosa@redhat.com>
>> ---
>>  MAINTAINERS | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
> 
> Reviewed-by: Willian Rampazzo <willianr@redhat.com>

Willian you could send an extra patch to add yourself a R: tag.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>



