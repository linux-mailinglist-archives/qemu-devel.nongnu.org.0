Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1FF3947FA
	for <lists+qemu-devel@lfdr.de>; Fri, 28 May 2021 22:33:24 +0200 (CEST)
Received: from localhost ([::1]:53580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmjAZ-0007bK-H6
	for lists+qemu-devel@lfdr.de; Fri, 28 May 2021 16:33:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lmj8y-0005yb-OP
 for qemu-devel@nongnu.org; Fri, 28 May 2021 16:31:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lmj8x-0002im-2D
 for qemu-devel@nongnu.org; Fri, 28 May 2021 16:31:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622233902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y33ooA4fU6ORuNUaFeRPUl7tFvT1HYlRlVVAY9nQ5RQ=;
 b=YgnEk9VWBn86qqjulhP8DRwPrgo4i82YFyHzvSWxVa0mT72MUC7EgSIPaLepl4OYqn8qxz
 XYq500i7S8h2JJcCpVP6DvmNfrtrGGgTIOcvgF7+8wbZLU2cjsZ6Ym2eEOl9Ifhn0MkRjW
 b5EZQSqgGRYjwqJa7qYmEX29WmCtfnw=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-4amdreA5MJGQRcT5bUxQGw-1; Fri, 28 May 2021 16:31:40 -0400
X-MC-Unique: 4amdreA5MJGQRcT5bUxQGw-1
Received: by mail-ed1-f70.google.com with SMTP id
 d4-20020aa7ce040000b029038d1d0524d0so2709021edv.3
 for <qemu-devel@nongnu.org>; Fri, 28 May 2021 13:31:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Y33ooA4fU6ORuNUaFeRPUl7tFvT1HYlRlVVAY9nQ5RQ=;
 b=W6GQFaVaCN9aE3ew7YfcyhsLh3k3Y48fqCE265+P2hGjuWCv/ubRVvS5oMfFLR0VES
 7HDBLsPn3dynRXSKCFYptZ+VCw2MvYJEFcGVgFMrD1/jRfJ72PgGvut+WuswppxZi5rN
 h3HLUfgq9CDNVg0Y5kZEc2zaiOEC5vHDDUWho+bOxKbPndrkG1+At05KB9fTrmTtDc4S
 GqusyGyB25eBF0DOc1m/IGfVC31m0aoMp0mAOJAOgU8n9yLwzZUO17w7SDskAyHuI+B8
 EToSXa+fETdrLkW8qn7RohvAzkP35m+4+v99iV44Qi1wFa/6N1zrwRs20v9oXW48+WPY
 oaFg==
X-Gm-Message-State: AOAM533GR+WikewmfLXut3SsjbA+TTp7WGAvnkL68a6sLfzjpBtcyDOK
 gE4vhKXjznm+nTtuqRNGRqM3+cT5maNzi0Jple5shcxQX8XLiOSBFyUgDBqnDQiVhN6eDkepnvo
 Td9P6DkYrx54Iwug=
X-Received: by 2002:a17:906:7052:: with SMTP id
 r18mr10625061ejj.449.1622233899346; 
 Fri, 28 May 2021 13:31:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwBOcJcdg8hQp3Lq3ReSSjo9cOtLCRA9VYL46a+8Hc/J4BdyRMINNSY5GzDTuYhc/sgsMYhFQ==
X-Received: by 2002:a17:906:7052:: with SMTP id
 r18mr10625040ejj.449.1622233899147; 
 Fri, 28 May 2021 13:31:39 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id
 f26sm2812681ejl.66.2021.05.28.13.31.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 May 2021 13:31:38 -0700 (PDT)
Subject: Re: [PATCH v4 09/15] qemu-iotests: extend the check script to support
 valgrind for python tests
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210520075236.44723-1-eesposit@redhat.com>
 <20210520075236.44723-10-eesposit@redhat.com>
 <1e81d521-803a-e11f-933e-b145432bf6c3@virtuozzo.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <1e37d812-9a24-9d16-cb79-2286fee09274@redhat.com>
Date: Fri, 28 May 2021 22:31:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1e81d521-803a-e11f-933e-b145432bf6c3@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


>>       sys.exit(os.EX_USAGE)
>> +qemu_valgrind = []
>> +if os.environ.get('VALGRIND_QEMU') == "y" and \
>> +    os.environ.get('NO_VALGRIND') != "y":
>> +    valgrind_logfile = "--log-file=" + test_dir.strip()
> 

> a bit strange that you need to strip test_dir here.. Why?
Yep, it's unnecessary


>> +VALGRIND_QEMU -- {VALGRIND_QEMU}
>>   """
>>           args = collections.defaultdict(str, self.get_env())
>>
> 
> commit subject sais "support valgrind", but actually we only add a 
> variable. valgrind is not actually used yet.. I'd reflect it in commit 
> subject somehow
> 
will replace with "prepare supporting"

Emanuele


